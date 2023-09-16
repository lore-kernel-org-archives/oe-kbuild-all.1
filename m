Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2991C15
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Sep 2023 02:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694829899; x=1726365899;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vi3mboqV3TZ7BemLAHfzSNHP9hodgqW82xREmbYIXEE=;
  b=a/kHCTVKO1QiyDxAaQvqUbT2OfqVSwdNNYtSXPqky7GypBtj5bw9BujJ
   JX0UdA6iKJ5rgJh45a7LQK1Xo0hADzENnoA9nDYHAo7exXkEn9aymdaEZ
   07xB/i7laR89bGTh9Zu4DOgFWipsmIr8QIzDfXLs4S9vr+rE4lYCLME/x
   Nl7Di+ZrbQuSojkLo7ejcczXfrb75BtLIMeS3mrlTpMlvvAfU6XbDNUe/
   wZdm+Nroc7+w7Hco6U6T+eLaJjqsMyHrOIYpBY8OPy8/gJZXwZhVB2u2L
   Jvf/L6X5Z1a5D6O6HqqX3/zHgSIX5GLv7/rdZulFUEzpAF5pCPeQpK1F/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="379289163"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; 
   d="scan'208";a="379289163"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 19:04:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="721894787"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; 
   d="scan'208";a="721894787"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 15 Sep 2023 19:04:57 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhKg3-0003j8-1i;
	Sat, 16 Sep 2023 02:04:55 +0000
Date: Sat, 16 Sep 2023 10:04:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 2/6]
 drivers/phy/realtek/phy-rtk-usb2.c:715: undefined reference to
 `usb_debug_root'
Message-ID: <202309161019.HOLPNsry-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   a6f12f29b8eedf3596db1b245877039482f5fb1d
commit: 3dadac8ba6d606ac003fb282b9da6c9c7448bf03 [2/6] FROMGIT: phy: realtek: usb: Add driver for the Realtek SoC USB 2.0 PHY
config: x86_64-randconfig-015-20230916 (https://download.01.org/0day-ci/archive/20230916/202309161019.HOLPNsry-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230916/202309161019.HOLPNsry-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309161019.HOLPNsry-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/phy/realtek/phy-rtk-usb2.o: in function `create_phy_debug_root':
>> drivers/phy/realtek/phy-rtk-usb2.c:715: undefined reference to `usb_debug_root'
>> ld: drivers/phy/realtek/phy-rtk-usb2.c:715: undefined reference to `usb_debug_root'
   ld: drivers/phy/realtek/phy-rtk-usb2.c:717: undefined reference to `usb_debug_root'
   ld: drivers/phy/realtek/phy-rtk-usb2.c:717: undefined reference to `usb_debug_root'


vim +715 drivers/phy/realtek/phy-rtk-usb2.c

   709	
   710	#ifdef CONFIG_DEBUG_FS
   711	static struct dentry *create_phy_debug_root(void)
   712	{
   713		struct dentry *phy_debug_root;
   714	
 > 715		phy_debug_root = debugfs_lookup("phy", usb_debug_root);
   716		if (!phy_debug_root)
   717			phy_debug_root = debugfs_create_dir("phy", usb_debug_root);
   718	
   719		return phy_debug_root;
   720	}
   721	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
