Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E203C0633
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Aug 2026 03:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787109850; cv=none; b=rUUchwFKyBgbD30IRnP0Z2MwHZHS3yOHav5In4zDWfTEW7RaGWO4YNOgGZXxXFiiRbC2sAb/2H8Ic8j9Zb6/IxLEXdO51yH78ugUGDENF7kE3tKPd/da40ZMEY+zIshjpnOg9K8IACfZyEE2S+onPBeZmNrSDY4NqnL+oLhr4d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787109850; c=relaxed/simple;
	bh=O1y9lHci1VVmlpHJ5uL4HnSuO+nhPbTstW6bEvjraUg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hKYR7K5rtFXupnvL7ADgDZCMhzGIA/wV/HE15VXiLV7pBuTUoZnNfh1qf98yZ1rGasLIGWNgfMI4C46YfFPF9g4GG1fsKcE1LBk0mOiuZDnISqd/CuSUCumtBw7wjv8yKHw6xzNO1TYoWB5nWWHRBhCvm3S+YNozpkmnDyGrC9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aAmnNCR9; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aAmnNCR9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787109848; x=1818645848;
  h=date:from:to:cc:subject:message-id;
  bh=O1y9lHci1VVmlpHJ5uL4HnSuO+nhPbTstW6bEvjraUg=;
  b=aAmnNCR9y1V31pQ4s7qggHAulCBVnB143e2HU8kMyWdA/DH2l89jIrC6
   JlMnY6CTbEZH9YXYEEgiGuYNXx2J3vZI+xfYvM/KYba8XBVsutzwyKtDu
   JptaLer0lhQmRXfv8zQj59OFwab2v0hE80t2hlDip7Ji990RY/WGdFMCx
   fWX7HCRh2CkM9Sxcg6gGNzkZf0oXgsg1YSkVOcE5nra3geonoJDyz+QAy
   3t3WFZKIdd7cBoXr/RBdqzn5v8mkxYSJsoL0EeMhTW6Kswrb7RZjmgfeS
   2g0YewTb+BKFrcYTiVQWm7y8gwflzvKMgKN3gop8yQ2LCjKLB9tJ4di17
   Q==;
X-CSE-ConnectionGUID: VcgXigU1S8K7JvMepTf05w==
X-CSE-MsgGUID: Grk69TluTWS2Gn7hn5qklA==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="87628690"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="87628690"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 20:24:07 -0700
X-CSE-ConnectionGUID: nbLr0g/cR8uanlQdlpp0Qg==
X-CSE-MsgGUID: w7Jz0A/ZRkuIgjKjMN2OBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="288916351"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Aug 2026 20:24:06 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwWuJ-00000000erG-1aLX;
	Wed, 19 Aug 2026 03:24:03 +0000
Date: Wed, 19 Aug 2026 11:23:09 +0800
From: kernel test robot <lkp@intel.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cris:acpi_pcc_v3_telemetry_ng_V10_on_v7.1 30/35]
 include/linux/fortify-string.h:746:17: error: call to '__read_overflow'
 declared with attribute error: detected read beyond size of object (1st
 parameter)
Message-ID: <202608191114.VJspdhSF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cris/linux.git acpi_pcc_v3_telemetry_ng_V10_on_v7.1
head:   330fae3bb5f8a8b084685e5944f0c7bbb5717d2e
commit: e67a787d5fc392d162d321d38430ce6af039e0fe [30/35] firmware: arm_scmi: Add System Telemetry driver
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260819/202608191114.VJspdhSF-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608191114.VJspdhSF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608191114.VJspdhSF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/string.h:386,
                    from arch/powerpc/include/asm/paca.h:16,
                    from arch/powerpc/include/asm/current.h:13,
                    from include/linux/mutex.h:14,
                    from include/linux/kernfs.h:11,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/cdev.h:5,
                    from drivers/firmware/arm_scmi/scmi_system_telemetry.c:11:
   In function 'memchr_inv',
       inlined from 'copy_struct_to_user' at include/linux/uaccess.h:514:4,
       inlined from 'scmi_tlm_abi_info_get_ioctl' at drivers/firmware/arm_scmi/scmi_system_telemetry.c:264:8:
>> include/linux/fortify-string.h:746:17: error: call to '__read_overflow' declared with attribute error: detected read beyond size of object (1st parameter)
     746 |                 __read_overflow();
         |                 ^~~~~~~~~~~~~~~~~


vim +/__read_overflow +746 include/linux/fortify-string.h

a28a6e860c6cf23 Francis Laniel 2021-02-25  739  
a28a6e860c6cf23 Francis Laniel 2021-02-25  740  void *__real_memchr_inv(const void *s, int c, size_t n) __RENAME(memchr_inv);
281d0c962752fb4 Kees Cook      2022-02-08  741  __FORTIFY_INLINE void *memchr_inv(const void * const POS0 p, int c, size_t size)
a28a6e860c6cf23 Francis Laniel 2021-02-25  742  {
21a2c74b0a2a784 Kees Cook      2023-04-07  743  	const size_t p_size = __struct_size(p);
a28a6e860c6cf23 Francis Laniel 2021-02-25  744  
fa35198f39571bb Kees Cook      2022-09-19  745  	if (__compiletime_lessthan(p_size, size))
a28a6e860c6cf23 Francis Laniel 2021-02-25 @746  		__read_overflow();
a28a6e860c6cf23 Francis Laniel 2021-02-25  747  	if (p_size < size)
3d965b33e40d973 Kees Cook      2023-04-07  748  		fortify_panic(FORTIFY_FUNC_memchr_inv, FORTIFY_READ, p_size, size, NULL);
a28a6e860c6cf23 Francis Laniel 2021-02-25  749  	return __real_memchr_inv(p, c, size);
a28a6e860c6cf23 Francis Laniel 2021-02-25  750  }
a28a6e860c6cf23 Francis Laniel 2021-02-25  751  

:::::: The code at line 746 was first introduced by commit
:::::: a28a6e860c6cf231cf3c5171c75c342adcd00406 string.h: move fortified functions definitions in a dedicated header.

:::::: TO: Francis Laniel <laniel_francis@privacyrequired.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
