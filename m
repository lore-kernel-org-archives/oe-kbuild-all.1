Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC8A15C0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 02:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MzxsZnuv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697338342; x=1728874342;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zMvE2ScO44FcNgfKjxJiJ/VzFCznN2PnMTOc4IrFzPQ=;
  b=MzxsZnuvYN62cBPIZM2tWDKzxdJPBPiUUtaQBAICu8EZY3TUP+u8lbds
   bDs6gS98hn5rBGv2+L1vfOADZTWPljfCRJYtGhqYbOlpmFNnf3H3BsP/u
   bFVm2O3ulaM0M/2xq4LOo3cEK0CODlasL0D5VI26P2eFSked9I6PPFkjr
   ScCgpndHTV9gR5/wQlEQ89QMklbclpgXu1kvO/m75b1TmVxKaTtAYX0jN
   /qSFbmLjUnATFj06D99yUCOS+baA5XLCIr7Mw+zHZWqSc5STgQ8dyQK0t
   BU6/jYo8BUzKkeZAGVXVy3LXgfCzqjccwkf3Fuira7uaKKJAMyCe7CLxG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="6925455"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="6925455"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 19:52:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="790353021"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="790353021"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 14 Oct 2023 19:52:19 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrrEn-0006x7-0v;
	Sun, 15 Oct 2023 02:52:17 +0000
Date: Sun, 15 Oct 2023 10:51:35 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 4877/15768]
 drivers/pwm/pwm-adp5585.c:213:25: error: 'adp5585_of_match' undeclared here
 (not in a function); did you mean 'adp5585_pwm_of_match'?
Message-ID: <202310151056.p1rGniMj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   3f41fbe42851375d3d5996e4bf9e9809e6c79517
commit: b2a8faf2b13f5346016ac80c42173ac714536584 [4877/15768] Merge branch 'pwm/next' into next
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20231015/202310151056.p1rGniMj-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310151056.p1rGniMj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310151056.p1rGniMj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pwm/pwm-adp5585.c:12:
>> drivers/pwm/pwm-adp5585.c:213:25: error: 'adp5585_of_match' undeclared here (not in a function); did you mean 'adp5585_pwm_of_match'?
     213 | MODULE_DEVICE_TABLE(of, adp5585_of_match);
         |                         ^~~~~~~~~~~~~~~~
   include/linux/module.h:243:15: note: in definition of macro 'MODULE_DEVICE_TABLE'
     243 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |               ^~~~
>> include/linux/module.h:243:21: error: '__mod_of__adp5585_of_match_device_table' aliased to undefined symbol 'adp5585_of_match'
     243 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |                     ^~~~~~
   drivers/pwm/pwm-adp5585.c:213:1: note: in expansion of macro 'MODULE_DEVICE_TABLE'
     213 | MODULE_DEVICE_TABLE(of, adp5585_of_match);
         | ^~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for RPMSG_VIRTIO
   Depends on [n]: HAS_DMA [=n]
   Selected by [m]:
   - HAVE_IMX_RPMSG [=y] && IMX_MBOX [=m]
   WARNING: unmet direct dependencies detected for UIO
   Depends on [n]: MMU [=n]
   Selected by [m]:
   - FEC_UIO [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_FREESCALE [=y]


vim +213 drivers/pwm/pwm-adp5585.c

92c8b45586c149 Clark Wang 2022-03-16  208  
92c8b45586c149 Clark Wang 2022-03-16  209  static const struct of_device_id adp5585_pwm_of_match[] = {
92c8b45586c149 Clark Wang 2022-03-16  210  	{.compatible = "adp5585-pwm", },
92c8b45586c149 Clark Wang 2022-03-16  211  	{ /* sentinel */ }
92c8b45586c149 Clark Wang 2022-03-16  212  };
92c8b45586c149 Clark Wang 2022-03-16 @213  MODULE_DEVICE_TABLE(of, adp5585_of_match);
92c8b45586c149 Clark Wang 2022-03-16  214  

:::::: The code at line 213 was first introduced by commit
:::::: 92c8b45586c149160a8a29356d97cdd721d9717a MLK-25922-1 pwm: adp5585: add adp5585 PWM support

:::::: TO: Clark Wang <xiaoning.wang@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
