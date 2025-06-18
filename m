Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E89A2FEE0F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Jun 2025 17:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750267889; cv=none; b=Y9RCAtay5WuyG6fbXT7YrCL5kJk+XGrv5nILzD+cWccMr+FVA/qQT5Fbx6znn/gc7W4Hw7zgik3mLfvLuqQqXoXAprL1U8bZWSU7gP35Jiq4E839MbRvy3TExrwGMOHFI+6NaEaFDk+/qeoEYOgUmvNJkpC6rKomhqAh0SFPhFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750267889; c=relaxed/simple;
	bh=0YEwiPo8T4OcWBogr82UpcKJ7cH5rx4rCLi+sPvqIeY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=YJheE0Xjym4ZTnyuAH1agBeZP7sD6Ja04VrOhS6AI9Kv3wKyYqTcEP4ZtD1n9duPiMuthE9+6MvGLK10kDd5o6jwHzjCERxgJdeCLRokd3FK11oQ5tr8zq6SVWC8WnCFoy3gchM+kIJcPElNHLl26WRkPzH71EZmZWFo0J0meJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xrLkKQYR; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xrLkKQYR"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-40905ae04e4so2038700b6e.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Jun 2025 10:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750267887; x=1750872687; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YFOtBsExh2BQyD2oG26Jl5MLncIJvS+Gsu483YiffqY=;
        b=xrLkKQYR1olWaZTcuswsIv3UbXUW7Vo2xqpkRfozllZ8GMSgt7RaKqTA7T+/ytra7A
         FOP61QXGeQmLjIh6mQibx5Mv7xf2yYK0DDcXFoQG2EkSkcgzY5CWnMrlR+smv6SgnDu8
         n9+Oe17covgLdJX23XFG/UvP6XNAZtKLCCOQyN0WgaTTMs0EyYTxKuuPNefaZ0KvQs7T
         ZZmacSLnJ11QXGV9fqPzal3QaplU3OaXcu9MkB9AwNfT33evTVQGBNtpxOXrFZ8GDqXp
         n3936vlCzRPRgxrcXlJSR6azJ0Ml8HvEhLXbbBex8mVPWJYOynQX7boFqr/s0BqUvaLm
         mJUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750267887; x=1750872687;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YFOtBsExh2BQyD2oG26Jl5MLncIJvS+Gsu483YiffqY=;
        b=GMfqnnP9/6Bh79oBU0djMI+I2XGEXsGcBXFnmVi1kxHfDVfn4ryA3UlysKnWZWWw8X
         cHlpRbbXiN60LsyFi3/ONaSusnyR6LJ3rsAUTRd1crE6FMeAsJLMJSinw71QmYKyaqyu
         Qv3FY7tOboFBkILVoZe91gET2foVxaA8WkkwhugFSutpHSzJMGp1b8LniGEDGGC17bGI
         3oe31xIE3CrHFQQZrBkdyrwXc25pgFHg9mHYYPKyVcF9fYOKeOCD5ltIrQA1sjnaSaLI
         RNWfPMbwwMPwPhBzH+mcnMZPeRs5rAtvq25EMosvyOXGF7E/bACdiWuK0YsWwJy6N0h+
         ZEQg==
X-Forwarded-Encrypted: i=1; AJvYcCXcqcssV3EhHForV6YaX7glM1LscVlEW4JeqbTdXTmvgdtLvRzknxb6Q05L6xngZ+kIZ7xtSlHbvPu2QFG6@lists.linux.dev
X-Gm-Message-State: AOJu0Yzs2sqYQ7dI11lwXbp9SnELwiIFLOo0f8nxcgNWcO0nOVoeV69I
	P+XXjr67JIBmiR8GqdOWMnoCzWhlT21Lf7+K05jQs45Hj3aUPPecfqKtK0wtME8xz1Q=
X-Gm-Gg: ASbGncv80Esbf/IeGHXFeKeHHEbV5yaPK57L9xExFc5sJIRJls5VH49GB51e0Pj9y8c
	EU+HwzrkNbfNWn8pYI8c+DXTLZJ4DG7jWsfih8veqKmd9CTYc4iEoBoCSS6N18QvojNFM4CggOu
	tILlNam2IFgf967hLpY53CJ/VOe53vpBNGQN90QNZU3b5nZFCkbAMcIYzXsh0UdxR2H9W4sa4KF
	534geqgl9HYwsvQVBNcROBb7arQfKoZscIe8bRfQvNb+0ssv+i/hASwA6tMp+dk7pILBPmmOOYY
	OGh4f3QPb+FBsnEAyBJaQylMn+9XQ7+aMBM+cAHEM/WwpvUsAJMCbTt9N3nlBxDqdxqdN3+Fdxe
	wY8hh
X-Google-Smtp-Source: AGHT+IFq/TTKxXerQXOZD6z3ttN0SBB3O4FF6/J83p6jBo2TVRfqU4lrL6RjS+Jqa8IWmsmDVdriYQ==
X-Received: by 2002:a05:6808:2384:b0:40a:59fd:1368 with SMTP id 5614622812f47-40a7c1b4040mr11436498b6e.4.1750267886667;
        Wed, 18 Jun 2025 10:31:26 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1b3b:c162:aefa:da1b])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a73fc91c8sm2439768b6e.0.2025.06.18.10.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 10:31:25 -0700 (PDT)
Date: Wed, 18 Jun 2025 20:31:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5] char: misc: add test cases
Message-ID: <00b3cd7a-fd52-4efd-9d1e-d7cc585ab22f@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612-misc-dynrange-v5-1-6f35048f7273@igalia.com>

Hi Thadeu,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Thadeu-Lima-de-Souza-Cascardo/char-misc-add-test-cases/20250613-013440
base:   19272b37aa4f83ca52bdf9c16d5d81bdd1354494
patch link:    https://lore.kernel.org/r/20250612-misc-dynrange-v5-1-6f35048f7273%40igalia.com
patch subject: [PATCH v5] char: misc: add test cases
config: powerpc-randconfig-r072-20250613 (https://download.01.org/0day-ci/archive/20250613/202506132058.thWZHlrb-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506132058.thWZHlrb-lkp@intel.com/

smatch warnings:
drivers/misc/misc_minor_kunit.c:192 miscdev_test_can_open() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +192 drivers/misc/misc_minor_kunit.c

127b049d35f107 Thadeu Lima de Souza Cascardo 2025-06-12  178  static void __init miscdev_test_can_open(struct kunit *test, struct miscdevice *misc)
127b049d35f107 Thadeu Lima de Souza Cascardo 2025-06-12  179  {
127b049d35f107 Thadeu Lima de Souza Cascardo 2025-06-12  180  	int ret;
127b049d35f107 Thadeu Lima de Souza Cascardo 2025-06-12  181  	struct file *filp;
127b049d35f107 Thadeu Lima de Souza Cascardo 2025-06-12  182  	char *devname;
127b049d35f107 Thadeu Lima de Souza Cascardo 2025-06-12  183  
127b049d35f107 Thadeu Lima de Souza Cascardo 2025-06-12  184  	devname = kasprintf(GFP_KERNEL, "/dev/%s", misc->name);
127b049d35f107 Thadeu Lima de Souza Cascardo 2025-06-12  185  	ret = init_mknod(devname, S_IFCHR | 0600,
127b049d35f107 Thadeu Lima de Souza Cascardo 2025-06-12  186  			 new_encode_dev(MKDEV(MISC_MAJOR, misc->minor)));
127b049d35f107 Thadeu Lima de Souza Cascardo 2025-06-12  187  	if (ret != 0)
127b049d35f107 Thadeu Lima de Souza Cascardo 2025-06-12  188  		KUNIT_FAIL(test, "failed to create node\n");
127b049d35f107 Thadeu Lima de Souza Cascardo 2025-06-12  189  
127b049d35f107 Thadeu Lima de Souza Cascardo 2025-06-12  190  	filp = filp_open(devname, O_RDONLY, 0);
127b049d35f107 Thadeu Lima de Souza Cascardo 2025-06-12  191  	if (IS_ERR_OR_NULL(filp))

This should just be if (IS_ERR()) {
https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-and-null/

127b049d35f107 Thadeu Lima de Souza Cascardo 2025-06-12 @192  		KUNIT_FAIL(test, "failed to open misc device: %ld\n", PTR_ERR(filp));
127b049d35f107 Thadeu Lima de Souza Cascardo 2025-06-12  193  	else
127b049d35f107 Thadeu Lima de Souza Cascardo 2025-06-12  194  		fput(filp);
127b049d35f107 Thadeu Lima de Souza Cascardo 2025-06-12  195  
127b049d35f107 Thadeu Lima de Souza Cascardo 2025-06-12  196  	init_unlink(devname);
127b049d35f107 Thadeu Lima de Souza Cascardo 2025-06-12  197  	kfree(devname);
127b049d35f107 Thadeu Lima de Souza Cascardo 2025-06-12  198  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

