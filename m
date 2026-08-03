Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35FA3845D5
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Aug 2026 06:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785737475; cv=none; b=uRHlPW7AIh/y7btWP+eui5PurSyxuh0NLTNc27Oz8q/J2niDDUWfL6IGaAyIeHGiO1MKDrE+TdenoTBO2SLN+CC1vPEaTf9kLddvTcVAdQzC391MWqCmebpqo0Ftx8tzXs8q+YexnbGIeqoHIFg4Tc90hFiaK3IEh4vnimTuy0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785737475; c=relaxed/simple;
	bh=0SewAGq4WthTX89Olu7uUxRKkcoXnJgdkGEt9Qd+1rs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Yahhsxv/Ttvwpv88L7Vvti/muElCCHuu9Y6uZOVDrey6JvjaWxnRrpXSm41jxBqSvGiU8dxOPur0eVeXTgYVqf0YT9LJ0GXyc7JkIL/XaSM9aUe0PF2j4/lsLNIf2nZ1MJe4RfrSgXtFOK+33LmCtHjItuvjyAfMhCvAKKeSois=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hIYJ10iO; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hIYJ10iO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785737474; x=1817273474;
  h=date:from:to:cc:subject:message-id;
  bh=0SewAGq4WthTX89Olu7uUxRKkcoXnJgdkGEt9Qd+1rs=;
  b=hIYJ10iO9V7H0+9FfIiualj1FpzF+FbY9/GWPtAiBqiAFNsg80t7ZLMS
   npeXgwy/+wA5f/hW1E9t8GdOmnOSVMRilh2Y+PXLXu+Vomg7JoatbycaJ
   fwlJSf/vm7sgKp5VCOMX37JFtGKFQDyvm5Jad8dPBnGBABIluOBkeMCvB
   I+7+3e6ZAT8gh+WNUBThe460DICpOgK7Or07OHKDKXggimZhjwy+o6q/a
   nmNKUjKaGTvp8w/nYGMR2D2dpC+li7YdDi1Qy0S4xmRfdnCFYANMGjVFt
   33l0IABOf5I9X6u3bSfP1p+BTAWyaI6T70WlUvciy77aKXwbiPClY1nPP
   A==;
X-CSE-ConnectionGUID: 15bbItIDQFmUpFORqiPB/g==
X-CSE-MsgGUID: QodoKGuPQbGBErvW7UV5/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="85239696"
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; 
   d="scan'208";a="85239696"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2026 23:11:13 -0700
X-CSE-ConnectionGUID: +Ompez4/QeuAZ5MukI+9uQ==
X-CSE-MsgGUID: mgkODW86S+qnQrdmVEbxsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; 
   d="scan'208";a="256803918"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 02 Aug 2026 23:11:11 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqltF-000000006FF-2Sfu;
	Mon, 03 Aug 2026 06:11:09 +0000
Date: Mon, 03 Aug 2026 14:10:44 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.1-main 192/192]
 include/linux/pcs/pcs.h:95:12: warning: 'unregister_fwnode_pcs_notifier'
 defined but not used
Message-ID: <202608031438.Hs7mI9p5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Rudy,

FYI, the error/warning still remains.

tree:   https://github.com/frank-w/BPI-R2-4.14 7.1-main
head:   2bb2b958e8885c95fc2cab2e3d81e6bb2184fc3d
commit: 7e58cf54169b7bb649742efbbf4a76f2185f07db [192/192] net: ethernet: mediatek: mtkmux: harden mux/phylink lifecycle
config: x86_64-buildonly-randconfig-005-20260803 (https://download.01.org/0day-ci/archive/20260803/202608031438.Hs7mI9p5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260803/202608031438.Hs7mI9p5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608031438.Hs7mI9p5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/mediatek/mtk_eth_soc.c:25:
   include/linux/pcs/pcs.h:107:1: warning: 'fwnode_phylink_pcs_get_from_fwnode' defined but not used [-Wunused-function]
     107 | fwnode_phylink_pcs_get_from_fwnode(struct fwnode_handle *fwnode,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/pcs/pcs.h:95:12: warning: 'unregister_fwnode_pcs_notifier' defined but not used [-Wunused-function]
      95 | static int unregister_fwnode_pcs_notifier(struct notifier_block *nb)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pcs/pcs.h:90:12: warning: 'register_fwnode_pcs_notifier' defined but not used [-Wunused-function]
      90 | static int register_fwnode_pcs_notifier(struct notifier_block *nb)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/unregister_fwnode_pcs_notifier +95 include/linux/pcs/pcs.h

    94	
  > 95	static int unregister_fwnode_pcs_notifier(struct notifier_block *nb)
    96	{
    97		return -EOPNOTSUPP;
    98	}
    99	
   100	static inline struct phylink_pcs *fwnode_pcs_get(struct fwnode_handle *fwnode,
   101							 int index)
   102	{
   103		return ERR_PTR(-ENOENT);
   104	}
   105	
   106	static struct phylink_pcs *
 > 107	fwnode_phylink_pcs_get_from_fwnode(struct fwnode_handle *fwnode,
   108					   struct fwnode_handle *pcs_fwnode)
   109	{
   110		return ERR_PTR(-ENOENT);
   111	}
   112	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
