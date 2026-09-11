Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C407947125B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Sep 2026 12:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789129419; cv=none; b=GwCwYjExFBmNpCQeeme5dUZl32h0QsyVssRvyQhdGZbLBrbBe4rM+49ACfi08x4q8RXBUxHyiMBAAeOc3hA4MhRcFsep36i3tFO3YIxpVrloOrn7X5c/wWySG/Hb8sIYBsDKcxpnn+Fr6SSg/XgZNbUg70QjSdRM7M+r6GcMtZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789129419; c=relaxed/simple;
	bh=WMg5pNKFeS/3Df03be8/j7ACkOJBdxGDH4qU5fGArMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oN/DfXI+HoUQJdFu5CaQfpvSJNrk0kT5Acjtz6SRS8MzgkpX538owIfODFmHigNsh0cKqVQ8YFSOfbf9I+7X8TmUYDPu4HEKy/uZ1Nsc4hVNdz+f5Xxn/v+MnzpFuEHvd3pv89NNNECQ+ytEh1R/W24JEhkJ/mKyFjlXAjrax7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nTuAgD1A; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nTuAgD1A"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48586861639so348535f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Sep 2026 05:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789129412; x=1789734212; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PpMXHaFF1JIW3abETAGrUWAAHuJWrnkzeYHOUDUyhbo=;
        b=nTuAgD1Au/hjH9iWY2v5J5AxLk1+QXkXsRCvLGldpI4MQP+wgOCsaFIl9haBoVuqEq
         h3t4UpdWiLueQuWxlzejl9QhP2Tb6qRkzuiMYDC5VWMo+muqyHUMIlfe8a2YUMNkScSK
         HRcH8ALxHT3nm2KdF4LdxWkB6FpIZ3YlFiuxPX9UYqxpVpizme9cHvNlQmxfx+ioW8Pf
         6HcfdVAu9QuhyHasNW7PqWAbFJljbTQHQTROmHd44wxkXPvQUox+7neOmkzxGWH/OsX5
         Uaz+xtmgdLGZnQFz8WEJR2euouDdeb+ByK0YC+ASTYcKGaT7C6YDc7FLQ4LJuOu0zxqS
         nLWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789129412; x=1789734212;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PpMXHaFF1JIW3abETAGrUWAAHuJWrnkzeYHOUDUyhbo=;
        b=TYssWsTcuyXOeDL9GjfPhPuSA2TPr6HhrYajBgF110ERsjD9rqHIERnk+1QeIcj5LF
         8baDDyyTfSd5GGyp0mRV2Wj1ylrOfQHyDg/JokBRprDQHNigXoQzDM0MoV7oEBZqhYNs
         L9kb0pJ7OJyBOYE17e0YoMnxBLBqDkxWJMwcN7GOAiAYOsJeoCnaGhBB3sd57XOJ7LHh
         GKeHGKPZuaj2SbEAwrrhQUcWl53SqtGpiQHj6icXuEang6IeoJMoJfCIwZl3P1YOFP9u
         sydtDp4B7YqQitG1ltnatXTKGUYuh8Qk0sIZjyIdnJCHnFK7fWqXPhMnrGObmR9EvpMe
         ZXIg==
X-Forwarded-Encrypted: i=1; AKwUvBztI8MBN4qH9rPmANFaqmGb1eZKVL8y+SakR395R1fbV/d6eaM+qnrYwqgRdUn2JdhDpxA5MSm7HtubID5z@lists.linux.dev
X-Gm-Message-State: AFuF++lPzzo6yodN3+4/EsccJutYEnN50kfhDD7O7Gv8Ho6tCqOOpRuG
	fA6wqwgKihGJMwYqq68WjV4qP9Rhw/ilFEGvk8k/Hy/Ptwlpdy+oQPuMh0t23IusZyA2OQ==
X-Gm-Gg: AYBFou0w03LlfUyMI2U2ZP3gl/UaR3YU3HgNxYPowbUUX6ZsB49NJW0xOQSo8R6X61w
	4Rp3b386RsKDbJTmX9YFiI/gQg8P9t9+CvTv9PJdKAcv1v0sZeKB9/kfO6hbU+HKzCD27fW9v7k
	yGUsWtSyFJI7dLAJ3zljm4Q9TK+umNAsJqZbBaFvm4frvbV4yUhva73F6SCgJHVlfkupm/sdozV
	1HvzkjQALCrFmSWl+p+9dH5uZtR3CWLSEPJUpMIYFTVFA7Kxqx2Zmg6OhGrZ448zUrkmDPIeLw8
	NgE9jD22+YGDQYXhv/BcnakminUEJfuHTZGTbfUwyRbKFEMZ94LpEOJIqWcGHXF7UstAZPtRdEw
	F+zoy4HI74eMy5yFN6IqEOA8l8U3ChJKYWyt404u73uT+KuabJWYfWxmFeQMBh/HiDhSSp41uti
	1bh2Ko2vyfsOxT4Vtx46/XiDMGSC+RKqkNVDM/7CqglR3bJoS368uhoKcdy7eIEun+Xqw=
X-Received: by 2002:a05:6000:2311:b0:485:8d9c:47d2 with SMTP id ffacd0b85a97d-486e0f955c8mr11792035f8f.30.1789129411941;
        Fri, 11 Sep 2026 05:23:31 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34e608sm5870255f8f.23.2026.09.11.05.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 05:23:31 -0700 (PDT)
Date: Fri, 11 Sep 2026 15:23:28 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:board-remove-7.3 182/295] drivers/hwmon/ads7828.c:121
 ads7828_probe() warn: if statement not indented
Message-ID: <202609111050.oiut4oST-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove-7.3
head:   cf983087c51a9c74c3d4d3b353eb811ae5030823
commit: 4df92b98525f08e1eab92a25f5da2045c78403e8 [182/295] hwmon: asd7828: remove pdata based probing
config: arm-randconfig-r071-20260911 (https://download.01.org/0day-ci/archive/20260911/202609111050.oiut4oST-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609111050.oiut4oST-lkp@intel.com/

smatch warnings:
drivers/hwmon/ads7828.c:121 ads7828_probe() warn: if statement not indented

vim +121 drivers/hwmon/ads7828.c

5812f9283e6213 Steve Hardy              2008-01-22  116  
a8ddfea09566c3 Sam Povilus              2017-03-29  117  	diff_input = of_property_read_bool(dev->of_node,
a8ddfea09566c3 Sam Povilus              2017-03-29  118  					   "ti,differential-input");
fddb5ceaf901b0 Qingshuang Fu            2026-08-05  119  	vref_uv = devm_regulator_get_enable_read_voltage(dev, "vref");
fddb5ceaf901b0 Qingshuang Fu            2026-08-05  120  	if (vref_uv < 0) {
fddb5ceaf901b0 Qingshuang Fu            2026-08-05 @121  		if (vref_uv != -ENODEV)
fddb5ceaf901b0 Qingshuang Fu            2026-08-05  122  		return vref_uv;

Add another tab before the return.

fddb5ceaf901b0 Qingshuang Fu            2026-08-05  123  	} else {
a8ddfea09566c3 Sam Povilus              2017-03-29  124  		vref_mv = DIV_ROUND_CLOSEST(vref_uv, 1000);
a8ddfea09566c3 Sam Povilus              2017-03-29  125  		if (vref_mv < ADS7828_EXT_VREF_MV_MIN ||
a8ddfea09566c3 Sam Povilus              2017-03-29  126  		    vref_mv > ADS7828_EXT_VREF_MV_MAX)
a8ddfea09566c3 Sam Povilus              2017-03-29  127  			return -EINVAL;
a8ddfea09566c3 Sam Povilus              2017-03-29  128  		ext_vref = true;
a8ddfea09566c3 Sam Povilus              2017-03-29  129  	}
--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

