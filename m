Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29821C7B6A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Oct 2024 04:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728622500; cv=none; b=lfamuvG27XtoyWlJ0TFA01bPdxHpgYlJPhyKuN9gccuGCmMKXgFx/qLLFZkFiVw0PGz3wRQsoJM3JcRZ6WtvgjuUkDkvgh8tSVTk8XxKTpXbPn53uCpTlJg5HfqEcaxWEXmPZvMlM1c2xA+SLNwTqVYXoYh1YTryb4VTEG/8+7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728622500; c=relaxed/simple;
	bh=ctM6S9WmsfMPKXUNokW2BeLVsRw06gX4Z4aqoOoS3T4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KGrFnBYqgWGaQMvJMVsmRE9isdp65tUli82CXF25Y3/9wnokpt2J89TNLGta7nNngPWMda3I96VunBY5uAplhBxx6cLgs+MHaFQQN7n9GmzTDGlgVhHsSmS97qLKBTK2omtsoTsE18Ww4/xXyjLTSIXULGUl5BGbDoHFFA6xbuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jolUWnXs; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jolUWnXs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728622497; x=1760158497;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ctM6S9WmsfMPKXUNokW2BeLVsRw06gX4Z4aqoOoS3T4=;
  b=jolUWnXscSwI6ywieyIVIFCZYKDvCh/OJtyX/1zfqyUE0VV4fKnjIi4k
   LeKClm4XS+ITWjMBXagYtsCFzr7Y4wIf2sIKH6OcTkLSEd/L4S6vhGAyl
   LoBQ8CAKc8E099paVH9mh9FQLvzuWxozmF2RtGkUY79xfZg5VYOEc4ipM
   8qBNTilsNmt1McTZSGcg4RPYFRZgwmlw0BufpwFoNTTpJ68OpR5CRKH3o
   HgVso8/BVfwmaLdtf6rvUHNg6fOdDjbVF/gJCeT/SGX/gh9USyaEmnjzK
   Esdd+h72O072+2KdLE1pcZosCxqQ1Y6yUSmq0F2MXyXsX+gd+kH8STcsL
   A==;
X-CSE-ConnectionGUID: ES0wP5HmTaOnpJMg4fTVcw==
X-CSE-MsgGUID: 0p/D5TOGQKGjCqqLmDdiTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="39141710"
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="39141710"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 21:54:57 -0700
X-CSE-ConnectionGUID: C4PyD3t9QU69QTTXoQoaFA==
X-CSE-MsgGUID: JraFvWlbRaWWuAKVpf3o8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="80809222"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Oct 2024 21:54:56 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sz7fx-000BpW-2C;
	Fri, 11 Oct 2024 04:54:53 +0000
Date: Fri, 11 Oct 2024 12:54:31 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, chench00 <chench@hygon.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 13318/14350]
 drivers/crypto/ccp/hygon/tdm-dev.c:340:63: error: incomplete definition of
 type 'struct module'
Message-ID: <202410111205.LRqw3beL-lkp@intel.com>
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
head:   f7c1291d7c3f15bc448cd93e29fa539386fe85fe
commit: a1dd4972da4e66d9a9d1a89b3dfd8f742c20193b [13318/14350] crypto: tdm: Add Hygon TDM driver
config: x86_64-buildonly-randconfig-003-20241011 (https://download.01.org/0day-ci/archive/20241011/202410111205.LRqw3beL-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241011/202410111205.LRqw3beL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410111205.LRqw3beL-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/crypto/ccp/hygon/tdm-dev.c:94:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
      94 |         int ret = 0;
         |             ^
>> drivers/crypto/ccp/hygon/tdm-dev.c:340:63: error: incomplete definition of type 'struct module'
     340 |                         memcpy(ctx_msg.module_name, p_module->name, sizeof(p_module->name));
         |                                                                            ~~~~~~~~^
   include/linux/fortify-string.h:707:53: note: expanded from macro 'memcpy'
     707 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
         |                                                     ^
   include/linux/fortify-string.h:650:41: note: expanded from macro '__fortify_memcpy_chk'
     650 |         const size_t __fortify_size = (size_t)(size);                   \
         |                                                ^~~~
   arch/x86/include/asm/alternative.h:103:8: note: forward declaration of 'struct module'
     103 | struct module;
         |        ^
   drivers/crypto/ccp/hygon/tdm-dev.c:340:40: error: incomplete definition of type 'struct module'
     340 |                         memcpy(ctx_msg.module_name, p_module->name, sizeof(p_module->name));
         |                                                     ~~~~~~~~^
   include/linux/fortify-string.h:708:35: note: expanded from macro 'memcpy'
     708 |                 __struct_size(p), __struct_size(q),                     \
         |                                                 ^
   include/linux/fortify-string.h:110:56: note: expanded from macro '__struct_size'
     110 | #define __struct_size(p)        __builtin_dynamic_object_size(p, 0)
         |                                                               ^
   include/linux/fortify-string.h:652:27: note: expanded from macro '__fortify_memcpy_chk'
     652 |         const size_t __q_size = (q_size);                               \
         |                                  ^~~~~~
   arch/x86/include/asm/alternative.h:103:8: note: forward declaration of 'struct module'
     103 | struct module;
         |        ^
   drivers/crypto/ccp/hygon/tdm-dev.c:340:40: error: incomplete definition of type 'struct module'
     340 |                         memcpy(ctx_msg.module_name, p_module->name, sizeof(p_module->name));
         |                                                     ~~~~~~~~^
   include/linux/fortify-string.h:709:35: note: expanded from macro 'memcpy'
     709 |                 __member_size(p), __member_size(q),                     \
         |                                                 ^
   include/linux/fortify-string.h:111:56: note: expanded from macro '__member_size'
     111 | #define __member_size(p)        __builtin_dynamic_object_size(p, 1)
         |                                                               ^
   include/linux/fortify-string.h:654:33: note: expanded from macro '__fortify_memcpy_chk'
     654 |         const size_t __q_size_field = (q_size_field);                   \
         |                                        ^~~~~~~~~~~~
   arch/x86/include/asm/alternative.h:103:8: note: forward declaration of 'struct module'
     103 | struct module;
         |        ^
   drivers/crypto/ccp/hygon/tdm-dev.c:340:40: error: incomplete definition of type 'struct module'
     340 |                         memcpy(ctx_msg.module_name, p_module->name, sizeof(p_module->name));
         |                                                     ~~~~~~~~^
   include/linux/fortify-string.h:707:50: note: expanded from macro 'memcpy'
     707 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
         |                                                  ^
   include/linux/fortify-string.h:662:23: note: expanded from macro '__fortify_memcpy_chk'
     662 |         __underlying_##op(p, q, __fortify_size);                        \
         |                              ^
   arch/x86/include/asm/alternative.h:103:8: note: forward declaration of 'struct module'
     103 | struct module;
         |        ^
   drivers/crypto/ccp/hygon/tdm-dev.c:606:20: warning: variable 'head' set but not used [-Wunused-but-set-variable]
     606 |         struct list_head *head = NULL;
         |                           ^
   2 warnings and 4 errors generated.


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
