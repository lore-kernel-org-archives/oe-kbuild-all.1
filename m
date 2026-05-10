Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B3C78F59
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 May 2026 01:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778376611; cv=none; b=g8xd/Fh5vC3fNHVKK6bJCnh+lJ0/caODmk3X64/ylxfb/n64zDcW989Mynu6GtqQP6ZqWgZaBAepgNnAuqfbAhKv0af/q4+ANZXDtaDA7vdCvbw39fdaXSokAtaLMqI84EUPNapetR4tNDICsq3fs94w0qReXWxw4GstQfGO85s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778376611; c=relaxed/simple;
	bh=0NBOP/vShi9MGOrxcwdSnO+FVGWxmH6Gq3DFCy7rUVA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K/FlRX1lXCUWPmyKVlJb38OWEtfOvkQK289djKtuH53ADTvF+xwpM+06kNbR0QjzEDGfMuRxlNiXp9i5QWXr4XoRTO0vYnYkF6LvSmRu3BhBYZVY9TlFwjTWr7l45EN+Nvz349L28Eq4rGOoyA4rSyTy0HToxCnolKMk8qskq0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Re9Sb8Be; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Re9Sb8Be"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778376610; x=1809912610;
  h=date:from:to:cc:subject:message-id;
  bh=0NBOP/vShi9MGOrxcwdSnO+FVGWxmH6Gq3DFCy7rUVA=;
  b=Re9Sb8BedpO+v2pv0UVUkfugwGMAeYV+d7eS8GYRtqsVDDP9PmzZ6jWt
   GKAPiWMMzyHqRWqQuzrpbDqsV8FAxE2rsbPN+TK1FTeUw5sGaY8ldv3FB
   PS52s8M5hUzFePF9DAQg+Eb9/+8EQyiXZ+aI45wjmFHhJpgWqzXU1Jmfg
   ghmL3QTn+f7l6Tg7+pXui6qUOR5VaZkMi62/M+9r8BFGhzP5DWgvqZPjm
   K0uH5J7uEGzUOwOP1jtsmUv47t1KTDr0cFBBaPWj/XkaWY0Sp9TCsJAVw
   047DIcQxWafik1ZgnfxCbz+PHUvlpCK65p9Yl2gsEvSrTdMcdc7SRDJBa
   w==;
X-CSE-ConnectionGUID: 9gNjVYZQQCmgkZ1QNOmzyQ==
X-CSE-MsgGUID: sr7+mA4BQ3+MSC7nMYuRZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="89896236"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="89896236"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 18:30:07 -0700
X-CSE-ConnectionGUID: XaaXW8FMQDyv4u6dmeiDaQ==
X-CSE-MsgGUID: XmbONeznRT2CLcO7pVBHrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="234050434"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 May 2026 18:30:05 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLszb-000000001cr-1hdO;
	Sun, 10 May 2026 01:30:03 +0000
Date: Sun, 10 May 2026 09:29:30 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.1-rc 152/162] ERROR: modpost:
 drivers/net/phy/as21xx_1.9.2/aeon_as21xxx: 'custome_cfg' exported twice.
 Previous export was in vmlinux
Message-ID: <202605100906.HGnxJDGT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.1-rc
head:   12aaea139e45ed0d826a63a866c1ce03d352fea6
commit: 3b3c9c1c9610d3d9dc993bcdd5e1228369cdb213 [152/162] net: phy: rename as21xx v1.9.1 like it's done for 1.9.2
config: arm-randconfig-004-20260510 (https://download.01.org/0day-ci/archive/20260510/202605100906.HGnxJDGT-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605100906.HGnxJDGT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605100906.HGnxJDGT-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt7987-apmixed.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt7987-topckgen.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt7987-infracfg.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt7987-mcusys.o
>> ERROR: modpost: drivers/net/phy/as21xx_1.9.2/aeon_as21xxx: 'custome_cfg' exported twice. Previous export was in vmlinux
>> ERROR: modpost: drivers/net/phy/as21xx_1.9.2/aeon_as21xxx: 'aeon_cl45_read' exported twice. Previous export was in vmlinux
>> ERROR: modpost: drivers/net/phy/as21xx_1.9.2/aeon_as21xxx: 'aeon_cl45_write' exported twice. Previous export was in vmlinux

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
