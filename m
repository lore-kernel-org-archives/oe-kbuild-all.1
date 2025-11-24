Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92DB2EC0A2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Nov 2025 08:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763971614; cv=none; b=nHSVx+f070Gv8hB1fLZ12S0T4jpW3B6ppcgY9OrYRhWuf8pI+eSFsJqoBBbuQvVXcSMILbgK3sFMeKfIsT0UFiTtP6W5QV2psiBk5QSjRGqbvw0xSNRTKiElNdsGht9Gr7k7TVv8qlE1vO7V/L1HATIsGc0C1UoArYZADR5Kmao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763971614; c=relaxed/simple;
	bh=04CAVc9NYmzBARlfFLXzpIVPUPs15woRVlixT8WhzEg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F9eKYAf/OAeYlFJpgugVK/J9dsYSTzxDonzXmcS7f7lQKcS5Vn3pF807pL5pb3MaK/dEoBpnlq5q0ATvXOdqWr1/yLN8wdj1CCJs/kye0V1dbxzS6VfCr36iTY9PDALOJXZzQ4+m7GO/gy7GKW7OX1fxOKPg4DWaG5n1GM/bUi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MeBKpO2z; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MeBKpO2z"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47755de027eso20698035e9.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Nov 2025 00:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763971611; x=1764576411; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uc/0gP/rCNw1M7RpPfA6xqpTqag4xQiO55TVkmbdX2o=;
        b=MeBKpO2zydtZlRKv22PhNOd+H+ekciw5OU3mBfk65MRPP61yw23cnkZuv562yufpws
         bgnIavHqXHO23JxMXK28F+hC8+/aFpM8SvGS4t1FjWen0m7q9qhZZhVxflpWHpKu+k85
         nqn1m1hOgoygBeKwV30AvZBtDktVw0MbCrdTrWryPEQqOgg8ofDOehnYBlnMdhMue1Hs
         2Kd9/DK5eL2ZMcLWdam/bzSVc/jdAXCDDgeBDZRSUHlWb1TyArMDr+rQyVlMM2MJJiUH
         B3nXm7/lROUuxNjR/cB9lX2j8T/zYu/cAZI9AVmJ4A61DKsUiv2nhqk3eTWfh0/u2FAW
         GTkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763971611; x=1764576411;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uc/0gP/rCNw1M7RpPfA6xqpTqag4xQiO55TVkmbdX2o=;
        b=JMXKtGcsO/s2b381i+ZDjqo9zQIDLFwgLdr7c0UmZFdPQ/9MgomqMFHqG9r6SIX3z4
         bL6MK4UahByf4zpzfFo1pW0EgF3epU2dgOLQVdPaa9ZmQFPlY9iqfIE3CZ9dUKpEfpzd
         WEi+TgNMwzmVu6NrljNGVN1uKoTmCOVFwdonZ04qY6A5+5NEtSYSEr1AukWvV0o9eOt2
         lfDS9I2e4MsV4TTR6vthq1ny07e2q1sswnS2086fP5zuyFDnVwvDWkAE/RfGaOd2ZgOW
         51xGsX4ogWWDnHj1Hb1bQFaNkUJNyG+BHuSoC3A3GT2xr25UI/2e2uPJtl9Uvm4NGj1K
         AJMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAaHxnmZ5zOlwaWoI6ii2klwu2MvointfhNrklwJV2teXlmps8mHxqXETlrKEJ375Tpb7kpf7v6fF2EF64@lists.linux.dev
X-Gm-Message-State: AOJu0YyF4d47mo2aEFDB1pdWnk2bIFGxRWJd++IvJhlLFEbBCOjK7iVC
	NQuF2U7KeG9j4x3H9iVC3oF+ZAptDXqZnNe0nuA4JauHfHkyawbF6Z794kkUjHtktos=
X-Gm-Gg: ASbGncvqvLhCBNi/jPeX0MjH1BAA83ATmPp0+iqPW4U10pyGCInEH4E28T2MIWp+Nji
	RffUW+09WPTgNmxvWBhyCAdAA8tDOdFUDZQus1zlZv0LYc7UA4myh5WtavhXTFnQFhH6AnmJWOV
	ZctOU59EJVes1VLnTe4F5Xr0FrtLqElMwJiIRFnRN9/iwdz0LklUfQDk641KHAEeYve2N3wz5Qu
	FRkFAIy+YxEsxPG0jOVpFPzwHa2QotnSlLLjx4JqC2j/X6dqTWSt+L9uBW5OBJ1NbbRhz6twqRl
	JZnlRoILNkBU7XjBCIgheqZF2OwiDWaIQCQfdgqo1HLymnEpi4VaADH1jAoAjMXypv6Y/Z2+cRY
	wqTAHUS9U8TybAsCbPDb3te8l9VX96su3iN7qx/6JwQokHMbILE0KmSD88yreb1fVk5RlkU4rcD
	vE7esPFtei0Vjv3zIO
X-Google-Smtp-Source: AGHT+IHaBdWDTMD3cQHQ5iFQbx0Sba2kNBDM7GMIrebSlU8eWt1vCYVEhaxFP/6Tk9w3EISTiZORgQ==
X-Received: by 2002:a05:600c:4591:b0:477:8b77:155e with SMTP id 5b1f17b1804b1-477c018a016mr136300645e9.15.1763971611110;
        Mon, 24 Nov 2025 00:06:51 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-477bf1e872esm180713855e9.5.2025.11.24.00.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 00:06:50 -0800 (PST)
Date: Mon, 24 Nov 2025 11:06:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Christian Brauner <brauner@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:work.fd.prepare.scoped 16/52] fs/open.c:1424
 do_sys_openat2() error: uninitialized symbol 'tmp'.
Message-ID: <202511220547.BX8AdVlr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git work.fd.prepare.scoped
head:   09ba3707485de081133d97c9bdc7fa364d318f46
commit: a290be3972f9df5a58b630e081d53caa1305ca1c [16/52] open: convert do_sys_openat2() to FD_PREPARE()
config: loongarch-randconfig-r072-20251122 (https://download.01.org/0day-ci/archive/20251122/202511220547.BX8AdVlr-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511220547.BX8AdVlr-lkp@intel.com/

smatch warnings:
fs/open.c:1424 do_sys_openat2() error: uninitialized symbol 'tmp'.

vim +/tmp +1424 fs/open.c

29d80d506b18384 Yuichiro Tsuji      2025-01-21  1420  static int do_sys_openat2(int dfd, const char __user *filename,
fddb5d430ad9fa9 Aleksa Sarai        2020-01-18  1421  			  struct open_how *how)
^1da177e4c3f415 Linus Torvalds      2005-04-16  1422  {
47c805dc2d2dff6 Al Viro             2011-02-23  1423  	struct open_flags op;
a290be3972f9df5 Christian Brauner   2025-11-18 @1424  	struct filename *tmp __free(putname);
a290be3972f9df5 Christian Brauner   2025-11-18  1425  	int err;
f9652e10c12b43d Al Viro             2013-06-11  1426  
d5a05a5a44a983e Mateusz Guzik       2025-03-20  1427  	err = build_open_flags(how, &op);
d5a05a5a44a983e Mateusz Guzik       2025-03-20  1428  	if (unlikely(err))
d5a05a5a44a983e Mateusz Guzik       2025-03-20  1429  		return err;

tmp is uninitialized.

f9652e10c12b43d Al Viro             2013-06-11  1430  
f9652e10c12b43d Al Viro             2013-06-11  1431  	tmp = getname(filename);
f9652e10c12b43d Al Viro             2013-06-11  1432  	if (IS_ERR(tmp))
f9652e10c12b43d Al Viro             2013-06-11  1433  		return PTR_ERR(tmp);
ef3daeda7b58f04 Yoav Zach           2005-06-23  1434  
a290be3972f9df5 Christian Brauner   2025-11-18  1435  	FD_PREPARE(fdf, how->flags, do_filp_open(dfd, tmp, &op)) {
a290be3972f9df5 Christian Brauner   2025-11-18  1436  		if (fd_prepare_failed(fdf))
a290be3972f9df5 Christian Brauner   2025-11-18  1437  			return fd_prepare_error(fdf);
a290be3972f9df5 Christian Brauner   2025-11-18  1438  
a290be3972f9df5 Christian Brauner   2025-11-18  1439  		return fd_publish(fdf);
fed2fc18a4567d6 Telemaque Ndizihiwe 2005-06-23  1440  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  1441  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

