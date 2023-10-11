Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5636312E69
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Oct 2023 19:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cLDXyMvO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697051975; x=1728587975;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2mD3x+4eQll2SvnYzoyx0ZPA9LrAFELoz4cQpJ+WCao=;
  b=cLDXyMvOvB8pEu+rQu2tZrH5jSrFXSE6Mk4K3r95cjaI2TP/QbJOXsLx
   djPWZmG/goE6sPh4Hs7E661Cikp615aaUTTiw5BDFhhcdzPGjsPKrxzuP
   V+Zf7gAHWoGHEod8xAi/tlQNRmo9mcBr2NUDkeQFEsUfO1p9DkIagFfk1
   PFsY9rnim7x98uNk3JMf0J+b25r2cjsaAsOcUy+xkEHbekZii0vl42ii+
   b5dVel7Ut/SfrpfCfMx1tqJpkRobuM6GmAOxvwHsufOTTZEp6ZgzDB6mL
   e68UHv0S2S4vc/4K/a797+Ts57eXi6l2jAYpsMj+hjEpf/HwfSkIoHR66
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="381990565"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; 
   d="scan'208";a="381990565"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 12:19:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="730608591"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; 
   d="scan'208";a="730608591"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 11 Oct 2023 12:19:29 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqejv-0002cH-0B;
	Wed, 11 Oct 2023 19:19:27 +0000
Date: Thu, 12 Oct 2023 03:19:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 3/6]
 drivers/phy/realtek/phy-rtk-usb3.c:349: undefined reference to
 `usb_debug_root'
Message-ID: <202310120234.17sssQCg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   0973d792be448addac3988320065be4d039e13d3
commit: 6e97af079d7960bc7b60265e233f04ec8e218f98 [3/6] FROMGIT: phy: realtek: usb: Add driver for the Realtek SoC USB 3.0 PHY
config: x86_64-randconfig-004-20231011 (https://download.01.org/0day-ci/archive/20231012/202310120234.17sssQCg-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231012/202310120234.17sssQCg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310120234.17sssQCg-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/phy/realtek/phy-rtk-usb3.o: in function `create_phy_debug_root':
>> drivers/phy/realtek/phy-rtk-usb3.c:349: undefined reference to `usb_debug_root'
>> ld: drivers/phy/realtek/phy-rtk-usb3.c:349: undefined reference to `usb_debug_root'
   ld: drivers/phy/realtek/phy-rtk-usb3.c:351: undefined reference to `usb_debug_root'
   ld: drivers/phy/realtek/phy-rtk-usb3.c:351: undefined reference to `usb_debug_root'


vim +349 drivers/phy/realtek/phy-rtk-usb3.c

   343	
   344	#ifdef CONFIG_DEBUG_FS
   345	static struct dentry *create_phy_debug_root(void)
   346	{
   347		struct dentry *phy_debug_root;
   348	
 > 349		phy_debug_root = debugfs_lookup("phy", usb_debug_root);
   350		if (!phy_debug_root)
   351			phy_debug_root = debugfs_create_dir("phy", usb_debug_root);
   352	
   353		return phy_debug_root;
   354	}
   355	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
