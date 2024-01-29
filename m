Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78CF524B7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jan 2024 08:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706517925; cv=none; b=FRwHRYVxZUEN8VJJ0Tge8D+UaOqtpIJOTOiTlRxSSOna6TyABHpUIerEssfH5f71oqGixM89bvYyHzPrzssPHaLuttH6R+wfr9OsmIq8WTF0aPrN5r9aQbldkqCJdmdy/BtwZVllJQi7/PsJpwzDxwD6MZFE331N/RklrZniPM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706517925; c=relaxed/simple;
	bh=E5wVvdy2Nw7n7I2vURdoJilLY62WSJUV7Vw2Mm8mIs8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jl5MMEpcP3EjTGySbi5EhLrTaMpRBlGiUzmy3g5lWuBTEcs21nUw/CpDC6LatB+69qZCue1ysoqhbTLudTPWkbwDhJ6MMcBZ0PgEW7g8VMuNDJ+5BRJnxeGQB6wCOyicXXHW6vxFpePVRqushlFiVOq7xScHQ5zNkITuwY0zAQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ILNk+70R; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ILNk+70R"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5100cb238bcso4278555e87.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jan 2024 00:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706517922; x=1707122722; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4F+xlgUGWJsyne8MrXcNfremPz7A1AclLvUOYf/t/Zo=;
        b=ILNk+70RIkMfFzrIz8KrlspBKDxhdQK/T3IBzkr+eLphf0s41dyp3lMYMap9D0cEKn
         OczuMwSZxUb+X14pC/gW8xSrQhgm3I90KkdsBocmyUeoKjxH5BzCrrSLfqrF48KuQmaa
         OUHBvDpshYAlkd5TS7NjzTyspTewCfnLGueCQ5x/Fvb4kJpL6tJ10gAze0l+JPODZqS5
         QxAOnzKp8H6gP5KRQZwkK6NWAgutDu6vcMwPxPCob1m6CdmL4iGjmbxBfJsMoWfyk8JH
         Vd2geSV6LnmzVaeI7LFdp1hwYNocVrQrb9r7PcwjZhtl0vuylUnc8E8OmsLY+es++wOK
         L12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706517922; x=1707122722;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4F+xlgUGWJsyne8MrXcNfremPz7A1AclLvUOYf/t/Zo=;
        b=mu8DwNpZY0aXfuaps1iViCIRenSnZfS/D0lCa+hWSVwyuuMFr6DZYwNg9P5KXfZw/h
         86VN0LDkYvrIr19i0x1shgKmyGKD4B6/l7bbaZwn7vMzEOD3xdxdHg2mbLTr6uYDmcpA
         Tk4O6AH2HWey12CbjWhVrul+Ja1RSnszuNL3oacHmDNKJic6NGth2JgbAaylVuGVliqk
         S7wX8Rv9y4esA7biB1pxawvDlgnCVxguATSkAPo+OpK/axK19/vxqqQcJqT3pj8m8Orw
         I6tSnbxXZXSl3kfYNfs+caaYZ4wEwzYTD27ylPqYBfuUHzgHBhp8b5DvHd6jCoF3NAWf
         RDlg==
X-Gm-Message-State: AOJu0Yze9saNGHnV48CUic5ksbxjFYH0UgipLPLR2NWmgWcaa2qTmead
	+ASwxYACsXO25g8kjxmstCe+QiG3QZjbKIcIdlx+2m4EuK0MRQ9VTWRMmK6vQzU=
X-Google-Smtp-Source: AGHT+IGCct6200jY/NB+MWQ/+A0vI5pEWaJg5H/oTWwB1XeByQYAHUDMZjxVzfSBIA7MSGYKTrZMBA==
X-Received: by 2002:a19:2d59:0:b0:510:78f:1a65 with SMTP id t25-20020a192d59000000b00510078f1a65mr2996191lft.49.1706517921583;
        Mon, 29 Jan 2024 00:45:21 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id l5-20020a05600c4f0500b0040e5951f199sm9483421wmq.34.2024.01.29.00.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 00:45:21 -0800 (PST)
Date: Mon, 29 Jan 2024 11:45:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Suma Hegde <suma.hegde@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [pdx86-platform-drivers-x86:review-ilpo 11/17]
 drivers/platform/x86/amd/hsmp.c:367 hsmp_metric_tbl_read() error: we
 previously assumed 'sock' could be null (see line 366)
Message-ID: <6e6cde7e-402e-4070-9854-85c6f7405e36@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-ilpo
head:   d04e52b47ab62cf36fddaa0feb1c5508e420e48d
commit: 7a5a66d63b8fb8ac60ef8e2ad989310c270a4fac [11/17] platform/x86/amd/hsmp: Move dev from platdev to hsmp_socket
config: x86_64-randconfig-161-20240128 (https://download.01.org/0day-ci/archive/20240129/202401291311.gzMCj6SP-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202401291311.gzMCj6SP-lkp@intel.com/

smatch warnings:
drivers/platform/x86/amd/hsmp.c:367 hsmp_metric_tbl_read() error: we previously assumed 'sock' could be null (see line 366)

vim +/sock +367 drivers/platform/x86/amd/hsmp.c

5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  352  static ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  353  				    struct bin_attribute *bin_attr, char *buf,
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  354  				    loff_t off, size_t count)
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  355  {
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  356  	struct hsmp_socket *sock = bin_attr->private;
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  357  	struct hsmp_message msg = { 0 };
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  358  	int ret;
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  359  
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  360  	/* Do not support lseek(), reads entire metric table */
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  361  	if (count < bin_attr->size) {
7a5a66d63b8fb8 drivers/platform/x86/amd/hsmp.c Suma Hegde 2024-01-06  362  		dev_err(sock->dev, "Wrong buffer size\n");
                                                                                                ^^^^^^^^^
Can sock be NULL?  Unchecked dereference

5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  363  		return -EINVAL;
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  364  	}
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  365  
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10 @366  	if (!sock) {
                                                                                    ^^^^^
Checked for NULL

7a5a66d63b8fb8 drivers/platform/x86/amd/hsmp.c Suma Hegde 2024-01-06 @367  		dev_err(sock->dev, "Failed to read attribute private data\n");
                                                                                                ^^^^^^^^^
NULL dereference in error message

5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  368  		return -EINVAL;
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  369  	}
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  370  
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  371  	msg.msg_id	= HSMP_GET_METRIC_TABLE;
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  372  	msg.sock_ind	= sock->sock_ind;
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  373  
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  374  	ret = hsmp_send_message(&msg);
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  375  	if (ret)
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  376  		return ret;
02a258ac3ebf8a drivers/platform/x86/amd/hsmp.c Armin Wolf 2023-10-19  377  	memcpy_fromio(buf, sock->metric_tbl_addr, bin_attr->size);
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  378  
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  379  	return bin_attr->size;
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  380  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

