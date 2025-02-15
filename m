Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12539E56C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Feb 2025 21:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739656362; cv=none; b=IfMRpLENH+H27YLGk1DKjFHn5Aen4S/J1CsMrktWcedxhk1ksOAbvmP0nRj//ZFzZpK1CGLRWo3kiKns9zELuY+9/vnPxzBzj+q1rBd64n222toFHOWyqhErbTEJbMtsp/IAHKxrMuo9kHxBHgI43rwEAB7kKlCAxpPjtbqMvp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739656362; c=relaxed/simple;
	bh=aiw2l0FbtwMNjdwUGXwSwCbh7NQ+9vgnblYHEgakDb8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K38K5Qtulr6eZDxM0Yu8bOHpNALQVnZHv8uHJey84OkQI8iUJDXG8vo97dN7/qepkh2KfngJN//lzgobGjU/8ROf+o5Iug5QR3m9J6+JfZI4BrHeooAvPh54XpaOQ8JkSc41N6ghOQj2nq8ZJOWzZqCKE77xgiqnQa+4dQmRjgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VTjhiQot; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VTjhiQot"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739656358; x=1771192358;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aiw2l0FbtwMNjdwUGXwSwCbh7NQ+9vgnblYHEgakDb8=;
  b=VTjhiQots3lXu5TFLRNg3bjnJx5HHw6Xrd5nifFQJ1P18k8AUdOEwZSb
   ENVFcShH1CemLMRkOBJ+5FlDv/cfFOz2jspTrcPt3eKFdbu6C3O4SuByj
   82sfsPklA1xke6iIhF0yhlnz/TLiyeQcxqeKFY49gexAXsHH0+5U2KEH8
   sBxaWPew2kFJqgbKJ7O7THXDS5T1vHyXIlUwKtdi1LYv0l7R9pe6SptEj
   IBqZXrdcYTvGQXM/PTBRJQiO5diWtc8oV/GCV9ZM3d0dZ38VLEOa1X8T4
   FIhkmTqc296fljdNUp8GpQZL32tVgxm8MA8BUDXekuBjJQr69mh/+avoG
   w==;
X-CSE-ConnectionGUID: oJPHJIFDTFK2+yRV3DckxA==
X-CSE-MsgGUID: uX2x2Ts2SbSgf2UqF9JQsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11346"; a="40649507"
X-IronPort-AV: E=Sophos;i="6.13,289,1732608000"; 
   d="scan'208";a="40649507"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2025 13:52:37 -0800
X-CSE-ConnectionGUID: Y+0kgtekQBOcbHAlSlhU3g==
X-CSE-MsgGUID: u8jT3Cn6Sv6QBoq7YqU1lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="136990978"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 15 Feb 2025 13:52:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjQ5R-001BDN-3C;
	Sat, 15 Feb 2025 21:52:33 +0000
Date: Sun, 16 Feb 2025 05:52:08 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2025-02-12 35/37] sound/soc/soc-pcm.c:322:1:
 error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
Message-ID: <202502160519.piTk0zj5-lkp@intel.com>
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
config: sparc-randconfig-001-20250216 (https://download.01.org/0day-ci/archive/20250216/202502160519.piTk0zj5-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250216/202502160519.piTk0zj5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502160519.piTk0zj5-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   sound/soc/soc-pcm.c: In function 'dpcm_state_string':
>> sound/soc/soc-pcm.c:322:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     322 | {
         | ^
   sound/soc/soc-pcm.c:326:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     326 | {
         | ^
>> sound/soc/soc-pcm.c:335:12: error: storage class specified for parameter 'dpcm_fe_dai_do_trigger'
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
>> sound/soc/soc-pcm.c:390:19: error: storage class specified for parameter 'snd_soc_runtime_action'
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
>> include/linux/compiler.h:166:45: error: storage class specified for parameter '__UNIQUE_ID___addressable_snd_soc_runtime_action279'
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
>> sound/soc/soc-pcm.c:390:1: error: parameter '__UNIQUE_ID___addressable_snd_soc_runtime_action279' is initialized
>> sound/soc/soc-pcm.c:390:1: warning: 'used' attribute ignored [-Wattributes]
>> include/linux/compiler.h:166:45: error: section attribute not allowed for '__UNIQUE_ID___addressable_snd_soc_runtime_action279'
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
>> include/linux/export.h:73:9: error: expected declaration specifiers before 'asm'
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
>> sound/soc/soc-pcm.c:702:19: error: storage class specified for parameter 'snd_soc_runtime_calc_hw'
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
>> include/linux/compiler.h:166:45: error: storage class specified for parameter '__UNIQUE_ID___addressable_snd_soc_runtime_calc_hw298'
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
>> sound/soc/soc-pcm.c:702:1: error: parameter '__UNIQUE_ID___addressable_snd_soc_runtime_calc_hw298' is initialized
   sound/soc/soc-pcm.c:702:1: warning: 'used' attribute ignored [-Wattributes]
>> include/linux/compiler.h:166:45: error: section attribute not allowed for '__UNIQUE_ID___addressable_snd_soc_runtime_calc_hw298'
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
>> include/linux/export.h:73:9: error: expected declaration specifiers before 'asm'
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
>> sound/soc/soc-pcm.c:1188:21: error: storage class specified for parameter 'trigger'
    1188 | static int (* const trigger[][TRIGGER_MAX])(struct snd_pcm_substream *substream, int cmd, int rollback) = {
         |                     ^~~~~~~
>> sound/soc/soc-pcm.c:1188:52: error: parameter 'trigger' is initialized
    1188 | static int (* const trigger[][TRIGGER_MAX])(struct snd_pcm_substream *substream, int cmd, int rollback) = {
         |                                                    ^~~~~~~~~~~~~~~~~
>> sound/soc/soc-pcm.c:1188:107: error: variable-sized object may not be initialized except with an empty initializer
    1188 | static int (* const trigger[][TRIGGER_MAX])(struct snd_pcm_substream *substream, int cmd, int rollback) = {
         |                                                                                                           ^
>> sound/soc/soc-pcm.c:1189:10: error: array index in non-array initializer
    1189 |         [SND_SOC_TRIGGER_ORDER_DEFAULT] = {
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:1189:10: note: (near initialization for 'trigger')
>> sound/soc/soc-pcm.c:1189:9: warning: braces around scalar initializer
    1189 |         [SND_SOC_TRIGGER_ORDER_DEFAULT] = {
         |         ^
   sound/soc/soc-pcm.c:1189:9: note: (near initialization for 'trigger')
>> sound/soc/soc-pcm.c:1190:17: error: initialization of 'int (* const (*)[3])(struct snd_pcm_substream *, int,  int)' from incompatible pointer type 'int (*)(struct snd_pcm_substream *, int,  int)' [-Wincompatible-pointer-types]
    1190 |                 snd_soc_link_trigger,
         |                 ^~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:1190:17: note: (near initialization for 'trigger')
>> sound/soc/soc-pcm.c:1191:17: warning: excess elements in scalar initializer
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
   include/linux/compiler.h:166:45: error: storage class specified for parameter '__UNIQUE_ID___addressable_widget_in_list299'
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
   sound/soc/soc-pcm.c:1465:1: error: parameter '__UNIQUE_ID___addressable_widget_in_list299' is initialized
   sound/soc/soc-pcm.c:1465:1: warning: 'used' attribute ignored [-Wattributes]
   include/linux/compiler.h:166:45: error: section attribute not allowed for '__UNIQUE_ID___addressable_widget_in_list299'
..


vim +322 sound/soc/soc-pcm.c

4dd4baa4408a15 Kuninori Morimoto  2024-08-26  119  
4dd4baa4408a15 Kuninori Morimoto  2024-08-26  120  /*
4dd4baa4408a15 Kuninori Morimoto  2024-08-26  121   * We can only change hw params a BE DAI if any of it's FE are not prepared,
4dd4baa4408a15 Kuninori Morimoto  2024-08-26  122   * running, paused or suspended for the specified stream direction.
4dd4baa4408a15 Kuninori Morimoto  2024-08-26  123   */
46acbab406b069 Kuninori Morimoto  2025-02-05 @124  static int snd_soc_dpcm_be_can_params(struct snd_soc_pcm_runtime *fe,
4dd4baa4408a15 Kuninori Morimoto  2024-08-26  125  				      struct snd_soc_pcm_runtime *be, int stream)
4dd4baa4408a15 Kuninori Morimoto  2024-08-26  126  {
41ce6fdaab0085 Kuninori Morimoto  2025-02-05  127  	return !dpcm_fe_state_is(fe, be, stream,
4dd4baa4408a15 Kuninori Morimoto  2024-08-26  128  				SND_SOC_DPCM_STATE_START,
4dd4baa4408a15 Kuninori Morimoto  2024-08-26  129  				SND_SOC_DPCM_STATE_PAUSED,
4dd4baa4408a15 Kuninori Morimoto  2024-08-26  130  				SND_SOC_DPCM_STATE_SUSPEND,
41ce6fdaab0085 Kuninori Morimoto  2025-02-05  131  				SND_SOC_DPCM_STATE_PREPARE);
4dd4baa4408a15 Kuninori Morimoto  2024-08-26  132  }
4dd4baa4408a15 Kuninori Morimoto  2024-08-26  133  
4dd4baa4408a15 Kuninori Morimoto  2024-08-26  134  /*
4dd4baa4408a15 Kuninori Morimoto  2024-08-26  135   * We can only prepare a BE DAI if any of it's FE are not prepared,
4dd4baa4408a15 Kuninori Morimoto  2024-08-26  136   * running or paused for the specified stream direction.
4dd4baa4408a15 Kuninori Morimoto  2024-08-26  137   */
46acbab406b069 Kuninori Morimoto  2025-02-05 @138  static int snd_soc_dpcm_be_can_prepared(struct snd_soc_pcm_runtime *fe,
4dd4baa4408a15 Kuninori Morimoto  2024-08-26  139  					struct snd_soc_pcm_runtime *be, int stream)
4dd4baa4408a15 Kuninori Morimoto  2024-08-26  140  {
41ce6fdaab0085 Kuninori Morimoto  2025-02-05  141  	return !dpcm_fe_state_is(fe, be, stream,
4dd4baa4408a15 Kuninori Morimoto  2024-08-26  142  				SND_SOC_DPCM_STATE_START,
4dd4baa4408a15 Kuninori Morimoto  2024-08-26  143  				SND_SOC_DPCM_STATE_PAUSED,
41ce6fdaab0085 Kuninori Morimoto  2025-02-05  144  				SND_SOC_DPCM_STATE_PREPARE);
4dd4baa4408a15 Kuninori Morimoto  2024-08-26  145  }
4dd4baa4408a15 Kuninori Morimoto  2024-08-26  146  
01d7584cd2e5a9 Liam Girdwood      2012-04-25  147  #define DPCM_MAX_BE_USERS	8
01d7584cd2e5a9 Liam Girdwood      2012-04-25  148  
6fb8944cd2892e Kuninori Morimoto  2021-03-09  149  static inline const char *soc_cpu_dai_name(struct snd_soc_pcm_runtime *rtd)
6fb8944cd2892e Kuninori Morimoto  2021-03-09  150  {
2679a5b2f7d99e Kuninori Morimoto  2023-09-11  151  	return (rtd)->dai_link->num_cpus == 1 ? snd_soc_rtd_to_cpu(rtd, 0)->name : "multicpu";
6fb8944cd2892e Kuninori Morimoto  2021-03-09  152  }
6fb8944cd2892e Kuninori Morimoto  2021-03-09  153  static inline const char *soc_codec_dai_name(struct snd_soc_pcm_runtime *rtd)
6fb8944cd2892e Kuninori Morimoto  2021-03-09  154  {
2679a5b2f7d99e Kuninori Morimoto  2023-09-11  155  	return (rtd)->dai_link->num_codecs == 1 ? snd_soc_rtd_to_codec(rtd, 0)->name : "multicodec";
6fb8944cd2892e Kuninori Morimoto  2021-03-09  156  }
6fb8944cd2892e Kuninori Morimoto  2021-03-09  157  
d7fdbbd2af104c Kuninori Morimoto  2025-02-05 @158  static const char *dpcm_state_string(struct snd_soc_pcm_runtime *rtd, int stream)
c3212829f812a4 Kuninori Morimoto  2020-02-19  159  #ifdef CONFIG_DEBUG_FS
c3212829f812a4 Kuninori Morimoto  2020-02-19  160  {
d7fdbbd2af104c Kuninori Morimoto  2025-02-05  161  	switch (rtd->dpcm[stream].state) {
c3212829f812a4 Kuninori Morimoto  2020-02-19  162  	case SND_SOC_DPCM_STATE_NEW:
c3212829f812a4 Kuninori Morimoto  2020-02-19  163  		return "new";
c3212829f812a4 Kuninori Morimoto  2020-02-19  164  	case SND_SOC_DPCM_STATE_OPEN:
c3212829f812a4 Kuninori Morimoto  2020-02-19  165  		return "open";
c3212829f812a4 Kuninori Morimoto  2020-02-19  166  	case SND_SOC_DPCM_STATE_HW_PARAMS:
c3212829f812a4 Kuninori Morimoto  2020-02-19  167  		return "hw_params";
c3212829f812a4 Kuninori Morimoto  2020-02-19  168  	case SND_SOC_DPCM_STATE_PREPARE:
c3212829f812a4 Kuninori Morimoto  2020-02-19  169  		return "prepare";
c3212829f812a4 Kuninori Morimoto  2020-02-19  170  	case SND_SOC_DPCM_STATE_START:
c3212829f812a4 Kuninori Morimoto  2020-02-19  171  		return "start";
c3212829f812a4 Kuninori Morimoto  2020-02-19  172  	case SND_SOC_DPCM_STATE_STOP:
c3212829f812a4 Kuninori Morimoto  2020-02-19  173  		return "stop";
c3212829f812a4 Kuninori Morimoto  2020-02-19  174  	case SND_SOC_DPCM_STATE_SUSPEND:
c3212829f812a4 Kuninori Morimoto  2020-02-19  175  		return "suspend";
c3212829f812a4 Kuninori Morimoto  2020-02-19  176  	case SND_SOC_DPCM_STATE_PAUSED:
c3212829f812a4 Kuninori Morimoto  2020-02-19  177  		return "paused";
c3212829f812a4 Kuninori Morimoto  2020-02-19  178  	case SND_SOC_DPCM_STATE_HW_FREE:
c3212829f812a4 Kuninori Morimoto  2020-02-19  179  		return "hw_free";
c3212829f812a4 Kuninori Morimoto  2020-02-19  180  	case SND_SOC_DPCM_STATE_CLOSE:
c3212829f812a4 Kuninori Morimoto  2020-02-19  181  		return "close";
c3212829f812a4 Kuninori Morimoto  2020-02-19  182  	}
c3212829f812a4 Kuninori Morimoto  2020-02-19  183  
c3212829f812a4 Kuninori Morimoto  2020-02-19  184  	return "unknown";
c3212829f812a4 Kuninori Morimoto  2020-02-19  185  }
c3212829f812a4 Kuninori Morimoto  2020-02-19  186  
c3212829f812a4 Kuninori Morimoto  2020-02-19  187  static ssize_t dpcm_show_state(struct snd_soc_pcm_runtime *fe,
c3212829f812a4 Kuninori Morimoto  2020-02-19  188  			       int stream, char *buf, size_t size)
c3212829f812a4 Kuninori Morimoto  2020-02-19  189  {
c3212829f812a4 Kuninori Morimoto  2020-02-19  190  	struct snd_pcm_hw_params *params = &fe->dpcm[stream].hw_params;
c3212829f812a4 Kuninori Morimoto  2020-02-19  191  	struct snd_soc_dpcm *dpcm;
c3212829f812a4 Kuninori Morimoto  2020-02-19  192  	ssize_t offset = 0;
c3212829f812a4 Kuninori Morimoto  2020-02-19  193  
c3212829f812a4 Kuninori Morimoto  2020-02-19  194  	/* FE state */
d0c9abb8339dfd Takashi Iwai       2020-03-10  195  	offset += scnprintf(buf + offset, size - offset,
c3212829f812a4 Kuninori Morimoto  2020-02-19  196  			   "[%s - %s]\n", fe->dai_link->name,
c3212829f812a4 Kuninori Morimoto  2020-02-19  197  			   stream ? "Capture" : "Playback");
c3212829f812a4 Kuninori Morimoto  2020-02-19  198  
d0c9abb8339dfd Takashi Iwai       2020-03-10  199  	offset += scnprintf(buf + offset, size - offset, "State: %s\n",
d7fdbbd2af104c Kuninori Morimoto  2025-02-05  200  			   dpcm_state_string(fe, stream));
c3212829f812a4 Kuninori Morimoto  2020-02-19  201  
0ae2bf14ca5680 Kuninori Morimoto  2025-02-05  202  	if (dpcm_state_is(fe, stream,	SND_SOC_DPCM_STATE_HW_PARAMS,
0ae2bf14ca5680 Kuninori Morimoto  2025-02-05  203  					SND_SOC_DPCM_STATE_PREPARE,
0ae2bf14ca5680 Kuninori Morimoto  2025-02-05  204  					SND_SOC_DPCM_STATE_START,
0ae2bf14ca5680 Kuninori Morimoto  2025-02-05  205  					SND_SOC_DPCM_STATE_STOP))
d0c9abb8339dfd Takashi Iwai       2020-03-10  206  		offset += scnprintf(buf + offset, size - offset,
c3212829f812a4 Kuninori Morimoto  2020-02-19  207  				   "Hardware Params: "
c3212829f812a4 Kuninori Morimoto  2020-02-19  208  				   "Format = %s, Channels = %d, Rate = %d\n",
c3212829f812a4 Kuninori Morimoto  2020-02-19  209  				   snd_pcm_format_name(params_format(params)),
c3212829f812a4 Kuninori Morimoto  2020-02-19  210  				   params_channels(params),
c3212829f812a4 Kuninori Morimoto  2020-02-19  211  				   params_rate(params));
c3212829f812a4 Kuninori Morimoto  2020-02-19  212  
c3212829f812a4 Kuninori Morimoto  2020-02-19  213  	/* BEs state */
d0c9abb8339dfd Takashi Iwai       2020-03-10  214  	offset += scnprintf(buf + offset, size - offset, "Backends:\n");
c3212829f812a4 Kuninori Morimoto  2020-02-19  215  
c3212829f812a4 Kuninori Morimoto  2020-02-19  216  	if (list_empty(&fe->dpcm[stream].be_clients)) {
d0c9abb8339dfd Takashi Iwai       2020-03-10  217  		offset += scnprintf(buf + offset, size - offset,
c3212829f812a4 Kuninori Morimoto  2020-02-19  218  				   " No active DSP links\n");
c3212829f812a4 Kuninori Morimoto  2020-02-19  219  		goto out;
c3212829f812a4 Kuninori Morimoto  2020-02-19  220  	}
c3212829f812a4 Kuninori Morimoto  2020-02-19  221  
c3212829f812a4 Kuninori Morimoto  2020-02-19  222  	for_each_dpcm_be(fe, stream, dpcm) {
c3212829f812a4 Kuninori Morimoto  2020-02-19  223  		struct snd_soc_pcm_runtime *be = dpcm->be;
25106550f1366b Kuninori Morimoto  2022-10-19  224  		params = &be->dpcm[stream].hw_params;
c3212829f812a4 Kuninori Morimoto  2020-02-19  225  
d0c9abb8339dfd Takashi Iwai       2020-03-10  226  		offset += scnprintf(buf + offset, size - offset,
c3212829f812a4 Kuninori Morimoto  2020-02-19  227  				   "- %s\n", be->dai_link->name);
c3212829f812a4 Kuninori Morimoto  2020-02-19  228  
d0c9abb8339dfd Takashi Iwai       2020-03-10  229  		offset += scnprintf(buf + offset, size - offset,
c3212829f812a4 Kuninori Morimoto  2020-02-19  230  				   "   State: %s\n",
d7fdbbd2af104c Kuninori Morimoto  2025-02-05  231  				   dpcm_state_string(be, stream));
c3212829f812a4 Kuninori Morimoto  2020-02-19  232  
0ae2bf14ca5680 Kuninori Morimoto  2025-02-05  233  		if (dpcm_state_is(be, stream,	SND_SOC_DPCM_STATE_HW_PARAMS,
0ae2bf14ca5680 Kuninori Morimoto  2025-02-05  234  						SND_SOC_DPCM_STATE_PREPARE,
0ae2bf14ca5680 Kuninori Morimoto  2025-02-05  235  						SND_SOC_DPCM_STATE_START,
0ae2bf14ca5680 Kuninori Morimoto  2025-02-05  236  						SND_SOC_DPCM_STATE_STOP))
d0c9abb8339dfd Takashi Iwai       2020-03-10  237  			offset += scnprintf(buf + offset, size - offset,
c3212829f812a4 Kuninori Morimoto  2020-02-19  238  					   "   Hardware Params: "
c3212829f812a4 Kuninori Morimoto  2020-02-19  239  					   "Format = %s, Channels = %d, Rate = %d\n",
c3212829f812a4 Kuninori Morimoto  2020-02-19  240  					   snd_pcm_format_name(params_format(params)),
c3212829f812a4 Kuninori Morimoto  2020-02-19  241  					   params_channels(params),
c3212829f812a4 Kuninori Morimoto  2020-02-19  242  					   params_rate(params));
c3212829f812a4 Kuninori Morimoto  2020-02-19  243  	}
c3212829f812a4 Kuninori Morimoto  2020-02-19  244  out:
c3212829f812a4 Kuninori Morimoto  2020-02-19  245  	return offset;
c3212829f812a4 Kuninori Morimoto  2020-02-19  246  }
c3212829f812a4 Kuninori Morimoto  2020-02-19  247  
c3212829f812a4 Kuninori Morimoto  2020-02-19  248  static ssize_t dpcm_state_read_file(struct file *file, char __user *user_buf,
c3212829f812a4 Kuninori Morimoto  2020-02-19  249  				    size_t count, loff_t *ppos)
c3212829f812a4 Kuninori Morimoto  2020-02-19  250  {
c3212829f812a4 Kuninori Morimoto  2020-02-19  251  	struct snd_soc_pcm_runtime *fe = file->private_data;
c3212829f812a4 Kuninori Morimoto  2020-02-19  252  	ssize_t out_count = PAGE_SIZE, offset = 0, ret = 0;
c3212829f812a4 Kuninori Morimoto  2020-02-19  253  	int stream;
c3212829f812a4 Kuninori Morimoto  2020-02-19  254  	char *buf;
c3212829f812a4 Kuninori Morimoto  2020-02-19  255  
be61cd4242e4a5 Kuninori Morimoto  2025-02-05  256  	if (fe->dai_link->num_cpus > 1)
be61cd4242e4a5 Kuninori Morimoto  2025-02-05  257  		return snd_soc_ret(fe->dev, -EINVAL,
6e1276a5e613d2 Bard Liao          2020-02-25  258  			"%s doesn't support Multi CPU yet\n", __func__);
6e1276a5e613d2 Bard Liao          2020-02-25  259  
c3212829f812a4 Kuninori Morimoto  2020-02-19  260  	buf = kmalloc(out_count, GFP_KERNEL);
c3212829f812a4 Kuninori Morimoto  2020-02-19  261  	if (!buf)
c3212829f812a4 Kuninori Morimoto  2020-02-19  262  		return -ENOMEM;
c3212829f812a4 Kuninori Morimoto  2020-02-19  263  
b7898396f4bbe1 Takashi Iwai       2021-12-07  264  	snd_soc_dpcm_mutex_lock(fe);
c3212829f812a4 Kuninori Morimoto  2020-02-19  265  	for_each_pcm_streams(stream)
2679a5b2f7d99e Kuninori Morimoto  2023-09-11  266  		if (snd_soc_dai_stream_valid(snd_soc_rtd_to_cpu(fe, 0), stream))
c3212829f812a4 Kuninori Morimoto  2020-02-19  267  			offset += dpcm_show_state(fe, stream,
c3212829f812a4 Kuninori Morimoto  2020-02-19  268  						  buf + offset,
c3212829f812a4 Kuninori Morimoto  2020-02-19  269  						  out_count - offset);
b7898396f4bbe1 Takashi Iwai       2021-12-07  270  	snd_soc_dpcm_mutex_unlock(fe);
c3212829f812a4 Kuninori Morimoto  2020-02-19  271  
c3212829f812a4 Kuninori Morimoto  2020-02-19  272  	ret = simple_read_from_buffer(user_buf, count, ppos, buf, offset);
c3212829f812a4 Kuninori Morimoto  2020-02-19  273  
c3212829f812a4 Kuninori Morimoto  2020-02-19  274  	kfree(buf);
c3212829f812a4 Kuninori Morimoto  2020-02-19  275  	return ret;
c3212829f812a4 Kuninori Morimoto  2020-02-19  276  }
c3212829f812a4 Kuninori Morimoto  2020-02-19  277  
c3212829f812a4 Kuninori Morimoto  2020-02-19  278  static const struct file_operations dpcm_state_fops = {
c3212829f812a4 Kuninori Morimoto  2020-02-19  279  	.open = simple_open,
c3212829f812a4 Kuninori Morimoto  2020-02-19  280  	.read = dpcm_state_read_file,
c3212829f812a4 Kuninori Morimoto  2020-02-19  281  	.llseek = default_llseek,
c3212829f812a4 Kuninori Morimoto  2020-02-19  282  };
c3212829f812a4 Kuninori Morimoto  2020-02-19  283  
c3212829f812a4 Kuninori Morimoto  2020-02-19  284  void soc_dpcm_debugfs_add(struct snd_soc_pcm_runtime *rtd)
c3212829f812a4 Kuninori Morimoto  2020-02-19  285  {
c3212829f812a4 Kuninori Morimoto  2020-02-19  286  	if (!rtd->dai_link->dynamic)
c3212829f812a4 Kuninori Morimoto  2020-02-19  287  		return;
c3212829f812a4 Kuninori Morimoto  2020-02-19  288  
c3212829f812a4 Kuninori Morimoto  2020-02-19  289  	if (!rtd->card->debugfs_card_root)
c3212829f812a4 Kuninori Morimoto  2020-02-19  290  		return;
c3212829f812a4 Kuninori Morimoto  2020-02-19  291  
c3212829f812a4 Kuninori Morimoto  2020-02-19  292  	rtd->debugfs_dpcm_root = debugfs_create_dir(rtd->dai_link->name,
c3212829f812a4 Kuninori Morimoto  2020-02-19  293  						    rtd->card->debugfs_card_root);
c3212829f812a4 Kuninori Morimoto  2020-02-19  294  
c3212829f812a4 Kuninori Morimoto  2020-02-19  295  	debugfs_create_file("state", 0444, rtd->debugfs_dpcm_root,
c3212829f812a4 Kuninori Morimoto  2020-02-19  296  			    rtd, &dpcm_state_fops);
c3212829f812a4 Kuninori Morimoto  2020-02-19  297  }
154dae87e73faa Kuninori Morimoto  2020-02-19  298  
154dae87e73faa Kuninori Morimoto  2020-02-19  299  static void dpcm_create_debugfs_state(struct snd_soc_dpcm *dpcm, int stream)
154dae87e73faa Kuninori Morimoto  2020-02-19  300  {
154dae87e73faa Kuninori Morimoto  2020-02-19  301  	char *name;
154dae87e73faa Kuninori Morimoto  2020-02-19  302  
154dae87e73faa Kuninori Morimoto  2020-02-19  303  	name = kasprintf(GFP_KERNEL, "%s:%s", dpcm->be->dai_link->name,
ebbd6703d4635d Kuninori Morimoto  2024-07-30  304  			 snd_pcm_direction_name(stream));
154dae87e73faa Kuninori Morimoto  2020-02-19  305  	if (name) {
154dae87e73faa Kuninori Morimoto  2020-02-19  306  		dpcm->debugfs_state = debugfs_create_dir(
154dae87e73faa Kuninori Morimoto  2020-02-19  307  			name, dpcm->fe->debugfs_dpcm_root);
154dae87e73faa Kuninori Morimoto  2020-02-19  308  		debugfs_create_u32("state", 0644, dpcm->debugfs_state,
154dae87e73faa Kuninori Morimoto  2020-02-19  309  				   &dpcm->state);
154dae87e73faa Kuninori Morimoto  2020-02-19  310  		kfree(name);
154dae87e73faa Kuninori Morimoto  2020-02-19  311  	}
154dae87e73faa Kuninori Morimoto  2020-02-19  312  }
154dae87e73faa Kuninori Morimoto  2020-02-19  313  
154dae87e73faa Kuninori Morimoto  2020-02-19  314  static void dpcm_remove_debugfs_state(struct snd_soc_dpcm *dpcm)
154dae87e73faa Kuninori Morimoto  2020-02-19  315  {
154dae87e73faa Kuninori Morimoto  2020-02-19  316  	debugfs_remove_recursive(dpcm->debugfs_state);
154dae87e73faa Kuninori Morimoto  2020-02-19  317  }
154dae87e73faa Kuninori Morimoto  2020-02-19  318  
154dae87e73faa Kuninori Morimoto  2020-02-19  319  #else
154dae87e73faa Kuninori Morimoto  2020-02-19  320  static inline void dpcm_create_debugfs_state(struct snd_soc_dpcm *dpcm,
154dae87e73faa Kuninori Morimoto  2020-02-19  321  					     int stream)
154dae87e73faa Kuninori Morimoto  2020-02-19 @322  {
154dae87e73faa Kuninori Morimoto  2020-02-19  323  }
154dae87e73faa Kuninori Morimoto  2020-02-19  324  
154dae87e73faa Kuninori Morimoto  2020-02-19  325  static inline void dpcm_remove_debugfs_state(struct snd_soc_dpcm *dpcm)
154dae87e73faa Kuninori Morimoto  2020-02-19  326  {
154dae87e73faa Kuninori Morimoto  2020-02-19  327  }
c3212829f812a4 Kuninori Morimoto  2020-02-19  328  #endif
c3212829f812a4 Kuninori Morimoto  2020-02-19  329  
9c6d7f9346b152 Kuninori Morimoto  2020-12-11  330  /* Set FE's runtime_update state; the state is protected via PCM stream lock
9c6d7f9346b152 Kuninori Morimoto  2020-12-11  331   * for avoiding the race with trigger callback.
9c6d7f9346b152 Kuninori Morimoto  2020-12-11  332   * If the state is unset and a trigger is pending while the previous operation,
9c6d7f9346b152 Kuninori Morimoto  2020-12-11  333   * process the pending trigger action here.
9c6d7f9346b152 Kuninori Morimoto  2020-12-11  334   */
9c6d7f9346b152 Kuninori Morimoto  2020-12-11 @335  static int dpcm_fe_dai_do_trigger(struct snd_pcm_substream *substream, int cmd);
9c6d7f9346b152 Kuninori Morimoto  2020-12-11  336  static void dpcm_set_fe_update_state(struct snd_soc_pcm_runtime *fe,
9c6d7f9346b152 Kuninori Morimoto  2020-12-11  337  				     int stream, enum snd_soc_dpcm_update state)
9c6d7f9346b152 Kuninori Morimoto  2020-12-11  338  {
9c6d7f9346b152 Kuninori Morimoto  2020-12-11  339  	struct snd_pcm_substream *substream =
9c6d7f9346b152 Kuninori Morimoto  2020-12-11  340  		snd_soc_dpcm_get_substream(fe, stream);
9c6d7f9346b152 Kuninori Morimoto  2020-12-11  341  
c8c3d9f8e3ffc3 Kuninori Morimoto  2024-07-30  342  	snd_pcm_stream_lock_irq(substream);
9c6d7f9346b152 Kuninori Morimoto  2020-12-11  343  	if (state == SND_SOC_DPCM_UPDATE_NO && fe->dpcm[stream].trigger_pending) {
9c6d7f9346b152 Kuninori Morimoto  2020-12-11  344  		dpcm_fe_dai_do_trigger(substream,
9c6d7f9346b152 Kuninori Morimoto  2020-12-11  345  				       fe->dpcm[stream].trigger_pending - 1);
9c6d7f9346b152 Kuninori Morimoto  2020-12-11  346  		fe->dpcm[stream].trigger_pending = 0;
9c6d7f9346b152 Kuninori Morimoto  2020-12-11  347  	}
9c6d7f9346b152 Kuninori Morimoto  2020-12-11  348  	fe->dpcm[stream].runtime_update = state;
c8c3d9f8e3ffc3 Kuninori Morimoto  2024-07-30  349  	snd_pcm_stream_unlock_irq(substream);
9c6d7f9346b152 Kuninori Morimoto  2020-12-11  350  }
9c6d7f9346b152 Kuninori Morimoto  2020-12-11  351  
a7e20444ef5e7a Kuninori Morimoto  2020-12-11  352  static void dpcm_set_be_update_state(struct snd_soc_pcm_runtime *be,
a7e20444ef5e7a Kuninori Morimoto  2020-12-11  353  				     int stream, enum snd_soc_dpcm_update state)
a7e20444ef5e7a Kuninori Morimoto  2020-12-11  354  {
a7e20444ef5e7a Kuninori Morimoto  2020-12-11  355  	be->dpcm[stream].runtime_update = state;
a7e20444ef5e7a Kuninori Morimoto  2020-12-11  356  }
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

:::::: The code at line 322 was first introduced by commit
:::::: 154dae87e73faa6d56265f22cae16dcdcea3dbb0 ASoC: soc-pcm: add dpcm_create/remove_debugfs_state()

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
