Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AB12BD587
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Feb 2026 22:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770675251; cv=none; b=EC7v032ksZTWD133IE/z6wzGp5TiOwPmz4mtUliNAy6y8Tiw3yj7CBiCOCMsnzXgbOb4BlLr/LATMvdWjecJNNmOKmBj//FpATPdPk4PIMMRdC4mqnZ4GPOCHlbo//gnWg+ahxx8MaBLKOHbknBIGFtkh4eq9Z4gNtmnZHDXG58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770675251; c=relaxed/simple;
	bh=LtrLIxEXitTA4JlM3oWM9pbnHpKOjRtDhRnhST/qxdk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=k/bfA+xdZi18Xw/FWxpkpEr6hDksl7hYm4/jzQkEPYPe29bYnS0S6rTmq/mKHlHeC4NJ7Xq/AxBqg96eFqn7k+lA9Cz4X6SFgbEeU9nIQINwuPA4LjWIrETw7yA3y5wzTzXj9N2sFus1LxtVjXoYe3BZ6d3DvWNN8w4Fsp/W6E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YNDuBsbP; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YNDuBsbP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770675249; x=1802211249;
  h=date:from:to:cc:subject:message-id;
  bh=LtrLIxEXitTA4JlM3oWM9pbnHpKOjRtDhRnhST/qxdk=;
  b=YNDuBsbPIIB5B49KewaTsgs/9Dd/FOQU8dAEs4sXs7nh/5WogYDblTA5
   YlRb7shgXWJC/boUNGQ6nPHXgz09EdpMY6XRpSTDX0n6yYziSKJaM6YMa
   8Wg7lY7m2Jn93utYKvUiLevONWJ+pDTXLG6pb7ptSbSiFsA5qgW3SJ8y9
   kRv8oJ25vuNkIa9/KiozsrFlmqmTIfLKhaAR1nY7JrvSTIXvV29NPMjth
   kgAdhwkw6hD6o5ORPzMUg50FQxVgOnhee1+QSNlF+nxhXZQfQ4M6+Jzdx
   +vjTWBXVBUhIaMIMZK+CfEZoSAKxkovF6ecvGmAFFwoDRR0lUujkvTRMT
   g==;
X-CSE-ConnectionGUID: GDVO8rm2RreIWblCU4N09Q==
X-CSE-MsgGUID: pQJBBzokSvi0o/yDsaXjqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71864241"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71864241"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 14:14:02 -0800
X-CSE-ConnectionGUID: XPeaHeKXSIi10EChT5B3Mw==
X-CSE-MsgGUID: 5+g/vJJ6Qay5JlAm5O8LNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="210841785"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Feb 2026 14:14:01 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpZW2-00000000oNI-48Rv;
	Mon, 09 Feb 2026 22:13:58 +0000
Date: Tue, 10 Feb 2026 06:13:01 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.19-main 132/134]
 include/linux/pcs/pcs.h:95:12: warning: 'unregister_fwnode_pcs_notifier'
 defined but not used
Message-ID: <202602100656.KHn4X2wV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 6.19-main
head:   b36492c323100a08d7954f0204204ab5abd06d02
commit: e7a9870bcfa17a368356bf7ffc80cdb8f28f2010 [132/134] net: ethernet: mediatek: mtkmux: harden mux/phylink lifecycle
config: xtensa-randconfig-001-20260210 (https://download.01.org/0day-ci/archive/20260210/202602100656.KHn4X2wV-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602100656.KHn4X2wV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602100656.KHn4X2wV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/mediatek/mtk_eth_soc.c:25:
   include/linux/pcs/pcs.h:107:1: warning: 'fwnode_phylink_pcs_get_from_fwnode' defined but not used [-Wunused-function]
    fwnode_phylink_pcs_get_from_fwnode(struct fwnode_handle *fwnode,
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/pcs/pcs.h:95:12: warning: 'unregister_fwnode_pcs_notifier' defined but not used [-Wunused-function]
    static int unregister_fwnode_pcs_notifier(struct notifier_block *nb)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pcs/pcs.h:90:12: warning: 'register_fwnode_pcs_notifier' defined but not used [-Wunused-function]
    static int register_fwnode_pcs_notifier(struct notifier_block *nb)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/unregister_fwnode_pcs_notifier +95 include/linux/pcs/pcs.h

    94	
  > 95	static int unregister_fwnode_pcs_notifier(struct notifier_block *nb)
    96	{
    97		return -EOPNOTSUPP;
    98	}
    99	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
