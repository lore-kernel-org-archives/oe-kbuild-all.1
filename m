Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10793BBE5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Jan 2025 09:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737453069; cv=none; b=aFV0CWI7Fawt3NiChYxccc5zrB1XuKYOP7NBiCAg8Wo9KBUkVFIdh3ei3WBdUmbQticanrJF8ttUqCiCtPGaBqzGoxDju5/2zs6rSxgYkBbd/dE6V7nMkXbfp3lXrcAQxncZnIff6P/u2LDRW7sLo+U4aeqiGUqYWhgV7JuC9CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737453069; c=relaxed/simple;
	bh=Q3593g1xjsWh8513vZR0IlpdAQRXlZlBTo7aAbYpOuU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TwRCt6Roi0YFK+1OOhuvohDKW+ZS6JCUdPe/4RMxVbdsmRa3o1zpC/+FaQoRlh3zmrLX9c5ejiSrlXJjbO3rh3eGj1H63dRhZXraBTUGoFmekQkf2JH+myljTLVrP8BkGUWjCuutGwHgUSqymsmVQhjKDS01Y/57AyXi63s8Yn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bXVdEKJP; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bXVdEKJP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737453068; x=1768989068;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q3593g1xjsWh8513vZR0IlpdAQRXlZlBTo7aAbYpOuU=;
  b=bXVdEKJPUmR7Jf2vhcs13TzRiPRATGeBTR2WB28ZYlUfMtVig1XiIk7k
   kzSSkJVKsX5ljS1UtfEbxYx04AEgVI15U6NKQbYCSef0yp4k62GnJIkSA
   vDXI8JPyLp7mkbALL7Leukx01PqfxC5aO90DGBqvEQyQ/UgYxjINPq2nf
   Ct49kwnPuKksJlUbVcT4duTIdt56IFGHwyql9D8dj6VCErDdKAKIiGBn9
   CGbqRDyQ1tDCEprtVr1p1qR4BesjhMlDNjtzliamN7q558c7cvns/D+Ol
   abfcAPVktjs9xih+8kgJ4GPQNNGFWfOuc3RdJJT6SKN3WHOabmw2O448x
   A==;
X-CSE-ConnectionGUID: APvPP+nRQQyBHxpFJz1u2g==
X-CSE-MsgGUID: kncmWrLDRVyHtw5BItFdCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="37553714"
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; 
   d="scan'208";a="37553714"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 01:51:06 -0800
X-CSE-ConnectionGUID: RfFfZvv6S560gphSecnnxA==
X-CSE-MsgGUID: utphp1dhRJekWazQ9lfNTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; 
   d="scan'208";a="106691129"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 21 Jan 2025 01:50:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taAuI-000XuB-25;
	Tue, 21 Jan 2025 09:50:50 +0000
Date: Tue, 21 Jan 2025 17:49:58 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1834/1834]
 drivers/crypto/ccp/hygon/tdm-kernel-guard.c:308:37: error: 'NR_syscalls'
 undeclared; did you mean 'si_syscall'?
Message-ID: <202501211756.LmO1gDKg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi chench00,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   75c81bcddd82381fbd4cef477a5b56eb2fe56697
commit: 3ad98583441f7c8a2553e1e8d6340ed4397033e2 [1834/1834] crypto: tdm: Support dynamic protection for SCT and IDT by HYGON TDM
config: x86_64-buildonly-randconfig-006-20250121 (https://download.01.org/0day-ci/archive/20250121/202501211756.LmO1gDKg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250121/202501211756.LmO1gDKg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501211756.LmO1gDKg-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/crypto/ccp/hygon/tdm-kernel-guard.c:151:5: warning: no previous prototype for 'tdm_service_run' [-Wmissing-prototypes]
     151 | int tdm_service_run(struct tdm_security_enhance *data)
         |     ^~~~~~~~~~~~~~~
   drivers/crypto/ccp/hygon/tdm-kernel-guard.c:212:5: warning: no previous prototype for 'tdm_service_exit' [-Wmissing-prototypes]
     212 | int tdm_service_exit(struct tdm_security_enhance *data)
         |     ^~~~~~~~~~~~~~~~
   drivers/crypto/ccp/hygon/tdm-kernel-guard.c: In function 'kernel_security_enhance_init':
>> drivers/crypto/ccp/hygon/tdm-kernel-guard.c:308:37: error: 'NR_syscalls' undeclared (first use in this function); did you mean 'si_syscall'?
     308 |                 eh_objs[SCT].size = NR_syscalls * sizeof(char *);
         |                                     ^~~~~~~~~~~
         |                                     si_syscall
   drivers/crypto/ccp/hygon/tdm-kernel-guard.c:308:37: note: each undeclared identifier is reported only once for each function it appears in


vim +308 drivers/crypto/ccp/hygon/tdm-kernel-guard.c

   286	
   287		sct_addr = (unsigned long *)kallsyms_lookup_name("sys_call_table");
   288	#endif
   289		if (!sct_addr) {
   290			ret = -DYN_ERR_API;
   291			pr_err("kallsyms_lookup_name for sys_call_table failed!");
   292			goto end;
   293		}
   294	
   295		asm("sidt %0":"=m"(idtr));
   296	
   297		if (!psp_check_tdm_support())
   298			return 0;
   299	
   300		for (i = 0; i < MAX_OBJ; i++) {
   301			memset(&eh_objs[i], 0, sizeof(eh_objs[i]));
   302			eh_objs[i].context = CONTEXT_CHECK_MODNAME;
   303			eh_objs[i].obj_name = obj_names[i];
   304		}
   305	
   306		if ((eh_obj == -1) || (eh_obj & (1 << SCT))) {
   307			eh_objs[SCT].vaddr = (uint64_t)sct_addr;
 > 308			eh_objs[SCT].size = NR_syscalls * sizeof(char *);
   309		}
   310		if ((eh_obj == -1) || (eh_obj & (1 << IDT))) {
   311			eh_objs[IDT].vaddr = idtr.address;
   312			eh_objs[IDT].size = idtr.size;
   313		}
   314	
   315		for (i = 0; i < MAX_OBJ; i++) {
   316			if (eh_objs[i].vaddr)
   317				tdm_service_run(&eh_objs[i]);
   318		}
   319	
   320		pr_info("Hygon TDM guard load successfully!\n");
   321	
   322	end:
   323		return ret;
   324	}
   325	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
