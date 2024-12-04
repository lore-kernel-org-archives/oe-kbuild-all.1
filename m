Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E354C20B1F7
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 15:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733325260; cv=none; b=q3sr/L58XThv/COz1ZIjAf5iSb8F8CGUD7+hO5Dm+5LW3+dHfwhufCTij/OIxKzIbyGrRx4tzculdzdTHHpV78BJVQuDel5YXYzjUhNLkQ8cXHQQZW36UUh1z+1V48HlkVMvwKBa4mclMyXK/Ch6vX3VrR6jmMkcS+WERqhsR60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733325260; c=relaxed/simple;
	bh=EvXM02tO6yjyKm/Jwl4qSn9ESvQ4Qu0hdnvG8bDmZu4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hYNU8VGwL3g4SQalx3ae96kIHDdTQTiTb0hD8TCpxVQbC6rAb04xZRLGJ2Io3KnVp+wJfnBNiJL2tuBcn9EpWX4LhrzuEYnF6M+G7dsujbG0ew3vszaCiJYLQck7k3TB022y19uGm+UyepxYuT3X0YsrbKPb4+2oONHD+/CQ+RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qzC0+Qmy; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qzC0+Qmy"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5cf6f367f97so8549212a12.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 04 Dec 2024 07:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733325257; x=1733930057; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZiMvEGOnA3x8ktWeqDOREzwrlUTrCkUJYsXv6kLLcLI=;
        b=qzC0+QmyxK+vqhxi17/JPOicrNS0rRbJxYD9Vv2u3uIIn+VjXNQSeFbOSaeBAV3+cC
         M9pXqiviWCo6Ord0X3wD/ksH4FUVD89MDCrXvNcuRw8yW7gTnts4ZseiaiVf1Y0n+xcz
         Mlu0hM6AuDFyFK+CF/E/0aE9DAwzIFQi7FAYAEk73QteEI5QR+ZFhQ6gUI/5Fi6RMhMA
         STI6khjPWwZUeE9q632UWShtaa6peRLfNE/7rTn+6SOlcUfj4Bcb1ldHU5KRsOAEdr8V
         PMBv5t0yJB2AcX9U7ndskkEug7yAcIEVBjU521vV26skC3c8aWa+vbL0zXeK1tAaUwbv
         IgcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733325257; x=1733930057;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZiMvEGOnA3x8ktWeqDOREzwrlUTrCkUJYsXv6kLLcLI=;
        b=FjteWJxIz3GkgcyMFVC6MWFvt/afQxOP8FBiixI5Z1jmvEAqhMXn+NJchrKEIZ1YYh
         qq/67RKA1wC2nhsigQa6dbJDcsrhHvzwfBzONR0tZXRWPYhLqenSXFmlJ1h6oACiZBGb
         3958b4TJ1UVK+JuTX/879o2ey8JWo6mxdld0Ho7u0fL3L8WlmUQt8AnkqDTDMfhHguxf
         85vJTcaZ7znHFksDEUNvG1Eb75ASgLs//8dHwgCUb0ho7rMjbsErL0VY/TBejr97EQxR
         i+TZgOn3VWCqybVVvhONvaHT5aJfu6tDaWR/9DjILwuFuzrPhDY4B+Ggcq+78AJPSbqa
         KL7w==
X-Forwarded-Encrypted: i=1; AJvYcCVC9J/gfgYoM8WVM3tq8XdfixZuRK4SOsV0dlUqyZ9C5m7epazJQdJvlapg27mHAXx1xfL5wrDZqEnaFRp7@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0ghQs9IqMepd0GHT7jyLDsvlNMwq0aVK2wX6DNVnVg/K8KXSB
	+wQvOpGB5BSXdfzA4PBqZOOUUPm02HvTzYv7i3Un6NVJ+Hk+QvhtFpdME3xUB1Q=
X-Gm-Gg: ASbGncsoQrnZkSVLFBMBXt5Dh53ec3KDokXX3Lr0pLpDuvnnF5zA095EQW8V/lRzRHt
	9yTIf+e9CBDllPGczsef25MGt7XJSKOPMsdWFGY4i3rfaGxUQTqiDNi1pIOBdc526K5VrbKdGEp
	IUnSqduwJ1NdVeX3PhZgIBrV9doW508EZxF5F5t10j2S8j9gHUUhYXl/0OjFGMZrUbyuSgC2IRh
	XEco1S49ZKOapB5234SbGyMmby8hEeQmVmHRpHfEDRA9N43aQkNiQIJwyaot2veeHyjdRSPxw==
X-Google-Smtp-Source: AGHT+IHbdn++zxupMPsIv4w/y2HdWMryceH/LpF4wX4mLdWemSgp6CuJQnWo+ftPXRvxTNtQzIB0dQ==
X-Received: by 2002:a17:907:7719:b0:aa5:249f:8431 with SMTP id a640c23a62f3a-aa5f7d4ed63mr634753666b.18.1733325257169;
        Wed, 04 Dec 2024 07:14:17 -0800 (PST)
Received: from localhost (hdeb.n1.ips.mtn.co.ug. [41.210.141.235])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d12136e9f9sm254760a12.44.2024.12.04.07.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 07:14:16 -0800 (PST)
Date: Wed, 4 Dec 2024 18:14:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Simon Horman <horms@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: drivers/remoteproc/pru_rproc.c:341 pru_rproc_set_ctable() warn:
 variable dereferenced before IS_ERR check 'rproc' (see line 335)
Message-ID: <f5bd0861-abaa-4e9a-89af-deb682df8641@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Simon,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   feffde684ac29a3b7aec82d2df850fbdbdee55e4
commit: e752f9b924a1fd1afcf36e51b03dfa9c3096a3bd soc: ti: pruss: Allow compile-testing
config: alpha-randconfig-r072-20241122 (https://download.01.org/0day-ci/archive/20241204/202412042058.zwL1rOlr-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412042058.zwL1rOlr-lkp@intel.com/

smatch warnings:
drivers/remoteproc/pru_rproc.c:341 pru_rproc_set_ctable() warn: variable dereferenced before IS_ERR check 'rproc' (see line 335)

vim +/rproc +341 drivers/remoteproc/pru_rproc.c

102853400321bae Roger Quadros   2023-01-06  333  int pru_rproc_set_ctable(struct rproc *rproc, enum pru_ctable_idx c, u32 addr)
102853400321bae Roger Quadros   2023-01-06  334  {
102853400321bae Roger Quadros   2023-01-06 @335  	struct pru_rproc *pru = rproc->priv;
                                                                                ^^^^^^^^^^^
Dereference

102853400321bae Roger Quadros   2023-01-06  336  	unsigned int reg;
102853400321bae Roger Quadros   2023-01-06  337  	u32 mask, set;
102853400321bae Roger Quadros   2023-01-06  338  	u16 idx;
102853400321bae Roger Quadros   2023-01-06  339  	u16 idx_mask;
102853400321bae Roger Quadros   2023-01-06  340  
102853400321bae Roger Quadros   2023-01-06 @341  	if (IS_ERR_OR_NULL(rproc))
                                                                           ^^^^^
Checked too late

102853400321bae Roger Quadros   2023-01-06  342  		return -EINVAL;
102853400321bae Roger Quadros   2023-01-06  343  
102853400321bae Roger Quadros   2023-01-06  344  	if (!rproc->dev.parent || !is_pru_rproc(rproc->dev.parent))

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

