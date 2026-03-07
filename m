Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE7F330B30
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Mar 2026 07:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772867817; cv=none; b=rFjSz7iu5C+4Fz2t0tGSTUU/ee3A/rR2NCenvLPFcZjXhkqzHncU2naS+YUKd5iZOhrzX3d01aJn2ngcPnBAVVsgW3b9S8MTqAHTZIWah/EV2C1UVQRikpfFXnKeGyMVurRO5Llbb+nv2GzsGLqDLR5mUqtIyue/1D8rdwB2UHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772867817; c=relaxed/simple;
	bh=U00DeheyHpiI2mwaay0dl8q29I04Hh2wH5xIji87vPc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MU45F3ULZ7avQC/oJXOGG0pomVpArv9rCzWkizehV3vytHG9TyT6gqd2Oq8X0K6zSMzpExzAfPbNKQ9z455Hd/zBR1TgGu0b3Oxb13N/JDapELhUvWg+ShoJ/WXq6yVNWnT2VWtfpeBcw9jHxpn5uzcuqISHkqyg6KGAl/HMVXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NKQGWS47; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NKQGWS47"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772867815; x=1804403815;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U00DeheyHpiI2mwaay0dl8q29I04Hh2wH5xIji87vPc=;
  b=NKQGWS47tgLFcU5d7dDQAkMPIy4SG+o/qqE8KC49fF3MV7EvjJ64C2wi
   itzF3QO9zI5Vv7EK/5yigMZjgvDkket+z45ZnKGT54OltXXsWKdye5hZ3
   +iS16pqIieX1Rq7bszQDlKNlL/4Ouy/+WU2R41CH42xMo4onatuPOWFuF
   f/xVppJMD/6JKAhSXOWcMEKPSeHj8gDACcKnEUbIZcdOBGkXRTKsGTsyL
   ymj3L/HnhEqslcQTWZZa+GBXFdF5RHaVC1Cv3FfsNJjKew+CEz1g+l3T/
   1D+iTRyIUwRdgY0rAwUGWMosQs4SCZLX25KVyiIYsn2VOynAQzfG/bb5w
   Q==;
X-CSE-ConnectionGUID: TAL5EYaYTTWTLrVChE+EWA==
X-CSE-MsgGUID: XVGe3PA8RQGqPEWJhkRg6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="77849890"
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="77849890"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 23:16:51 -0800
X-CSE-ConnectionGUID: MWwlOK6DQ+eeaqeQdls+wg==
X-CSE-MsgGUID: sZXsI0wsQGCX/hOHVf96FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="224180817"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Mar 2026 23:16:49 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vylu2-000000001nJ-27pR;
	Sat, 07 Mar 2026 07:16:46 +0000
Date: Sat, 07 Mar 2026 15:16:23 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/kbuild-vmlinux-h 2/6] Makefile:1691:
 *** missing separator.  Stop.
Message-ID: <202603071522.HKwRTiER-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/kbuild-vmlinux-h
head:   8004855a92a2320932629e08adcf6e3048ff774c
commit: dc4d07a89d0af09d050c7954444aebe6c8b2c028 [2/6] bpftool
config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20260307/202603071522.HKwRTiER-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603071522.HKwRTiER-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603071522.HKwRTiER-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Makefile:1691: *** missing separator.  Stop.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'distclean' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'distclean' not remade because of errors.
--
>> /kbuild/src/consumer/Makefile:1691: *** missing separator.  Stop.
   make[1]: *** [/kbuild/src/consumer/Makefile:248: __sub-make] Error 2
   make[1]: Target 'mrproper' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'mrproper' not remade because of errors.
--
>> Makefile:1691: *** missing separator.  Stop.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +1691 Makefile

  1686	
  1687	vmlinuxclean:
  1688		$(Q)$(CONFIG_SHELL) $(srctree)/scripts/link-vmlinux.sh clean
  1689		$(Q)$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) clean)
  1690	
> 1691	<<<<<<< HEAD
  1692	clean: archclean vmlinuxclean resolve_btfids_clean objtool_clean
  1693	=======
  1694	clean: archclean vmlinuxclean resolve_btfids_clean bpftool_clean
  1695	>>>>>>> 112d8787b4bc (bpftool)
  1696	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
