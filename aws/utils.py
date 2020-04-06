"""
This is a library with common functions using the AWS SDK.
"""
import boto3

# S3 utilities
def s3_download_object(pull_file, bucket, download_path):
    """Download a file from S3"""
    s3 = boto3.resource('s3')
    s3.Bucket(bucket).download_file(pull_file, bucket, download_path)


def s3_upload_object(file, bucket, s3_path):
    """Upload a file from S3"""
    s3 = boto3.resource('s3')
    s3.meta.client.upload_file(file, bucket, s3_path)


def s3_copy_to_bucket(bucket_from, bucket_to, file_name):
    """Copy objects from one bucket to another"""
    s3 = boto3.resource('s3')
    copy_source = {
        'Bucket': bucket_from,
        'Key': file_name
    }
    s3.Object(bucket_to, file_name).copy(copy_source)


def s3_delete_object(file, bucket, s3_path):
    """Upload a file from S3"""
    s3 = boto3.resource('s3')
    s3.meta.client.upload_file(file, bucket, s3_path)


def s3_bucket_versioning(bucket_name, status=False):
    s3 = boto3.resource('s3')
    status = status
    bucket_versioning = s3.BucketVersioning(bucket_name)
    if status:
        bucket_versioning.enable()
    print(bucket_versioning.status)


# SQS Utilities
