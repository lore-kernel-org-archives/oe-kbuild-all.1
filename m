Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F0D1EFF96
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Aug 2025 10:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754302323; cv=none; b=mNuI0ZcMRmbPUsWzUAPksRrLQ/lxtcF0hvyInRWn1gxnv2Uqu4QASq7WKp8LC0PNss78IaYhUuQxYCRKFYYj69+6IJVRzL5Uahmfja9IOHgHvfSon0nJui5vD1NmmRk8VZYKkKfm433iMxrXcFVWU1PnSjvpc8EPjjw8em/6Z3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754302323; c=relaxed/simple;
	bh=ZEc1MBCi1PmxO21YsMtTSqxuBNpzCV7tjBETN8W/1IY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z8BGPSPTO1rkENnRI4aVL6nksgvwVCNQOHwpfZV7xO9hb3NMKv4NqbkDTYJMUlnkeJiUA7jd8IBPKxsEbR0pna6OJvQEjioE2FuFxk9sN++sjFzQ4WCN6J9E2AjbPaH7TtEoklk4QIFcu/I+4Tex8L7QcLrdLc45CQb070JIK7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wk8Dcdzl; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wk8Dcdzl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754302321; x=1785838321;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZEc1MBCi1PmxO21YsMtTSqxuBNpzCV7tjBETN8W/1IY=;
  b=Wk8DcdzlsgkfvdrwgcH3Tl0MZ5qzLMfThBl1+VbE/MmqIjgD34UmQqn6
   w06Fl5rFNmWK6mh/J/kZqqo4XVXuBL67Uf3YGSRCOTNWDprxjysRkeue9
   SdjbVWsp5eDUYkX7c7OHI4RKG3wyxo5RwKqsB/lwNc9BiLfw1TT7qIygY
   K9qBY+J2R7ahcbDLc8PitUqSE4asrGo7o3c+IWFMh86HzBn7JRm72jM0g
   K9z9UoJEbDwIkHymUfPxzfxdKx45KiPBf9io5GwAUkkUdn2z/aOIKpNKB
   hGmINnUHB9pFncZIs4u+8x99rvG0IrEhgegYfiTEGi9jUjpyyAWmp/4Ev
   A==;
X-CSE-ConnectionGUID: QlDCbVqIT7CfZGYHcmp9Dw==
X-CSE-MsgGUID: 3nleXWIrRuihAZZlS8+Xrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="56698501"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56698501"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 03:12:00 -0700
X-CSE-ConnectionGUID: 7efI9R7LTCu2qVZ+geUbjg==
X-CSE-MsgGUID: QoRqiSb3SbCyPJ1oT4efCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="164122011"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa007.jf.intel.com with ESMTP; 04 Aug 2025 03:12:00 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uisAf-0001lj-0A;
	Mon, 04 Aug 2025 10:11:57 +0000
Date: Mon, 4 Aug 2025 12:11:13 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2634/2634]
 drivers/crypto/ccp/hygon/tdm-kernel-guard.c:308:23: error: use of undeclared
 identifier 'NR_syscalls'
Message-ID: <202508041257.VLmpFnXZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   e46fbbc0ad301c3517340bf966d39b8493a2ebb0
commit: 3ad98583441f7c8a2553e1e8d6340ed4397033e2 [2634/2634] crypto: tdm: Support dynamic protection for SCT and IDT by HYGON TDM
config: x86_64-buildonly-randconfig-2004-20250804 (https://download.01.org/0day-ci/archive/20250804/202508041257.VLmpFnXZ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508041257.VLmpFnXZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508041257.VLmpFnXZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/crypto/ccp/hygon/tdm-kernel-guard.c:15:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2242:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/ccp/hygon/tdm-kernel-guard.c:151:5: warning: no previous prototype for function 'tdm_service_run' [-Wmissing-prototypes]
     151 | int tdm_service_run(struct tdm_security_enhance *data)
         |     ^
   drivers/crypto/ccp/hygon/tdm-kernel-guard.c:151:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     151 | int tdm_service_run(struct tdm_security_enhance *data)
         | ^
         | static 
   drivers/crypto/ccp/hygon/tdm-kernel-guard.c:212:5: warning: no previous prototype for function 'tdm_service_exit' [-Wmissing-prototypes]
     212 | int tdm_service_exit(struct tdm_security_enhance *data)
         |     ^
   drivers/crypto/ccp/hygon/tdm-kernel-guard.c:212:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     212 | int tdm_service_exit(struct tdm_security_enhance *data)
         | ^
         | static 
>> drivers/crypto/ccp/hygon/tdm-kernel-guard.c:308:23: error: use of undeclared identifier 'NR_syscalls'
     308 |                 eh_objs[SCT].size = NR_syscalls * sizeof(char *);
         |                                     ^
   7 warnings and 1 error generated.


vim +/NR_syscalls +308 drivers/crypto/ccp/hygon/tdm-kernel-guard.c

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
