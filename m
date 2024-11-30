Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BA21A08AB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Nov 2024 15:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732981435; cv=none; b=KRctqhefiLnuEbrUXpjSClQa5ZAYhKAwrbzSG6BLh9CkjaxF3Yrff99stR0UNp6o50SXRPVnjelrehiUVzXzvpSzo6HeBMNeys9DdSyAw/OHfzCeyCJ/HpEjB4y9OAnBgDs1pa/g6Wmye2A8+5RSyoYfVf0TKnVzezjmvRPWbAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732981435; c=relaxed/simple;
	bh=8P7EZh8yb0h7RIxx3McBqNuNXtXocSyz+vcxg95TtNA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MPvdgbrGXgWLWYFPhv66OADLn1AdZsMrsQZxWZvrksp9sZ60YZHq5PsPqQF9ZHmEGb2jLEBcdhzglK4jT+6O1XHBlBeT4C4s2hQfJiFOlOhwqzwYBX7ouGTdYV9+S21DqyA8VTejfLT+BZNkr4GM5Jxy5+I4cYMR5MncgxzkPKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MHXKgFS/; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MHXKgFS/"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aa5325af6a0so379483766b.2
        for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Nov 2024 07:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732981431; x=1733586231; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QEr8+hx+feiWRenkko8sFtr7Ec4FvTKy4XdPwSZ8x7I=;
        b=MHXKgFS/OV4oVaaMSPBnx0us5BU9prcQ7D7LCIaa/7k4nDyRsKIgIIFdcHGjnKBzIE
         XZsfaklU5AP/UARF4av2oYxcqHf1AmChxiGIOEBjwO0b1loms1OPO8di4hc0Gph57MV4
         Rhm0DRt4wYRVebT2Odwumov8hSZ5FC0rY8KV+7GbrdUujjqsdTCGZM3MwStL57tBR5Ra
         DOPI9n5SIXKR3YnmAXzcQ4yFskJnrwYrIz9AJo/CHbBjthApXz30MXJvkiEVZlXTCiQY
         z7ARLcFR4BVo2Qw0jj4ntNZTypE4GsPWNRLdVMuWnyUEa1NP93EVDt6R6ElO3cG86x69
         lrdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732981431; x=1733586231;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QEr8+hx+feiWRenkko8sFtr7Ec4FvTKy4XdPwSZ8x7I=;
        b=ttuDLaM59Ihis5FMY45w2OCQpQ+XnhOvPsX2wVXX2Kp8Ja1MbpY0as06c1nGRUrm1o
         qv9/5anx2Co49LELdfGMStHrLTVzuyEmDc4x+TS84KIpyxWfBkzXrcxqojhDPZ35nnG5
         0KrDCGUejj8cfnEzwKDPYqZMZHV2Q3/cmVmhVN3MrwNl7i4JFhzxXavAuKF4/FUBMAdb
         K2/mRHoNCLAwqakhaQvmZSNDEQx/8Eh3pssYRlbiTKTvnNwAbvRsJvmOAF7gQgM/IES+
         lTdGxhSYSEIk6P09NnhB58gh91dNzxZWYXdo3fpdCpsY6JYn3m1Ci29FgkxkebcA4KUt
         HPfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVwifKd/aMpvoW8IxxoG4Kmp/ZHrEIKQ3FqGw7SKZ3BFuZv0srlO7yfo+UzID4d12JO+yGLxG5M3M9WX8d@lists.linux.dev
X-Gm-Message-State: AOJu0YyncW61VOQa8oHxcub+tviDffKHLjPFJxi59OGPb+w97BBcOcfM
	tXQeE3YdpE4B+j/JxmBhKUsRlcAv1sU7oqyLUHlv1VgkYeLeOtY2AYlFHQnQJNc=
X-Gm-Gg: ASbGncso+OVi2cvxqmT6zBjmx76roSGURBcfMfHJRWeTN5ERtOwtqE+ym343T9vGUtw
	tJZB2RPGAYD8NvAz1mGR2/RXHtzUPI51Vi2vdkfYEG7KJa1A5l2ZNV6NV3NTuZLVV+PtLilmzqA
	WfFJs0nb0EkYQldy0VbulT2xBCOzRcfk43As2nnswipfcKtD5Z6kLqal8jAJbaRzn9APs3DpSIR
	0M4QYR9cCtcbJsA47sQklTUMvueduW1EdSYdZ+VfygpCZhnf021ZcTMHY/I4HTpl0lRWVBI
X-Google-Smtp-Source: AGHT+IFqIGiJnI9PzQXBkXZRQHQIfQKitL7vKaRiNgc89HUSGEOMYbqu+ESdUAuI4e+DGJ1WNLOcCw==
X-Received: by 2002:a17:906:18b2:b0:aa5:241a:dc77 with SMTP id a640c23a62f3a-aa581073ea2mr1154088866b.54.1732981431440;
        Sat, 30 Nov 2024 07:43:51 -0800 (PST)
Received: from localhost (h1109.n1.ips.mtn.co.ug. [41.210.145.9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996c0eb2sm294386566b.28.2024.11.30.07.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 07:43:50 -0800 (PST)
Date: Sat, 30 Nov 2024 18:43:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jarkko Sakkinen <jarkko@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:v4l2-loopback 6/7]
 drivers/media/v4l2-core/v4l2-loopback.c:1892 vidioc_dqbuf() error:
 uninitialized symbol 'index'.
Message-ID: <4cded80e-601b-4feb-a789-73f8cc863a34@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git v4l2-loopback
head:   3a755621b768ff98489ccb7cf9905866d724872b
commit: 4a6abc37d28f3a63e4f54d12b97c075744285f8d [6/7] media: v4l2-loopback
config: hexagon-randconfig-r072-20241125 (https://download.01.org/0day-ci/archive/20241126/202411260207.Y7cyTmeG-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411260207.Y7cyTmeG-lkp@intel.com/

smatch warnings:
drivers/media/v4l2-core/v4l2-loopback.c:1892 vidioc_dqbuf() error: uninitialized symbol 'index'.
drivers/media/v4l2-core/v4l2-loopback.c:2959 v4l2loopback_control_ioctl() warn: maybe return -EFAULT instead of the bytes remaining?

vim +/index +1892 drivers/media/v4l2-core/v4l2-loopback.c

4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1845  static int vidioc_dqbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1846  {
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1847  	struct v4l2_loopback_device *dev;
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1848  	struct v4l2_loopback_opener *opener;
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1849  	int index;
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1850  	struct v4l2l_buffer *b;
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1851  
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1852  	dev = v4l2loopback_getdevice(file);
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1853  	opener = fh_to_opener(fh);
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1854  	if (opener->timeout_image_io) {
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1855  		*buf = dev->timeout_image_buffer.buffer;
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1856  		return 0;
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1857  	}
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1858  
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1859  	switch (buf->type) {
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1860  	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1861  		index = get_capture_buffer(file);
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1862  		if (index < 0)
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1863  			return index;
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1864  		dprintkrw("capture DQBUF pos: %lld index: %d\n",
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1865  			  (long long)(opener->read_position - 1), index);
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1866  		if (!(dev->buffers[index].buffer.flags &
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1867  		      V4L2_BUF_FLAG_MAPPED)) {
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1868  			dprintk("trying to return not mapped buf[%d]\n", index);
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1869  			return -EINVAL;
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1870  		}
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1871  		unset_flags(&dev->buffers[index]);
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1872  		*buf = dev->buffers[index].buffer;
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1873  		dprintkrw(
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1874  			"dqbuf(CAPTURE)#%d: buffer#%d @ %p type=%d bytesused=%d length=%d flags=%x field=%d timestamp=%lld.%06ld sequence=%d\n",
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1875  			index, buf->index, buf, buf->type, buf->bytesused,
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1876  			buf->length, buf->flags, buf->field,
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1877  			(long long)buf->timestamp.tv_sec,
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1878  			(long int)buf->timestamp.tv_usec, buf->sequence);
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1879  		return 0;
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1880  	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1881  		spin_lock_bh(&dev->list_lock);
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1882  
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1883  		b = list_entry(dev->outbufs_list.prev, struct v4l2l_buffer,
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1884  			       list_head);
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1885  		list_move_tail(&b->list_head, &dev->outbufs_list);
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1886  
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1887  		spin_unlock_bh(&dev->list_lock);
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1888  		dprintkrw("output DQBUF index: %d\n", b->buffer.index);
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1889  		unset_flags(b);
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1890  		*buf = b->buffer;
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1891  		buf->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22 @1892  		dprintkrw(
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1893  			"dqbuf(OUTPUT)#%d: buffer#%d @ %p type=%d bytesused=%d length=%d flags=%x field=%d timestamp=%lld.%06ld sequence=%d\n",
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1894  			index, buf->index, buf, buf->type, buf->bytesused,
                                                                        ^^^^^
index is uninitialized

4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1895  			buf->length, buf->flags, buf->field,
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1896  			(long long)buf->timestamp.tv_sec,
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1897  			(long int)buf->timestamp.tv_usec, buf->sequence);
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1898  		return 0;
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1899  	default:
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1900  		return -EINVAL;
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1901  	}
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1902  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

