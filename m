Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BEA1459FD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Nov 2024 04:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731989462; cv=none; b=HAJB8jZ2idaQ50XEi+fsbduIykGcBEsEIy88aa4aDXta+C6mPAnm7T3MLoai+zzY95K5QP8eo2zMMNeLHLqxgfoUTKmhjgmAFl45SGl7DFM+vsAwJGOe5ZqOVxjNRKitXnWV7FMvd4R7rjzogd+18GoX7JWYwPk3rRrNKptuSQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731989462; c=relaxed/simple;
	bh=zapFSX7oiftm4/g7Iz+ofckvWe7y4t4PeRpiqeD7XqI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AJ6+TE/MjbFm7jnyFClc1cgLlPRzojSI6w2Wv3nEHJKKPNuF07WwOluksNnmD2Q4Vi/3lhTgMyDkXGdpseAbiWwYScWhp5j9Hbd3CEeyRia2837NjT/iQ/c7koeGwmPV7emOd+MRT75RvspHRX9Ru0/xcfrGcAS3QGj9x01qhqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S1wIXTUI; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S1wIXTUI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731989461; x=1763525461;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zapFSX7oiftm4/g7Iz+ofckvWe7y4t4PeRpiqeD7XqI=;
  b=S1wIXTUI4/SHWqOqZXqOFW0corV+auYR7pH+t+cSwRR8kV4mgiHNzE7E
   EgtsxrtIbHH2T/8J+JhIPCwAU64+se5zS5tHLhmMnRWvBPaHftXujkGQo
   xyE/RtonTqHFHTVuDHzxir6I+nvLBGDbZBk+FRW+T2kC5GRQ1/8+E9kky
   l/gW2oXNWaHGBFKVOb7QaBL33hI4iKjUcu084XOKvXYLgEIf8xDrCayBu
   F1JVXnw4XRSfrXFgtZ2ncWqrX/eVWZ/k1xUOTisuQQ/c/47jFvKpJLRG9
   rFOdYIw51EipiXhO+7xaQKJDpkAevoT2kSeADEcy1dEfqTl8OPCx1A/CO
   Q==;
X-CSE-ConnectionGUID: Tl9aumi5STSdx7krN8hmbA==
X-CSE-MsgGUID: 8bIiNs7YSb6qVWlR9rF3Xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="57382625"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="57382625"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 20:11:00 -0800
X-CSE-ConnectionGUID: 0/SUUZanTu2a67f9PWl0bw==
X-CSE-MsgGUID: fXNymZWWS96x1vK42oBmHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="89554904"
Received: from lkp-server02.sh.intel.com (HELO 2cc4542d09d4) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 18 Nov 2024 20:10:59 -0800
Received: from kbuild by 2cc4542d09d4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDFZo-00006A-2X;
	Tue, 19 Nov 2024 04:10:56 +0000
Date: Tue, 19 Nov 2024 12:09:58 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, chench00 <chench@hygon.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1484/1484]
 drivers/crypto/ccp/hygon/tdm-kernel-guard.c:308:37: error: 'NR_syscalls'
 undeclared; did you mean 'si_syscall'?
Message-ID: <202411191227.rP48T37X-lkp@intel.com>
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
head:   8a039651010897592567f5751c4e706ab794e9c0
commit: 3ad98583441f7c8a2553e1e8d6340ed4397033e2 [1484/1484] crypto: tdm: Support dynamic protection for SCT and IDT by HYGON TDM
config: x86_64-randconfig-074-20241119 (https://download.01.org/0day-ci/archive/20241119/202411191227.rP48T37X-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241119/202411191227.rP48T37X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411191227.rP48T37X-lkp@intel.com/

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
   WARNING: unmet direct dependencies detected for PGP_KEY_PARSER
   Depends on [m]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y] && ASYMMETRIC_PUBLIC_KEY_SUBTYPE [=m]
   Selected by [y]:
   - PGP_PRELOAD [=y] && CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y]


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
