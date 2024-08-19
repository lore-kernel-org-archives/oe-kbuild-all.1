Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96D34438B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Aug 2024 19:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724095513; cv=none; b=I+lZxHD2c+WdCahsYEoLdMbVPpYTwExJeqcGrPzkF0ciZC3upiPslsC62ao9Iq1uOP84JXDHsXfclP5ZsGrfWIFgTYaILBt0eDmA34GeNkc4fIAObhLL8Bj86sfx+MMtPaoYpS8hN2U3mz6dLhFQaSKbDOdapNuFu03ncnyaB1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724095513; c=relaxed/simple;
	bh=1qAdAcWpIjSCg2oV6f4fJhtSbl+7qxHwx+CChCxobBk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YL3Ynu5dZvMMEEBg7dXMLB9eZfsSPQ6Eljp1EsVdu3IaWqx7KLDTdmYL2exMA9CWp0MeP9dVpTa57P0N4Cp12bWB1L5H4Fs26fa5MUOvE4ZAJ7q0gTBj5PtbLK56cVPSxsGIbp2IcYyaW0dr9gGb6IbAOnJKqWuxKIbKkryBNG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iS1bHbWF; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iS1bHbWF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724095511; x=1755631511;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1qAdAcWpIjSCg2oV6f4fJhtSbl+7qxHwx+CChCxobBk=;
  b=iS1bHbWFgrxJk/eAMWiHIRLq4ABhtcTDubeCc+VAKmdvh5zI4O+AMN8Q
   35d8pWrBG9sroFGg3U2Buq4HCxwOw4IuEjNDIO2GuysDN72wxdCdn9krh
   Q0i4NHKkmVMyJGtJ5yH377/hXKa0o8bX1PG+4oETiJOCxlDVzTiG1DsTg
   q5otuBHbIwItJ2fw0DnLNdcm/bfiXJfREovLBHr0vWy2wm8uC87uSb6+z
   WPa1k0wZhnhLhxDmbOdQe0jy8AmPcDnVapTW97FNT0tQR2REtFfdZi/kM
   zf5QSYCpzuNhQ5uzYzYTe1BiwUSf5FunDXAgatn24Y0gBLCu+pn3m0Xtl
   A==;
X-CSE-ConnectionGUID: kjfaXXxXS0mfrzY9ahu1xw==
X-CSE-MsgGUID: lA5SG184Qf66yRLRBR/P8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22497926"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="22497926"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 12:25:11 -0700
X-CSE-ConnectionGUID: B6g0VYVXRXenUnnJ1cJwUA==
X-CSE-MsgGUID: tAlqVuJHSf6wMdcZu2ftcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="65156447"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 19 Aug 2024 12:24:59 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sg7zs-0009MI-2m;
	Mon, 19 Aug 2024 19:24:56 +0000
Date: Tue, 20 Aug 2024 03:24:26 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, chench00 <chench@hygon.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 13311/13455]
 drivers/crypto/ccp/hygon/tdm-kernel-guard.c:308:37: error: 'NR_syscalls'
 undeclared; did you mean 'si_syscall'?
Message-ID: <202408200300.4dy9MKnd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   063fb5b67877d27a0adebef0dd88bab842d8de07
commit: 3ad98583441f7c8a2553e1e8d6340ed4397033e2 [13311/13455] crypto: tdm: Support dynamic protection for SCT and IDT by HYGON TDM
config: x86_64-randconfig-004-20240819 (https://download.01.org/0day-ci/archive/20240820/202408200300.4dy9MKnd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240820/202408200300.4dy9MKnd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408200300.4dy9MKnd-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/crypto/ccp/hygon/tdm-kernel-guard.c:151:5: warning: no previous prototype for 'tdm_service_run' [-Wmissing-prototypes]
     151 | int tdm_service_run(struct tdm_security_enhance *data)
         |     ^~~~~~~~~~~~~~~
   drivers/crypto/ccp/hygon/tdm-kernel-guard.c:212:5: warning: no previous prototype for 'tdm_service_exit' [-Wmissing-prototypes]
     212 | int tdm_service_exit(struct tdm_security_enhance *data)
         |     ^~~~~~~~~~~~~~~~
   drivers/crypto/ccp/hygon/tdm-kernel-guard.c:243:15: warning: no previous prototype for 'kprobe_symbol_address_byname' [-Wmissing-prototypes]
     243 | unsigned long kprobe_symbol_address_byname(const char *name)
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/ccp/hygon/tdm-kernel-guard.c: In function 'kernel_security_enhance_init':
>> drivers/crypto/ccp/hygon/tdm-kernel-guard.c:308:37: error: 'NR_syscalls' undeclared (first use in this function); did you mean 'si_syscall'?
     308 |                 eh_objs[SCT].size = NR_syscalls * sizeof(char *);
         |                                     ^~~~~~~~~~~
         |                                     si_syscall
   drivers/crypto/ccp/hygon/tdm-kernel-guard.c:308:37: note: each undeclared identifier is reported only once for each function it appears in

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ACPI_HOTPLUG_IGNORE_OSC
   Depends on [n]: ACPI [=y] && ACPI_HOTPLUG_CPU [=n]
   Selected by [y]:
   - X86 [=y] && ACPI [=y] && HOTPLUG_CPU [=y]


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
