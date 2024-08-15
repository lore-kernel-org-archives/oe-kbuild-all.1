Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3046B154BEA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Aug 2024 22:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723762592; cv=none; b=gQH6TIVDGMXIPRzpS0cFX/XG8ksbYW7PtuVOQJLnmI1nFUiRSSac8wuzLyHNatkda7WA6ko0yC+LqfTqJrOmEz/fZq/qXWBqARUlEd4/JDUbnJ8ngVZWmHtMayMPkGcCdor/YWF/ZZLQJAkb897eADWoZJ/xoDF6VjHg0RmisP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723762592; c=relaxed/simple;
	bh=4PSaV+c6U3WetwFOUQ7dehD+LeTit1Cq6DrwxUtQ0vk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ovqG9McZBivmaaNEtUEoPua21SYQSrtcklmDlkO66eLyxYIDDyR4q7nr05UP3gDpq/euE3FQiDb7A4qpCXhdLSM/j+nmrX+O7TrS4t2tJFL8CCPOfrzljtVuD+CYHZkZ1/OECeOuX4FvGHt7jUOGz7scjSvo6fG0b/pnTJF2Xlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PcqfVyO0; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PcqfVyO0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723762590; x=1755298590;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4PSaV+c6U3WetwFOUQ7dehD+LeTit1Cq6DrwxUtQ0vk=;
  b=PcqfVyO0YfsPhoVVmwIwuIuRkdVHwQeRuBYnfNuoDAWJEQXmqjITr6B1
   kPdMcLPDBy70f/CYivctFR+SIS0yOncUIOaUPLoHOPjR+g8WImHEFKF6x
   mj41H3t3nWJZeOFwiw8B6lrxEmlv09tSm6AfM+cNEXLsDk0GA2xSPcpOU
   DKwqUzeCb7ke6qQBDwY8nmtXyFxuambYhTC24l+LTE6OnU9brYo/00RDL
   tpZ2THpRlbuei55c9nL6A/LqnMMRshVwwbIzOb4AAXq8sZa9/JSw2iCEQ
   bmDBDJbS53h1DlmdVnofn2jrwBT1KGI4uIxpL589nGHvWbVlLZVcqlIr3
   Q==;
X-CSE-ConnectionGUID: 4JGDIY0mQS+HGzx99aZD1Q==
X-CSE-MsgGUID: UH4pbrG6S8exlRJY1FHrBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="32718280"
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; 
   d="scan'208";a="32718280"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2024 15:56:29 -0700
X-CSE-ConnectionGUID: HPAJiqVGRkGIcWk8nA0nQg==
X-CSE-MsgGUID: 9dLPrr8uTl62ejb2SSzoeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; 
   d="scan'208";a="90275310"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 Aug 2024 15:56:28 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sejOM-0005hS-0J;
	Thu, 15 Aug 2024 22:56:26 +0000
Date: Fri, 16 Aug 2024 06:55:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, chench00 <chench@hygon.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 13292/13430]
 drivers/crypto/ccp/hygon/tdm-dev.c:340:40: error: incomplete definition of
 type 'struct module'
Message-ID: <202408160647.XUdenjS0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   130fc493d13fa24dba99b7116f0f995fe2d1465b
commit: a1dd4972da4e66d9a9d1a89b3dfd8f742c20193b [13292/13430] crypto: tdm: Add Hygon TDM driver
config: x86_64-buildonly-randconfig-001-20240816 (https://download.01.org/0day-ci/archive/20240816/202408160647.XUdenjS0-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240816/202408160647.XUdenjS0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408160647.XUdenjS0-lkp@intel.com/

All errors (new ones prefixed by >>):

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
   2 warnings and 2 errors generated.


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
