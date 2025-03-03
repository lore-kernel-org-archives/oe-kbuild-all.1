Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1DE2135C7
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Mar 2025 22:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741042070; cv=none; b=OzUr/qrQjjOo4fKY442s5zjQZau90ltK0/CVGoVDMjb3styxOHHSwsggnTOwIunrf8lD5c5NI5RACCk2SApWzSaKLyREgYddjKP1lpz85eK4UxztjCZ8qYc/2NoXz71xB8NYZYTsrSloBmLRU9MLcGSsPyg9lcBT36MtgGX7+Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741042070; c=relaxed/simple;
	bh=9wo96Ra9WkhBxX9Cl81hQX4xX84qosveYc3tFx/uiPs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dWTCSHB5l+huSp7wEZHGQ3cwE/5/f2J/HEYvEVkhqxr+SgmPokc4EUdLqYE+bmgNyHMvuppmhkKfUT4PwzxTbSoVrwzBkj7zIPP2AJT6uDtLwZfh3Jqt2b44hNmURwMkatIBi2tkJTfuqW1ViwV8q14vjy01Td5wesw4lVEr9YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IWmagQ0Q; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IWmagQ0Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741042068; x=1772578068;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9wo96Ra9WkhBxX9Cl81hQX4xX84qosveYc3tFx/uiPs=;
  b=IWmagQ0QqKnK9EYegy3i6PvW8Uffrrur/noyw0udRTbJ/rI7hKyqQlVX
   pmUiQWw1rbSA3pKc2XhoZuPp40lffYVKa2fvNZPk8dZzVRAUer6x3nuca
   gyCut/kpjak6q4+8fa/ty4D0/o96H5n2vUBE+kZSq2dzQImmFY8OIxPTI
   8KNIuVBKAW4GNPiNTzfQBY4ZJecCUDvfI4+Fo5u47qOoKrm52PHNKyKqB
   LAdbHr7CspiakJz/WnPnimi9S5h9cdCjQXCLQ5DjMBhOA/htnzG1H2oeX
   YeiV7G+Ynh/u0p6f67lMDcCstIIKgy5vXuoKi37+s8u/+hbabD2442FG0
   Q==;
X-CSE-ConnectionGUID: zb1amS3aTvesYTLIhPzwRQ==
X-CSE-MsgGUID: BBCI8Vy2RPOr7aDvuMgObg==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="42058932"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; 
   d="scan'208";a="42058932"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 14:47:46 -0800
X-CSE-ConnectionGUID: mjHB1TkZSJ2ajbpPU0LkYg==
X-CSE-MsgGUID: YEdtcWWvR3u4TuoRPByG7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="149096995"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 03 Mar 2025 14:47:44 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpEZZ-000J0M-35;
	Mon, 03 Mar 2025 22:47:41 +0000
Date: Tue, 4 Mar 2025 06:46:55 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 2492/7719] drivers/media/cec/i2c/tda9950.c:92:8:
 error: call to undeclared function 'i2c_transfer'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202503040620.vGidTXb4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   cd3215bbcb9d4321def93fea6cfad4d5b42b9d1d
commit: caa6f4a75e9f8eaebd814a9c2d1602e0926f473d [2492/7719] media: cec: move driver for TDA9950 from drm/i2c
config: powerpc-randconfig-r113-20250304 (https://download.01.org/0day-ci/archive/20250304/202503040620.vGidTXb4-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce: (https://download.01.org/0day-ci/archive/20250304/202503040620.vGidTXb4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503040620.vGidTXb4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/cec/i2c/tda9950.c:92:8: error: call to undeclared function 'i2c_transfer'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           ret = i2c_transfer(client->adapter, &msg, 1);
                 ^
   drivers/media/cec/i2c/tda9950.c:117:8: error: call to undeclared function 'i2c_transfer'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           ret = i2c_transfer(client->adapter, msg, 2);
                 ^
>> drivers/media/cec/i2c/tda9950.c:391:7: error: call to undeclared function 'i2c_check_functionality'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
                ^
>> drivers/media/cec/i2c/tda9950.c:503:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
   module_i2c_driver(tda9950_driver);
   ^
   int
>> drivers/media/cec/i2c/tda9950.c:503:19: error: a parameter list without types is only allowed in a function definition
   module_i2c_driver(tda9950_driver);
                     ^
   5 errors generated.


vim +/i2c_transfer +92 drivers/media/cec/i2c/tda9950.c

f0316f93897c4c drivers/gpu/drm/i2c/tda9950.c Russell King 2015-12-05  72  
f0316f93897c4c drivers/gpu/drm/i2c/tda9950.c Russell King 2015-12-05  73  static int tda9950_write_range(struct i2c_client *client, u8 addr, u8 *p, int cnt)
f0316f93897c4c drivers/gpu/drm/i2c/tda9950.c Russell King 2015-12-05  74  {
f0316f93897c4c drivers/gpu/drm/i2c/tda9950.c Russell King 2015-12-05  75  	struct i2c_msg msg;
699112f5e831c0 drivers/gpu/drm/i2c/tda9950.c Kees Cook    2018-06-19  76  	u8 buf[CEC_MAX_MSG_SIZE + 3];
f0316f93897c4c drivers/gpu/drm/i2c/tda9950.c Russell King 2015-12-05  77  	int ret;
f0316f93897c4c drivers/gpu/drm/i2c/tda9950.c Russell King 2015-12-05  78  
699112f5e831c0 drivers/gpu/drm/i2c/tda9950.c Kees Cook    2018-06-19  79  	if (WARN_ON(cnt > sizeof(buf) - 1))
699112f5e831c0 drivers/gpu/drm/i2c/tda9950.c Kees Cook    2018-06-19  80  		return -EINVAL;
699112f5e831c0 drivers/gpu/drm/i2c/tda9950.c Kees Cook    2018-06-19  81  
f0316f93897c4c drivers/gpu/drm/i2c/tda9950.c Russell King 2015-12-05  82  	buf[0] = addr;
f0316f93897c4c drivers/gpu/drm/i2c/tda9950.c Russell King 2015-12-05  83  	memcpy(buf + 1, p, cnt);
f0316f93897c4c drivers/gpu/drm/i2c/tda9950.c Russell King 2015-12-05  84  
f0316f93897c4c drivers/gpu/drm/i2c/tda9950.c Russell King 2015-12-05  85  	msg.addr = client->addr;
f0316f93897c4c drivers/gpu/drm/i2c/tda9950.c Russell King 2015-12-05  86  	msg.flags = 0;
f0316f93897c4c drivers/gpu/drm/i2c/tda9950.c Russell King 2015-12-05  87  	msg.len = cnt + 1;
f0316f93897c4c drivers/gpu/drm/i2c/tda9950.c Russell King 2015-12-05  88  	msg.buf = buf;
f0316f93897c4c drivers/gpu/drm/i2c/tda9950.c Russell King 2015-12-05  89  
f0316f93897c4c drivers/gpu/drm/i2c/tda9950.c Russell King 2015-12-05  90  	dev_dbg(&client->dev, "wr 0x%02x: %*ph\n", addr, cnt, p);
f0316f93897c4c drivers/gpu/drm/i2c/tda9950.c Russell King 2015-12-05  91  
f0316f93897c4c drivers/gpu/drm/i2c/tda9950.c Russell King 2015-12-05 @92  	ret = i2c_transfer(client->adapter, &msg, 1);
f0316f93897c4c drivers/gpu/drm/i2c/tda9950.c Russell King 2015-12-05  93  	if (ret < 0)
f0316f93897c4c drivers/gpu/drm/i2c/tda9950.c Russell King 2015-12-05  94  		dev_err(&client->dev, "Error %d writing to cec:0x%x\n", ret, addr);
f0316f93897c4c drivers/gpu/drm/i2c/tda9950.c Russell King 2015-12-05  95  	return ret < 0 ? ret : 0;
f0316f93897c4c drivers/gpu/drm/i2c/tda9950.c Russell King 2015-12-05  96  }
f0316f93897c4c drivers/gpu/drm/i2c/tda9950.c Russell King 2015-12-05  97  

:::::: The code at line 92 was first introduced by commit
:::::: f0316f93897c4c4e67278b175bfbfd3a95ba650a drm/i2c: tda9950: add CEC driver

:::::: TO: Russell King <rmk+kernel@armlinux.org.uk>
:::::: CC: Russell King <rmk+kernel@armlinux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
