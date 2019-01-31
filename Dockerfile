FROM amazonlinux:2018.03.0.20180424


# Dir settings
ENV APP_DIR /var/task
WORKDIR $APP_DIR
RUN mkdir -p $APP_DIR/lib

# Adjust time zone to Asia/Tokyo
RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# Install libraries in requirements.txt
# Change pip to something exectable at other language environment!
COPY requirements.txt .
RUN yum install -y gcc python36 python36-devel
RUN pip3 install -r requirements.txt -t /var/task/lib