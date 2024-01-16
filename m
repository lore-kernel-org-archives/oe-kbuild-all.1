Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B2D1CAB9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jan 2024 17:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705426466; cv=none; b=K6kyMxjA3e+jRqhRp2LV0TWkPp26S1KU/cWCbPIwJa5oGeQjDdwfvzSCPaDvnxWiT1r1Xz2+TMeNGJRShario57RpstfWWD+RQ4gr/lDA/CGPaOmWSbSvQ0ToeXlct/w8+MoereA5mQ/1h6M7Nde5T7f6zEiTZtER/xcBt661U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705426466; c=relaxed/simple;
	bh=x6VAJg0a13qKRvnZ0gGQoDu7MF9L0aaNGyqIOjw5sT8=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	b=sF1mW1mqP2WNNti18xj4A1wzWJWtDWZpekZhwc02Y4H6BYxkM92ZRU/lm8fN4gGDnI3eFJMuLji09PAPJREgrPNvCkaHSVE3pxahNPEsWhRfklHhxHotH93Bfz4ZEIS1/4y38p8bBuoL2Ne7wFIT+wXAeNJEzCu7+IZMgmjQ6Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b1ORvfzr; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b1ORvfzr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705426464; x=1736962464;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x6VAJg0a13qKRvnZ0gGQoDu7MF9L0aaNGyqIOjw5sT8=;
  b=b1ORvfzrLgMUgG1CQKo+yoMJX2foCOaWVh23K4OPkUc9R7xOP+4mRD9R
   mngJIthSTzbkk0/XlT69nBVIpFaBMJ/Felf69yCN7HSMjpJVIuHGui4sz
   5Qs7pFWRox3Nyou7C8oGuCmLN+IOd0w8JHdRuvVo3bsG9NWBWSwafTm7P
   Zsgzv6UQKNbrUvyc73aLsXrO/5u1oytNcgmXtzz/YHqz0A55nxWxi7IA1
   cChS2S/1zh3tMI073gVLvmwwq9/4VMfE+GpOL6hczRiwfL3PuAd9zyBV6
   FQSliGaEVLMyHXX6WLosBy1b7PLc3xaqX0dV2yDBrQuLWHaGFYYoW+P53
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="13286351"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; 
   d="scan'208";a="13286351"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 09:34:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="787520644"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; 
   d="scan'208";a="787520644"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 16 Jan 2024 09:34:21 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPnKN-00010y-2A;
	Tue, 16 Jan 2024 17:34:19 +0000
Date: Wed, 17 Jan 2024 01:33:25 +0800
From: kernel test robot <lkp@intel.com>
To: Okan Sahin <okan.sahin@analog.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: drivers/regulator/max77857-regulator.c:428:28: sparse: sparse:
 symbol 'max77857_id' was not declared. Should it be static?
Message-ID: <202401170155.jdqDmOVC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   052d534373b7ed33712a63d5e17b2b6cdbce84fd
commit: af71cccadecedad3484c2208e2c4fc8eff927d4a regulator: max77857: Add ADI MAX77857/59/MAX77831 Regulator Support
date:   6 months ago
config: x86_64-randconfig-123-20240106 (https://download.01.org/0day-ci/archive/20240117/202401170155.jdqDmOVC-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240117/202401170155.jdqDmOVC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401170155.jdqDmOVC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/regulator/max77857-regulator.c:70:22: sparse: sparse: symbol 'max77857_regmap_config' was not declared. Should it be static?
   drivers/regulator/max77857-regulator.c:209:5: sparse: sparse: symbol 'max77859_get_voltage_sel' was not declared. Should it be static?
   drivers/regulator/max77857-regulator.c:221:5: sparse: sparse: symbol 'max77859_set_current_limit' was not declared. Should it be static?
   drivers/regulator/max77857-regulator.c:235:5: sparse: sparse: symbol 'max77859_get_current_limit' was not declared. Should it be static?
>> drivers/regulator/max77857-regulator.c:428:28: sparse: sparse: symbol 'max77857_id' was not declared. Should it be static?
   drivers/regulator/max77857-regulator.c:446:19: sparse: sparse: symbol 'max77857_driver' was not declared. Should it be static?

vim +/max77857_id +428 drivers/regulator/max77857-regulator.c

   427	
 > 428	const struct i2c_device_id max77857_id[] = {
   429		{ "max77831", ID_MAX77831 },
   430		{ "max77857", ID_MAX77857 },
   431		{ "max77859", ID_MAX77859 },
   432		{ "max77859a", ID_MAX77859A },
   433		{ }
   434	};
   435	MODULE_DEVICE_TABLE(i2c, max77857_id);
   436	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
