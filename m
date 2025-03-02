Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564B71EE7A1
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Mar 2025 21:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740951733; cv=none; b=qA+SvzzjBlG+A4YO8ZkaWhbyVvT2ImMjHjRRHhCiAndUxEcg1Fz3XPd42yHj9/eD3TyhZxNEJHby2iIyN9A5zQ4Mbl+M5EdeLo7SsTIcYOGEaJzyBX73YPAAoLA3tuXt5eUKNXl96Dd5AFFYhcP4GDkuwhQBCRCqgG5x56/aH4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740951733; c=relaxed/simple;
	bh=0AwqeWeL/vTSX1hOfoF3Axi+nkj69RB5ZUr0Ys81x2w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tIJVNSwk1VBp36Iu2K86GOcUuBP7r4IuPd6/bD36JdJ7QJJ9wMUrQGOPpJjldbTxaR/3cLm2ZA4GPpQLO36LdL5g3ildPgdINGz2veO7n+OE9CpklLP6LnWeD8fZdAhmpcpXdGOCOI1zVuyQvGbUyOGEczoCxt+O/ZkPKp5aIWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hHtz6RgW; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hHtz6RgW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740951731; x=1772487731;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0AwqeWeL/vTSX1hOfoF3Axi+nkj69RB5ZUr0Ys81x2w=;
  b=hHtz6RgWVMh2jCA44wbLL8Yi5+kj6YqHpjscTMOTjISTxCzRZjJi0A9N
   7qFeKiTNqXICmLZFB16S7GeGVcclQ9nzheWopUkDeflVBxWLTeDKGhms0
   SJNjlbbDtrx5MN7k9LRB5s4EmfraCHHGkyQFBvqjsF5Kr73gOndwFmeyt
   w9Xqz/+zkbck6tjd3ZPrwKPkpRPFYW1qJkrAiheoltWKH0EX/MLszJQ1v
   WMj8RvAbmHsp2RIkBocRWwMBsDmZn+FyZcX6qorzUnADZuTbuuRUxcTfe
   b99N61/Edld+lTAucSozZcBn0TMqTjlyU+5HbYz4VHcXCOoIAIOAVCyZm
   w==;
X-CSE-ConnectionGUID: 1fPdsqaWRpGPa5KSHIcRWw==
X-CSE-MsgGUID: hhgKtT6sQEOZr+vtJLWH1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="44635267"
X-IronPort-AV: E=Sophos;i="6.13,328,1732608000"; 
   d="scan'208";a="44635267"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 13:42:11 -0800
X-CSE-ConnectionGUID: uFC12QIpSFi4v/HacdMGxg==
X-CSE-MsgGUID: rcxGBlBDQUumptZgQ+7oDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,328,1732608000"; 
   d="scan'208";a="118321300"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 02 Mar 2025 13:42:10 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tor4V-000Heu-0G;
	Sun, 02 Mar 2025 21:42:04 +0000
Date: Mon, 3 Mar 2025 05:41:42 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 2543/7423] drivers/media/cec/i2c/tda9950.c:92:15:
 error: implicit declaration of function 'i2c_transfer'
Message-ID: <202503030506.0vfDZ8nZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dmitry,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c0eb65494e59d9834af7cbad983629e9017b25a1
commit: caa6f4a75e9f8eaebd814a9c2d1602e0926f473d [2543/7423] media: cec: move driver for TDA9950 from drm/i2c
config: x86_64-randconfig-003-20250303 (https://download.01.org/0day-ci/archive/20250303/202503030506.0vfDZ8nZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250303/202503030506.0vfDZ8nZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503030506.0vfDZ8nZ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/media/cec/i2c/tda9950.c: In function 'tda9950_write_range':
>> drivers/media/cec/i2c/tda9950.c:92:15: error: implicit declaration of function 'i2c_transfer' [-Werror=implicit-function-declaration]
      92 |         ret = i2c_transfer(client->adapter, &msg, 1);
         |               ^~~~~~~~~~~~
   drivers/media/cec/i2c/tda9950.c: In function 'tda9950_probe':
>> drivers/media/cec/i2c/tda9950.c:391:14: error: implicit declaration of function 'i2c_check_functionality' [-Werror=implicit-function-declaration]
     391 |         if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
         |              ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/cec/i2c/tda9950.c: At top level:
>> drivers/media/cec/i2c/tda9950.c:503:1: warning: data definition has no type or storage class
     503 | module_i2c_driver(tda9950_driver);
         | ^~~~~~~~~~~~~~~~~
>> drivers/media/cec/i2c/tda9950.c:503:1: error: type defaults to 'int' in declaration of 'module_i2c_driver' [-Werror=implicit-int]
>> drivers/media/cec/i2c/tda9950.c:503:1: warning: parameter names (without types) in function declaration
>> drivers/media/cec/i2c/tda9950.c:494:26: warning: 'tda9950_driver' defined but not used [-Wunused-variable]
     494 | static struct i2c_driver tda9950_driver = {
         |                          ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


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
