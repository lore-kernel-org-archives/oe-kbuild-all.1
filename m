Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A57A1FF7DD
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Apr 2025 15:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744039856; cv=none; b=PAO6qMyAX/7SI9m53DwhO2Iy//2QYhczC9d3vngR0oZAS38CM6TLLQGuj/aKbTjc/2eP7AcPYGF8AVi79GulDVuKwpBsB/KVHg1vC3EEv20OnnG2TddPURX1Z7CRs8ZaOLLOjDlnanS8BqAJ5DXGC8oDCC69awWZvkIX+Bn8MAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744039856; c=relaxed/simple;
	bh=rW2AWBgNg40ft5cy0C356YAsV5byNyjkeJ4SxvBLXu0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W2O/VmmZoHQvLvVqhfxwYzdrdCKYhc4w9uLgakuPndlUVfeQe0Ml2r99ZMtsndsZliNrhiw6uLhR9fWC+onsUlU5cKMHUGPOFqYPZ5qhnWuWqMbif53WLlmzZLLz0wGHCWMBtoPfTYGhGHc6g+ybe3Y5r1Ze1fgpRySmhtalq1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C2uG9e8p; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C2uG9e8p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744039854; x=1775575854;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rW2AWBgNg40ft5cy0C356YAsV5byNyjkeJ4SxvBLXu0=;
  b=C2uG9e8ptRV1ySlxjEvBPLs/PaIF/x4Omadzg66pS9ZL72oUzdTCUf47
   khWOayyTD64d2Vv5w61nBl3V09F+ToZaVUR7DOaLKhelLxMT8wi42R0mD
   VAQ36zANpAubCd+Yczxe9E/PcDAaE1VAuua7IxfwMLOdiJNWqy9Tbs5Vl
   oyIjylH+HkQdXdjoVgu0s/CAuxeB8JALGlKJYJs+B8xyyxcGM8dKUZXZu
   PwvbmeV8QZFQxDUqS0KMc7tSpLj3PnFsVp1DFkNBOHvmGTu3nfqrK8F1K
   qJ0CIW3KFz0cgrSwUyRmnUmieeZJsq/xkE9OfbDn5DM+5qAKuh8klT2J5
   w==;
X-CSE-ConnectionGUID: ThusiOFkRKW5SqDIlq2Mag==
X-CSE-MsgGUID: D8OHUi0ERMmdPCbFMLyYog==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="62980303"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="62980303"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 08:30:53 -0700
X-CSE-ConnectionGUID: pATk8rjBRuSe96XjEgM0NQ==
X-CSE-MsgGUID: i7QGkcnrTnuXZNJFfYEHkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="127869355"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 Apr 2025 08:30:53 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1oR0-0003Wm-0o;
	Mon, 07 Apr 2025 15:30:50 +0000
Date: Mon, 7 Apr 2025 23:30:32 +0800
From: kernel test robot <lkp@intel.com>
To: Jyri Sarha <jyri.sarha@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topology2_sched_domain_support 1/1]
 sound/soc/sof/ipc4-topology.c:510:25: error: passing argument 1 of
 '_dev_err' from incompatible pointer type
Message-ID: <202504072346.VVJCxKS3-lkp@intel.com>
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
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250407/202504072346.VVJCxKS3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250407/202504072346.VVJCxKS3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504072346.VVJCxKS3-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:99,
                    from include/linux/bug.h:5,
                    from include/linux/fortify-string.h:6,
                    from include/linux/string.h:392,
                    from arch/x86/include/asm/page_32.h:18,
                    from arch/x86/include/asm/page.h:14,
                    from arch/x86/include/asm/processor.h:20,
                    from arch/x86/include/asm/timex.h:5,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/sound/asound.h:11,
                    from include/sound/pcm.h:11,
                    from include/sound/pcm_params.h:10,
                    from sound/soc/sof/ipc4-topology.c:12:
   sound/soc/sof/ipc4-topology.c: In function 'sof_ipc4_widget_setup_msg':
>> include/linux/printk.h:434:76: warning: pointer/integer type mismatch in conditional expression
     434 |                                 .fmt = __builtin_constant_p(_fmt) ? (_fmt) : NULL, \
         |                                                                            ^
   include/linux/printk.h:468:9: note: in expansion of macro '__printk_index_emit'
     468 |         __printk_index_emit(fmt, level, subsys_fmt_prefix)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:105:9: note: in expansion of macro 'printk_index_subsys_emit'
     105 |         printk_index_subsys_emit("%s %s: ", level, fmt)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:109:17: note: in expansion of macro 'dev_printk_index_emit'
     109 |                 dev_printk_index_emit(level, fmt);                      \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:154:9: note: in expansion of macro 'dev_printk_index_wrap'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/sof/ipc4-topology.c:510:17: note: in expansion of macro 'dev_err'
     510 |                 dev_err("Bad domain val %d", swidget->comp_domain);
         |                 ^~~~~~~
   In file included from include/linux/device.h:15,
                    from include/linux/pm_qos.h:17,
                    from include/sound/pcm.h:17:
>> sound/soc/sof/ipc4-topology.c:510:25: error: passing argument 1 of '_dev_err' from incompatible pointer type [-Werror=incompatible-pointer-types]
     510 |                 dev_err("Bad domain val %d", swidget->comp_domain);
         |                         ^~~~~~~~~~~~~~~~~~~
         |                         |
         |                         char *
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   sound/soc/sof/ipc4-topology.c:510:17: note: in expansion of macro 'dev_err'
     510 |                 dev_err("Bad domain val %d", swidget->comp_domain);
         |                 ^~~~~~~
   include/linux/dev_printk.h:50:36: note: expected 'const struct device *' but argument is of type 'char *'
      50 | void _dev_err(const struct device *dev, const char *fmt, ...);
         |               ~~~~~~~~~~~~~~~~~~~~~^~~
>> sound/soc/sof/ipc4-topology.c:510:53: error: incompatible type for argument 2 of '_dev_err'
     510 |                 dev_err("Bad domain val %d", swidget->comp_domain);
         |                                              ~~~~~~~^~~~~~~~~~~~~
         |                                                     |
         |                                                     enum sof_comp_domain
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   sound/soc/sof/ipc4-topology.c:510:17: note: in expansion of macro 'dev_err'
     510 |                 dev_err("Bad domain val %d", swidget->comp_domain);
         |                 ^~~~~~~
   include/linux/dev_printk.h:50:53: note: expected 'const char *' but argument is of type 'enum sof_comp_domain'
      50 | void _dev_err(const struct device *dev, const char *fmt, ...);
         |                                         ~~~~~~~~~~~~^~~
   cc1: some warnings being treated as errors
--
   In file included from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:99,
                    from include/linux/bug.h:5,
                    from include/linux/fortify-string.h:6,
                    from include/linux/string.h:392,
                    from arch/x86/include/asm/page_32.h:18,
                    from arch/x86/include/asm/page.h:14,
                    from arch/x86/include/asm/processor.h:20,
                    from arch/x86/include/asm/timex.h:5,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/sound/asound.h:11,
                    from include/sound/pcm.h:11,
                    from include/sound/pcm_params.h:10,
                    from ipc4-topology.c:12:
   ipc4-topology.c: In function 'sof_ipc4_widget_setup_msg':
>> include/linux/printk.h:434:76: warning: pointer/integer type mismatch in conditional expression
     434 |                                 .fmt = __builtin_constant_p(_fmt) ? (_fmt) : NULL, \
         |                                                                            ^
   include/linux/printk.h:468:9: note: in expansion of macro '__printk_index_emit'
     468 |         __printk_index_emit(fmt, level, subsys_fmt_prefix)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:105:9: note: in expansion of macro 'printk_index_subsys_emit'
     105 |         printk_index_subsys_emit("%s %s: ", level, fmt)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:109:17: note: in expansion of macro 'dev_printk_index_emit'
     109 |                 dev_printk_index_emit(level, fmt);                      \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:154:9: note: in expansion of macro 'dev_printk_index_wrap'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~
   ipc4-topology.c:510:17: note: in expansion of macro 'dev_err'
     510 |                 dev_err("Bad domain val %d", swidget->comp_domain);
         |                 ^~~~~~~
   In file included from include/linux/device.h:15,
                    from include/linux/pm_qos.h:17,
                    from include/sound/pcm.h:17:
   ipc4-topology.c:510:25: error: passing argument 1 of '_dev_err' from incompatible pointer type [-Werror=incompatible-pointer-types]
     510 |                 dev_err("Bad domain val %d", swidget->comp_domain);
         |                         ^~~~~~~~~~~~~~~~~~~
         |                         |
         |                         char *
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   ipc4-topology.c:510:17: note: in expansion of macro 'dev_err'
     510 |                 dev_err("Bad domain val %d", swidget->comp_domain);
         |                 ^~~~~~~
   include/linux/dev_printk.h:50:36: note: expected 'const struct device *' but argument is of type 'char *'
      50 | void _dev_err(const struct device *dev, const char *fmt, ...);
         |               ~~~~~~~~~~~~~~~~~~~~~^~~
   ipc4-topology.c:510:53: error: incompatible type for argument 2 of '_dev_err'
     510 |                 dev_err("Bad domain val %d", swidget->comp_domain);
         |                                              ~~~~~~~^~~~~~~~~~~~~
         |                                                     |
         |                                                     enum sof_comp_domain
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   ipc4-topology.c:510:17: note: in expansion of macro 'dev_err'
     510 |                 dev_err("Bad domain val %d", swidget->comp_domain);
         |                 ^~~~~~~
   include/linux/dev_printk.h:50:53: note: expected 'const char *' but argument is of type 'enum sof_comp_domain'
      50 | void _dev_err(const struct device *dev, const char *fmt, ...);
         |                                         ~~~~~~~~~~~~^~~
   cc1: some warnings being treated as errors


vim +/_dev_err +510 sound/soc/sof/ipc4-topology.c

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
