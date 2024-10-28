Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B5F18B03
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Oct 2024 19:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730144485; cv=none; b=FTOAT652qLOzlRcQYiBRFM2drc+TsIx0fCvsi36Op6FzQkiK0AW0qPepj7MUZqaQlVt6YVyuruRT1YGhChq4lXy/9JHaHMUrReaQ3fW6FKXn4oU3v28A3vaj0HVqqsO9qra2r9AT3XjPdBX8DwnDb/gY5ZPeuGqaQ9PoFob4kVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730144485; c=relaxed/simple;
	bh=mlAgS1Xd+5Hzy7xKuMyhOQY3SV2j3vOzai9e4+QMLJM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b2keIv9as1I22+GvIZxNRj0Ga6DVUlLxY006hkISF+wjO5ODUhP+/r9jiKaNPkJrFXEKzzJ28hOTWgs/cdnvk3vdBu0NtbUTQ8RcjGgustJH4ygeg6svSAWr1Hwj74js4N5OnR/exKz21+JIi/NBrFRziljBU3IzTQoPQNXRMAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ebTQfkVN; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ebTQfkVN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730144483; x=1761680483;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mlAgS1Xd+5Hzy7xKuMyhOQY3SV2j3vOzai9e4+QMLJM=;
  b=ebTQfkVN7U+pHruoeL9qEAmS72cUDg0kytYtE4ueVjSoK1UYPCN5F9M7
   2pFIZWl3KNKdU/CbjdbvjI++MCpCiJPRWdlgd4smKf4+bDqyrlO8OXeTz
   al9n65Xyragw8jCbTF5nboFUdFoLGfHRfI09z1IebOT4yiLn+OgBRfCAF
   8VN1RJWQZAvzRMN5mIuBlMAlYe6CtC15yPVKcZFzxEGjothwrodJdIVEu
   lIPXNhn2kwVk8t7bKJ918ExdJg0vUC3S1UuHl6AjzacPJm8wE8RVaRFHC
   D7Wt5QFWvg03xxFMG4C+5oy6uYkeK53Pv+AX3Vao8xG2gjJ0rpDgrujBh
   g==;
X-CSE-ConnectionGUID: Za/nPmmXTuKmENYdTPEY2w==
X-CSE-MsgGUID: pg9qVz2oSgKAIZyIsbMwNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40857016"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40857016"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 12:41:22 -0700
X-CSE-ConnectionGUID: G/9yHliuQjmV8388GIbSSw==
X-CSE-MsgGUID: AxG3CWVkTsmpW9IislDDBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="81778847"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 28 Oct 2024 12:41:20 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5Vc6-000co0-1h;
	Mon, 28 Oct 2024 19:41:18 +0000
Date: Tue, 29 Oct 2024 03:40:31 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, chench00 <chench@hygon.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 13319/15358]
 drivers/crypto/ccp/hygon/tdm-dev.c:340:84: error: invalid use of undefined
 type 'struct module'
Message-ID: <202410290303.9DGdQJBL-lkp@intel.com>
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
head:   27e5d43e49e85d816bd05ffe8672ceea631a07e4
commit: a1dd4972da4e66d9a9d1a89b3dfd8f742c20193b [13319/15358] crypto: tdm: Add Hygon TDM driver
config: x86_64-buildonly-randconfig-001-20241029 (https://download.01.org/0day-ci/archive/20241029/202410290303.9DGdQJBL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410290303.9DGdQJBL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410290303.9DGdQJBL-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/crypto/ccp/hygon/tdm-dev.c: In function 'list_enqueue':
   drivers/crypto/ccp/hygon/tdm-dev.c:94:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
      94 |         int ret = 0;
         |             ^~~
   In file included from include/linux/string.h:294,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from arch/x86/include/asm/cpumask.h:5,
                    from arch/x86/include/asm/msr.h:11,
                    from arch/x86/include/asm/processor.h:23,
                    from arch/x86/include/asm/timex.h:5,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from drivers/crypto/ccp/hygon/tdm-dev.c:11:
   drivers/crypto/ccp/hygon/tdm-dev.c: In function 'tdm_get_cmd_context_hash':
>> drivers/crypto/ccp/hygon/tdm-dev.c:340:84: error: invalid use of undefined type 'struct module'
     340 |                         memcpy(ctx_msg.module_name, p_module->name, sizeof(p_module->name));
         |                                                                                    ^~
   include/linux/fortify-string.h:650:48: note: in definition of macro '__fortify_memcpy_chk'
     650 |         const size_t __fortify_size = (size_t)(size);                   \
         |                                                ^~~~
   drivers/crypto/ccp/hygon/tdm-dev.c:340:25: note: in expansion of macro 'memcpy'
     340 |                         memcpy(ctx_msg.module_name, p_module->name, sizeof(p_module->name));
         |                         ^~~~~~
   drivers/crypto/ccp/hygon/tdm-dev.c:340:61: error: invalid use of undefined type 'struct module'
     340 |                         memcpy(ctx_msg.module_name, p_module->name, sizeof(p_module->name));
         |                                                             ^~
   include/linux/fortify-string.h:652:34: note: in definition of macro '__fortify_memcpy_chk'
     652 |         const size_t __q_size = (q_size);                               \
         |                                  ^~~~~~
   include/linux/fortify-string.h:708:35: note: in expansion of macro '__struct_size'
     708 |                 __struct_size(p), __struct_size(q),                     \
         |                                   ^~~~~~~~~~~~~
   drivers/crypto/ccp/hygon/tdm-dev.c:340:25: note: in expansion of macro 'memcpy'
     340 |                         memcpy(ctx_msg.module_name, p_module->name, sizeof(p_module->name));
         |                         ^~~~~~
   drivers/crypto/ccp/hygon/tdm-dev.c:340:61: error: invalid use of undefined type 'struct module'
     340 |                         memcpy(ctx_msg.module_name, p_module->name, sizeof(p_module->name));
         |                                                             ^~
   include/linux/fortify-string.h:654:40: note: in definition of macro '__fortify_memcpy_chk'
     654 |         const size_t __q_size_field = (q_size_field);                   \
         |                                        ^~~~~~~~~~~~
   include/linux/fortify-string.h:709:35: note: in expansion of macro '__member_size'
     709 |                 __member_size(p), __member_size(q),                     \
         |                                   ^~~~~~~~~~~~~
   drivers/crypto/ccp/hygon/tdm-dev.c:340:25: note: in expansion of macro 'memcpy'
     340 |                         memcpy(ctx_msg.module_name, p_module->name, sizeof(p_module->name));
         |                         ^~~~~~
   drivers/crypto/ccp/hygon/tdm-dev.c:340:61: error: invalid use of undefined type 'struct module'
     340 |                         memcpy(ctx_msg.module_name, p_module->name, sizeof(p_module->name));
         |                                                             ^~
   include/linux/fortify-string.h:662:30: note: in definition of macro '__fortify_memcpy_chk'
     662 |         __underlying_##op(p, q, __fortify_size);                        \
         |                              ^
   drivers/crypto/ccp/hygon/tdm-dev.c:340:25: note: in expansion of macro 'memcpy'
     340 |                         memcpy(ctx_msg.module_name, p_module->name, sizeof(p_module->name));
         |                         ^~~~~~
   drivers/crypto/ccp/hygon/tdm-dev.c: In function 'psp_create_measure_task':
   drivers/crypto/ccp/hygon/tdm-dev.c:606:27: warning: variable 'head' set but not used [-Wunused-but-set-variable]
     606 |         struct list_head *head = NULL;
         |                           ^~~~


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
