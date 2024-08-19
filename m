Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7D916CD0C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Aug 2024 17:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724088718; cv=none; b=lEUTrpncTaut0HHnvKewfNR3oXuInhPFl4LWGk45IZcZtqw2IEtxNReFSy3+SlJy6XNQJFwTDbUknn7mqu5aNOPfRhJdEoX4imRcRwfO8/T7G7zqKRKakpqAhe9f/rahoDCdxfrViMQ7cR5uB9+BSfUVu/8n0F4gZh9i77G7qPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724088718; c=relaxed/simple;
	bh=EbeaxMLLp1LV4pAwhhk/NowOaGBQR7uoQkA3cRqOGQk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tUW0XJ3e5WAuNT0i0TjqFMSc1LkPydzDQ6S0tNm+QEdNZXfHUuLkM+G1xhXwH5tuoaFNDrRF2dlwnf2Vqv8AqfAIhfdZe7aN0dgh6A/XhS74NKZfP7gl9S4ksQSwqmoxgdOD7O0AEo/YeFSZmV7VOr+icRl00UDvx8UU7xMFXGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Axz+WSJx; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Axz+WSJx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724088716; x=1755624716;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EbeaxMLLp1LV4pAwhhk/NowOaGBQR7uoQkA3cRqOGQk=;
  b=Axz+WSJx0+x8iHgxb31Po2Ej7s7+O/oiqUAFWVGIqbBS/h//lYQFM9WY
   g9/nWQpmDt6R5IUoyBAsIJa9qCiAhHkhADlWBPa1EaQfgkKTt1D7H/KVI
   tt2cKOBSVwE5+e4/4bB0QxiYpITgCKITKs0HcjD6JSPDBeXuqKzu7gnDp
   E+FnUNgMMGocwl4o1GTSCmGqHPH1d+iKobJpO1R+7qg4aEESfYqM9UYZt
   5LrptonlXBQ2MFUZeZzgpTrXm2mj+dgurHPUsglfRp9lhGttk0PKRxY4e
   ve1rLC4BFiAlwd9vVMs++J8ysuWPfLES6vjQSnOFZyYRLTiZIunDfNvLJ
   w==;
X-CSE-ConnectionGUID: iN/Xt1YxRkq4Hh20Ba6V8g==
X-CSE-MsgGUID: y+OD6X/KSR2Jd3GIL5WsjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="32925237"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="32925237"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 10:31:56 -0700
X-CSE-ConnectionGUID: 2xvQjFTuRweYGRAxpDvoug==
X-CSE-MsgGUID: lzcPqEX7SimkTEqpVnm3RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="97921468"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Aug 2024 10:31:53 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sg6ES-0009FO-0N;
	Mon, 19 Aug 2024 17:31:52 +0000
Date: Tue, 20 Aug 2024 01:31:15 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, chench00 <chench@hygon.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 13310/13455]
 drivers/crypto/ccp/hygon/tdm-dev.c:340:61: error: invalid use of undefined
 type 'struct module'
Message-ID: <202408200124.eAjYI7Na-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   063fb5b67877d27a0adebef0dd88bab842d8de07
commit: a1dd4972da4e66d9a9d1a89b3dfd8f742c20193b [13310/13455] crypto: tdm: Add Hygon TDM driver
config: x86_64-buildonly-randconfig-006-20240819 (https://download.01.org/0day-ci/archive/20240820/202408200124.eAjYI7Na-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240820/202408200124.eAjYI7Na-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408200124.eAjYI7Na-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/crypto/ccp/hygon/tdm-dev.c: In function 'list_enqueue':
   drivers/crypto/ccp/hygon/tdm-dev.c:94:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
      94 |         int ret = 0;
         |             ^~~
   drivers/crypto/ccp/hygon/tdm-dev.c: In function 'tdm_get_cmd_context_hash':
>> drivers/crypto/ccp/hygon/tdm-dev.c:340:61: error: invalid use of undefined type 'struct module'
     340 |                         memcpy(ctx_msg.module_name, p_module->name, sizeof(p_module->name));
         |                                                             ^~
   drivers/crypto/ccp/hygon/tdm-dev.c:340:84: error: invalid use of undefined type 'struct module'
     340 |                         memcpy(ctx_msg.module_name, p_module->name, sizeof(p_module->name));
         |                                                                                    ^~
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
