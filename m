Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB1921D5AF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Oct 2026 02:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792376349; cv=none; b=C0u4AciLB60nBx8BILKdvj8Y0BGUcIFf2mY0iISCksRZdbqxGqLlHT/H2KIpI+3qdQSIBeqUdhKPmVqOWRq9PMV0sDF4MNzeMru2e0yD2I2DKPd3NxUx+eyUpRSPDu5c4ZzTPBOfgymCdKf78Q2UnZZsrauymBCSSWLD9ZnXczA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792376349; c=relaxed/simple;
	bh=tJbuGcdZTqhQH0UHhLcxTKV+3DdhkC2hs+3Qsd7o++c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WeyCAB9GphbFPdtVZYY7nat3qfw0I5t5A7rfLu51WmPSHf9OYyp9g7+DTrAcquexy+9OePKp/3oB35YssX5Ujg2BoItfOGn2qYSiAXqI5zsIzkxQVxoYWmPHAWIxr0WV2GLzR3tP0ookbQHUazq0OH9X3GRlgrEycGmynmHev2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YJZEpm1g; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YJZEpm1g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792376346; x=1823912346;
  h=date:from:to:cc:subject:message-id;
  bh=tJbuGcdZTqhQH0UHhLcxTKV+3DdhkC2hs+3Qsd7o++c=;
  b=YJZEpm1g8lMksFq2KBkiXXh/ho4mpDjZmu/9bZzegV4GXbgazhfC+XG/
   PiRntVYVpljE9AApA5hO4GFTLgiY4RmxSLC7IFugQfIM5t5403JbIHMR0
   GXgB1WePgvi+vO8rNlMVN0jt0GBz3hqSFakxpTlva6m26Ogrlj0dQwwLg
   52/PSPOeG8iqF2y0FI7hLMOzwbJjPlCxXkRidBf4BhubvUVF9GzE0c+DP
   tpaa/S2UD+skkL37ceE7x9lNcMHgxVHELVyl76EnaprUwCLw49UWozJTn
   ayrqYbZBWdgRTiFWJZ4Z8piakwpVHw/yR2RPmZ7ApzGaviOHwC16dTe/X
   A==;
X-CSE-ConnectionGUID: U7sbxN63RXartW0TWZjBhw==
X-CSE-MsgGUID: BphphXVrRhW6alCkZtiMvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1048672"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="1048672"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 19:19:05 -0700
X-CSE-ConnectionGUID: jxZzVMK2QB+whNBrOFA5wg==
X-CSE-MsgGUID: 38/4ollITLG0YjwgaghkWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="2418325"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 18 Oct 2026 19:19:03 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIcxo-00000000L7C-3lfy;
	Mon, 19 Oct 2026 02:19:00 +0000
Date: Mon, 19 Oct 2026 10:18:57 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [daveh-devel:kss 31/32] arch/x86/kernel/cet.c:204:6:
 warning: no previous prototype for 'regs_set_return_ip'
Message-ID: <202610191047.bWwiVQVA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git kss
head:   1b2e2aefa6c7e3d15fac1b25a971b2d2cc3b697d
commit: ca107dce40b82cc491ac08e03e01626956ca5eb4 [31/32] fred-entry-ssp-muck
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20261019/202610191047.bWwiVQVA-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610191047.bWwiVQVA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610191047.bWwiVQVA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/cet.c:204:6: warning: no previous prototype for 'regs_set_return_ip' [-Wmissing-prototypes]
     204 | void regs_set_return_ip(struct pt_regs *regs, unsigned long ip)
         |      ^~~~~~~~~~~~~~~~~~


vim +/regs_set_return_ip +204 arch/x86/kernel/cet.c

   193	
   194	/*
   195	 * Change the return IP of an event. Use this instead of directly
   196	 * manipulating regs->ip.
   197	 *
   198	 * The hardware saves a special FRED entry frame on to the shadow
   199	 * stack. It contains the RIP of the interrupted context. ERETS
   200	 * ensures that this matches regs->ip.
   201	 *
   202	 * Update the FRED entry frame in addition to regs->ip.
   203	 */
 > 204	void regs_set_return_ip(struct pt_regs *regs, unsigned long ip)
   205	{
   206		struct fred_shstk_entry_frame *ssef;
   207	
   208		regs->ip = ip;
   209	
   210		/* Only kernel-mode events save the 'ssef' pointer. */
   211		WARN_ON_ONCE(user_mode(regs));
   212	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
