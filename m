Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548B63A16BE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 May 2026 11:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778673078; cv=none; b=AS8FNQaQK+GHgQeZogsGCxfJnR+b0B1DemHE8cqkbYrXQBSXl1vaYj55qhP0ig1JZo+mKfVeNnR2Umb1ptGudKwl8eLqrSfO7FP06IcpQBZngWDWr52BCejoB2PH0f7bqPjVRhGyZkgKNm5yEt7OMifaXrIEMtiBjgO2d8CMXkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778673078; c=relaxed/simple;
	bh=gLj256UuQEFx0YuMQ40nv8jxQjP+ERIhFntrksasQQs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Im+C07yk4jQzk4LMYKEPXI8gd9BRrQwSAQaGoeQTXBzS8u6B1lh8ID/BzJ8yF5CPrpqLczwJDuhB36NKaIkrQKs7uO8u2S1Y10ege1dSyScZFvBbWZRgGr8z6RNNvJlaNadgyvxqyvT84F7Z4nqGWqdwdzAiHHa3L26hU5S/OcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ox3yfk93; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ox3yfk93"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so74470485e9.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 13 May 2026 04:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778673076; x=1779277876; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RWFQNDbf2rrK8r4ZmbR2jCjzyDHtlDs+g6TmKHPy/fw=;
        b=ox3yfk93Ck9qzTm/qTbwUFwAROTnqiVY2ylwxVfe6EhpW/HieS0NLooxKdpLhVOSfD
         22p7A+6ahBw/czYuxsgH6VVjo176pK8N8a/HHE82uNulFcSGQfVT5p7v7zlXdA451+3k
         qE79lNYG3vuORwCbHx7IXZDPIq5Os1Hx5FiLsgJvHZgfu1WUZX35uJ7MsBN9QWrBETL4
         osNLBu3RDJJovjTo7ws8keCd9ho8O+byq+FH0wdbvLgG9zQAvJt7Dp8iuC1rH++01Hx2
         0WakvIiEMUI2udmlhYDzlYP5G8IlRuZCQbzkrEO+QkLSEPvAViGV8cgM2gk1P+KEOi7T
         f5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778673076; x=1779277876;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RWFQNDbf2rrK8r4ZmbR2jCjzyDHtlDs+g6TmKHPy/fw=;
        b=omFmXM1FMgWjzJ/tEq0hzuSssQhe7ZWjYAJ2grq64xtG7ttBEvlFgMOFEEz+nw2Ih9
         slvad2tx0DeOPrOw0Wg6JIqu2JCoBw1qFVLgoCft58FVaGWu3XsHkufMXexXefY2TtwP
         pTEdhaAqUv97VqRvnKliCvaI+Ou/isThDHswjaH6kMs2sNJpB0+ZzmfnMbjzHeSPKajh
         Auwg+dWhxFgXv61zTX4ai+r28qafo4h0buWB6JL3rMil/kJSTgOnimWBZmJUhvfUuOmy
         dKqgdieHq6WknBzOYDkWy8XIeJxEXqCmpxN2PrM9i2Zz6pwDUv8EsAMnsACEIdWkS3gA
         dVXw==
X-Forwarded-Encrypted: i=1; AFNElJ/AVlnmYFPLLNQNgxzC0ETfDuONwziCXk/56ERpuW5yJ9h5tKY48zTRyDzR1o2eTF9aBCzNi71GkE9UplKr@lists.linux.dev
X-Gm-Message-State: AOJu0YyNYd/a0zNuLts/1EADUuABLu9vQyYfBYMew7IJDaLBdozcvHEu
	iIQZ2nTS1SpW1cILuGZOO4sgwwUBX2zX9gwMZl1O+XjrYGC9Y2kPsU6W
X-Gm-Gg: Acq92OFb1mAOH6dbVYc4XH/od3cxMwYblmLLHnT9AOu8cqLRtK+Cdu5BLwfa64lTok0
	lSx0pa222DtjR8+jfMJy35J2TO5qBkiDvLd2ckhswdU2279kThgeupvbYWtY3swCWcj0tVz5zkg
	BUVN4zZwe8NBeSKwIVSzhn0lJU9fT84T6AHwnWVTaliC2zKxQDPTK8l6S4mtj7u4NttX88Oc5EL
	Sf+ZkMsiiXvOeUAzwk2IpjSusmrCU59VhU9Vn6MtaZvgkl0K3e5K2sCzXwmVf4L4/+fYYKAroRR
	xH2G3JHb1kukMIuEJdUG8hSqd8+VKhkQpaKDZv3YQKXbviUW5ts7b4Wll8KDigdsewKiolxt1jL
	XLAL1oTlwDcA7M8ciaSKycdfug1x2EACLUfAiMwLfS//fAbJ8/cJU0H5QL6GzmZO9zt3AON0snC
	Q/cQR+9qdKGfGiPlloU7Y4eVwKC1jRtw==
X-Received: by 2002:a05:600c:8b75:b0:488:7ff6:1f75 with SMTP id 5b1f17b1804b1-48fc9a3b8e2mr42923045e9.21.1778673075356;
        Wed, 13 May 2026 04:51:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f3e7829sm63658835e9.4.2026.05.13.04.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 04:51:14 -0700 (PDT)
Date: Wed, 13 May 2026 14:51:11 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Helge Deller <deller@gmx.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [deller-parisc:parisc-7.0-1 4/10] arch/parisc/kernel/drivers.c:928
 qemu_header() error: strcpy() 'boot_cpu_data.pdc.sys_model_name' too large
 for 'name_mpe' (81 vs 80)
Message-ID: <202605131913.dfb23qZE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-7.0-1
head:   1651d69443c3a5fc12f1dee1229d526e7af9020a
commit: 97cb9150ff2dd8bc87726a04045f1b3eda6f52b3 [4/10] parisc: Export model name for MPE/ix
config: parisc-randconfig-r072-20260513 (https://download.01.org/0day-ci/archive/20260513/202605131913.dfb23qZE-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.4.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605131913.dfb23qZE-lkp@intel.com/

smatch warnings:
arch/parisc/kernel/drivers.c:928 qemu_header() error: strcpy() 'boot_cpu_data.pdc.sys_model_name' too large for 'name_mpe' (81 vs 80)

vim +928 arch/parisc/kernel/drivers.c

a77ab0e7ce232a6 Helge Deller   2018-03-25  915  static __init void qemu_header(void)
a77ab0e7ce232a6 Helge Deller   2018-03-25  916  {
a77ab0e7ce232a6 Helge Deller   2018-03-25  917  	int num;
a77ab0e7ce232a6 Helge Deller   2018-03-25  918  	unsigned long *p;
97cb9150ff2dd8b Helge Deller   2026-01-28  919  	char name_mpe[80];
a77ab0e7ce232a6 Helge Deller   2018-03-25  920  
a77ab0e7ce232a6 Helge Deller   2018-03-25  921  	pr_info("--- cut here ---\n");
a77ab0e7ce232a6 Helge Deller   2018-03-25  922  	pr_info("/* AUTO-GENERATED HEADER FILE FOR SEABIOS FIRMWARE */\n");
a77ab0e7ce232a6 Helge Deller   2018-03-25  923  	pr_cont("/* generated with Linux kernel */\n");
a77ab0e7ce232a6 Helge Deller   2018-03-25  924  	pr_cont("/* search for PARISC_QEMU_MACHINE_HEADER in Linux */\n\n");
a77ab0e7ce232a6 Helge Deller   2018-03-25  925  
97cb9150ff2dd8b Helge Deller   2026-01-28  926  	pr_info("#define PARISC_MODEL     \"%s\"\n",
a77ab0e7ce232a6 Helge Deller   2018-03-25  927  			boot_cpu_data.pdc.sys_model_name);
97cb9150ff2dd8b Helge Deller   2026-01-28 @928  	strcpy(name_mpe, boot_cpu_data.pdc.sys_model_name);

The boot_cpu_data.pdc.sys_model_name[] buffer is 81 characters and
name_mpe[]  is 80 characters.

97cb9150ff2dd8b Helge Deller   2026-01-28  929  	pdc_model_sysmodel(OS_ID_MPEXL, name_mpe);
97cb9150ff2dd8b Helge Deller   2026-01-28  930  	pr_info("#define PARISC_MODEL_MPE \"%s\"\n\n", name_mpe);

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

