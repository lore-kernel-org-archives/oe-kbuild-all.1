Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209883A1CD
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 18:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727633273; cv=none; b=FYMC5C0cUlHNfc/83EG/zbXZNWG02fwJnAmjcQxS2BWucIgrlNm6jTHfvGax8DEYJEQE6Pyt74R/1xL+GXYWoZzL68yOSkYhmox8ZAEen5dhUFNoPOST4ZnUkmOaVm+cIgQtExoK1gIcTinqNdTlDwuDF32aX/2SaqUl40DvmcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727633273; c=relaxed/simple;
	bh=xh0UAlHri4RmkBY7KGADFG/Vxv251UC0Dg7SSnlvFZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VztdbJWC7XdrfEbdEdbW3nRshmgd7HOUsPfnDbsudXRtr36gyzvb687C2D9L0fvLZBIwPVAHCouZ5sxvCCw/7oparIizZCFLSpYJZep6dRDPEhYxFotxaQ2/WhSj21yjA2fu5bHRhBFQUiUh3cK3z/hdPBJQKM0t+wtys07+f4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Az7SHiCF; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Az7SHiCF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727633273; x=1759169273;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xh0UAlHri4RmkBY7KGADFG/Vxv251UC0Dg7SSnlvFZ4=;
  b=Az7SHiCFsauGsJB+1lqlwbuuMSiN4Hd4PmsDrOgaUNL6j+PZ5eY132yw
   MXUQVDJvpy/Az3khkFWt70dVthvDxEGLAcUFMMpLfJZqVCGWPpDc6/Vfn
   Bw53zcU+mvPL7mSli/nq2vmAvuEl8XWDnqJ/ERSnR1sOiJJiHUNNuRwJ/
   e8MdS+lmwuNJE/CFkRYnrpnhYkm7ECeoWeZOFaLKKj2WGFCvJ+lobaJfq
   EsQsYfGvohBUF70Cr3O0+nOd/a85cBQFzTQUebwf+aDzAZWozZdwq4PyT
   RQ+XICpHeiCDvPAJgUk4iw9AGzxc3AK8cn6vlZ2yGJR2qfeab47cwCRq6
   A==;
X-CSE-ConnectionGUID: pe7nYLjPQFii5N4GYFiztw==
X-CSE-MsgGUID: rJ4FBuxgQxekhhjL4ppEEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="26850424"
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="26850424"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 11:07:50 -0700
X-CSE-ConnectionGUID: cZ27mdozSjydrG/OCfx+dQ==
X-CSE-MsgGUID: 1kbPdR18S8K2ZbWtM/Yv2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="72646821"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 29 Sep 2024 11:07:44 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suyKZ-000OXn-2p;
	Sun, 29 Sep 2024 18:07:39 +0000
Date: Mon, 30 Sep 2024 02:07:09 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, chench00 <chench@hygon.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 13319/14244]
 drivers/crypto/ccp/hygon/tdm-kernel-guard.c:308:23: error: use of undeclared
 identifier 'NR_syscalls'
Message-ID: <202409300206.JS60OQQZ-lkp@intel.com>
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
head:   91ff8f4b711382909faa289c49735e0514af6f76
commit: 3ad98583441f7c8a2553e1e8d6340ed4397033e2 [13319/14244] crypto: tdm: Support dynamic protection for SCT and IDT by HYGON TDM
config: x86_64-buildonly-randconfig-004-20240929 (https://download.01.org/0day-ci/archive/20240930/202409300206.JS60OQQZ-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409300206.JS60OQQZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409300206.JS60OQQZ-lkp@intel.com/

All errors (new ones prefixed by >>):

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
   3 warnings and 1 error generated.


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
