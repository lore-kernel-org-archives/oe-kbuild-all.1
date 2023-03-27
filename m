Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62ECB23DA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Mar 2023 13:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679924115; x=1711460115;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E0h4QeasTh6WUHaFIXDS47RCENe1xtazflv68If6aeA=;
  b=LyLXjNZ53SOzfGerz1mgu1dd7CANEg1NU8Pxm4HTc3P99Fvp/iMdkH5s
   l7mAFeu/BstXS9rAvlCY36PDTCFJ5xidl0+iH/vImzdylibSq2iBCoKiS
   BK6Gq+9vYLModwCUwFbBComFipNT2NGGSiaexLVZ06NWxWMdNDSSRD845
   A4mjBG7+Z/gtqANw6pbb91jEA5aGRUudUBYt9Oa/ZH/qDfTJoZg25a5f1
   ivV5EMd3YYgo5nF52RctlVzbmmMUWgO+0OHIo79GXMV3PcXPUMYiT+Feo
   puWTDpdVsVq4c9GA1e9qt+Fo/96R2BtAYzHxO4HlFvLp8Bi6KuihonZJF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="340289483"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; 
   d="scan'208";a="340289483"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 06:35:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="827042106"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; 
   d="scan'208";a="827042106"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 27 Mar 2023 06:35:13 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgn0C-000Hjz-38;
	Mon, 27 Mar 2023 13:35:12 +0000
Date: Mon, 27 Mar 2023 21:35:09 +0800
From: kernel test robot <lkp@intel.com>
To: Nikita Kravets <teackot@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [pdx86-platform-drivers-x86:review-hans 82/82]
 drivers/platform/x86/msi-ec.c:825:35: warning: 'msi_dmi_table' defined but
 not used
Message-ID: <202303272159.NYvmInyO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-hans
head:   9a62a9be30c2caab402c66105171cd96bbfd077d
commit: 9a62a9be30c2caab402c66105171cd96bbfd077d [82/82] platform/x86: Add new msi-ec driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230327/202303272159.NYvmInyO-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/commit/?id=9a62a9be30c2caab402c66105171cd96bbfd077d
        git remote add pdx86-platform-drivers-x86 https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
        git fetch --no-tags pdx86-platform-drivers-x86 review-hans
        git checkout 9a62a9be30c2caab402c66105171cd96bbfd077d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/platform/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303272159.NYvmInyO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/msi-ec.c:825:35: warning: 'msi_dmi_table' defined but not used [-Wunused-const-variable=]
     825 | static const struct dmi_system_id msi_dmi_table[] __initconst = {
         |                                   ^~~~~~~~~~~~~


vim +/msi_dmi_table +825 drivers/platform/x86/msi-ec.c

   820	
   821	/*
   822	 * Module load/unload
   823	 */
   824	
 > 825	static const struct dmi_system_id msi_dmi_table[] __initconst = {
   826		{
   827			.matches = {
   828				DMI_MATCH(DMI_SYS_VENDOR, "MICRO-STAR INT"),
   829			},
   830		},
   831		{
   832			.matches = {
   833				DMI_MATCH(DMI_SYS_VENDOR, "Micro-Star International"),
   834			},
   835		},
   836		{
   837			.matches = {
   838				DMI_MATCH(DMI_SYS_VENDOR,
   839					  "Micro-Star International Co., Ltd."),
   840			},
   841		},
   842		{
   843			.matches = {
   844				DMI_MATCH(DMI_SYS_VENDOR,
   845					  "MICRO-STAR INTERNATIONAL CO., LTD"),
   846			},
   847		},
   848		{}
   849	};
   850	MODULE_DEVICE_TABLE(dmi, msi_dmi_table);
   851	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
