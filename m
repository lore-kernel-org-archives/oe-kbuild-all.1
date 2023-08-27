Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC71E63A0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Aug 2023 10:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693132014; x=1724668014;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/PWJWl8peHrvjM9e91uTlTZfMetFFMnoaRiEHzj30dg=;
  b=T+kliUrq33MRLjSsCYUF2OH9EDQ6SHwUWYQklUJJzJNqlbdZ8Tbm4OZV
   Jse+n14XRnzpqC7oss6S42q1NPPCzWcqlNK/tORvOrWXgb3CGwFS0tvSp
   2YqYemlSDvpYOwBgbBfFl2mbJQQZI4dDfUcO1pTSzl4BOkGJqMrWItXnH
   anrOQs1Y5BO3i1Gy6n+QsjM0KoRQ4uA/Y7mOAtZ85j87PvphhocQz6erW
   iSTtDVTqapVyA28MoiCmkQ4mAF++JedU1mh/fLMkQC7wcMkEaqj7Y1nSh
   ncLHRaF4wiMuDPqKmNpX03NROqiwYLE9dPUsSw16np5FxICOyfMIa+VX8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="372334423"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="372334423"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 03:26:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="714824092"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="714824092"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 27 Aug 2023 03:26:50 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaCyn-0005gB-0P;
	Sun, 27 Aug 2023 10:26:49 +0000
Date: Sun, 27 Aug 2023 18:26:27 +0800
From: kernel test robot <lkp@intel.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [esmil:visionfive 40/56] drivers/usb/cdns3/cdns3-starfive.c:23:
 warning: expecting prototype for cdns3(). Prototype was for JH7100_USB0()
 instead
Message-ID: <202308271840.9zVMuOSn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux visionfive
head:   c44f4dcb3a1f8876ab931434b13a6db4f8e1ce39
commit: d72cdc5c9354fb0af3625da5b7f951ab8ae10e47 [40/56] usb: cdns3: starfive: Initialize JH7100 host mode
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230827/202308271840.9zVMuOSn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230827/202308271840.9zVMuOSn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308271840.9zVMuOSn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/cdns3/cdns3-starfive.c:23: warning: expecting prototype for cdns3(). Prototype was for JH7100_USB0() instead


vim +23 drivers/usb/cdns3/cdns3-starfive.c

    22	
  > 23	#define JH7100_USB0			0x20
    24	#define JH7100_USB0_MODE_STRAP_MASK	GENMASK(2, 0)
    25	#define JH7100_USB0_MODE_STRAP_HOST	2
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
