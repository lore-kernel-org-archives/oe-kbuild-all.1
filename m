Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F068F1DA23
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 23:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732836111; cv=none; b=Hcsx+1ELKAzxhzmSzbOuEL97UIRtNxPVJYqPoGO7GOfpNh1kEFnzrEh0zpn0l6DK3XiSNTeAHW/P34thdGq1IxCzJVVFFEXxBqlWyFWdUaNv2GCHszmE9IZOHJf3FAuQVstFopmiCUdTiS/F5yDT4udfh7UAW95zvfZtbvIxBsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732836111; c=relaxed/simple;
	bh=qZfyIX5Vf3TkV3wBcfPD1+S3SHCRUJggydPimL5TA64=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pvjXWBdat2Kwt69yNMEDeSSJhrGBcvb0D2rIGD2RO4Eo9slWrW6h9HGafvwB5xld2y353lkKMj6PO8B/dszdjGGzbDjEkvWxris/Z+bQrTLvqDs1Q3B8iKuYJwlVUU5Hxhgqp9nrTKMJ8/uSFFmKIS1Tb261JCneuSnh/vUeugc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ax3k07Zt; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ax3k07Zt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732836109; x=1764372109;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qZfyIX5Vf3TkV3wBcfPD1+S3SHCRUJggydPimL5TA64=;
  b=Ax3k07ZtAnVbbzrSDHhjVY9Wbs9dAPvDl+n4+pqCEZu21094cjixOJOA
   D0ylWNDmqXjjIVXNdQjF3LEzNe+1lKDccoHtkQxxRBm8eubIzCf7dey1Y
   C8FFsTT6GySKvfUhONWhAltojVUBEzXff1oerdw6lJ+OUKVZ/vONeptHb
   f7iVe9Zddmt2MNyntc6ENanDUSNFRpBPyhNZfZw76NWspatVPZiaYJodC
   jfJwJlBoFWKWErAdyhg9dw2Kjhv/Rt4faDAi40b+fK3p1sVpNWXO5Y/gl
   ZT9FGLFRLQqgeHLov6N1qc/QGHts5mPOQOHkNiMwwL1/F2U6BP2o06MIU
   g==;
X-CSE-ConnectionGUID: b1ZlpP93RGWkUkeQh0OhBA==
X-CSE-MsgGUID: nOJq96lmRUOTgvsYAWkYuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="35937735"
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="35937735"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 15:21:48 -0800
X-CSE-ConnectionGUID: kVIDvoxsRXWkw9lj4TTlCw==
X-CSE-MsgGUID: 749/UcUDTum7LNf0nLUdrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="97103857"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Nov 2024 15:21:47 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGnpR-000A9I-0d;
	Thu, 28 Nov 2024 23:21:45 +0000
Date: Fri, 29 Nov 2024 07:21:08 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, chench00 <chench@hygon.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1559/1559]
 drivers/crypto/ccp/hygon/tdm-kernel-guard.c:308:23: error: use of undeclared
 identifier 'NR_syscalls'
Message-ID: <202411290729.4IacO2ee-lkp@intel.com>
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
head:   95bc69473a373c2e578d4fc39734e5811a03ead3
commit: 3ad98583441f7c8a2553e1e8d6340ed4397033e2 [1559/1559] crypto: tdm: Support dynamic protection for SCT and IDT by HYGON TDM
config: x86_64-randconfig-075-20241129 (https://download.01.org/0day-ci/archive/20241129/202411290729.4IacO2ee-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411290729.4IacO2ee-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411290729.4IacO2ee-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/crypto/ccp/hygon/tdm-kernel-guard.c:15:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2242:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
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
   drivers/crypto/ccp/hygon/tdm-kernel-guard.c:243:15: warning: no previous prototype for function 'kprobe_symbol_address_byname' [-Wmissing-prototypes]
     243 | unsigned long kprobe_symbol_address_byname(const char *name)
         |               ^
   drivers/crypto/ccp/hygon/tdm-kernel-guard.c:243:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     243 | unsigned long kprobe_symbol_address_byname(const char *name)
         | ^
         | static 
>> drivers/crypto/ccp/hygon/tdm-kernel-guard.c:308:23: error: use of undeclared identifier 'NR_syscalls'
     308 |                 eh_objs[SCT].size = NR_syscalls * sizeof(char *);
         |                                     ^
   4 warnings and 1 error generated.


vim +/NR_syscalls +308 drivers/crypto/ccp/hygon/tdm-kernel-guard.c

   242	
 > 243	unsigned long kprobe_symbol_address_byname(const char *name)
   244	{
   245		int p_ret;
   246		struct kprobe p_kprobe;
   247		unsigned long addr = 0;
   248	
   249		memset(&p_kprobe, 0, sizeof(p_kprobe));
   250	
   251		p_kprobe.pre_handler = p_tmp_kprobe_handler;
   252		p_kprobe.symbol_name = name;
   253	
   254		p_ret = register_kprobe(&p_kprobe);
   255		if (p_ret < 0) {
   256			pr_err("register_kprobe error [%d] :(\n", p_ret);
   257			return 0;
   258		}
   259	
   260		addr = (unsigned long)p_kprobe.addr;
   261		unregister_kprobe(&p_kprobe);
   262	
   263		return addr;
   264	}
   265	#endif
   266	
   267	static int __init kernel_security_enhance_init(void)
   268	{
   269		int i = 0;
   270		int ret = 0;
   271		unsigned long *sct_addr;
   272		struct desc_ptr idtr;
   273	#if !IS_BUILTIN(CONFIG_TDM_KERNEL_GUARD)
   274		unsigned long (*f_kallsyms_lookup_name)(const char *);
   275	
   276		f_kallsyms_lookup_name = (unsigned long (*)(const char *))kprobe_symbol_address_byname(
   277			"kallsyms_lookup_name");
   278		if (!f_kallsyms_lookup_name) {
   279			ret = -DYN_ERR_API;
   280			pr_err("kprobe_symbol_address_byname failed!");
   281			goto end;
   282		}
   283	
   284		sct_addr = (unsigned long *)f_kallsyms_lookup_name("sys_call_table");
   285	#else
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
