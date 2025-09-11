Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD52C247298
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Sep 2025 18:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757616943; cv=none; b=W62VTh9VQ0/gcluHvgg38jOvIOUL6K3jQma/5pGy5MeeP7bbkpjV84mPVZysIty4cf8OxoOXpKGV2lwojX2DuVzocEbeagt4FOv2PNAXmeDn6a8YaubJk2R3DAFzQrbOLC8vtgVeXA7V/Vg3LJgsE3H715fRJ7+f/Nvnqz9sUVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757616943; c=relaxed/simple;
	bh=lzd6NtgHgkyDSLWMrj81lFHwBZJAe5JfV+GPhZaKTV4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o2mctomAphmoLwHA90oNiKGR4blpCx2rekoQR1z25k49SQpivmmMMQxfzFyrdV9BRT1LoHq1zvdl8lQbxTKISW6s1EOpDeQXrfeu6Ftf+ZKC3qVL8OwT1zap713ACGVN2mLIl2tY6db3KAPY6qoNGE2KognI9REmeW6z6V+qs4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eujxYCtw; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eujxYCtw"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3df35a67434so743219f8f.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Sep 2025 11:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757616939; x=1758221739; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=on1LxH3XCPAWDrhUZ5T3eqLBDppv1GkqfxuP4NdAa8M=;
        b=eujxYCtwE8e1+PIftn2rYH8Wqs8ZEQQcNgMOo7wafTzwGysrWe52TKJccLoWhcYQDP
         5j8v67XbWILERYCnE3ryM6dEg2c3ARO4w25AG1DS222bqZp0rExdbCDGVXZEGUNDRfkw
         36pMHJ01J71fwzML3eepd1HZ0jNeTW/GSo0O2lDO0qEapnP94LsQDWAceAcb2xEkstHt
         jH+3eOCfXQtAn4siXT/f8tk+ks/5hsGvQ4lpse5kM6ZjFVJU6JLoUnXPZXU4WVNaFI9g
         tVRq8Ns2aERUVgWaCCbsQ78NfrYp0nigZo+my08U0G3BQSnuwtqq1T35QVPmqzWzYntH
         0opg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757616939; x=1758221739;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=on1LxH3XCPAWDrhUZ5T3eqLBDppv1GkqfxuP4NdAa8M=;
        b=u5ErbZmGVPYnTjANfuq2kHdhkkdIXbu5TKJljeMXkSOcfTtMi065feQfJ2WrXb04p6
         BnqoDz1qKrUohxV4qRGOhQK0c9F1yzCoHwvg6NLCMhx/ELk10P1kr5A+P+h47G2LnGiC
         FHEJWBLzbJRNtJ/YPvWu8U4RwECOUX66irEf+YYq3RUXHmrq6VMZENIk03lnc2/3cUuh
         vs+nQXhmYtvqd6y9o59IP08BsMFVJ3uLV4tcilIcgF0F2EdZ5mquilvONKtclOIPsdb/
         DzzXmx50MJVVMuw4AkWkvatQSwPmGo1Hisoj+nTkTmDtIasixUBswoXDmy9Uq/GLx1Y6
         G8ug==
X-Forwarded-Encrypted: i=1; AJvYcCWEda4f/Rt0yu6QEkAiOmLkEMN71QevodrtQWSUuyvsp7vkUGcA8nkydZ2o+qcAVuHUqNtuBBpF/gmtreBD@lists.linux.dev
X-Gm-Message-State: AOJu0YxFFUCnPqdz0ElsllHcieV+qKwhNphRkd8wdPXQoGO+ML2r/qUp
	dNw+4NN8vKytDrhH2Ss+LDYZyFGjanMN9fkSezQjjg5niBfK27gPrgCjhKOWMxWODCgXQ5R/ePw
	i+dmc
X-Gm-Gg: ASbGncve2307+kwjnY/hE6eiLf5qARxd73+fu3krfvBDEYNV6QHBWDX3OSG0DUI0t0X
	A6e3AW4gyCuHYWtvkPMeDz4DAFuQ0/utncMSVX8+oif7kqYcRndoq+YQj8wsHTXoL79JDxDW0s3
	Z2yGXX5x3GcBPIvRsQgztJRMHEamxDbfdpQeM4ytXa1suLXluH9uFu0qo8KoMLc/IEz8z6+BLfZ
	IpLRV+3k1AiCA60QlnFebwdSSeyDysQl8prZ83VXMQioWmtWmy3Oa0ddA5Y7KPvge0OLMbs8jZ3
	jOiJEqnDLzBLWJLNH0sRYbzEV6y+4zzFNMJcf22loHilwDfnIq2XGl2wNDdy8L1YpHqAyYd8KIq
	/yik5BcusaLx77u+LSPKCj0VqkFA=
X-Google-Smtp-Source: AGHT+IGCbd5+C0lvF6hqq/A2SzFcoSrAVnxQ2N0dbWUUQ2bfNAxuGp4CbA4bM8Qe1/rPncZRiMsPyw==
X-Received: by 2002:a05:6000:1a86:b0:3e7:490c:1b2 with SMTP id ffacd0b85a97d-3e7659c4d6dmr335557f8f.36.1757616939077;
        Thu, 11 Sep 2025 11:55:39 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3e7607cd415sm3403567f8f.30.2025.09.11.11.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 11:55:38 -0700 (PDT)
Date: Thu, 11 Sep 2025 21:55:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jens Axboe <axboe@kernel.dk>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 8010/8263] io_uring/query.c:98 io_query() error:
 uninitialized symbol 'ret'.
Message-ID: <202509120150.hzd9vw51-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8f21d9da46702c4d6951ba60ca8a05f42870fe8f
commit: d9b7dbb7f34aa7a8485fd39ffe4bba65e20692cf [8010/8263] io_uring/query: check for loops in in_query()
config: x86_64-randconfig-161-20250911 (https://download.01.org/0day-ci/archive/20250912/202509120150.hzd9vw51-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202509120150.hzd9vw51-lkp@intel.com/

smatch warnings:
io_uring/query.c:98 io_query() error: uninitialized symbol 'ret'.

vim +/ret +98 io_uring/query.c

c265ae75f900ce Pavel Begunkov 2025-09-08  76  int io_query(struct io_ring_ctx *ctx, void __user *arg, unsigned nr_args)
c265ae75f900ce Pavel Begunkov 2025-09-08  77  {
c265ae75f900ce Pavel Begunkov 2025-09-08  78  	char entry_buffer[IO_MAX_QUERY_SIZE];
c265ae75f900ce Pavel Begunkov 2025-09-08  79  	void __user *uhdr = arg;
d9b7dbb7f34aa7 Jens Axboe     2025-09-10  80  	int ret, nr = 0;
c265ae75f900ce Pavel Begunkov 2025-09-08  81  
c265ae75f900ce Pavel Begunkov 2025-09-08  82  	memset(entry_buffer, 0, sizeof(entry_buffer));
c265ae75f900ce Pavel Begunkov 2025-09-08  83  
c265ae75f900ce Pavel Begunkov 2025-09-08  84  	if (nr_args)
c265ae75f900ce Pavel Begunkov 2025-09-08  85  		return -EINVAL;
c265ae75f900ce Pavel Begunkov 2025-09-08  86  
c265ae75f900ce Pavel Begunkov 2025-09-08  87  	while (uhdr) {

This comes from the syscall so it could be NULL at the start.

c265ae75f900ce Pavel Begunkov 2025-09-08  88  		u64 next_hdr;
c265ae75f900ce Pavel Begunkov 2025-09-08  89  
c265ae75f900ce Pavel Begunkov 2025-09-08  90  		ret = io_handle_query_entry(ctx, entry_buffer, uhdr, &next_hdr);
c265ae75f900ce Pavel Begunkov 2025-09-08  91  		if (ret)
d9b7dbb7f34aa7 Jens Axboe     2025-09-10  92  			break;
c265ae75f900ce Pavel Begunkov 2025-09-08  93  		uhdr = u64_to_user_ptr(next_hdr);
d9b7dbb7f34aa7 Jens Axboe     2025-09-10  94  		/* Have some limit to avoid a potential loop */
d9b7dbb7f34aa7 Jens Axboe     2025-09-10  95  		if (++nr >= 1024)
d9b7dbb7f34aa7 Jens Axboe     2025-09-10  96  			break;
c265ae75f900ce Pavel Begunkov 2025-09-08  97  	}
d9b7dbb7f34aa7 Jens Axboe     2025-09-10 @98  	return nr ?: ret;
                                                             ^^^
leading to an uninitialized "ret" variable.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

