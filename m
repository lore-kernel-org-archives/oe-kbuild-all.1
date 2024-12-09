Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406D91D555
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 06:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733727257; cv=none; b=MMXof7na2vpORSiw/znHyX2gSL4WmhIduvEvtw9zG5JHa5iFE/sNoG9rfABVsg2tFl54uc9pUPIh5fRIrqEGzmYkEcNO0CR2I5L03rjHGA7wkxaagz6XTuWLPLjNAOgNvHWFD5IEoFcYr/5RsPEFFJ+fQ9WVDvzYbO2CNBdBnDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733727257; c=relaxed/simple;
	bh=5iNAheTMqqEZTvRyNO4OryKRiUcBhWBW1Q2Kc2Uk9iY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YMKd9GBon/rby3R0Txxho8kaTN1KF07GuQNjw57ub5M+MIz2hIoAZxEnuiNy24IP4DmldudwcEKzmINyQBRAoiBKGO/ygirG80hLDD5zZThKs+nCgqrD0/89ytFJtXtXBM2V3cIT49lCQs8x/Av0wGqCO+ezM+7vk11SfZeAQAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I5TGpISl; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I5TGpISl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733727256; x=1765263256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5iNAheTMqqEZTvRyNO4OryKRiUcBhWBW1Q2Kc2Uk9iY=;
  b=I5TGpISlJCJTyYIRT0MqOeIhqxYjiWjEGWC2QG5zp3WfNCmmpJt1da8w
   XNXNi8r5QEx/dRc2SGp6Xi6GxqyzfzPC4NQCmuEKhOIOftO6+KK2g1sVJ
   o9XY8uBJPtcpkJ/RpvPb8Bs7vicaJpp6TMXOIc5O7FutjI3pdfll+0t+I
   6DIj6LVOTj+zefpOORTnpSh/JmJ6dx+jxRxde7netsnvxE3zkCFRp73HP
   nGyiq9419K85AyaKx8ITGJ1nrskg2wXDAp9DyxUWN4cDoX2ykNdZ2R32E
   a6usJYVS4tVEEVFR3cQj+malx7H01YI+QquhmxLqFdVmVwxCWMTJwhy+Z
   g==;
X-CSE-ConnectionGUID: xwkUUbDcTnmTxKtGgZq+wQ==
X-CSE-MsgGUID: LjvYBkLMR3if6f4Booi61g==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="37689140"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="37689140"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 22:54:15 -0800
X-CSE-ConnectionGUID: lNCUAmc0SeieVj3GC40lNQ==
X-CSE-MsgGUID: 0ivsrdfsSS6ZRW47+G4hHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="99435196"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Dec 2024 22:54:14 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKXel-00041R-19;
	Mon, 09 Dec 2024 06:54:11 +0000
Date: Mon, 9 Dec 2024 14:53:11 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, chench00 <chench@hygon.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1610/1610]
 drivers/crypto/ccp/hygon/tdm-dev.c:340:40: error: incomplete definition of
 type 'struct module'
Message-ID: <202412091416.tF5xTUAU-lkp@intel.com>
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
head:   31c4fffa86e17e8a946c944e91e7412db7f8427b
commit: a1dd4972da4e66d9a9d1a89b3dfd8f742c20193b [1610/1610] crypto: tdm: Add Hygon TDM driver
config: x86_64-buildonly-randconfig-005-20241209 (https://download.01.org/0day-ci/archive/20241209/202412091416.tF5xTUAU-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241209/202412091416.tF5xTUAU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412091416.tF5xTUAU-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/crypto/ccp/hygon/tdm-dev.c:21:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:8:
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
   drivers/crypto/ccp/hygon/tdm-dev.c:94:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
      94 |         int ret = 0;
         |             ^
>> drivers/crypto/ccp/hygon/tdm-dev.c:340:40: error: incomplete definition of type 'struct module'
     340 |                         memcpy(ctx_msg.module_name, p_module->name, sizeof(p_module->name));
         |                                                     ~~~~~~~~^
   arch/x86/include/asm/alternative.h:103:8: note: forward declaration of 'struct module'
     103 | struct module;
         |        ^
   drivers/crypto/ccp/hygon/tdm-dev.c:340:63: error: incomplete definition of type 'struct module'
     340 |                         memcpy(ctx_msg.module_name, p_module->name, sizeof(p_module->name));
         |                                                                            ~~~~~~~~^
   arch/x86/include/asm/alternative.h:103:8: note: forward declaration of 'struct module'
     103 | struct module;
         |        ^
   drivers/crypto/ccp/hygon/tdm-dev.c:606:20: warning: variable 'head' set but not used [-Wunused-but-set-variable]
     606 |         struct list_head *head = NULL;
         |                           ^
   7 warnings and 2 errors generated.


vim +340 drivers/crypto/ccp/hygon/tdm-dev.c

   323	
   324		if (!hash) {
   325			ret = -DYN_NULL_POINTER;
   326			pr_err("Null pointer\n");
   327			goto end;
   328		}
   329	
   330		ctx_msg.flag = flag;
   331		ctx_msg.pid = current->pid;
   332		memcpy(ctx_msg.comm, current->comm, sizeof(current->comm));
   333	
   334		return_address = CALLER_ADDR1;
   335		if (return_address) {
   336	#if IS_BUILTIN(CONFIG_CRYPTO_DEV_CCP_DD)
   337			p_module = __module_address(return_address);
   338			// caller is module
   339			if (p_module)
 > 340				memcpy(ctx_msg.module_name, p_module->name, sizeof(p_module->name));
   341			// caller is build-in
   342			else
   343				memset(ctx_msg.module_name, 0, sizeof(ctx_msg.module_name));
   344	#elif IS_ENABLED(CONFIG_KALLSYMS)
   345			symbol_len = sprint_symbol((char *)symbol_buf, return_address);
   346			if (!symbol_len) {
   347				ret = -DYN_ERR_API;
   348				pr_err("sprint_symbol failed\n");
   349				goto end;
   350			}
   351			symbol_begin = strchr((char *)symbol_buf, '[');
   352			if (!symbol_begin) {
   353				ret = -DYN_NULL_POINTER;
   354				pr_err("module name is not exist\n");
   355				goto end;
   356			}
   357			symbol_end = strchr((char *)symbol_buf, ']');
   358			if (!symbol_end) {
   359				ret = -DYN_NULL_POINTER;
   360				pr_err("module name is not exist\n");
   361				goto end;
   362			}
   363			symbol_begin++;
   364			if (symbol_end - symbol_begin)
   365				memcpy(ctx_msg.module_name, symbol_begin, symbol_end - symbol_begin);
   366			else
   367				memset(ctx_msg.module_name, 0, sizeof(ctx_msg.module_name));
   368	#else
   369			memset(ctx_msg.module_name, 0, sizeof(ctx_msg.module_name));
   370	#endif
   371		} else
   372			memset(ctx_msg.module_name, 0, sizeof(ctx_msg.module_name));
   373	
   374		ret = calc_task_context_hash(ctx_msg, hash);
   375		if (ret) {
   376			pr_err("calc_task_context_hash failed\n");
   377			goto end;
   378		}
   379	
   380	end:
   381		return ret;
   382	}
   383	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
