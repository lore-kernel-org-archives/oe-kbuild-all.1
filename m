Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794561D7E48
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Sep 2024 19:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725391927; cv=none; b=aMhl3pBu1kwWfSggcyT+odF/07lNdk7/GjzGnHgXogT9erFsG7FSHlNxrqSkQo/waqVCVSbMJVfg88z3ck2QBozm+EHQ3eoTFTTrJpdGP+pKJ6TY9gXN7sl4oqgCUBwoq9cWOW/6pOZE4KnOlWfpv9SpoILn/QZ6oF+Ld9FXmKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725391927; c=relaxed/simple;
	bh=2W8hwznFDZoXHvINBPmZvBk+WEJ0g4V7yTJYC3HD3Yg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DXjO9kOrg4weX5PgVv0reOF3VqllyJa+ap+7nC30HqgGx4Pg6TriTEaTbwZujLfFA7HxvntowHxVkf0HLLCSGb0tQ4KTV2vbVjL9g+Zd5aAHsJPEXisl8/+qVm6zHezqvXSKTpw4YQ2p4kYCbjc9Hj9z/XVXBj5gGUrbLyFXws4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PTtxfG20; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PTtxfG20"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-374ca65cafdso1243524f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 03 Sep 2024 12:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725391924; x=1725996724; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LVzAyCpAybrQZZdn0DRcKq/aGvOZv6izq6VKEaiwBWA=;
        b=PTtxfG20ALp4xs64phEqXq4EJ9Pxf11ZPdD2Mw4CbUjiL5ng9LvWXjyZMhso7HcN+t
         xlpJQm1tFfbFiLzrScYMQ1TIsEDMGI5x0aPqj3ZUEBrV+siF0/ZxrxmKpib7ycbpvbxi
         Fq2JJDeNAZVZIllIoaQA4BmlI1Q+Atq51yVhxE6g6BqXO1Sj485ZG5tavyc6cK9xCkC1
         ru5svh3Y99hGRIRlIKejzBpijC4bEgpGXIIhQT/5ztutR64f6LuzSesgaiK/MC7Rv4Pi
         n9I/8pGCcDlQUnOrovb0ZwFx3GERVwrViHTNLF0LLmYNS6M8Z7yQbphUNvx+SEotCuVb
         ZhOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725391924; x=1725996724;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LVzAyCpAybrQZZdn0DRcKq/aGvOZv6izq6VKEaiwBWA=;
        b=mf/cR/G5lyhM+dIflt1UJKXy1A5CUE757nntf6pUvL7Np8F5lRKekWpj5aUhm9G6Yy
         iMQi/N0yUetXMXXOOrychEanRbjNNpsMuVSyldE/KCwY7DO5kbvrELXxqhJoQ9c97mcN
         RC3dU98rAx0+k6Wzpl+zDkmyKHIXKSuNdvmBJp7538xoD2zqpBZXzgblfAbAVYOS4mlD
         UEf/rZkFdjA/Albz0f+ySTS26reBc5Y3dIPGv9fk27skwiUvzxqFQGZYZJojqwn0bCzD
         Ib+rAinxllXx9lJxu826Jo+1V1K/MvUdcSJiS7ZiGwQNXWYz43lU6d3IzwLp7tVfChRv
         cg5w==
X-Forwarded-Encrypted: i=1; AJvYcCXPkPlUamYcA4KnAuObagp5iDrxdypXpVgr4cWoOw3lhMNCZu2qUPngJrrlVdIZPh4vkzEVM+NHnyYkUu2v@lists.linux.dev
X-Gm-Message-State: AOJu0YzE0wWz/2OLAIxOc6Jy0tPbWRsGR1TNG3kZNpxXI8bllPhw7/iI
	kdscnHBZUO7HbkrwyTTzq8BfGGRg/ZWBrj0vs5vq9Y9xwjDkpCItGOaxq4BDanw=
X-Google-Smtp-Source: AGHT+IF9HQM1swDjMPfJ6RpIz5fscrjBfplQb4M7+zaGIxvVZXS3GsM/i7FjzDTG4TMaiHzVFGKe3A==
X-Received: by 2002:adf:a351:0:b0:374:baeb:2fb with SMTP id ffacd0b85a97d-374baeb0c2amr7876635f8f.35.1725391923345;
        Tue, 03 Sep 2024 12:32:03 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374c39eacdfsm8843054f8f.42.2024.09.03.12.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 12:32:02 -0700 (PDT)
Date: Tue, 3 Sep 2024 22:31:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, shuaijie wang <wangshuaijie@awinic.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [jic23-iio:testing 268/269] drivers/iio/proximity/aw96103.c:475
 aw96103_reg_version_comp() warn: iterator 'i' not incremented
Message-ID: <97914f05-0881-4c33-9acb-117f89dba35c@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   fa533227a89a1d8509a1ad4e93a35d683a77aa23
commit: a369e1d1a10790f63b4b858dc74b53730146754f [268/269] iio: proximity: aw96103: Add support for aw96103/aw96105 proximity sensor
config: riscv-randconfig-r072-20240901 (https://download.01.org/0day-ci/archive/20240904/202409040114.Rpkwt3gm-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 6f682c26b04f0b349c4c473756cb8625b4f37c6d)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202409040114.Rpkwt3gm-lkp@intel.com/

smatch warnings:
drivers/iio/proximity/aw96103.c:475 aw96103_reg_version_comp() warn: iterator 'i' not incremented

vim +/i +475 drivers/iio/proximity/aw96103.c

a369e1d1a10790f shuaijie wang 2024-08-27  457  static int aw96103_reg_version_comp(struct aw96103 *aw96103,
a369e1d1a10790f shuaijie wang 2024-08-27  458  				    struct aw_bin *aw_bin)
a369e1d1a10790f shuaijie wang 2024-08-27  459  {
a369e1d1a10790f shuaijie wang 2024-08-27  460  	u32 blfilt1_data, fw_ver;
a369e1d1a10790f shuaijie wang 2024-08-27  461  	unsigned char i;
a369e1d1a10790f shuaijie wang 2024-08-27  462  	int ret;
a369e1d1a10790f shuaijie wang 2024-08-27  463  
a369e1d1a10790f shuaijie wang 2024-08-27  464  	ret = regmap_read(aw96103->regmap, AW96103_REG_FWVER2, &fw_ver);
a369e1d1a10790f shuaijie wang 2024-08-27  465  	if (ret)
a369e1d1a10790f shuaijie wang 2024-08-27  466  		return ret;
a369e1d1a10790f shuaijie wang 2024-08-27  467  	/*
a369e1d1a10790f shuaijie wang 2024-08-27  468  	 * If the chip version is AW96103A and the loaded register
a369e1d1a10790f shuaijie wang 2024-08-27  469  	 * configuration file is for AW96103, special handling of the
a369e1d1a10790f shuaijie wang 2024-08-27  470  	 * AW96103_REG_BLRSTRNG_CH0 register is required.
a369e1d1a10790f shuaijie wang 2024-08-27  471  	 */
a369e1d1a10790f shuaijie wang 2024-08-27  472  	if ((fw_ver != AW96103A) || (aw_bin->chip_type[7] != '\0'))
a369e1d1a10790f shuaijie wang 2024-08-27  473  		return 0;
a369e1d1a10790f shuaijie wang 2024-08-27  474  
a369e1d1a10790f shuaijie wang 2024-08-27 @475  	for (i = 0; i < aw96103->max_channels; i++) {

This loop only iterates one time.

a369e1d1a10790f shuaijie wang 2024-08-27  476  		ret = regmap_read(aw96103->regmap,
a369e1d1a10790f shuaijie wang 2024-08-27  477  			AW96103_REG_BLFILT_CH0 + (AW96103_BLFILT_CH_STEP * i),
a369e1d1a10790f shuaijie wang 2024-08-27  478  			&blfilt1_data);
a369e1d1a10790f shuaijie wang 2024-08-27  479  		if (ret)
a369e1d1a10790f shuaijie wang 2024-08-27  480  			return ret;
a369e1d1a10790f shuaijie wang 2024-08-27  481  		if (FIELD_GET(AW96103_BLERRTRIG_MASK, blfilt1_data) != 1)
a369e1d1a10790f shuaijie wang 2024-08-27  482  			return 0;
a369e1d1a10790f shuaijie wang 2024-08-27  483  
a369e1d1a10790f shuaijie wang 2024-08-27  484  		return regmap_update_bits(aw96103->regmap,
a369e1d1a10790f shuaijie wang 2024-08-27  485  			AW96103_REG_BLRSTRNG_CH0 + (AW96103_BLFILT_CH_STEP * i),
a369e1d1a10790f shuaijie wang 2024-08-27  486  			AW96103_BLRSTRNG_MASK, 1 << i);
a369e1d1a10790f shuaijie wang 2024-08-27  487  	}
a369e1d1a10790f shuaijie wang 2024-08-27  488  
a369e1d1a10790f shuaijie wang 2024-08-27  489  	return 0;
a369e1d1a10790f shuaijie wang 2024-08-27  490  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

