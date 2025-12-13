Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316393002B3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 11:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765623943; cv=none; b=bIT2r4PhwUQdMU2f+fcpyr6tm/qOjKxbquQ2sCFa5+zI2uWzGoeKPmRco7TCMLOsF4KbbCD+FsmRwdkK3UbwQr0ssoQ0XJ91t947Ip/O3Nhk57Sw6qpfgqw9vr7ZOAd19ufcZa2ewPSIzXJKL2vKlJj76P/CzQjpLk37ocXBsCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765623943; c=relaxed/simple;
	bh=eIJlkmB/GRZzqWXY/TXR/frfHynJkJBeE5Cp5x0g4pc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BC3uPW6u6dpQqMVE+XcZCiPhnv/Hnpb6Q1o6IWwlh9JkHEmrTCAgpenJp9G9ZmMVdg7QyF3GtQoiRZJ8qM7kl0WvDqa+ooWL6a7ZmJKgCN0SZDl6b7tFjyjuRb4W7ALIYqz5DUgsj3SSkrK2E9tS7BjBvTXOfAenA/Q4ueyepes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wEH8Bw1S; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wEH8Bw1S"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477b198f4bcso15525795e9.3
        for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 03:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765623939; x=1766228739; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=akrEjsebCHvdmAghGI3gbVT9gvRKLMOOrbNDoLAYklU=;
        b=wEH8Bw1SOCq4IB9+BdRAV+Uj4kiOL5VwCUec8Ku9/1LBTX+Rs01MZXZUj7rNOPoFvc
         YoFg0FSqAhByJu9geKSef69AzgBmhD90BvvKZfXBFo27i9+xuNG7fgY/yl27AeUJQSDG
         NQSKLWc+lbVpEJd4lo0gmgYNMGvdSbrYEMrqouGZV5n6O/uvbGoVpUh0oVsiQSlB2JWL
         V5qLcEr5fEaMiJFXCCDzFQpy9E95sBmmtzL4tCk/4HWAdkrhpEBhQ3ixP+U5Ryf+mZVs
         2s8q+OxBMa3kDbgWdpL+DhwYzJOdnUK4ERPG1PIL8QOI7Fu3PEX196HWrVEcccWh/quI
         x6PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765623939; x=1766228739;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=akrEjsebCHvdmAghGI3gbVT9gvRKLMOOrbNDoLAYklU=;
        b=I1dVUyRZCicjyO3/Xlusr58R7J1kanV0Iw6/SjStAa0uwxAr6EKC1wbFFz1u7bPtp7
         y0uX1PiXSfiAXefXv/Lu41euC8vsuJcfkQeLsEpI+iFM6s9BVkocfF38o3o6iWO2ho36
         ZWZ133s8seAw10t79x5CfPMFMDZYnpVut3r2G/bbwxj180jQpoVKkS9oL3mCDbC18cCL
         zR7+EeyNkrodgRwLwp34eN8XQ79dcDycqAeViP4aCXuhi+B7o8+BghC5AjVvAV4FkYMw
         cNVsnLjDolRnUrgmU+ddyBhDSgsOPHhu3M2cCQPVsPF3uRZvydro4Nv4hKDKIo4f7aTT
         Iquw==
X-Forwarded-Encrypted: i=1; AJvYcCVZEfDNJzUkeiY1MkCkJB7kvANDZN64piB4ddqOjjpBNtRuuokobRa4EdIhLIvEKlSJCIM/BaaevIPFocXv@lists.linux.dev
X-Gm-Message-State: AOJu0YyPeRrxF/c3igFrYsbvCn+b0gEt+W1R9xxMR9kcskBkJQCX4Go1
	0Zt1xOb00wMASqu+bMpVW2T7baLZt0dtbT9ltt1gBThzUvjoxkOn9JvYiD3LWnzhMvs=
X-Gm-Gg: AY/fxX7C51ReSwzSORJ+a+GHmIefvXS0KslrIuCuIe5DK743N/czE1lgPzlJ4E6Smaj
	XH15DzP5AVNrfAKnHNEjED9v/HnIkrO6kB+NXVv8biIcp9cM5WEVMZT54R0T7Ph1oN+PZhJv2uL
	8ae/89D0NHGDL34zXMhcGA0SNbfAxaGcOb9+XtdDUPGCIWkQIBOiXoSU+XlqFMrdJd2zwkRV/G0
	4u13efzzV4G2ruGHJp5HOaqWT3i+HNcGBHGBNpr4NpUdcz9I7w6C5OiCMY7b5Aqb+/4hvv19zoo
	arhrBqPq+z0B7Bxlm9tyJczugrfkRpz2slNXgrVlOmrvUokPIuPYvvCrAfzwkfnbQl3KWC5hAER
	bbdLc0KnHef4itd+AQ3ob3RqSRcOVjVqt2KYT1OFEgRqszrfDoBwaS8REZkaZn4CsM65t7DoM5e
	GCB9SAiJnhnDiz4fmZ
X-Google-Smtp-Source: AGHT+IE+pX8X2Ot532bTKW7TF2VDVMGDA06itUIEaUomojq7OnkTUqThaR9z92r+Z3ptlzWx+7Cing==
X-Received: by 2002:a05:600c:1c92:b0:477:333a:f71f with SMTP id 5b1f17b1804b1-47a8f905306mr68638335e9.17.1765623939317;
        Sat, 13 Dec 2025 03:05:39 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43009dfe55asm4252942f8f.41.2025.12.13.03.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 03:05:38 -0800 (PST)
Date: Sat, 13 Dec 2025 14:05:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: drivers/tee/tee_core.c:735 tee_ioctl_object_invoke() warn: potential
 user controlled sizeof overflow '20 + (size_mul(32, (arg.num_params)))' '20
 + 0-u32max'
Message-ID: <202512130645.3njk1yxJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   187d0801404f415f22c0b31531982c7ea97fa341
commit: d5b8b0fa1775d8b59c3fc9e4aa2baa715d08f3ee tee: add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF
config: csky-randconfig-r071-20251212 (https://download.01.org/0day-ci/archive/20251213/202512130645.3njk1yxJ-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512130645.3njk1yxJ-lkp@intel.com/

New smatch warnings:
drivers/tee/tee_core.c:735 tee_ioctl_object_invoke() warn: potential user controlled sizeof overflow '20 + (size_mul(32, (arg.num_params)))' '20 + 0-u32max'

Old smatch warnings:
arch/csky/include/asm/uaccess.h:191 __get_user_fn() error: uninitialized symbol 'retval'.

vim +735 drivers/tee/tee_core.c

d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  710  static int tee_ioctl_object_invoke(struct tee_context *ctx,
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  711  				   struct tee_ioctl_buf_data __user *ubuf)
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  712  {
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  713  	int rc;
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  714  	size_t n;
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  715  	struct tee_ioctl_buf_data buf;
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  716  	struct tee_ioctl_object_invoke_arg __user *uarg;
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  717  	struct tee_ioctl_object_invoke_arg arg;
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  718  	struct tee_ioctl_param __user *uparams = NULL;
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  719  	struct tee_param *params = NULL;
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  720  
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  721  	if (!ctx->teedev->desc->ops->object_invoke_func)
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  722  		return -EINVAL;
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  723  
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  724  	if (copy_from_user(&buf, ubuf, sizeof(buf)))
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  725  		return -EFAULT;
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  726  
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  727  	if (buf.buf_len > TEE_MAX_ARG_SIZE ||
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  728  	    buf.buf_len < sizeof(struct tee_ioctl_object_invoke_arg))
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  729  		return -EINVAL;
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  730  
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  731  	uarg = u64_to_user_ptr(buf.buf_ptr);
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  732  	if (copy_from_user(&arg, uarg, sizeof(arg)))
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  733  		return -EFAULT;
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  734  
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11 @735  	if (sizeof(arg) + TEE_IOCTL_PARAM_SIZE(arg.num_params) != buf.buf_len)

This isn't a runtime bug, because if arg.num_params is too high the
kcalloc() will fail.  But eventually we're going to create a KMSan thing
to make it a runtime warning when there is an integer overflow in a
size_t math.

Integer overflows are complicated because the integer overflow is
harmless.  It's just math.  If there is a bad effect, it always
happens later.  But we want to start considering it a bug in a limited
way just for sizes because that makes preventing bugs easier.

You could use:

	if (size_add(sizeof(arg), TEE_IOCTL_PARAM_SIZE(arg.num_params)) != buf.buf_len)
		return -EINVAL;

d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  736  		return -EINVAL;
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  737  
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  738  	if (arg.num_params) {
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  739  		params = kcalloc(arg.num_params, sizeof(struct tee_param),
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  740  				 GFP_KERNEL);
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  741  		if (!params)
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  742  			return -ENOMEM;
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  743  		uparams = uarg->params;
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  744  		rc = params_from_user(ctx, params, arg.num_params, uparams);
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  745  		if (rc)
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  746  			goto out;
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  747  	}
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  748  
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  749  	rc = ctx->teedev->desc->ops->object_invoke_func(ctx, &arg, params);
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  750  	if (rc)
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  751  		goto out;
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  752  
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  753  	if (put_user(arg.ret, &uarg->ret)) {
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  754  		rc = -EFAULT;
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  755  		goto out;
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  756  	}
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  757  	rc = params_to_user(uparams, arg.num_params, params);
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  758  out:
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  759  	if (params) {
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  760  		/* Decrease ref count for all valid shared memory pointers */
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  761  		for (n = 0; n < arg.num_params; n++)
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  762  			if (tee_param_is_memref(params + n) &&
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  763  			    params[n].u.memref.shm)
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  764  				tee_shm_put(params[n].u.memref.shm);
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  765  		kfree(params);
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  766  	}
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  767  	return rc;
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  768  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

