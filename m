Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5454D199BC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Feb 2025 20:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739737975; cv=none; b=GQTEBNm+iBnHKbeF4A4nuYW1zT2lJ0ks8B3LVMNZMPV0YEv916qRJpVzjAlJj0W4ADlMjuBp+ICYOt7wmWF27ank6AmvGuSJsc0YUWJLlncPbYnsHJiBxpuQGDAj1WcFKmwt9Zr1G6STRX55WVxLhh23KJ21anaQ9VMEyYr6KPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739737975; c=relaxed/simple;
	bh=ORKgAmO847zH4Q/LDEfW2/mlYrR87DBGeGmREkVO0yE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eDtCS3Hrla2VuV+FFvk11p590vHCt1SLBi4Y+EC/AwQb4LDHfEmaYVIMJbYalDsr/68b74U5bg9qomv1V6CG8MRENDO5e6MdUnVY7XTjez64Er1ePG3QiEZKYYsvVkXmLCH58fppkDVAsObWWvmpN9oGUq9xb2grxbU0S78283w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LJgyBEYJ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LJgyBEYJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739737971; x=1771273971;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ORKgAmO847zH4Q/LDEfW2/mlYrR87DBGeGmREkVO0yE=;
  b=LJgyBEYJcM+QiI/ndvZYl3FhsngDnzPWRv2hv0ke162vhcqlebx2pGsY
   jodTQuZaVfup7KCMBxPhgGELypn/I9FjGKw5u6UtRuqW7GkL7zZAyyPz4
   a17J93TXuI+/jTk/ZJtoRxMpT1cRn5YUma9PdUCiVFu5G4bS+r6/44jbN
   lS3E4I649pEcg1empwiFePmO1TpSC5amIHTwbru9kARXkYedhJXfz7lBz
   bUAr/j0VsOS9kRpSGxA4Qghzuh0yacnqP8UUQMdRXunzI6yvXwfG0etw0
   HbteUtxSsKSYGxHrhlApu3fe+NN8Y3fwqDMv80qMQlZwA5T1psXqxwF+P
   g==;
X-CSE-ConnectionGUID: W0IgySx+TXG1uINuLySN/Q==
X-CSE-MsgGUID: 85bMC94WTcGG9WdSgwZ4Dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="40558042"
X-IronPort-AV: E=Sophos;i="6.13,291,1732608000"; 
   d="scan'208";a="40558042"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 12:32:50 -0800
X-CSE-ConnectionGUID: 4vX56zryQryH225AWWsdGQ==
X-CSE-MsgGUID: 120iSaoqQW2uRNQcKLN9Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="144863571"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Feb 2025 12:32:49 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjlJm-001CCJ-2U;
	Sun, 16 Feb 2025 20:32:46 +0000
Date: Mon, 17 Feb 2025 04:32:14 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2025-02-12 35/37] sound/soc/soc-pcm.c:390:1:
 error: parameter '__UNIQUE_ID___addressable_snd_soc_runtime_action292' is
 initialized
Message-ID: <202502170404.UCmx1KyF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-cleanup-2025-02-12
head:   f285c73d410451a679fa6e71b155e2cda3a7102f
commit: d7fdbbd2af104c76fa8b3a087b25b963c32f3fe6 [35/37] ASoC: soc-pcm: reuse dpcm_state_string()
config: arm-tegra_defconfig (https://download.01.org/0day-ci/archive/20250217/202502170404.UCmx1KyF-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250217/202502170404.UCmx1KyF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502170404.UCmx1KyF-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/soc-pcm.c: In function 'dpcm_state_string':
   sound/soc/soc-pcm.c:322:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     322 | {
         | ^
   sound/soc/soc-pcm.c:326:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     326 | {
         | ^
   sound/soc/soc-pcm.c:335:12: error: storage class specified for parameter 'dpcm_fe_dai_do_trigger'
     335 | static int dpcm_fe_dai_do_trigger(struct snd_pcm_substream *substream, int cmd);
         |            ^~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:338:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     338 | {
         | ^
   sound/soc/soc-pcm.c:354:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     354 | {
         | ^
   sound/soc/soc-pcm.c:373:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     373 | {
         | ^
   In file included from include/linux/linkage.h:7,
                    from include/linux/kernel.h:18,
                    from sound/soc/soc-pcm.c:13:
   sound/soc/soc-pcm.c:390:19: error: storage class specified for parameter 'snd_soc_runtime_action'
     390 | EXPORT_SYMBOL_GPL(snd_soc_runtime_action);
         |                   ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:70:28: note: in definition of macro '__EXPORT_SYMBOL'
      70 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:84:41: note: in expansion of macro '_EXPORT_SYMBOL'
      84 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:390:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     390 | EXPORT_SYMBOL_GPL(snd_soc_runtime_action);
         | ^~~~~~~~~~~~~~~~~
   In file included from <command-line>:
>> include/linux/compiler.h:166:45: error: storage class specified for parameter '__UNIQUE_ID___addressable_snd_soc_runtime_action292'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:83:23: note: in definition of macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/compiler.h:166:29: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:166:37: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/compiler.h:221:9: note: in expansion of macro '__UNIQUE_ID'
     221 |         __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)(uintptr_t)&sym;
         |         ^~~~~~~~~~~
   include/linux/compiler.h:224:9: note: in expansion of macro '___ADDRESSABLE'
     224 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/export.h:71:9: note: in expansion of macro '__ADDRESSABLE'
      71 |         __ADDRESSABLE(sym)                                      \
         |         ^~~~~~~~~~~~~
   include/linux/export.h:80:41: note: in expansion of macro '__EXPORT_SYMBOL'
      80 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:84:41: note: in expansion of macro '_EXPORT_SYMBOL'
      84 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:390:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     390 | EXPORT_SYMBOL_GPL(snd_soc_runtime_action);
         | ^~~~~~~~~~~~~~~~~
>> sound/soc/soc-pcm.c:390:1: error: parameter '__UNIQUE_ID___addressable_snd_soc_runtime_action292' is initialized
   sound/soc/soc-pcm.c:390:1: warning: 'used' attribute ignored [-Wattributes]
>> include/linux/compiler.h:166:45: error: section attribute not allowed for '__UNIQUE_ID___addressable_snd_soc_runtime_action292'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:83:23: note: in definition of macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/compiler.h:166:29: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:166:37: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/compiler.h:221:9: note: in expansion of macro '__UNIQUE_ID'
     221 |         __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)(uintptr_t)&sym;
         |         ^~~~~~~~~~~
   include/linux/compiler.h:224:9: note: in expansion of macro '___ADDRESSABLE'
     224 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/export.h:71:9: note: in expansion of macro '__ADDRESSABLE'
      71 |         __ADDRESSABLE(sym)                                      \
         |         ^~~~~~~~~~~~~
   include/linux/export.h:80:41: note: in expansion of macro '__EXPORT_SYMBOL'
      80 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:84:41: note: in expansion of macro '_EXPORT_SYMBOL'
      84 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:390:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     390 | EXPORT_SYMBOL_GPL(snd_soc_runtime_action);
         | ^~~~~~~~~~~~~~~~~
   include/linux/export.h:73:9: error: expected declaration specifiers before 'asm'
      73 |         asm(__stringify(___EXPORT_SYMBOL(sym, license, ns)))
         |         ^~~
   include/linux/export.h:80:41: note: in expansion of macro '__EXPORT_SYMBOL'
      80 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:84:41: note: in expansion of macro '_EXPORT_SYMBOL'
      84 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:390:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     390 | EXPORT_SYMBOL_GPL(snd_soc_runtime_action);
         | ^~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:402:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     402 | {
         | ^
   sound/soc/soc-pcm.c:419:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     419 | {
         | ^
   sound/soc/soc-pcm.c:443:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     443 | {
         | ^
   sound/soc/soc-pcm.c:457:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     457 | {
         | ^
   sound/soc/soc-pcm.c:487:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     487 | {
         | ^
   sound/soc/soc-pcm.c:521:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     521 | {
         | ^
   sound/soc/soc-pcm.c:542:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     542 | {
         | ^
   sound/soc/soc-pcm.c:556:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     556 | {
         | ^
   sound/soc/soc-pcm.c:589:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     589 | {
         | ^
   sound/soc/soc-pcm.c:600:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     600 | {
         | ^
   sound/soc/soc-pcm.c:613:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     613 | {
         | ^
   sound/soc/soc-pcm.c:620:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     620 | {
         | ^
   sound/soc/soc-pcm.c:636:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     636 | {
         | ^
   sound/soc/soc-pcm.c:702:19: error: storage class specified for parameter 'snd_soc_runtime_calc_hw'
     702 | EXPORT_SYMBOL_GPL(snd_soc_runtime_calc_hw);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:70:28: note: in definition of macro '__EXPORT_SYMBOL'
      70 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:84:41: note: in expansion of macro '_EXPORT_SYMBOL'
      84 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:702:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     702 | EXPORT_SYMBOL_GPL(snd_soc_runtime_calc_hw);
         | ^~~~~~~~~~~~~~~~~
>> include/linux/compiler.h:166:45: error: storage class specified for parameter '__UNIQUE_ID___addressable_snd_soc_runtime_calc_hw311'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:83:23: note: in definition of macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/compiler.h:166:29: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:166:37: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/compiler.h:221:9: note: in expansion of macro '__UNIQUE_ID'
     221 |         __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)(uintptr_t)&sym;
         |         ^~~~~~~~~~~
   include/linux/compiler.h:224:9: note: in expansion of macro '___ADDRESSABLE'
     224 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/export.h:71:9: note: in expansion of macro '__ADDRESSABLE'
      71 |         __ADDRESSABLE(sym)                                      \
         |         ^~~~~~~~~~~~~
   include/linux/export.h:80:41: note: in expansion of macro '__EXPORT_SYMBOL'
      80 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:84:41: note: in expansion of macro '_EXPORT_SYMBOL'
      84 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:702:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     702 | EXPORT_SYMBOL_GPL(snd_soc_runtime_calc_hw);
         | ^~~~~~~~~~~~~~~~~
>> sound/soc/soc-pcm.c:702:1: error: parameter '__UNIQUE_ID___addressable_snd_soc_runtime_calc_hw311' is initialized
   sound/soc/soc-pcm.c:702:1: warning: 'used' attribute ignored [-Wattributes]
>> include/linux/compiler.h:166:45: error: section attribute not allowed for '__UNIQUE_ID___addressable_snd_soc_runtime_calc_hw311'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:83:23: note: in definition of macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/compiler.h:166:29: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:166:37: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/compiler.h:221:9: note: in expansion of macro '__UNIQUE_ID'
     221 |         __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)(uintptr_t)&sym;
         |         ^~~~~~~~~~~
   include/linux/compiler.h:224:9: note: in expansion of macro '___ADDRESSABLE'
     224 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/export.h:71:9: note: in expansion of macro '__ADDRESSABLE'
      71 |         __ADDRESSABLE(sym)                                      \
         |         ^~~~~~~~~~~~~
   include/linux/export.h:80:41: note: in expansion of macro '__EXPORT_SYMBOL'
      80 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:84:41: note: in expansion of macro '_EXPORT_SYMBOL'
      84 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:702:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     702 | EXPORT_SYMBOL_GPL(snd_soc_runtime_calc_hw);
         | ^~~~~~~~~~~~~~~~~
   include/linux/export.h:73:9: error: expected declaration specifiers before 'asm'
      73 |         asm(__stringify(___EXPORT_SYMBOL(sym, license, ns)))
         |         ^~~
   include/linux/export.h:80:41: note: in expansion of macro '__EXPORT_SYMBOL'
      80 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:84:41: note: in expansion of macro '_EXPORT_SYMBOL'
      84 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:702:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     702 | EXPORT_SYMBOL_GPL(snd_soc_runtime_calc_hw);
         | ^~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:705:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     705 | {
         | ^
   sound/soc/soc-pcm.c:722:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     722 | {
         | ^
   sound/soc/soc-pcm.c:742:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     742 | {
         | ^
   sound/soc/soc-pcm.c:760:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     760 | {
         | ^
   sound/soc/soc-pcm.c:800:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     800 | {
         | ^
   sound/soc/soc-pcm.c:806:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     806 | {
         | ^
   sound/soc/soc-pcm.c:816:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     816 | {
         | ^
   sound/soc/soc-pcm.c:859:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     859 | {
         | ^
   sound/soc/soc-pcm.c:921:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     921 | {
         | ^
   sound/soc/soc-pcm.c:938:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     938 | {
         | ^
   sound/soc/soc-pcm.c:983:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     983 | {
         | ^
   sound/soc/soc-pcm.c:1002:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1002 | {
         | ^
   sound/soc/soc-pcm.c:1013:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1013 | {
         | ^
   sound/soc/soc-pcm.c:1052:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1052 | {
         | ^
   sound/soc/soc-pcm.c:1058:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1058 | {
         | ^
   sound/soc/soc-pcm.c:1075:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1075 | {
         | ^
   sound/soc/soc-pcm.c:1177:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1177 | {
         | ^
   sound/soc/soc-pcm.c:1188:21: error: storage class specified for parameter 'trigger'
    1188 | static int (* const trigger[][TRIGGER_MAX])(struct snd_pcm_substream *substream, int cmd, int rollback) = {
         |                     ^~~~~~~
   sound/soc/soc-pcm.c:1188:52: error: parameter 'trigger' is initialized
    1188 | static int (* const trigger[][TRIGGER_MAX])(struct snd_pcm_substream *substream, int cmd, int rollback) = {
         |                                                    ^~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:1188:107: error: variable-sized object may not be initialized except with an empty initializer
    1188 | static int (* const trigger[][TRIGGER_MAX])(struct snd_pcm_substream *substream, int cmd, int rollback) = {
         |                                                                                                           ^
   sound/soc/soc-pcm.c:1189:10: error: array index in non-array initializer
    1189 |         [SND_SOC_TRIGGER_ORDER_DEFAULT] = {
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:1189:10: note: (near initialization for 'trigger')
   sound/soc/soc-pcm.c:1189:9: warning: braces around scalar initializer
    1189 |         [SND_SOC_TRIGGER_ORDER_DEFAULT] = {
         |         ^
   sound/soc/soc-pcm.c:1189:9: note: (near initialization for 'trigger')
   sound/soc/soc-pcm.c:1190:17: error: initialization of 'int (* const (*)[3])(struct snd_pcm_substream *, int,  int)' from incompatible pointer type 'int (*)(struct snd_pcm_substream *, int,  int)' [-Wincompatible-pointer-types]
    1190 |                 snd_soc_link_trigger,
         |                 ^~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:1190:17: note: (near initialization for 'trigger')
   sound/soc/soc-pcm.c:1191:17: warning: excess elements in scalar initializer
    1191 |                 snd_soc_pcm_component_trigger,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:1191:17: note: (near initialization for 'trigger')
   sound/soc/soc-pcm.c:1192:17: warning: excess elements in scalar initializer
    1192 |                 snd_soc_pcm_dai_trigger,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:1192:17: note: (near initialization for 'trigger')
   sound/soc/soc-pcm.c:1194:10: error: array index in non-array initializer
    1194 |         [SND_SOC_TRIGGER_ORDER_LDC] = {
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:1194:10: note: (near initialization for 'trigger')
   sound/soc/soc-pcm.c:1194:9: warning: braces around scalar initializer
    1194 |         [SND_SOC_TRIGGER_ORDER_LDC] = {
         |         ^
   sound/soc/soc-pcm.c:1194:9: note: (near initialization for 'trigger')
   sound/soc/soc-pcm.c:1195:17: error: initialization of 'int (* const (*)[3])(struct snd_pcm_substream *, int,  int)' from incompatible pointer type 'int (*)(struct snd_pcm_substream *, int,  int)' [-Wincompatible-pointer-types]
    1195 |                 snd_soc_link_trigger,
         |                 ^~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:1195:17: note: (near initialization for 'trigger')
   sound/soc/soc-pcm.c:1196:17: warning: excess elements in scalar initializer
    1196 |                 snd_soc_pcm_dai_trigger,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:1196:17: note: (near initialization for 'trigger')
   sound/soc/soc-pcm.c:1197:17: warning: excess elements in scalar initializer
    1197 |                 snd_soc_pcm_component_trigger,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:1197:17: note: (near initialization for 'trigger')
   sound/soc/soc-pcm.c:1194:39: warning: excess elements in scalar initializer
    1194 |         [SND_SOC_TRIGGER_ORDER_LDC] = {
         |                                       ^
   sound/soc/soc-pcm.c:1194:39: note: (near initialization for 'trigger')
   sound/soc/soc-pcm.c:1202:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1202 | {
         | ^
   sound/soc/soc-pcm.c:1284:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1284 | {
         | ^
   sound/soc/soc-pcm.c:1304:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1304 | {
         | ^
   sound/soc/soc-pcm.c:1353:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1353 | {
         | ^
   sound/soc/soc-pcm.c:1382:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1382 | {
         | ^
   sound/soc/soc-pcm.c:1422:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1422 | {
         | ^
   sound/soc/soc-pcm.c:1455:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1455 | {
         | ^
   sound/soc/soc-pcm.c:1465:19: error: storage class specified for parameter 'widget_in_list'
    1465 | EXPORT_SYMBOL_GPL(widget_in_list);
         |                   ^~~~~~~~~~~~~~
   include/linux/export.h:70:28: note: in definition of macro '__EXPORT_SYMBOL'
      70 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:84:41: note: in expansion of macro '_EXPORT_SYMBOL'
      84 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:1465:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    1465 | EXPORT_SYMBOL_GPL(widget_in_list);
         | ^~~~~~~~~~~~~~~~~
>> include/linux/compiler.h:166:45: error: storage class specified for parameter '__UNIQUE_ID___addressable_widget_in_list312'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:83:23: note: in definition of macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/compiler.h:166:29: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:166:37: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/compiler.h:221:9: note: in expansion of macro '__UNIQUE_ID'
     221 |         __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)(uintptr_t)&sym;
         |         ^~~~~~~~~~~
   include/linux/compiler.h:224:9: note: in expansion of macro '___ADDRESSABLE'
     224 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/export.h:71:9: note: in expansion of macro '__ADDRESSABLE'
      71 |         __ADDRESSABLE(sym)                                      \
         |         ^~~~~~~~~~~~~
   include/linux/export.h:80:41: note: in expansion of macro '__EXPORT_SYMBOL'
      80 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:84:41: note: in expansion of macro '_EXPORT_SYMBOL'
      84 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:1465:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    1465 | EXPORT_SYMBOL_GPL(widget_in_list);
         | ^~~~~~~~~~~~~~~~~
>> sound/soc/soc-pcm.c:1465:1: error: parameter '__UNIQUE_ID___addressable_widget_in_list312' is initialized
   sound/soc/soc-pcm.c:1465:1: warning: 'used' attribute ignored [-Wattributes]
>> include/linux/compiler.h:166:45: error: section attribute not allowed for '__UNIQUE_ID___addressable_widget_in_list312'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:83:23: note: in definition of macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/compiler.h:166:29: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:166:37: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/compiler.h:221:9: note: in expansion of macro '__UNIQUE_ID'
     221 |         __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)(uintptr_t)&sym;
         |         ^~~~~~~~~~~
   include/linux/compiler.h:224:9: note: in expansion of macro '___ADDRESSABLE'
     224 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/export.h:71:9: note: in expansion of macro '__ADDRESSABLE'
      71 |         __ADDRESSABLE(sym)                                      \
         |         ^~~~~~~~~~~~~
   include/linux/export.h:80:41: note: in expansion of macro '__EXPORT_SYMBOL'
      80 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:84:41: note: in expansion of macro '_EXPORT_SYMBOL'
      84 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:1465:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    1465 | EXPORT_SYMBOL_GPL(widget_in_list);
         | ^~~~~~~~~~~~~~~~~
   include/linux/export.h:73:9: error: expected declaration specifiers before 'asm'
      73 |         asm(__stringify(___EXPORT_SYMBOL(sym, license, ns)))
         |         ^~~
   include/linux/export.h:80:41: note: in expansion of macro '__EXPORT_SYMBOL'
      80 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:84:41: note: in expansion of macro '_EXPORT_SYMBOL'
      84 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:1465:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    1465 | EXPORT_SYMBOL_GPL(widget_in_list);
         | ^~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:1468:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1468 | {
         | ^
   sound/soc/soc-pcm.c:1485:19: error: storage class specified for parameter 'dpcm_end_walk_at_be'
    1485 | EXPORT_SYMBOL_GPL(dpcm_end_walk_at_be);
         |                   ^~~~~~~~~~~~~~~~~~~
   include/linux/export.h:70:28: note: in definition of macro '__EXPORT_SYMBOL'
      70 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:84:41: note: in expansion of macro '_EXPORT_SYMBOL'
      84 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:1485:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    1485 | EXPORT_SYMBOL_GPL(dpcm_end_walk_at_be);
         | ^~~~~~~~~~~~~~~~~
>> include/linux/compiler.h:166:45: error: storage class specified for parameter '__UNIQUE_ID___addressable_dpcm_end_walk_at_be313'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:83:23: note: in definition of macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/compiler.h:166:29: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:166:37: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/compiler.h:221:9: note: in expansion of macro '__UNIQUE_ID'
     221 |         __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)(uintptr_t)&sym;
         |         ^~~~~~~~~~~
   include/linux/compiler.h:224:9: note: in expansion of macro '___ADDRESSABLE'
     224 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/export.h:71:9: note: in expansion of macro '__ADDRESSABLE'
      71 |         __ADDRESSABLE(sym)                                      \
         |         ^~~~~~~~~~~~~
   include/linux/export.h:80:41: note: in expansion of macro '__EXPORT_SYMBOL'
      80 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:84:41: note: in expansion of macro '_EXPORT_SYMBOL'
      84 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:1485:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    1485 | EXPORT_SYMBOL_GPL(dpcm_end_walk_at_be);
         | ^~~~~~~~~~~~~~~~~
>> sound/soc/soc-pcm.c:1485:1: error: parameter '__UNIQUE_ID___addressable_dpcm_end_walk_at_be313' is initialized
   sound/soc/soc-pcm.c:1485:1: warning: 'used' attribute ignored [-Wattributes]
>> include/linux/compiler.h:166:45: error: section attribute not allowed for '__UNIQUE_ID___addressable_dpcm_end_walk_at_be313'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:83:23: note: in definition of macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/compiler.h:166:29: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:166:37: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/compiler.h:221:9: note: in expansion of macro '__UNIQUE_ID'
     221 |         __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)(uintptr_t)&sym;
         |         ^~~~~~~~~~~
   include/linux/compiler.h:224:9: note: in expansion of macro '___ADDRESSABLE'
     224 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/export.h:71:9: note: in expansion of macro '__ADDRESSABLE'
      71 |         __ADDRESSABLE(sym)                                      \
         |         ^~~~~~~~~~~~~
   include/linux/export.h:80:41: note: in expansion of macro '__EXPORT_SYMBOL'
      80 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:84:41: note: in expansion of macro '_EXPORT_SYMBOL'
      84 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:1485:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    1485 | EXPORT_SYMBOL_GPL(dpcm_end_walk_at_be);
         | ^~~~~~~~~~~~~~~~~
   include/linux/export.h:73:9: error: expected declaration specifiers before 'asm'
      73 |         asm(__stringify(___EXPORT_SYMBOL(sym, license, ns)))
         |         ^~~
   include/linux/export.h:80:41: note: in expansion of macro '__EXPORT_SYMBOL'
      80 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:84:41: note: in expansion of macro '_EXPORT_SYMBOL'
      84 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:1485:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    1485 | EXPORT_SYMBOL_GPL(dpcm_end_walk_at_be);
         | ^~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:1489:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1489 | {
         | ^
   sound/soc/soc-pcm.c:1513:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1513 | {
         | ^
   sound/soc/soc-pcm.c:1519:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1519 | {
         | ^
   sound/soc/soc-pcm.c:1540:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1540 | {
         | ^
   sound/soc/soc-pcm.c:1563:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1563 | {
         | ^
   sound/soc/soc-pcm.c:1628:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1628 | {
         | ^
   sound/soc/soc-pcm.c:1637:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1637 | {
         | ^
   sound/soc/soc-pcm.c:1680:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1680 | {
         | ^
   sound/soc/soc-pcm.c:1747:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1747 | {
         | ^
   sound/soc/soc-pcm.c:1781:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1781 | {
         | ^
   sound/soc/soc-pcm.c:1818:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1818 | {
         | ^
   sound/soc/soc-pcm.c:1866:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1866 | {
         | ^
   sound/soc/soc-pcm.c:1904:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1904 | {
         | ^
   sound/soc/soc-pcm.c:1951:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1951 | {
         | ^
   sound/soc/soc-pcm.c:1988:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1988 | {
         | ^
   sound/soc/soc-pcm.c:2013:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    2013 | {
         | ^
   sound/soc/soc-pcm.c:2052:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    2052 | {
         | ^
   sound/soc/soc-pcm.c:2076:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    2076 | {
         | ^
   sound/soc/soc-pcm.c:2155:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    2155 | {
         | ^
   sound/soc/soc-pcm.c:2188:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    2188 | {
         | ^
   sound/soc/soc-pcm.c:2354:19: error: storage class specified for parameter 'dpcm_be_dai_trigger'
    2354 | EXPORT_SYMBOL_GPL(dpcm_be_dai_trigger);
         |                   ^~~~~~~~~~~~~~~~~~~
   include/linux/export.h:70:28: note: in definition of macro '__EXPORT_SYMBOL'
      70 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:84:41: note: in expansion of macro '_EXPORT_SYMBOL'
      84 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:2354:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    2354 | EXPORT_SYMBOL_GPL(dpcm_be_dai_trigger);
         | ^~~~~~~~~~~~~~~~~
>> include/linux/compiler.h:166:45: error: storage class specified for parameter '__UNIQUE_ID___addressable_dpcm_be_dai_trigger314'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:83:23: note: in definition of macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/compiler.h:166:29: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:166:37: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/compiler.h:221:9: note: in expansion of macro '__UNIQUE_ID'
     221 |         __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)(uintptr_t)&sym;
         |         ^~~~~~~~~~~
   include/linux/compiler.h:224:9: note: in expansion of macro '___ADDRESSABLE'
     224 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/export.h:71:9: note: in expansion of macro '__ADDRESSABLE'
      71 |         __ADDRESSABLE(sym)                                      \
         |         ^~~~~~~~~~~~~
   include/linux/export.h:80:41: note: in expansion of macro '__EXPORT_SYMBOL'
      80 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:84:41: note: in expansion of macro '_EXPORT_SYMBOL'
      84 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:2354:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    2354 | EXPORT_SYMBOL_GPL(dpcm_be_dai_trigger);
         | ^~~~~~~~~~~~~~~~~
>> sound/soc/soc-pcm.c:2354:1: error: parameter '__UNIQUE_ID___addressable_dpcm_be_dai_trigger314' is initialized
   sound/soc/soc-pcm.c:2354:1: warning: 'used' attribute ignored [-Wattributes]
>> include/linux/compiler.h:166:45: error: section attribute not allowed for '__UNIQUE_ID___addressable_dpcm_be_dai_trigger314'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:83:23: note: in definition of macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/compiler.h:166:29: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:166:37: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/compiler.h:221:9: note: in expansion of macro '__UNIQUE_ID'
     221 |         __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)(uintptr_t)&sym;
         |         ^~~~~~~~~~~
   include/linux/compiler.h:224:9: note: in expansion of macro '___ADDRESSABLE'
     224 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/export.h:71:9: note: in expansion of macro '__ADDRESSABLE'
      71 |         __ADDRESSABLE(sym)                                      \
         |         ^~~~~~~~~~~~~
   include/linux/export.h:80:41: note: in expansion of macro '__EXPORT_SYMBOL'
      80 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:84:41: note: in expansion of macro '_EXPORT_SYMBOL'
      84 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:2354:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    2354 | EXPORT_SYMBOL_GPL(dpcm_be_dai_trigger);
         | ^~~~~~~~~~~~~~~~~
   include/linux/export.h:73:9: error: expected declaration specifiers before 'asm'
      73 |         asm(__stringify(___EXPORT_SYMBOL(sym, license, ns)))
         |         ^~~
   include/linux/export.h:80:41: note: in expansion of macro '__EXPORT_SYMBOL'
      80 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:84:41: note: in expansion of macro '_EXPORT_SYMBOL'
      84 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:2354:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    2354 | EXPORT_SYMBOL_GPL(dpcm_be_dai_trigger);
         | ^~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:2358:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    2358 | {
         | ^
   sound/soc/soc-pcm.c:2389:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    2389 | {
         | ^
   sound/soc/soc-pcm.c:2453:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    2453 | {
         | ^
   sound/soc/soc-pcm.c:2470:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    2470 | {
         | ^
   sound/soc/soc-pcm.c:2513:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    2513 | {
         | ^
   sound/soc/soc-pcm.c:2559:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    2559 | {
         | ^
   sound/soc/soc-pcm.c:2578:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    2578 | {
         | ^
   sound/soc/soc-pcm.c:2651:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    2651 | {
         | ^
   sound/soc/soc-pcm.c:2718:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    2718 | {
         | ^
   sound/soc/soc-pcm.c:2742:19: error: storage class specified for parameter 'snd_soc_dpcm_runtime_update'
    2742 | EXPORT_SYMBOL_GPL(snd_soc_dpcm_runtime_update);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:70:28: note: in definition of macro '__EXPORT_SYMBOL'
      70 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:84:41: note: in expansion of macro '_EXPORT_SYMBOL'
      84 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:2742:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    2742 | EXPORT_SYMBOL_GPL(snd_soc_dpcm_runtime_update);
         | ^~~~~~~~~~~~~~~~~
>> include/linux/compiler.h:166:45: error: storage class specified for parameter '__UNIQUE_ID___addressable_snd_soc_dpcm_runtime_update315'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:83:23: note: in definition of macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/compiler.h:166:29: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:166:37: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/compiler.h:221:9: note: in expansion of macro '__UNIQUE_ID'
     221 |         __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)(uintptr_t)&sym;
         |         ^~~~~~~~~~~
   include/linux/compiler.h:224:9: note: in expansion of macro '___ADDRESSABLE'
     224 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/export.h:71:9: note: in expansion of macro '__ADDRESSABLE'
      71 |         __ADDRESSABLE(sym)                                      \
         |         ^~~~~~~~~~~~~
   include/linux/export.h:80:41: note: in expansion of macro '__EXPORT_SYMBOL'
      80 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:84:41: note: in expansion of macro '_EXPORT_SYMBOL'
      84 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:2742:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    2742 | EXPORT_SYMBOL_GPL(snd_soc_dpcm_runtime_update);
         | ^~~~~~~~~~~~~~~~~
>> sound/soc/soc-pcm.c:2742:1: error: parameter '__UNIQUE_ID___addressable_snd_soc_dpcm_runtime_update315' is initialized
   sound/soc/soc-pcm.c:2742:1: warning: 'used' attribute ignored [-Wattributes]
>> include/linux/compiler.h:166:45: error: section attribute not allowed for '__UNIQUE_ID___addressable_snd_soc_dpcm_runtime_update315'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:83:23: note: in definition of macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/compiler.h:166:29: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:166:37: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/compiler.h:221:9: note: in expansion of macro '__UNIQUE_ID'
     221 |         __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)(uintptr_t)&sym;
         |         ^~~~~~~~~~~
   include/linux/compiler.h:224:9: note: in expansion of macro '___ADDRESSABLE'
     224 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/export.h:71:9: note: in expansion of macro '__ADDRESSABLE'
      71 |         __ADDRESSABLE(sym)                                      \
         |         ^~~~~~~~~~~~~
   include/linux/export.h:80:41: note: in expansion of macro '__EXPORT_SYMBOL'
      80 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:84:41: note: in expansion of macro '_EXPORT_SYMBOL'
      84 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:2742:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    2742 | EXPORT_SYMBOL_GPL(snd_soc_dpcm_runtime_update);
         | ^~~~~~~~~~~~~~~~~
   include/linux/export.h:73:9: error: expected declaration specifiers before 'asm'
      73 |         asm(__stringify(___EXPORT_SYMBOL(sym, license, ns)))
         |         ^~~
   include/linux/export.h:80:41: note: in expansion of macro '__EXPORT_SYMBOL'
      80 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:84:41: note: in expansion of macro '_EXPORT_SYMBOL'
      84 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:2742:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    2742 | EXPORT_SYMBOL_GPL(snd_soc_dpcm_runtime_update);
         | ^~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:2745:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    2745 | {
         | ^
   sound/soc/soc-pcm.c:2760:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    2760 | {
         | ^
   sound/soc/soc-pcm.c:2774:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    2774 | {
         | ^
   sound/soc/soc-pcm.c:2802:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    2802 | {
         | ^
   sound/soc/soc-pcm.c:2871:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    2871 | {
         | ^
   sound/soc/soc-pcm.c:2911:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    2911 | {
         | ^
   sound/soc/soc-pcm.c:3002:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    3002 | {
         | ^
   sound/soc/soc-pcm.c:3005:19: error: storage class specified for parameter 'snd_soc_dpcm_get_substream'
    3005 | EXPORT_SYMBOL_GPL(snd_soc_dpcm_get_substream);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:70:28: note: in definition of macro '__EXPORT_SYMBOL'
      70 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:84:41: note: in expansion of macro '_EXPORT_SYMBOL'
      84 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:3005:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    3005 | EXPORT_SYMBOL_GPL(snd_soc_dpcm_get_substream);
         | ^~~~~~~~~~~~~~~~~
>> include/linux/compiler.h:166:45: error: storage class specified for parameter '__UNIQUE_ID___addressable_snd_soc_dpcm_get_substream316'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:83:23: note: in definition of macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/compiler.h:166:29: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:166:37: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/compiler.h:221:9: note: in expansion of macro '__UNIQUE_ID'
     221 |         __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)(uintptr_t)&sym;
         |         ^~~~~~~~~~~
   include/linux/compiler.h:224:9: note: in expansion of macro '___ADDRESSABLE'
     224 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/export.h:71:9: note: in expansion of macro '__ADDRESSABLE'
      71 |         __ADDRESSABLE(sym)                                      \
         |         ^~~~~~~~~~~~~
   include/linux/export.h:80:41: note: in expansion of macro '__EXPORT_SYMBOL'
      80 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:84:41: note: in expansion of macro '_EXPORT_SYMBOL'
      84 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:3005:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    3005 | EXPORT_SYMBOL_GPL(snd_soc_dpcm_get_substream);
         | ^~~~~~~~~~~~~~~~~
>> sound/soc/soc-pcm.c:3005:1: error: parameter '__UNIQUE_ID___addressable_snd_soc_dpcm_get_substream316' is initialized
   sound/soc/soc-pcm.c:3005:1: warning: 'used' attribute ignored [-Wattributes]
   include/linux/compiler.h:166:45: error: section attribute not allowed for '__UNIQUE_ID___addressable_snd_soc_dpcm_get_substream316'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:83:23: note: in definition of macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/compiler.h:166:29: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:166:37: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/compiler.h:221:9: note: in expansion of macro '__UNIQUE_ID'
     221 |         __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)(uintptr_t)&sym;
         |         ^~~~~~~~~~~
   include/linux/compiler.h:224:9: note: in expansion of macro '___ADDRESSABLE'
     224 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/export.h:71:9: note: in expansion of macro '__ADDRESSABLE'
      71 |         __ADDRESSABLE(sym)                                      \
         |         ^~~~~~~~~~~~~
   include/linux/export.h:80:41: note: in expansion of macro '__EXPORT_SYMBOL'
      80 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:84:41: note: in expansion of macro '_EXPORT_SYMBOL'
      84 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:3005:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    3005 | EXPORT_SYMBOL_GPL(snd_soc_dpcm_get_substream);
         | ^~~~~~~~~~~~~~~~~
   include/linux/export.h:73:9: error: expected declaration specifiers before 'asm'
      73 |         asm(__stringify(___EXPORT_SYMBOL(sym, license, ns)))
         |         ^~~
   include/linux/export.h:80:41: note: in expansion of macro '__EXPORT_SYMBOL'
      80 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:84:41: note: in expansion of macro '_EXPORT_SYMBOL'
      84 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:3005:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    3005 | EXPORT_SYMBOL_GPL(snd_soc_dpcm_get_substream);
         | ^~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:158:20: error: old-style parameter declarations in prototyped function definition
     158 | static const char *dpcm_state_string(struct snd_soc_pcm_runtime *rtd, int stream)
         |                    ^~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:3006: error: expected '{' at end of input
   include/linux/export.h:73:9: warning: no return statement in function returning non-void [-Wreturn-type]
      73 |         asm(__stringify(___EXPORT_SYMBOL(sym, license, ns)))
         |         ^~~
   include/linux/export.h:80:41: note: in expansion of macro '__EXPORT_SYMBOL'
      80 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:84:41: note: in expansion of macro '_EXPORT_SYMBOL'
      84 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:3005:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    3005 | EXPORT_SYMBOL_GPL(snd_soc_dpcm_get_substream);
         | ^~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c: At top level:
   sound/soc/soc-pcm.c:158:20: warning: 'dpcm_state_string' defined but not used [-Wunused-function]
     158 | static const char *dpcm_state_string(struct snd_soc_pcm_runtime *rtd, int stream)
         |                    ^~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:138:12: warning: 'snd_soc_dpcm_be_can_prepared' defined but not used [-Wunused-function]
     138 | static int snd_soc_dpcm_be_can_prepared(struct snd_soc_pcm_runtime *fe,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:124:12: warning: 'snd_soc_dpcm_be_can_params' defined but not used [-Wunused-function]
     124 | static int snd_soc_dpcm_be_can_params(struct snd_soc_pcm_runtime *fe,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:111:12: warning: 'snd_soc_dpcm_be_can_free_stop' defined but not used [-Wunused-function]
     111 | static int snd_soc_dpcm_be_can_free_stop(struct snd_soc_pcm_runtime *fe,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:68:12: warning: '_dpcm_state_is' defined but not used [-Wunused-function]
      68 | static int _dpcm_state_is(struct snd_soc_pcm_runtime *rtd,
         |            ^~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:48:12: warning: 'snd_soc_dpcm_be_can_update' defined but not used [-Wunused-function]
      48 | static int snd_soc_dpcm_be_can_update(struct snd_soc_pcm_runtime *fe,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/__UNIQUE_ID___addressable_snd_soc_runtime_action292 +390 sound/soc/soc-pcm.c

a7e20444ef5e7a Kuninori Morimoto  2020-12-11  357  
d9051d86ad30ca Kuninori Morimoto  2020-05-15  358  /**
d9051d86ad30ca Kuninori Morimoto  2020-05-15  359   * snd_soc_runtime_action() - Increment/Decrement active count for
d9051d86ad30ca Kuninori Morimoto  2020-05-15  360   * PCM runtime components
d9051d86ad30ca Kuninori Morimoto  2020-05-15  361   * @rtd: ASoC PCM runtime that is activated
d9051d86ad30ca Kuninori Morimoto  2020-05-15  362   * @stream: Direction of the PCM stream
b6d6e9ea8fb9d4 Colton Lewis       2020-06-26  363   * @action: Activate stream if 1. Deactivate if -1.
d9051d86ad30ca Kuninori Morimoto  2020-05-15  364   *
d9051d86ad30ca Kuninori Morimoto  2020-05-15  365   * Increments/Decrements the active count for all the DAIs and components
d9051d86ad30ca Kuninori Morimoto  2020-05-15  366   * attached to a PCM runtime.
d9051d86ad30ca Kuninori Morimoto  2020-05-15  367   * Should typically be called when a stream is opened.
d9051d86ad30ca Kuninori Morimoto  2020-05-15  368   *
d9051d86ad30ca Kuninori Morimoto  2020-05-15  369   * Must be called with the rtd->card->pcm_mutex being held
d9051d86ad30ca Kuninori Morimoto  2020-05-15  370   */
d9051d86ad30ca Kuninori Morimoto  2020-05-15  371  void snd_soc_runtime_action(struct snd_soc_pcm_runtime *rtd,
7a5aaba4a4f45a Kuninori Morimoto  2020-02-10  372  			    int stream, int action)
24894b76468ed2 Lars-Peter Clausen 2014-03-05  373  {
8f039360897bdd Chancel Liu        2023-12-04  374  	struct snd_soc_component *component;
c840f7698d26b0 Kuninori Morimoto  2020-03-16  375  	struct snd_soc_dai *dai;
2e5894d73789ee Benoit Cousson     2014-07-08  376  	int i;
24894b76468ed2 Lars-Peter Clausen 2014-03-05  377  
b7898396f4bbe1 Takashi Iwai       2021-12-07  378  	snd_soc_dpcm_mutex_assert_held(rtd);
24894b76468ed2 Lars-Peter Clausen 2014-03-05  379  
dc82910682ef06 Kuninori Morimoto  2020-05-15  380  	for_each_rtd_dais(rtd, i, dai)
dc82910682ef06 Kuninori Morimoto  2020-05-15  381  		snd_soc_dai_action(dai, stream, action);
8f039360897bdd Chancel Liu        2023-12-04  382  
8f039360897bdd Chancel Liu        2023-12-04  383  	/* Increments/Decrements the active count for components without DAIs */
8f039360897bdd Chancel Liu        2023-12-04  384  	for_each_rtd_components(rtd, i, component) {
8f039360897bdd Chancel Liu        2023-12-04  385  		if (component->num_dai)
8f039360897bdd Chancel Liu        2023-12-04  386  			continue;
8f039360897bdd Chancel Liu        2023-12-04  387  		component->active += action;
8f039360897bdd Chancel Liu        2023-12-04  388  	}
24894b76468ed2 Lars-Peter Clausen 2014-03-05  389  }
d9051d86ad30ca Kuninori Morimoto  2020-05-15 @390  EXPORT_SYMBOL_GPL(snd_soc_runtime_action);
24894b76468ed2 Lars-Peter Clausen 2014-03-05  391  

:::::: The code at line 390 was first introduced by commit
:::::: d9051d86ad30ca1ef1fc99e29854daeeb3944f8f ASoC: soc-pcm: replace snd_soc_runtime_activate()/deactivate() to macro

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
