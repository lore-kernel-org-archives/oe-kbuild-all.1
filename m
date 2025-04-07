Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4599C215063
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Apr 2025 17:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744046648; cv=none; b=Jv6Nu16HhQM2xfZYXTMH1A/4REVEJ5ay9g2ijUW7a/IENhrwXrkIfed73/nUcUaZIUA74byZbBKOyouOsu7mQzSe9Tc+ex4fYPuk6QU4AGY8TeVez1fZ7CUgU4lV9n41X/QM/okGSn6TWwqprBkOTwKtO+//4lXjbIpeYtXI/AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744046648; c=relaxed/simple;
	bh=tZvb47P79GQZOoIX6zoBlzP2B5OndCJrDqRKPWkUtI0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kakFKCaqT3YVvitgUQnEI1f4cB2JjB9rSjl3iv48TNHJ41Yy4TIXyVP7qSa5oheeUyOi9wD6sh5L2ure8Ypi8XDr36PcXK3x4YfZ757Ma1dOHd3kJKcfsh8MRoHePolkVGtAJFai5bjpQSmnYzk2Qeirg/EEVdO0/vtTvOrsemI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LCRPHBkY; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LCRPHBkY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744046647; x=1775582647;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tZvb47P79GQZOoIX6zoBlzP2B5OndCJrDqRKPWkUtI0=;
  b=LCRPHBkY6PuPerkUnbK5+F3P2wRBYIiU9qXZ1HhmXI9hWYtE71CZUvZq
   jHEWOi9wXlw4BwHflyOjwMNnVYj2E9ubewzEZw2JuZ8s6Yld/tWNie0S9
   V4bgQjBCM6UOU0YlzmHcDUxj1g7b15faObRx0OO0QOj1J0zwaV3QKyVpC
   wZmL/AJe3fqyFpG1kPfj9ezMbmMxS7u6A+WvpWxnP+JBx6dLMgwJRE6RA
   bMDEPoNZ2kH+HlfbTa7Valh9m6d1MlsnqDN+wdnxQOLFah1tDkZTVZD2U
   LnjaY8+WWjhoN5OtC679cz3OmGmtVByxj/zK1VLI80W3S9liFwDJJhdOc
   A==;
X-CSE-ConnectionGUID: BFLsZWRYS1OF3TaBleSREA==
X-CSE-MsgGUID: jjI9UWORTQegV0hBQRcMPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="48157442"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="48157442"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 10:24:06 -0700
X-CSE-ConnectionGUID: 59Aw+UhPR/Ob4eQzehYN8Q==
X-CSE-MsgGUID: A2KjhwxARZGv39lkDulcig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="159010594"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 Apr 2025 10:24:06 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1qCY-0003e0-2g;
	Mon, 07 Apr 2025 17:24:02 +0000
Date: Tue, 8 Apr 2025 01:23:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jyri Sarha <jyri.sarha@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topology2_sched_domain_support 1/1]
 sound/soc/sof/ipc4-topology.c:510:3: warning: pointer/integer type mismatch
 in conditional expression ('unsigned int' and 'void *')
Message-ID: <202504080147.AExWIzWG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topology2_sched_domain_support
head:   e7f2745320e2fae66eb1e6d7620062d5377b25b9
commit: e7f2745320e2fae66eb1e6d7620062d5377b25b9 [1/1] ASoC: sof: ipc4-topology: Add support to sched_domain attribute
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250408/202504080147.AExWIzWG-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250408/202504080147.AExWIzWG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504080147.AExWIzWG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/sof/ipc4-topology.c:510:3: warning: pointer/integer type mismatch in conditional expression ('unsigned int' and 'void *') [-Wconditional-type-mismatch]
     510 |                 dev_err("Bad domain val %d", swidget->comp_domain);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:154:2: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_index_wrap'
     109 |                 dev_printk_index_emit(level, fmt);                      \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_index_emit'
     105 |         printk_index_subsys_emit("%s %s: ", level, fmt)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:468:2: note: expanded from macro 'printk_index_subsys_emit'
     468 |         __printk_index_emit(fmt, level, subsys_fmt_prefix)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:434:39: note: expanded from macro '__printk_index_emit'
     434 |                                 .fmt = __builtin_constant_p(_fmt) ? (_fmt) : NULL, \
         |                                                                   ^ ~~~~~~   ~~~~
   sound/soc/sof/ipc4-topology.c:510:11: error: incompatible pointer types passing 'char[18]' to parameter of type 'const struct device *' [-Werror,-Wincompatible-pointer-types]
     510 |                 dev_err("Bad domain val %d", swidget->comp_domain);
         |                         ^~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:154:44: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                   ^~~
   include/linux/dev_printk.h:110:11: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   include/linux/dev_printk.h:50:36: note: passing argument to parameter 'dev' here
      50 | void _dev_err(const struct device *dev, const char *fmt, ...);
         |                                    ^
   sound/soc/sof/ipc4-topology.c:510:32: error: incompatible integer to pointer conversion passing 'enum sof_comp_domain' to parameter of type 'const char *' [-Wint-conversion]
     510 |                 dev_err("Bad domain val %d", swidget->comp_domain);
         |                                              ^~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:154:57: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ^~~
   include/linux/dev_printk.h:19:22: note: expanded from macro 'dev_fmt'
      19 | #define dev_fmt(fmt) fmt
         |                      ^~~
   include/linux/dev_printk.h:110:16: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:50:53: note: passing argument to parameter 'fmt' here
      50 | void _dev_err(const struct device *dev, const char *fmt, ...);
         |                                                     ^
   1 warning and 2 errors generated.


vim +510 sound/soc/sof/ipc4-topology.c

   482	
   483	static int sof_ipc4_widget_setup_msg(struct snd_sof_widget *swidget, struct sof_ipc4_msg *msg)
   484	{
   485		struct sof_ipc4_fw_module *fw_module;
   486		uint32_t type;
   487		int ret;
   488	
   489		ret = sof_ipc4_widget_set_module_info(swidget);
   490		if (ret)
   491			return ret;
   492	
   493		fw_module = swidget->module_info;
   494	
   495		msg->primary = fw_module->man4_module_entry.id;
   496		msg->primary |= SOF_IPC4_MSG_TYPE_SET(SOF_IPC4_MOD_INIT_INSTANCE);
   497		msg->primary |= SOF_IPC4_MSG_DIR(SOF_IPC4_MSG_REQUEST);
   498		msg->primary |= SOF_IPC4_MSG_TARGET(SOF_IPC4_MODULE_MSG);
   499	
   500		msg->extension = SOF_IPC4_MOD_EXT_CORE_ID(swidget->core);
   501	
   502		switch (swidget->comp_domain) {
   503		case SOF_COMP_DOMAIN_LL:
   504			type = 0;
   505			break;
   506		case SOF_COMP_DOMAIN_DP:
   507			type = 1;
   508			break;
   509		default:
 > 510			dev_err("Bad domain val %d", swidget->comp_domain);
   511			/* fall through */
   512		case SOF_COMP_DOMAIN_UNSET:
   513			type = (fw_module->man4_module_entry.type & SOF_IPC4_MODULE_DP) ? 1 : 0;
   514			break;
   515		}
   516		msg->extension |= SOF_IPC4_MOD_EXT_DOMAIN(type);
   517	
   518		return 0;
   519	}
   520	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
