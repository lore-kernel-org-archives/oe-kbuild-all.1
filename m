Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE144142E9D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Aug 2024 21:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724448885; cv=none; b=D1QDA0EqJ6ODkM+BPM+jE01MVGInkXHwJkvm5shkzvKHhTdK4DZB+Omj/Rl03Qkcy4hFSz/sObGf9T5ATGxeLZUzNWNp2CzLpBLhHyEMu3L1lmOUho0S089hFp659Qtd1knpQjg7L8DlFavdbQ6P9r5Eqy9kJMdZ6NLcpeSwZsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724448885; c=relaxed/simple;
	bh=rm0lCGLh9U6fxQoPBm/ieDPykqnE69uHZWE7FTTjO1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rc8X8nYZ5i15GUoMBmEJvzpE7wbNi7y8xLFst6RyRLQMlWjaKu3x0EKYWbadLUfqJgUxWHjgoe/7G9jhYCi5UFkwKtDuie/yeGduwid4BBujO5XQYaKrwG+TyeU2rfa7pMkgALf0GH6ZVRRpGrQu2T2MAaYgebgruh3RcwyMTW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XVeWM1MZ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XVeWM1MZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724448885; x=1755984885;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rm0lCGLh9U6fxQoPBm/ieDPykqnE69uHZWE7FTTjO1Y=;
  b=XVeWM1MZguIPvI1UPugA6lNXy50uFgOxxugesdKPZYnXBBGY4ihBJgie
   bYjPdkCR/X/+V5EkI/e+gVUF3hq9aPt85KOmiBibPi8HC4rs5MHs4rYeO
   bqPVy+r8KbeZghvXtjW+rbolKaM7va+XQQtCO7k1zX47aRclioADyW8S0
   AQHr4t/Vcfl8TDOcCI9/CWY/pIIz16ojUXnmMV4oJwyrpMcprUKGXUvXr
   NPpYVy6wwPHR2JHYaWUuP0J/dmzuR2gus11DNR44BLtbJA7uR3QnQpHIY
   UiSv6iKT3Vxi9V2PsMYVmNAuaSiU9ij9TSPHiAWNWg987iZh08C87bFcw
   Q==;
X-CSE-ConnectionGUID: 2bn+3R0bSiq/DdlMpv7aMg==
X-CSE-MsgGUID: 2DTwA/FZQMyD6v3MwMMvLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="34314150"
X-IronPort-AV: E=Sophos;i="6.10,171,1719903600"; 
   d="scan'208";a="34314150"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 14:34:44 -0700
X-CSE-ConnectionGUID: mqTuBsVITPCNMKTR/KwxEA==
X-CSE-MsgGUID: nwKyyuLRQKewTmfgJJu0Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,171,1719903600"; 
   d="scan'208";a="62215166"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 23 Aug 2024 14:34:42 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shbvb-000E2i-1i;
	Fri, 23 Aug 2024 21:34:39 +0000
Date: Sat, 24 Aug 2024 05:33:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, chench00 <chench@hygon.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 13311/13487]
 drivers/crypto/ccp/hygon/tdm-kernel-guard.c:308:23: error: use of undeclared
 identifier 'NR_syscalls'
Message-ID: <202408240549.2pI9X9cN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   0ab269ed98945656b9c1c01a856b7eeea6a95257
commit: 3ad98583441f7c8a2553e1e8d6340ed4397033e2 [13311/13487] crypto: tdm: Support dynamic protection for SCT and IDT by HYGON TDM
config: x86_64-buildonly-randconfig-004-20240824 (https://download.01.org/0day-ci/archive/20240824/202408240549.2pI9X9cN-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240824/202408240549.2pI9X9cN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408240549.2pI9X9cN-lkp@intel.com/

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
>> drivers/crypto/ccp/hygon/tdm-kernel-guard.c:308:23: error: use of undeclared identifier 'NR_syscalls'
     308 |                 eh_objs[SCT].size = NR_syscalls * sizeof(char *);
         |                                     ^
   2 warnings and 1 error generated.


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
