Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3101CB53F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Oct 2024 14:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729088572; cv=none; b=NCr++s1Rj5xNEi5V4L79Q9PYzur2yDPWXuo0TNB53Xyx/j1q1f8YyODxT4gFLfcKS/iP4bvb1HjjkZGu7lFVDFvCmyjdb1WYhJU+pdHYJpgwifJue0X4lrNpgjGyUfU3Grsq+C7IZVQFtB3ygYfz2UQwCTR8UYEd8Ksih5wIkbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729088572; c=relaxed/simple;
	bh=LA0pu8STWhrlwxF7SSn7+T4mjCyoOQVosi4K6YAntQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=odzHKOZeMdveqfWT7hfyYFmN0bG1aAhzEzUR4PQ8GQzeJrIEZGTBVLwJtdI22OSO6ZGmDGdWPfXyZ/zo4H5B74u7GbpHtpt+aVU0wCtyRl2rz6uat9XgOUlcJ5wlvs0Q4F28/knHX5L32JQIy1Mp0bxwTKuV6hsrWbjIX7mUXwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wj6HQOAd; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wj6HQOAd"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a99f629a7aaso178596666b.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Oct 2024 07:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729088569; x=1729693369; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/t0JkfDSzWWrRpinUGYcX097nCcgBj9fkWkXnOoM92Q=;
        b=wj6HQOAd6hsOm9IBPisT2SyvXurKXOZTdSi46THInkILXSvUjc0AUgDa/utUUtOcHZ
         tjLPEWLWB7nFM1Zn/xMc2g2KpnHdtk/ruUmV2aUYpClnQvfF5wOxmS52CFgtcWqBounU
         U3uf7a2BHEgPaX72t3rAACJh3OnkoeAGtmjxVKaNLXlMu4MpPqi3SSVGErZSN+ebTOa4
         q7VtYrRVgv8fCd0QvZdpnf872bC2ftVMZfU97yejcqCgiaofJ+Bt6e5W+XKLH8+IMV/C
         fRjwoQAYCri01yBjQQ9rL6zsnaY7CSSmQhkMd7/NSWd9bYJDzAsgh6gWMBuqteEyt5nU
         4few==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729088569; x=1729693369;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/t0JkfDSzWWrRpinUGYcX097nCcgBj9fkWkXnOoM92Q=;
        b=FsVkWlCKuXZUT1giUW6Blbfh9I9sKn8BLBThNTDWWqpvcFUDOEqhSc7ce21NxAr8AN
         v7Rn+74baIeEyPnJaRRTUoS164V4U45nQ2ry6+OQQsgkKzMsnRmJhyja00Ztv27LkajP
         YB8FYuW0ViMPn/84y2Xoo1/lbcV+TY/NiTtWjkqIdqE7DvDpPmuL2hl6UzQjgplflD7G
         mbOEP8MNXn19kGLJPbIEZqg1fZIx9TqAYq41qD79wZPWGoopc4hXfCs1xzvnKuimLCFz
         OtLIGE12NSrBIZv+z9BYYsuHGiuuO2AABqqnkmDVu87g5XaeTsXkEmb7KIB5Tu5sIiJq
         cIRg==
X-Forwarded-Encrypted: i=1; AJvYcCU5ECrmdm/5ATrMzOuZmJFXELH9MmmmFP7Sd9y52NpbBDS//uBQMHXU7loymTBffbxzlAoKk2CPKOQ/ak36@lists.linux.dev
X-Gm-Message-State: AOJu0YxAvTdGD//7cqJvPK9LO4SBFCHu3xNHEjNUa2r1n5vV/bWFUxal
	djaUmFW6y4/MA77UO70Yt5ZsH/pfgcq1E7dUaAMpRGB107H+8KUs5PSvCevtNm0=
X-Google-Smtp-Source: AGHT+IFPtgPateumTcL4fx59JpiDJqrolmR5WA4S8dFYvswZfBVsUu8vANi78NaZCjg141Y1nAf4Mg==
X-Received: by 2002:a17:907:a0c9:b0:a99:ee23:dfb8 with SMTP id a640c23a62f3a-a99ee23e019mr1266522566b.20.1729088569175;
        Wed, 16 Oct 2024 07:22:49 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a2971a48csm189681966b.6.2024.10.16.07.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 07:22:48 -0700 (PDT)
Date: Wed, 16 Oct 2024 17:22:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Vimal Agrawal <avimalin@gmail.com>,
	linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
	arnd@arndb.de
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, avimalin@gmail.com,
	vimal.agrawal@sophos.com
Subject: Re: [PATCH] misc: misc_minor_alloc to allocate ids for all
 dynamic/misc dynamic minors
Message-ID: <f38e017e-40ef-4241-8701-fc56c5c2d06d@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241014131416.27324-1-vimal.agrawal@sophos.com>

Hi Vimal,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vimal-Agrawal/misc-misc_minor_alloc-to-allocate-ids-for-all-dynamic-misc-dynamic-minors/20241014-211915
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20241014131416.27324-1-vimal.agrawal%40sophos.com
patch subject: [PATCH] misc: misc_minor_alloc to allocate ids for all dynamic/misc dynamic minors
config: sparc64-randconfig-r072-20241015 (https://download.01.org/0day-ci/archive/20241016/202410161811.aIPEJHOt-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410161811.aIPEJHOt-lkp@intel.com/

smatch warnings:
drivers/char/misc.c:89 misc_minor_alloc() error: uninitialized symbol 'ret'.

vim +/ret +89 drivers/char/misc.c

d52c84545e305b Vimal Agrawal    2024-10-14  66  static int misc_minor_alloc(int minor)
ab760791c0cfbb D Scott Phillips 2022-11-14  67  {
ab760791c0cfbb D Scott Phillips 2022-11-14  68  	int ret;
ab760791c0cfbb D Scott Phillips 2022-11-14  69  
d52c84545e305b Vimal Agrawal    2024-10-14  70  	if (minor == MISC_DYNAMIC_MINOR) {
d52c84545e305b Vimal Agrawal    2024-10-14  71  		/* allocate free id */
ab760791c0cfbb D Scott Phillips 2022-11-14  72  		ret = ida_alloc_max(&misc_minors_ida, DYNAMIC_MINORS - 1, GFP_KERNEL);
ab760791c0cfbb D Scott Phillips 2022-11-14  73  		if (ret >= 0) {
ab760791c0cfbb D Scott Phillips 2022-11-14  74  			ret = DYNAMIC_MINORS - ret - 1;
ab760791c0cfbb D Scott Phillips 2022-11-14  75  		} else {
ab760791c0cfbb D Scott Phillips 2022-11-14  76  			ret = ida_alloc_range(&misc_minors_ida, MISC_DYNAMIC_MINOR + 1,
ab760791c0cfbb D Scott Phillips 2022-11-14  77  				      MINORMASK, GFP_KERNEL);
ab760791c0cfbb D Scott Phillips 2022-11-14  78  		}
d52c84545e305b Vimal Agrawal    2024-10-14  79  	} else {
d52c84545e305b Vimal Agrawal    2024-10-14  80  		/* specific minor, check if it is in dynamic or misc dynamic range  */
d52c84545e305b Vimal Agrawal    2024-10-14  81  		if (minor < DYNAMIC_MINORS) {
d52c84545e305b Vimal Agrawal    2024-10-14  82  			minor = DYNAMIC_MINORS - minor - 1;
d52c84545e305b Vimal Agrawal    2024-10-14  83  			ret = ida_alloc_range(&misc_minors_ida, minor, minor, GFP_KERNEL);
d52c84545e305b Vimal Agrawal    2024-10-14  84  		}
d52c84545e305b Vimal Agrawal    2024-10-14  85  
d52c84545e305b Vimal Agrawal    2024-10-14  86  		if (minor > MISC_DYNAMIC_MINOR)
d52c84545e305b Vimal Agrawal    2024-10-14  87  			ret = ida_alloc_range(&misc_minors_ida, minor, minor, GFP_KERNEL);

What about if minor is >= DYNAMIC_MINORS (128) but <= MISC_DYNAMIC_MINOR (255)?

d52c84545e305b Vimal Agrawal    2024-10-14  88  	}
ab760791c0cfbb D Scott Phillips 2022-11-14 @89  	return ret;
ab760791c0cfbb D Scott Phillips 2022-11-14  90  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

