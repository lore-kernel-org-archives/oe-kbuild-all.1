Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921F43E6DD0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jul 2026 09:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784282183; cv=none; b=SRcWJGBqbkN46lqVfVlWo/Q7wSOGXCfrbdDnJVuk0nOy+7hoUwRVTQjgffubVh5a8FkaQwR4a6lyKNSmXdOvXiZwuqDtx6cOHIHlLEsquKcB/d6IxCEsx+UEUe84NIo4gKxq23XArw362BEDeHxL2hDPwS6DjrD3NMBwkaLpZIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784282183; c=relaxed/simple;
	bh=sNigEbRnp/SNBGfrq5GGRT9QCcXyf5NPs3eFCpTdQEg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kdrTmRjoe4rr76OGu9s5yM+N00xL6S6nf2d+jbKiU9aFweXoWbjKQFH2t4TZc25Bv8RqcuSiRuN4bBi9BHUiwyNgJRfDO4cjqhPicKJETPKyOesJnGu1q/0f6DCMm4r8TRabFH7zQcttEBghqNvv+9wc/fz/FoTh6JDamE+xC10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IxedV1+h; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IxedV1+h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784282181; x=1815818181;
  h=date:from:to:cc:subject:message-id;
  bh=sNigEbRnp/SNBGfrq5GGRT9QCcXyf5NPs3eFCpTdQEg=;
  b=IxedV1+haPDW1PCwaLmuB24e7fik6fPBUja7i8I1by9NIwBIspnbW4sf
   c2s93sKArvX76dho6WdbIRuxsy6wMx//S09U1FTRrxnsqCbshNqoUpWRI
   d5LgbMDgv5WT6j1EWjxLv2N1FrvUK0o1z5pXIE+2lDACYjy9MtbmrOLcq
   sVT6WLQbykZJhE9xWVFQ/gmUSkDpw7e2R8VnSCu8BB61+BBUA4u9frZCG
   L3Jj/Ci6OH2p4XrfYBZ6zEKuRYd/r2p2f0A5ZBHHb2QBph/m0szhOJ51Q
   GayiPJtC3dWYcyt4UctD7dhIG+RvvmFxuDm3/xGAcn+Q0g6WmB/hKvT7s
   g==;
X-CSE-ConnectionGUID: UjZdfkb/SAeKuDRt/Z1UzA==
X-CSE-MsgGUID: 2UfycFRoRAWLgiDEcNP5KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="84729608"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="84729608"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 02:56:20 -0700
X-CSE-ConnectionGUID: /FbP810KQsWawhj3t/KSiw==
X-CSE-MsgGUID: qNyGb80VTa+dpW5MAt8N9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="261708507"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 17 Jul 2026 02:56:18 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkfIm-00000000Sc4-0GvH;
	Fri, 17 Jul 2026 09:56:16 +0000
Date: Fri, 17 Jul 2026 17:55:38 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-07-16 311/311]
 include/linux/fortify-string.h:208:9: error: first argument to
 '__builtin_choose_expr' not a constant
Message-ID: <202607171708.wv5p5jRi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-07-16
head:   e51d2e02d8d4c974132f00eec9d2215a476084f0
commit: e5cb44e887fc27a5ca0bcbcc673b11edb01174f8 [311/311] ASoC: soc-component: capsuling Component
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260717/202607171708.wv5p5jRi-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260717/202607171708.wv5p5jRi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607171708.wv5p5jRi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:132,
                    from include/trace/events/asoc.h:280,
                    from sound/soc/soc-core.c:43:
   include/trace/events/asoc.h: In function 'trace_event_get_offsets_snd_soc_dapm':
   include/trace/events/asoc.h:31:114: error: invalid use of undefined type 'struct snd_soc_component'
      31 |                 __string(       comp_name,      snd_soc_dapm_to_component(dapm) ? snd_soc_dapm_to_component(dapm)->name : "(none)")
         |                                                                                                                  ^~
   include/trace/trace_events.h:285:9: note: in definition of macro 'DECLARE_EVENT_CLASS'
     285 |         tstruct;                                                        \
         |         ^~~~~~~
   include/trace/events/asoc.h:29:9: note: in expansion of macro 'TP_STRUCT__entry'
      29 |         TP_STRUCT__entry(
         |         ^~~~~~~~~~~~~~~~
   include/trace/stages/stage5_get_offsets.h:59:29: note: in expansion of macro '__dynamic_array'
      59 | #define __string(item, src) __dynamic_array(char, item,                 \
         |                             ^~~~~~~~~~~~~~~
   include/linux/fortify-string.h:208:31: note: in expansion of macro '__is_constexpr'
     208 |         __builtin_choose_expr(__is_constexpr(__builtin_strlen(p)),      \
         |                               ^~~~~~~~~~~~~~
   include/trace/stages/stage5_get_offsets.h:60:21: note: in expansion of macro 'strlen'
      60 |                     strlen(__string_src(src)) + 1)                      \
         |                     ^~~~~~
   include/trace/events/asoc.h:31:17: note: in expansion of macro '__string'
      31 |                 __string(       comp_name,      snd_soc_dapm_to_component(dapm) ? snd_soc_dapm_to_component(dapm)->name : "(none)")
         |                 ^~~~~~~~
   include/trace/events/asoc.h:31:114: error: invalid use of undefined type 'struct snd_soc_component'
      31 |                 __string(       comp_name,      snd_soc_dapm_to_component(dapm) ? snd_soc_dapm_to_component(dapm)->name : "(none)")
         |                                                                                                                  ^~
   include/trace/trace_events.h:285:9: note: in definition of macro 'DECLARE_EVENT_CLASS'
     285 |         tstruct;                                                        \
         |         ^~~~~~~
   include/trace/events/asoc.h:29:9: note: in expansion of macro 'TP_STRUCT__entry'
      29 |         TP_STRUCT__entry(
         |         ^~~~~~~~~~~~~~~~
   include/trace/stages/stage5_get_offsets.h:59:29: note: in expansion of macro '__dynamic_array'
      59 | #define __string(item, src) __dynamic_array(char, item,                 \
         |                             ^~~~~~~~~~~~~~~
   include/trace/stages/stage5_get_offsets.h:60:21: note: in expansion of macro 'strlen'
      60 |                     strlen(__string_src(src)) + 1)                      \
         |                     ^~~~~~
   include/trace/events/asoc.h:31:17: note: in expansion of macro '__string'
      31 |                 __string(       comp_name,      snd_soc_dapm_to_component(dapm) ? snd_soc_dapm_to_component(dapm)->name : "(none)")
         |                 ^~~~~~~~
   include/trace/events/asoc.h:31:114: error: invalid use of undefined type 'struct snd_soc_component'
      31 |                 __string(       comp_name,      snd_soc_dapm_to_component(dapm) ? snd_soc_dapm_to_component(dapm)->name : "(none)")
         |                                                                                                                  ^~
   include/trace/trace_events.h:285:9: note: in definition of macro 'DECLARE_EVENT_CLASS'
     285 |         tstruct;                                                        \
         |         ^~~~~~~
   include/trace/events/asoc.h:29:9: note: in expansion of macro 'TP_STRUCT__entry'
      29 |         TP_STRUCT__entry(
         |         ^~~~~~~~~~~~~~~~
   include/trace/stages/stage5_get_offsets.h:59:29: note: in expansion of macro '__dynamic_array'
      59 | #define __string(item, src) __dynamic_array(char, item,                 \
         |                             ^~~~~~~~~~~~~~~
   include/trace/stages/stage5_get_offsets.h:60:21: note: in expansion of macro 'strlen'
      60 |                     strlen(__string_src(src)) + 1)                      \
         |                     ^~~~~~
   include/trace/events/asoc.h:31:17: note: in expansion of macro '__string'
      31 |                 __string(       comp_name,      snd_soc_dapm_to_component(dapm) ? snd_soc_dapm_to_component(dapm)->name : "(none)")
         |                 ^~~~~~~~
>> include/linux/fortify-string.h:208:9: error: first argument to '__builtin_choose_expr' not a constant
     208 |         __builtin_choose_expr(__is_constexpr(__builtin_strlen(p)),      \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:285:9: note: in definition of macro 'DECLARE_EVENT_CLASS'
     285 |         tstruct;                                                        \
         |         ^~~~~~~
   include/trace/events/asoc.h:29:9: note: in expansion of macro 'TP_STRUCT__entry'
      29 |         TP_STRUCT__entry(
         |         ^~~~~~~~~~~~~~~~
   include/trace/stages/stage5_get_offsets.h:59:29: note: in expansion of macro '__dynamic_array'
      59 | #define __string(item, src) __dynamic_array(char, item,                 \
         |                             ^~~~~~~~~~~~~~~
   include/trace/stages/stage5_get_offsets.h:60:21: note: in expansion of macro 'strlen'
      60 |                     strlen(__string_src(src)) + 1)                      \
         |                     ^~~~~~
   include/trace/events/asoc.h:31:17: note: in expansion of macro '__string'
      31 |                 __string(       comp_name,      snd_soc_dapm_to_component(dapm) ? snd_soc_dapm_to_component(dapm)->name : "(none)")
         |                 ^~~~~~~~
   include/trace/events/asoc.h:31:114: error: invalid use of undefined type 'struct snd_soc_component'
      31 |                 __string(       comp_name,      snd_soc_dapm_to_component(dapm) ? snd_soc_dapm_to_component(dapm)->name : "(none)")
         |                                                                                                                  ^~
   include/trace/trace_events.h:285:9: note: in definition of macro 'DECLARE_EVENT_CLASS'
     285 |         tstruct;                                                        \
         |         ^~~~~~~
   include/trace/events/asoc.h:29:9: note: in expansion of macro 'TP_STRUCT__entry'
      29 |         TP_STRUCT__entry(
         |         ^~~~~~~~~~~~~~~~
   include/trace/events/asoc.h:31:17: note: in expansion of macro '__string'
      31 |                 __string(       comp_name,      snd_soc_dapm_to_component(dapm) ? snd_soc_dapm_to_component(dapm)->name : "(none)")
         |                 ^~~~~~~~


vim +/__builtin_choose_expr +208 include/linux/fortify-string.h

369cd2165d7bea Kees Cook      2021-08-04  188  
67ebc3ab446230 Kees Cook      2022-02-08  189  /*
67ebc3ab446230 Kees Cook      2022-02-08  190   * Defined after fortified strnlen to reuse it. However, it must still be
67ebc3ab446230 Kees Cook      2022-02-08  191   * possible for strlen() to be used on compile-time strings for use in
67ebc3ab446230 Kees Cook      2022-02-08  192   * static initializers (i.e. as a constant expression).
67ebc3ab446230 Kees Cook      2022-02-08  193   */
03699f271de1f4 Kees Cook      2022-09-02  194  /**
03699f271de1f4 Kees Cook      2022-09-02  195   * strlen - Return count of characters in a NUL-terminated string
03699f271de1f4 Kees Cook      2022-09-02  196   *
03699f271de1f4 Kees Cook      2022-09-02  197   * @p: pointer to NUL-terminated string to count.
03699f271de1f4 Kees Cook      2022-09-02  198   *
03699f271de1f4 Kees Cook      2022-09-02  199   * Do not use this function unless the string length is known at
03699f271de1f4 Kees Cook      2022-09-02  200   * compile-time. When @p is unterminated, this function may crash
03699f271de1f4 Kees Cook      2022-09-02  201   * or return unexpected counts that could lead to memory content
03699f271de1f4 Kees Cook      2022-09-02  202   * exposures. Prefer strnlen().
03699f271de1f4 Kees Cook      2022-09-02  203   *
03699f271de1f4 Kees Cook      2022-09-02  204   * Returns number of characters in @p (NOT including the final NUL).
03699f271de1f4 Kees Cook      2022-09-02  205   *
03699f271de1f4 Kees Cook      2022-09-02  206   */
67ebc3ab446230 Kees Cook      2022-02-08  207  #define strlen(p)							\
67ebc3ab446230 Kees Cook      2022-02-08 @208  	__builtin_choose_expr(__is_constexpr(__builtin_strlen(p)),	\
67ebc3ab446230 Kees Cook      2022-02-08  209  		__builtin_strlen(p), __fortify_strlen(p))
92df138a8d663c Kees Cook      2022-02-08  210  __FORTIFY_INLINE __diagnose_as(__builtin_strlen, 1)
281d0c962752fb Kees Cook      2022-02-08  211  __kernel_size_t __fortify_strlen(const char * const POS p)
a28a6e860c6cf2 Francis Laniel 2021-02-25  212  {
21a2c74b0a2a78 Kees Cook      2023-04-07  213  	const size_t p_size = __member_size(p);
a28a6e860c6cf2 Francis Laniel 2021-02-25  214  	__kernel_size_t ret;
a28a6e860c6cf2 Francis Laniel 2021-02-25  215  
3009f891bb9f32 Kees Cook      2021-08-02  216  	/* Give up if we don't know how large p is. */
311fb40aa0569a Kees Cook      2022-09-02  217  	if (p_size == SIZE_MAX)
a28a6e860c6cf2 Francis Laniel 2021-02-25  218  		return __underlying_strlen(p);
a28a6e860c6cf2 Francis Laniel 2021-02-25  219  	ret = strnlen(p, p_size);
a28a6e860c6cf2 Francis Laniel 2021-02-25  220  	if (p_size <= ret)
3d965b33e40d97 Kees Cook      2023-04-07  221  		fortify_panic(FORTIFY_FUNC_strlen, FORTIFY_READ, p_size, ret + 1, ret);
a28a6e860c6cf2 Francis Laniel 2021-02-25  222  	return ret;
a28a6e860c6cf2 Francis Laniel 2021-02-25  223  }
a28a6e860c6cf2 Francis Laniel 2021-02-25  224  

:::::: The code at line 208 was first introduced by commit
:::::: 67ebc3ab446230c77fe3b545a9d8a11cac1cfb6e fortify: Make sure strlen() may still be used as a constant expression

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
