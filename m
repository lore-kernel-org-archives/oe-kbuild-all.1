Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F38A48
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Sep 2024 19:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725822036; cv=none; b=a9vVrMBD91H192jv+8P7BGIz2nwD2foA40LjoiwXt571jMuf9uisnAdRKbDHOk2vzhHGubKYdg1d9CbtmKbLKYC9TgXUSFFoqzbD5R3r9NzSAHWUTHh8lbK9PvV90huMEGpSsqq5wcd+HEdK+iZKqW5peu/wqE3H+Nefv0esFpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725822036; c=relaxed/simple;
	bh=wIBqF3kmpoTvtkrxcNRkvEDcviYRp7TFPz3qWpA8whE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B8EmlPXKfOqM5Xnn0h6BfhXa/sNg3OlFXOqN5qspEDfbv7wInp+dykdHhcdiGaqMwYm+iHAEed5hJIAjdV2AVrL4rz+DbqgVNOjMXj0h08D1h7wsfodRq+fr+vtkToFh01SeH8NrETJFkIF1TX0UBVpJgKd/OUm7+njZVaCx2qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HdxCwv6u; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HdxCwv6u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725822034; x=1757358034;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wIBqF3kmpoTvtkrxcNRkvEDcviYRp7TFPz3qWpA8whE=;
  b=HdxCwv6utRAwjOYyNmM7UCww8XtBXTU6xlxq64Lki0pNNY/y5sdDNjsq
   +OpxKbANowVMTy+chsQsZOj1nWJjxyNplr05aNPQPOwoVxYQf/LtMh45o
   7/mYukN8xqRxPz5IukS2XXTG9Od8bc7ZYVqByg4V149YMlk4k2dPZrX1b
   fZJsQkbjoSrW3yoB0fCTkspRhFY5ND4OegqO2+E7hRrcuXODPyNMU5Brt
   q4Iq3OnQoqRreRfaEEy8RrljAkbrtme8symPsqC1Q4oRdQYaiPgO89dYg
   0hkvnGCDS1Z9xeFmgp/4gSHZiUawOHWG9UfGiYq9prEx6ixYHp1/ZGbrP
   g==;
X-CSE-ConnectionGUID: PshG45fZTPypst/rVVLh2Q==
X-CSE-MsgGUID: Zc9UQzCmRje9xkC1Bj3i+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="35652347"
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="35652347"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 12:00:33 -0700
X-CSE-ConnectionGUID: OuNKfyeISOyncK+MBLJh/w==
X-CSE-MsgGUID: oy4NrbmRRZ+Vh9GMDVOUIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="66089036"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Sep 2024 12:00:32 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snN9B-000DrH-2c;
	Sun, 08 Sep 2024 19:00:29 +0000
Date: Mon, 9 Sep 2024 02:59:37 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, "Rob Herring (Arm)" <robh@kernel.org>
Subject: [masahiroy:kbuild 27/30] make[3]: *** No rule to make target
 'arch/powerpc/boot/cuImage.mpc866ads', needed by 'arch/powerpc/boot/zImage'.
Message-ID: <202409090247.dAsoJ1nl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild
head:   4dda2081d84398248af60da1d519840a5d6e3390
commit: e6abfb536d16cc9264c4d92b429934f92adf5285 [27/30] kbuild: split device tree build rules into scripts/Makefile.dtbs
config: powerpc-mpc866_ads_defconfig (https://download.01.org/0day-ci/archive/20240909/202409090247.dAsoJ1nl-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240909/202409090247.dAsoJ1nl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409090247.dAsoJ1nl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[3]: *** No rule to make target 'arch/powerpc/boot/cuImage.mpc866ads', needed by 'arch/powerpc/boot/zImage'.
   make[3]: Target 'arch/powerpc/boot/zImage' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
