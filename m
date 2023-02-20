Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C2A1119
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Feb 2023 09:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676885832; x=1708421832;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CcK7M3ko8kU99lozhPpRskTUogdYlPg+YQxn8rbu7Nk=;
  b=SL0+IBVAA1jXxdANs28v7KZ47vBxxC2D8aGbewQXSxWnpXLWbyL+H54T
   TGQRLua2VutNfpLzRG/iHb/qSLMi6OONeANQQdSam5gvdvq5WoHY0crmz
   p0b5EKGHhUhLlUrLT/N7GOvRexRacukkoIv0x7EioiSexw+VqYWUVAW50
   DgPy6RpgY3h+yGHjjmvX3q1vdqCWR8uKYoVRdEw8/rdM1UiXxI3tDIxPb
   3xIW2vX4whVDdfPj+Jqjba0KzIqyruzKg95peKkMOEATMN9qeouesrtq6
   FMdKv1tVQ63KQUf0e28WCmK4bYFpOlDlxwIJ9sw+RPiRy9W6Isf9IrQ4o
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="312730584"
X-IronPort-AV: E=Sophos;i="5.97,312,1669104000"; 
   d="scan'208";a="312730584"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2023 01:37:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="671252145"
X-IronPort-AV: E=Sophos;i="5.97,312,1669104000"; 
   d="scan'208";a="671252145"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 20 Feb 2023 01:37:10 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pU2bd-000DpZ-25;
	Mon, 20 Feb 2023 09:37:09 +0000
Date: Mon, 20 Feb 2023 17:37:07 +0800
From: kernel test robot <lkp@intel.com>
To: Baolin Wang <baolin.wang7@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: drivers/hwspinlock/omap_hwspinlock.c:165:34: warning:
 'omap_hwspinlock_of_match' defined but not used
Message-ID: <202302201728.S4sOFmKE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Baolin,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c9c3395d5e3dcc6daee66c6908354d47bf98cb0c
commit: ffd0bbfb378ecd56eac22bf932ccdbf89ac7f725 hwspinlock: Allow drivers to be built with COMPILE_TEST
date:   2 years, 11 months ago
config: x86_64-buildonly-randconfig-r004-20230220 (https://download.01.org/0day-ci/archive/20230220/202302201728.S4sOFmKE-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ffd0bbfb378ecd56eac22bf932ccdbf89ac7f725
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ffd0bbfb378ecd56eac22bf932ccdbf89ac7f725
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/clk/imx/ drivers/hwspinlock/ drivers/mmc/host/ drivers/usb/phy/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302201728.S4sOFmKE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwspinlock/omap_hwspinlock.c:165:34: warning: 'omap_hwspinlock_of_match' defined but not used [-Wunused-const-variable=]
     165 | static const struct of_device_id omap_hwspinlock_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/omap_hwspinlock_of_match +165 drivers/hwspinlock/omap_hwspinlock.c

70ba4cc26b9f53 Simon Que  2011-02-17  164  
65bd4341d61678 Suman Anna 2015-03-04 @165  static const struct of_device_id omap_hwspinlock_of_match[] = {
65bd4341d61678 Suman Anna 2015-03-04  166  	{ .compatible = "ti,omap4-hwspinlock", },
6fa154e282f9c8 Suman Anna 2019-05-30  167  	{ .compatible = "ti,am654-hwspinlock", },
65bd4341d61678 Suman Anna 2015-03-04  168  	{ /* end */ },
65bd4341d61678 Suman Anna 2015-03-04  169  };
65bd4341d61678 Suman Anna 2015-03-04  170  MODULE_DEVICE_TABLE(of, omap_hwspinlock_of_match);
65bd4341d61678 Suman Anna 2015-03-04  171  

:::::: The code at line 165 was first introduced by commit
:::::: 65bd4341d61678494ea14994d0d7df73644ca014 hwspinlock/omap: add support for dt nodes

:::::: TO: Suman Anna <s-anna@ti.com>
:::::: CC: Ohad Ben-Cohen <ohad@wizery.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
