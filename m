Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3477E2F30
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Aug 2025 09:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754298839; cv=none; b=Zu/110eSdPcXaQ7+VXgmTuRFCISP8thrV73aLt1L7161/Z5TKmlbFylMJs6chy22ykcfEBA/KxuE8yRH/W5kCh3U2eE+LT+yo6iTbMqjIJuFYggMotVHMBgGyensGLJeZjFYhmQ04uRlCqiCvsq24AlBAUkBcmpuYrXlaakIVMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754298839; c=relaxed/simple;
	bh=vuO1mtHfm3t7NZQhVclM+4/XAGJn4f4ZaJCfFh7m1j0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mq5ISX5qxOAua3Qfeem/mRi45QV1+BHc9zLmCYBQv/TH5kML7OMAh2vKCI2nYlPHdMlI++g0lLft1QPaicFmjOQ0eHFsj/kiAoAUiP15HfGCJh5ED2okQwsd6J2i1ieQcCbbYW49LYKsAhzzrWkiVTNFZR8wg1PtGWnr5waJxyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EIvoTzJZ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EIvoTzJZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754298838; x=1785834838;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vuO1mtHfm3t7NZQhVclM+4/XAGJn4f4ZaJCfFh7m1j0=;
  b=EIvoTzJZEOcYSTwcJaQ46ayX0EO4m4QY3ulHNTGY+t9VUYeetqyYiDfS
   B2lvbXE8KSzRwsBDRKs5g0KKV4zt4IxWvCy9rZ/pjLiF8TSFk3leMrpQR
   w8t4neNhoHXL3hubAVvwuQGNS0OaH/xBZfnHO+uQ/kgge7lziWCe7hAqn
   7leh8oIbs12Le+aZM+mweVIonYgag/UEIAGInamcLXPUw6XTLEGiH9Ee7
   0eqXoqZuNDu/JEMUMno2b5KIluZ+dMUyKUg28ukLhFTStDH9dH6ISCz7I
   rrutjR2w94yalYExVUdaj50nuMpJpLnZuaaryiGjLUb08FI+x9aBq36iJ
   A==;
X-CSE-ConnectionGUID: ojgJ6rwjSwCnUq3wXupnGw==
X-CSE-MsgGUID: fVMoy8tNSuSTgN4rZzBAlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="66831261"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="66831261"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 02:13:57 -0700
X-CSE-ConnectionGUID: hDoZNpDlQwi8hWdJGp/+fQ==
X-CSE-MsgGUID: RoksOvQGR+eiuhmxiTXefw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="169495921"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa005.jf.intel.com with ESMTP; 04 Aug 2025 02:13:55 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uirGT-0001lP-1x;
	Mon, 04 Aug 2025 09:13:53 +0000
Date: Mon, 4 Aug 2025 11:13:20 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2634/2634]
 drivers/crypto/ccp/hygon/tdm-dev.c:340:40: error: incomplete definition of
 type 'struct module'
Message-ID: <202508041105.2ucnSiI7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   2c3b9ec99c8859c2992ed4684c28a503913d5251
commit: a1dd4972da4e66d9a9d1a89b3dfd8f742c20193b [2634/2634] crypto: tdm: Add Hygon TDM driver
config: x86_64-buildonly-randconfig-2004-20250804 (https://download.01.org/0day-ci/archive/20250804/202508041105.2ucnSiI7-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508041105.2ucnSiI7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508041105.2ucnSiI7-lkp@intel.com/

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
