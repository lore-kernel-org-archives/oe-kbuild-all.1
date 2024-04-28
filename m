Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDEC1E89A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Apr 2024 14:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714315358; cv=none; b=d6mVN0aKlv41eN/x6IY5hfoi4Kk0Qs76uOl5AdcXYikdRlS0v9AULqxZhcijKv/Erbz0G0xqCwKV5oaxDOF9JTRpuFzgYifJ/V52XtGurY85g9Eo/G7Q4bk8IHO2U9mGWmgKRpGHrYG4FcI/q1S4T0DQyFzoa8D1De4vZavoQ5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714315358; c=relaxed/simple;
	bh=WSESDJoKVxX4r7ac9wOdNwx+Q90S56PxnMc+4SlfFHM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fi1O4zbDLb7dqoUDE+DTVl3VRU1ivaUHByxoFifApJE0h5gRaCoM/of7sgrCiZc6oM5oCrvnwAiE0pJ9CvM1NAeRyX/QghuCjf87K68lR7OoItI2IFHv6KxuWsdifYwpJ5ALHjM4dULQmbfZkYgCtX4E2dWgQtbaM0zqfrcGreI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hqWwQekk; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hqWwQekk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714315355; x=1745851355;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WSESDJoKVxX4r7ac9wOdNwx+Q90S56PxnMc+4SlfFHM=;
  b=hqWwQekkeCjKiJFlw+grZiTKLv8Z5EmZuLkNWpPsOeb7ChNCL7LKK2P4
   iyDd0U4NVQfGdX6pUGgucNcCGSTbFzTKOjiv+lGLcbxmAVOjW38Za0j0j
   WFrPsONnkY8zB/xHdbLunT6Vy8zn3bqSlMEVZELzAMwX1he8Cat8wfJur
   Ldc3ohOr+oz6b/LFAPnzioMNX+YO5CUtfK3AHU9DAuAdno0Ig8Z2UUEM2
   o06zcr4KAfkCZxLuLeTTAT38N4JTU6AJvD4bsy3mfiaju1Giy1yrMmVef
   xNcrc+sraSwsFA2zvOiwPjbnbFDZ+FG3PZHbJJaRywjRYtFGJzmPL3mC4
   A==;
X-CSE-ConnectionGUID: HImBjUC8TQOFYD12hWmsyg==
X-CSE-MsgGUID: JxjKUKDUQc+vXC44THMC4A==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="32487599"
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="32487599"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 07:42:35 -0700
X-CSE-ConnectionGUID: emu7t0bGTFGuYsZeBq4/xQ==
X-CSE-MsgGUID: JVrEEaA4SVWQYlOHwOxwJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="25956991"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Apr 2024 07:42:34 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s15jc-0006Q2-03;
	Sun, 28 Apr 2024 14:42:32 +0000
Date: Sun, 28 Apr 2024 22:41:35 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 5892/11728] make[7]: *** No rule to
 make target 'drivers/media/platform/mxc/capture/ov5642.o', needed by
 'drivers/media/platform/mxc/capture/built-in.a'.
Message-ID: <202404282258.p99TINiF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

First bad commit (maybe != root cause):

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   37770f55ac9c4f6cd958eb5544939207eed8478f
commit: 4ee746439830c24ac6722d15237c9992279f74ef [5892/11728] Merge branch 'mxc/next' into next
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20240428/202404282258.p99TINiF-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240428/202404282258.p99TINiF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404282258.p99TINiF-lkp@intel.com/

All errors (new ones prefixed by >>):

   make[7]: *** [scripts/Makefile.build:243: drivers/media/platform/mxc/capture/mxc_v4l2_capture.o] Error 1
   make[7]: *** [scripts/Makefile.build:243: drivers/media/platform/mxc/capture/ipu_fg_overlay_sdc.o] Error 1
   make[7]: *** [scripts/Makefile.build:243: drivers/media/platform/mxc/capture/ipu_bg_overlay_sdc.o] Error 1
   make[7]: *** [scripts/Makefile.build:243: drivers/media/platform/mxc/capture/ipu_prp_enc.o] Error 1
   make[7]: *** [scripts/Makefile.build:243: drivers/media/platform/mxc/capture/ipu_still.o] Error 1
   make[7]: *** [scripts/Makefile.build:243: drivers/media/platform/mxc/capture/ipu_csi_enc.o] Error 1
   make[7]: *** [scripts/Makefile.build:243: drivers/media/platform/mxc/capture/ov5640.o] Error 1
>> make[7]: *** No rule to make target 'drivers/media/platform/mxc/capture/ov5642.o', needed by 'drivers/media/platform/mxc/capture/built-in.a'.
   make[7]: *** [scripts/Makefile.build:243: drivers/media/platform/mxc/capture/ov5640_mipi.o] Error 1
   make[7]: *** [scripts/Makefile.build:243: drivers/media/platform/mxc/capture/adv7180.o] Error 1
   make[7]: *** [scripts/Makefile.build:243: drivers/media/platform/mxc/capture/ov5647_mipi.o] Error 1
   make[7]: Target 'drivers/media/platform/mxc/capture/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
