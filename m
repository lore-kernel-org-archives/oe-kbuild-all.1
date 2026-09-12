Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1B13546DF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Sep 2026 22:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789251322; cv=none; b=Ziws3URyt6Mgdx1MDwHbVdAqwuzrkQSoP6RYYFCoo1S+VzHnXp4uLeOh+5OE3cr7E3dDKzJlt3IJLsHx/xwyByI6/fq0cTvh4wnZqWLZyT4mkyRZ/n5xxCjaDdr1GUf4HZd9WakiAFKreFb3CSAkm1NJTACjcG3FfovcxoGGccw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789251322; c=relaxed/simple;
	bh=y0i03G5YOktAYBy3j0X+zUTkQLSh464BMYqGrX0zAVU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fuWDmk5FA34MQeE4WxZ+CQvB34eUYS19ZKgipNDm0T0AfvWHomeQwynpMuW4yTazha9bpHlWKXjWZYFKapP5m0PNrf9PwZoC8utGgeoxDcCZCwCAy2JhDRg6kEySMnqpdPjjljQIg5QTRsxQ1wlRonFjUxaRz0IxZzWd4dW2sx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jxyGphw1; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jxyGphw1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789251317; x=1820787317;
  h=date:from:to:cc:subject:message-id;
  bh=y0i03G5YOktAYBy3j0X+zUTkQLSh464BMYqGrX0zAVU=;
  b=jxyGphw1X/lbnXvmBYHjIn0X/d8daMeEJKRERjgdsshJ7h1s5g0lelj5
   ScEKZlcFLtOEYeUFa83k9Ap1eSuOqqgJbz9YeuE+qxMOjWMHBGymwx1sZ
   rDpCRnCwOwUA0PckSgU2KxtMzaCt14UBxAhJoA2ILkL7/El6rkv3nZzVX
   jQ2lOHTBgvPgvlIvk4BAutnfTZnLLRZ30iyj05bmdnOOcB0g0BnTZpEN8
   2+cBFg6mMMdcxThZOqOfRp42w25TUrQ06ggcNUnZePuBc1Riz8deUFJ8S
   C+STCh2vCPkcr3Z8ouqydUCkex5HRrjfZV7IGj+MfCj8LolkFKdaOjXqP
   Q==;
X-CSE-ConnectionGUID: JhYndMJ1THGtftLapdfP9w==
X-CSE-MsgGUID: Wt9cuevjQG2mec2strcMRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11903"; a="89513259"
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="89513259"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 15:15:15 -0700
X-CSE-ConnectionGUID: Z0f6yBv8R8iDQGIOPnIVYw==
X-CSE-MsgGUID: O9zsIDhyR/6M2HaBBISpjw==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 12 Sep 2026 15:15:13 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5W07-000000003JZ-0QcW;
	Sat, 12 Sep 2026 22:15:11 +0000
Date: Sun, 13 Sep 2026 06:14:50 +0800
From: kernel test robot <lkp@intel.com>
To: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>, Vishal Sagar <vishal.sagar@amd.com>
Subject: [xilinx-xlnx:master 17/176] depmod: ERROR: Cycle detected:
 drm -> drm_kms_helper -> drm
Message-ID: <202609130611.fpfD49w6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/Xilinx/linux-xlnx master
head:   235bd5e49f53bfea681cfd6c489ca1e0eab0b061
commit: f4aa5b97b5e1735f72676a44811c60268bde49bf [17/176] drm/atomic-helper: Add select_output_bus_format callback
config: i386-randconfig-013-20260912 (https://download.01.org/0day-ci/archive/20260913/202609130611.fpfD49w6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260913/202609130611.fpfD49w6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609130611.fpfD49w6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> depmod: ERROR: Cycle detected: drm -> drm_kms_helper -> drm
   depmod: ERROR: Found 2 modules in dependency cycles!
   make[3]: *** [scripts/Makefile.modinst:132: depmod] Error 1 shuffle=4108730021
   make[3]: Target '__modinst' not remade because of errors.
   make[2]: *** [Makefile:1844: modules_install] Error 2 shuffle=4108730021
   make[1]: *** [Makefile:224: __sub-make] Error 2 shuffle=4108730021
   make[1]: Target 'modules_install' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2 shuffle=4108730021
   make: Target 'modules_install' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
