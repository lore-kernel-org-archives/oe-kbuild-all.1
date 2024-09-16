Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BF03E47B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Sep 2024 07:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726472516; cv=none; b=rSnRe0D2DuriQJMB5l3/fQGvtFGgOwx7KVHXbgLZcij2khzokAPi+oeI2p8/9XojWiF/G/3e0yTLlQWXaW1yJNSUrXLZPvgmAnw0GNNFud3Iip2yX9VXVSve3bksi+Sj+iLn0fistjw9srvAB7HtzwI60pX83TcRPeD3Omgxef0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726472516; c=relaxed/simple;
	bh=WuL7fc3dsUJrzGy++U3w6UI+nK9QBAGR5fSiJTUTGwg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TsB4tPswFTadyyfCUOubQjBi9vczscYmldLKxwcm38G+F2WApxLkTTJpf/2mSTDd5l5FnV6lcPqOdkOBLDSRQbvzi42zxZb+4LG+c4cgFOK1dhCrLDqLMSa1gfhdPuaAEVhNtzTwo5/lqcE7wiiL6PgsIe1ITu4b7RS7hzDK+jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JDod8ggo; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JDod8ggo"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a8d60e23b33so539726066b.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Sep 2024 00:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726472513; x=1727077313; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AZS57HTfuqNCpR+j8S0CQPhdJ2cT4uHPD0UI94VxX1s=;
        b=JDod8ggowgaJ8iqLdvj8qmZYIno52ZznRLWVg+FEjP5iSl6SrJ2APhJd+dChpwaOq0
         9O46NChPkGuDxgmgBbKtbUd6lLXjrtAjEjqGHQVxqYQGRGT+M3WL1YcFT0pAg3Z7LiNI
         FQ0Ky2bMFldVPsbKJiGm7ASdY7xphGxXLp6bXMd+3huHY+aqLruGeEB8/uHY7+fvH699
         6SUsC4yuDld4SNQ8CnU0kBa2dldjUyY2gd/olobhunecOhe2zt3Ty2vHcb4Gu8pLjpcL
         pD27JDXrGyTwGSszrop/VRRv8xLkUrERvuT27Rh681h1k1iQBPR7SOy1b0QNAyMhwu7M
         Cj4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726472513; x=1727077313;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AZS57HTfuqNCpR+j8S0CQPhdJ2cT4uHPD0UI94VxX1s=;
        b=X6P9bKxJimpTmkry8lSnjswNLYtzFFZrg+UuCnqCF9/Vei35nm5TZfJLL6R0es6xIu
         mU10WKrvom2z7dFV5G1mxhNNcABH9Okep7mpJRhrTLlpUE9L/dwFcmvVj19Myt6mE6F4
         xdVNPxyRehAe0qbfJLsamgoTMaetWg24m+ABxciecwMbcdctBekWYHkQbPO+giQeIh0L
         cesgkwkzFgBu2kvDTTQODFGm3b9wPNZHVlLO2UzDWxUKcKYGvSDHnM7i1uYH+zRhvOEe
         rOg+AOWZemmnDf/qfllQBU59Djv/oMnB58op1qf8BASewZ1vluqJ+d9yfrrars7BHz8l
         w7RQ==
X-Forwarded-Encrypted: i=1; AJvYcCWh5F2TvSBwVmRKqd2H1m5ZNgKkU9B4NaXFACCOAw5O5sUUseIR3oEVGSRaf8wJOJvBGlUP27FMB04vP9h9@lists.linux.dev
X-Gm-Message-State: AOJu0YxAVFC02R/u3kN5Y1uin7/ilJNVw10NKsLckP3SzziKfh4B2nBV
	gL0mRd7kud5xjDt4ebnc7hlUpoX11MFSNJEvxTV9HQM00nY7cFfLb6bxGtAHvhk=
X-Google-Smtp-Source: AGHT+IH2IjXV5tLpbg5HdvTtKUQ2QaLHwVgTpsT3oW2QM8v5U1x4we3oE+VqW11x3lB9GzSdHkBQBQ==
X-Received: by 2002:a17:907:e26a:b0:a7a:8da1:eb00 with SMTP id a640c23a62f3a-a902941faefmr1333729766b.7.1726472512847;
        Mon, 16 Sep 2024 00:41:52 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a906109669fsm274363666b.3.2024.09.16.00.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 00:41:50 -0700 (PDT)
Date: Mon, 16 Sep 2024 10:41:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Meng Wei <wei.meng@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	"Pan, Kris" <kris.pan@intel.com>, Chang Ying <ying.chang@intel.com>
Subject: [intel-lts:4.19/android_s 677/30000]
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c:1098 put_v4l2_subdev_routing()
 warn: check for integer overflow 'num_routes'
Message-ID: <904c51ae-9517-44a9-9a60-aaa9490afe1f@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   84d5fc421289417e51781e27e64fbb0fc44216ae
commit: dcdab0d72b69b6291d08483c0baf62cf92e2a1bc [677/30000] v4l: subdev: Add [GS]_ROUTING subdev ioctls and operations
config: x86_64-randconfig-161-20240914 (https://download.01.org/0day-ci/archive/20240916/202409161236.pnGXSCjw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202409161236.pnGXSCjw-lkp@intel.com/

smatch warnings:
drivers/media/v4l2-core/v4l2-compat-ioctl32.c:1098 put_v4l2_subdev_routing() warn: check for integer overflow 'num_routes'

vim +/num_routes +1098 drivers/media/v4l2-core/v4l2-compat-ioctl32.c

dcdab0d72b69b6 Meng Wei 2018-10-26  1082  static int put_v4l2_subdev_routing(struct v4l2_subdev_routing __user *kp,
dcdab0d72b69b6 Meng Wei 2018-10-26  1083  				   struct v4l2_subdev_routing32 __user *up)
dcdab0d72b69b6 Meng Wei 2018-10-26  1084  {
dcdab0d72b69b6 Meng Wei 2018-10-26  1085  	struct v4l2_subdev_route __user *uroutes;
dcdab0d72b69b6 Meng Wei 2018-10-26  1086  	compat_caddr_t p;
dcdab0d72b69b6 Meng Wei 2018-10-26  1087  	u32 num_routes;
dcdab0d72b69b6 Meng Wei 2018-10-26  1088  
dcdab0d72b69b6 Meng Wei 2018-10-26  1089  	if (!access_ok(VERIFY_WRITE, up, sizeof(*up)) ||
dcdab0d72b69b6 Meng Wei 2018-10-26  1090  	    get_user(p, &up->routes) ||
dcdab0d72b69b6 Meng Wei 2018-10-26  1091  	    get_user(num_routes, &kp->num_routes) ||
dcdab0d72b69b6 Meng Wei 2018-10-26  1092  	    assign_in_user(&up->num_routes, &kp->num_routes) ||
dcdab0d72b69b6 Meng Wei 2018-10-26  1093  	    !access_ok(VERIFY_WRITE, up->reserved, sizeof(*up->reserved)))
dcdab0d72b69b6 Meng Wei 2018-10-26  1094  		return -EFAULT;
dcdab0d72b69b6 Meng Wei 2018-10-26  1095  
dcdab0d72b69b6 Meng Wei 2018-10-26  1096  	uroutes = compat_ptr(p);
dcdab0d72b69b6 Meng Wei 2018-10-26  1097  
dcdab0d72b69b6 Meng Wei 2018-10-26 @1098  	if (!access_ok(VERIFY_WRITE, uroutes,
dcdab0d72b69b6 Meng Wei 2018-10-26  1099  		       num_routes * sizeof(*kp->routes)))
                                                               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This multiplication has an integer overflow bug on 32bit systems.  Just do:

	if (!access_ok(VERIFY_WRITE, uroutes,
		       size_mul(num_routes, sizeof(*kp->routes)))

dcdab0d72b69b6 Meng Wei 2018-10-26  1100  		return -EFAULT;
dcdab0d72b69b6 Meng Wei 2018-10-26  1101  
dcdab0d72b69b6 Meng Wei 2018-10-26  1102  	return 0;
dcdab0d72b69b6 Meng Wei 2018-10-26  1103  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

