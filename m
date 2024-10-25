Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C395A1D356E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 11:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729855747; cv=none; b=HSfItI1ETmMz/ab88SGZ8F3ai4z11w0ovreUgVeZzMAzQYj0zCkrWkXrMTpgZbDa4Zn70F0iZRPeq84lbctPP5hKtvrcHZNDIk5jf3IOM+aNUxwwHOucyOCyAddeU/sJGhf80bQ1Clq0d2tqdhkScAe52jpsYGpc4tQ+UOv/EDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729855747; c=relaxed/simple;
	bh=7/3aJjHXgWwanJDdzrRXa9URaVPLVzzDP3RPeaDzYuc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SYItwrqaBSv9x7//eCVrp1O3MOC8G/AO/SMri5/E03dIlpfgMnGCY6w0gzWzhzIyjRi6Y48AYwV94jAEKi2jBEsIxyK/Lmn4eM8a81hITVCd6BiOAiKWkG80hv+Ij3ZxM5QZ7FAd2Xprml8c0MPFW4C3/ag8cf68MHh4GYuvwVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PR9egctn; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PR9egctn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729855742; x=1761391742;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7/3aJjHXgWwanJDdzrRXa9URaVPLVzzDP3RPeaDzYuc=;
  b=PR9egctnSmEQGyZIZ31VYP/rY05xiKjtgxc5imVVq3aWCiFnuypBfr/p
   5XjpcH3tRAIBe4GtpHSc+FPT+MInXPrY0+yatlgltMq57xBMe3wp+lHa4
   4jv0hDsjTeIWQzWJ8vngExv1E49c8D38Vc1XAnX2x8Ac2PY2EBQYJZcwq
   7vGMw79Efk8ZEvcjynZAaYUsgvTzgImdnvNsSGZcj/8UmstU0BF+P5CGM
   pAV4iK3L0o6wE80TQuqMJYLgMpxaIvwXW00VAAjGSF4JQPCI724gfCsou
   Fa7QnIPZ6FjbpAhIxM7cTDilKIKg/OKSBSWXeKu6rzI1JaC3DY3SumJkV
   w==;
X-CSE-ConnectionGUID: T4+E1JMgQV+TxFU1qIjNaw==
X-CSE-MsgGUID: KGtdCud0RD++/8PrRj192g==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="33432477"
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="33432477"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 04:29:02 -0700
X-CSE-ConnectionGUID: amiAsskLTvWPSNvJPcImxw==
X-CSE-MsgGUID: lN8bxz+uTweTua05RyyPxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="80997979"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 25 Oct 2024 04:29:00 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4IV0-000YAG-1O;
	Fri, 25 Oct 2024 11:28:58 +0000
Date: Fri, 25 Oct 2024 19:28:37 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-pcmv2-2024-10-22 2/3] sound/soc/soc-core.c:1485:34:
 error: 'struct snd_soc_dai_link' has no member named 'no_pcm'
Message-ID: <202410251947.1MKvOoGZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/morimoto/linux sound-pcmv2-2024-10-22
head:   ad08834668b453f25c4d160e515f18b8f3d5fd39
commit: 9c5ddaa0866d7901f7f8a0203fcf371ba5c67cde [2/3] rtd1 / dai_link1
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20241025/202410251947.1MKvOoGZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410251947.1MKvOoGZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410251947.1MKvOoGZ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/sound/soc-dpcm.h:14,
                    from sound/soc/soc-core.c:39:
   include/sound/soc-pcm.h:20:37: error: array type has incomplete element type 'struct snd_soc_dpcm_runtime'
      20 |         struct snd_soc_dpcm_runtime dpcm[SNDRV_PCM_STREAM_LAST + 1];
         |                                     ^~~~
   include/sound/soc-pcm.h:44:35: error: array type has incomplete element type 'enum snd_soc_dpcm_trigger'
      44 |         enum snd_soc_dpcm_trigger trigger[2]; /* trigger type for DPCM */
         |                                   ^~~~~~~
   sound/soc/soc-core.c: In function 'soc_init_pcm_runtime':
>> sound/soc/soc-core.c:1485:34: error: 'struct snd_soc_dai_link' has no member named 'no_pcm'
    1485 |                 if (rtd->dai_link->no_pcm)
         |                                  ^~
   sound/soc/soc-core.c: In function 'soc_check_tplg_fes':
>> sound/soc/soc-core.c:1988:37: error: 'struct snd_soc_dai_link' has no member named 'dynamic'
    1988 |                         if (dai_link->dynamic) {
         |                                     ^~
   sound/soc/soc-core.c:2008:38: error: 'struct snd_soc_dai_link' has no member named 'no_pcm'
    2008 |                         if (!dai_link->no_pcm) {
         |                                      ^~
   sound/soc/soc-core.c:2009:41: error: 'struct snd_soc_dai_link' has no member named 'no_pcm'
    2009 |                                 dai_link->no_pcm = 1;
         |                                         ^~
>> sound/soc/soc-core.c:2011:45: error: 'struct snd_soc_dai_link' has no member named 'dpcm_playback'
    2011 |                                 if (dai_link->dpcm_playback)
         |                                             ^~
>> sound/soc/soc-core.c:2015:45: error: 'struct snd_soc_dai_link' has no member named 'dpcm_capture'
    2015 |                                 if (dai_link->dpcm_capture)
         |                                             ^~
   sound/soc/soc-core.c:2021:47: error: 'struct snd_soc_dai_link' has no member named 'dpcm_playback'
    2021 |                                 if (!(dai_link->dpcm_playback ||
         |                                               ^~
   sound/soc/soc-core.c:2022:47: error: 'struct snd_soc_dai_link' has no member named 'dpcm_capture'
    2022 |                                       dai_link->dpcm_capture)) {
         |                                               ^~
   sound/soc/soc-core.c:2023:49: error: 'struct snd_soc_dai_link' has no member named 'dpcm_playback'
    2023 |                                         dai_link->dpcm_playback = !dai_link->capture_only;
         |                                                 ^~
   sound/soc/soc-core.c:2024:49: error: 'struct snd_soc_dai_link' has no member named 'dpcm_capture'
    2024 |                                         dai_link->dpcm_capture = !dai_link->playback_only;
         |                                                 ^~
   sound/soc/soc-core.c: In function 'snd_soc_get_stream_cpu':
>> sound/soc/soc-core.c:3451:22: error: 'const struct snd_soc_dai_link' has no member named 'c2c_params'
    3451 |         if (!dai_link->c2c_params)
         |                      ^~
--
   sound/soc/soc-dapm.c: In function 'dapm_new_dai_link':
>> sound/soc/soc-dapm.c:1086:26: error: 'struct snd_soc_dai_link' has no member named 'num_c2c_params'
    1086 |         if (rtd->dai_link->num_c2c_params <= 1)
         |                          ^~
   sound/soc/soc-dapm.c: In function 'snd_soc_dapm_mux_update_power':
>> sound/soc/soc-dapm.c:2373:17: error: implicit declaration of function 'snd_soc_dpcm_runtime_update' [-Werror=implicit-function-declaration]
    2373 |                 snd_soc_dpcm_runtime_update(card);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-dapm.c: In function 'snd_soc_dai_link_event_pre_pmu':
   sound/soc/soc-dapm.c:3938:31: error: 'struct snd_soc_dai_link' has no member named 'c2c_params'
    3938 |         config = rtd->dai_link->c2c_params + rtd->c2c_params_select;
         |                               ^~
   sound/soc/soc-dapm.c:3938:49: error: 'struct snd_soc_pcm_runtime' has no member named 'c2c_params_select'
    3938 |         config = rtd->dai_link->c2c_params + rtd->c2c_params_select;
         |                                                 ^~
   sound/soc/soc-dapm.c: In function 'snd_soc_dapm_dai_link_get':
   sound/soc/soc-dapm.c:4079:49: error: 'struct snd_soc_pcm_runtime' has no member named 'c2c_params_select'
    4079 |         ucontrol->value.enumerated.item[0] = rtd->c2c_params_select;
         |                                                 ^~
   sound/soc/soc-dapm.c: In function 'snd_soc_dapm_dai_link_put':
   sound/soc/soc-dapm.c:4094:54: error: 'struct snd_soc_pcm_runtime' has no member named 'c2c_params_select'
    4094 |         if (ucontrol->value.enumerated.item[0] == rtd->c2c_params_select)
         |                                                      ^~
   sound/soc/soc-dapm.c:4097:64: error: 'struct snd_soc_dai_link' has no member named 'num_c2c_params'
    4097 |         if (ucontrol->value.enumerated.item[0] >= rtd->dai_link->num_c2c_params)
         |                                                                ^~
   sound/soc/soc-dapm.c:4100:12: error: 'struct snd_soc_pcm_runtime' has no member named 'c2c_params_select'
    4100 |         rtd->c2c_params_select = ucontrol->value.enumerated.item[0];
         |            ^~
   sound/soc/soc-dapm.c: In function 'snd_soc_dapm_new_dai':
   sound/soc/soc-dapm.c:4215:26: error: 'struct snd_soc_dai_link' has no member named 'num_c2c_params'
    4215 |         if (rtd->dai_link->num_c2c_params > 1) {
         |                          ^~
   sound/soc/soc-dapm.c:4217:58: error: 'struct snd_soc_dai_link' has no member named 'num_c2c_params'
    4217 |                                             rtd->dai_link->num_c2c_params,
         |                                                          ^~
   sound/soc/soc-dapm.c:4224:74: error: 'struct snd_soc_dai_link' has no member named 'c2c_params'
    4224 |                                                             rtd->dai_link->c2c_params,
         |                                                                          ^~
   sound/soc/soc-dapm.c:4225:74: error: 'struct snd_soc_dai_link' has no member named 'num_c2c_params'
    4225 |                                                             rtd->dai_link->num_c2c_params,
         |                                                                          ^~
   sound/soc/soc-dapm.c:4256:49: error: 'struct snd_soc_dai_link' has no member named 'num_c2c_params'
    4256 |                                    rtd->dai_link->num_c2c_params, w_param_text);
         |                                                 ^~
   sound/soc/soc-dapm.c: In function 'dapm_connect_dai_pair':
   sound/soc/soc-dapm.c:4422:29: error: 'struct snd_soc_dai_link' has no member named 'c2c_params'
    4422 |                 if (dai_link->c2c_params && !rtd->c2c_widget[stream]) {
         |                             ^~
   sound/soc/soc-dapm.c:4422:49: error: 'struct snd_soc_pcm_runtime' has no member named 'c2c_widget'
    4422 |                 if (dai_link->c2c_params && !rtd->c2c_widget[stream]) {
         |                                                 ^~
   sound/soc/soc-dapm.c:4430:28: error: 'struct snd_soc_pcm_runtime' has no member named 'c2c_widget'
    4430 |                         rtd->c2c_widget[stream] = dai;
         |                            ^~
   sound/soc/soc-dapm.c:4434:44: error: 'struct snd_soc_pcm_runtime' has no member named 'c2c_widget'
    4434 |                                         rtd->c2c_widget[stream],
         |                                            ^~
   sound/soc/soc-dapm.c: In function 'snd_soc_dapm_connect_dai_link_widgets':
>> sound/soc/soc-dapm.c:4492:34: error: 'struct snd_soc_dai_link' has no member named 'dynamic'
    4492 |                 if (rtd->dai_link->dynamic)
         |                                  ^~
   cc1: some warnings being treated as errors
--
   sound/soc/soc-utils.c: In function 'dummy_dma_open':
>> sound/soc/soc-utils.c:134:55: error: implicit declaration of function 'snd_soc_dai_link_to_link1'; did you mean 'snd_soc_link_to_codec'? [-Werror=implicit-function-declaration]
     134 |                 struct snd_soc_dai_link1 *dai_link1 = snd_soc_dai_link_to_link1(rtd->dai_link);
         |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                       snd_soc_link_to_codec
>> sound/soc/soc-utils.c:134:55: warning: initialization of 'struct snd_soc_dai_link1 *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>> sound/soc/soc-utils.c:136:31: error: invalid use of undefined type 'struct snd_soc_dai_link1'
     136 |                 if (!dai_link1->no_pcm)
         |                               ^~
   cc1: some warnings being treated as errors
--
   In file included from include/sound/soc-dpcm.h:14,
                    from sound/soc/soc-pcm.c:25:
   include/sound/soc-pcm.h:20:37: error: array type has incomplete element type 'struct snd_soc_dpcm_runtime'
      20 |         struct snd_soc_dpcm_runtime dpcm[SNDRV_PCM_STREAM_LAST + 1];
         |                                     ^~~~
   include/sound/soc-pcm.h:44:35: error: array type has incomplete element type 'enum snd_soc_dpcm_trigger'
      44 |         enum snd_soc_dpcm_trigger trigger[2]; /* trigger type for DPCM */
         |                                   ^~~~~~~
   sound/soc/soc-pcm.c: In function '_soc_pcm_ret':
   include/sound/soc-pcm.h:13:36: error: incompatible types when initializing type 'struct snd_soc_pcm_runtime *' using type 'struct snd_soc_pcm_runtime'
      13 | #define snd_soc_rtd1_to_rtd(_rtd1) (_rtd1->rtd)
         |                                    ^
   sound/soc/soc-pcm.c:33:43: note: in expansion of macro 'snd_soc_rtd1_to_rtd'
      33 |         struct snd_soc_pcm_runtime *rtd = snd_soc_rtd1_to_rtd(rtd1);
         |                                           ^~~~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c: In function 'snd_soc_dpcm_be_can_update':
   sound/soc/soc-pcm.c:66:70: warning: parameter 'stream' set but not used [-Wunused-but-set-parameter]
      66 |                                struct snd_soc_pcm_runtime1 *be1, int stream)
         |                                                                  ~~~~^~~~~~
   In file included from include/linux/container_of.h:5,
                    from include/linux/kernel.h:22,
                    from sound/soc/soc-pcm.c:13:
   sound/soc/soc-pcm.c: In function 'snd_soc_dpcm_check_state':
>> include/linux/compiler_types.h:458:27: error: expression in static assertion is not an integer
     458 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:612:9: note: in expansion of macro 'list_entry'
     612 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:778:20: note: in expansion of macro 'list_first_entry'
     778 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   include/sound/soc-dpcm.h:108:9: note: in expansion of macro 'list_for_each_entry'
     108 |         list_for_each_entry(_dpcm, &(be)->dpcm[stream].fe_clients, list_fe)
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:86:9: note: in expansion of macro 'for_each_dpcm_fe'
      86 |         for_each_dpcm_fe(be1, stream, dpcm) {
         |         ^~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:88:52: error: invalid operands to binary == (have 'struct snd_soc_pcm_runtime' and 'struct snd_soc_pcm_runtime1 *')
      88 |                 if (snd_soc_rtd1_to_rtd(dpcm->fe1) == fe1)
         |                                                    ^~
   sound/soc/soc-pcm.c:77:41: warning: parameter 'stream' set but not used [-Wunused-but-set-parameter]
      77 |                                     int stream,
         |                                     ~~~~^~~~~~
   sound/soc/soc-pcm.c: In function 'soc_cpu_dai_name':
   include/sound/soc-pcm.h:13:36: error: incompatible types when initializing type 'struct snd_soc_pcm_runtime *' using type 'struct snd_soc_pcm_runtime'
      13 | #define snd_soc_rtd1_to_rtd(_rtd1) (_rtd1->rtd)
         |                                    ^
   sound/soc/soc-pcm.c:157:43: note: in expansion of macro 'snd_soc_rtd1_to_rtd'
     157 |         struct snd_soc_pcm_runtime *rtd = snd_soc_rtd1_to_rtd(rtd1);
         |                                           ^~~~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c: In function 'soc_codec_dai_name':
   include/sound/soc-pcm.h:13:36: error: incompatible types when initializing type 'struct snd_soc_pcm_runtime *' using type 'struct snd_soc_pcm_runtime'
      13 | #define snd_soc_rtd1_to_rtd(_rtd1) (_rtd1->rtd)
         |                                    ^
   sound/soc/soc-pcm.c:163:43: note: in expansion of macro 'snd_soc_rtd1_to_rtd'
     163 |         struct snd_soc_pcm_runtime *rtd = snd_soc_rtd1_to_rtd(rtd1);
         |                                           ^~~~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c: In function 'dpcm_show_state':
>> include/linux/container_of.h:18:41: error: initialization of 'struct snd_soc_pcm_runtime *' from incompatible pointer type 'struct snd_soc_pcm_runtime1 *' [-Werror=incompatible-pointer-types]
      18 | #define container_of(ptr, type, member) ({                              \
         |                                         ^
   include/sound/soc-pcm.h:12:35: note: in expansion of macro 'container_of'
      12 | #define snd_soc_rtd_to_rtd1(_rtd) container_of((_rtd), struct snd_soc_pcm_runtime1, rtd)
         |                                   ^~~~~~~~~~~~
   sound/soc/soc-pcm.c:200:43: note: in expansion of macro 'snd_soc_rtd_to_rtd1'
     200 |         struct snd_soc_pcm_runtime *fe1 = snd_soc_rtd_to_rtd1(fe);
         |                                           ^~~~~~~~~~~~~~~~~~~
>> sound/soc/soc-pcm.c:201:50: error: 'struct snd_soc_pcm_runtime' has no member named 'dpcm'; did you mean 'pcm'?
     201 |         struct snd_pcm_hw_params *params = &fe1->dpcm[stream].hw_params;
         |                                                  ^~~~
         |                                                  pcm
   sound/soc/soc-pcm.c:211:51: error: 'struct snd_soc_pcm_runtime' has no member named 'dpcm'; did you mean 'pcm'?
     211 |                            dpcm_state_string(fe1->dpcm[stream].state));
         |                                                   ^~~~
         |                                                   pcm
   sound/soc/soc-pcm.c:213:19: error: 'struct snd_soc_pcm_runtime' has no member named 'dpcm'; did you mean 'pcm'?
     213 |         if ((fe1->dpcm[stream].state >= SND_SOC_DPCM_STATE_HW_PARAMS) &&
         |                   ^~~~
         |                   pcm
   sound/soc/soc-pcm.c:214:19: error: 'struct snd_soc_pcm_runtime' has no member named 'dpcm'; did you mean 'pcm'?
     214 |             (fe1->dpcm[stream].state <= SND_SOC_DPCM_STATE_STOP))
         |                   ^~~~
         |                   pcm
   sound/soc/soc-pcm.c:225:29: error: 'struct snd_soc_pcm_runtime' has no member named 'dpcm'; did you mean 'pcm'?
     225 |         if (list_empty(&fe->dpcm[stream].be_clients)) {
         |                             ^~~~
         |                             pcm
>> include/sound/soc-dpcm.h:111:43: error: 'struct snd_soc_pcm_runtime' has no member named 'dpcm'; did you mean 'pcm'?
     111 |         list_for_each_entry(_dpcm, &(fe)->dpcm[stream].be_clients, list_be)
         |                                           ^~~~
   include/linux/container_of.h:19:33: note: in definition of macro 'container_of'
      19 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   include/linux/list.h:612:9: note: in expansion of macro 'list_entry'
     612 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:778:20: note: in expansion of macro 'list_first_entry'
     778 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   include/sound/soc-dpcm.h:111:9: note: in expansion of macro 'list_for_each_entry'
     111 |         list_for_each_entry(_dpcm, &(fe)->dpcm[stream].be_clients, list_be)
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:231:9: note: in expansion of macro 'for_each_dpcm_be'
     231 |         for_each_dpcm_be(fe1, stream, dpcm) {
         |         ^~~~~~~~~~~~~~~~
>> include/sound/soc-dpcm.h:111:43: error: 'struct snd_soc_pcm_runtime' has no member named 'dpcm'; did you mean 'pcm'?
     111 |         list_for_each_entry(_dpcm, &(fe)->dpcm[stream].be_clients, list_be)
         |                                           ^~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:612:9: note: in expansion of macro 'list_entry'
     612 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:778:20: note: in expansion of macro 'list_first_entry'
     778 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   include/sound/soc-dpcm.h:111:9: note: in expansion of macro 'list_for_each_entry'
     111 |         list_for_each_entry(_dpcm, &(fe)->dpcm[stream].be_clients, list_be)
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:231:9: note: in expansion of macro 'for_each_dpcm_be'
     231 |         for_each_dpcm_be(fe1, stream, dpcm) {
         |         ^~~~~~~~~~~~~~~~
>> include/sound/soc-dpcm.h:111:43: error: 'struct snd_soc_pcm_runtime' has no member named 'dpcm'; did you mean 'pcm'?
     111 |         list_for_each_entry(_dpcm, &(fe)->dpcm[stream].be_clients, list_be)
         |                                           ^~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:612:9: note: in expansion of macro 'list_entry'
     612 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:778:20: note: in expansion of macro 'list_first_entry'
     778 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   include/sound/soc-dpcm.h:111:9: note: in expansion of macro 'list_for_each_entry'
     111 |         list_for_each_entry(_dpcm, &(fe)->dpcm[stream].be_clients, list_be)
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:231:9: note: in expansion of macro 'for_each_dpcm_be'
     231 |         for_each_dpcm_be(fe1, stream, dpcm) {
         |         ^~~~~~~~~~~~~~~~
>> include/linux/compiler_types.h:458:27: error: expression in static assertion is not an integer
     458 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:612:9: note: in expansion of macro 'list_entry'
     612 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:778:20: note: in expansion of macro 'list_first_entry'
     778 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   include/sound/soc-dpcm.h:111:9: note: in expansion of macro 'list_for_each_entry'
     111 |         list_for_each_entry(_dpcm, &(fe)->dpcm[stream].be_clients, list_be)
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:231:9: note: in expansion of macro 'for_each_dpcm_be'
     231 |         for_each_dpcm_be(fe1, stream, dpcm) {
         |         ^~~~~~~~~~~~~~~~
   In file included from include/linux/smp.h:12,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:2140,
                    from include/linux/delay.h:23,
                    from sound/soc/soc-pcm.c:15:
>> include/sound/soc-dpcm.h:111:43: error: 'struct snd_soc_pcm_runtime' has no member named 'dpcm'; did you mean 'pcm'?
     111 |         list_for_each_entry(_dpcm, &(fe)->dpcm[stream].be_clients, list_be)
         |                                           ^~~~
   include/linux/list.h:769:37: note: in definition of macro 'list_entry_is_head'
     769 |         list_is_head(&pos->member, (head))
         |                                     ^~~~
   include/sound/soc-dpcm.h:111:9: note: in expansion of macro 'list_for_each_entry'
     111 |         list_for_each_entry(_dpcm, &(fe)->dpcm[stream].be_clients, list_be)
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:231:9: note: in expansion of macro 'for_each_dpcm_be'
     231 |         for_each_dpcm_be(fe1, stream, dpcm) {
         |         ^~~~~~~~~~~~~~~~
>> sound/soc/soc-pcm.c:236:46: error: 'be' undeclared (first use in this function); did you mean 'be1'?
     236 |                                    "- %s\n", be->dai_link->name);
         |                                              ^~
         |                                              be1
   sound/soc/soc-pcm.c:236:46: note: each undeclared identifier is reported only once for each function it appears in
   sound/soc/soc-pcm.c: In function 'soc_dpcm_debugfs_add':
>> sound/soc/soc-pcm.c:295:27: error: 'struct snd_soc_dai_link' has no member named 'dynamic'
     295 |         if (!rtd->dai_link->dynamic)
         |                           ^~
   sound/soc/soc-pcm.c: In function 'dpcm_create_debugfs_state':
>> sound/soc/soc-pcm.c:312:56: error: 'struct snd_soc_pcm_runtime1' has no member named 'dai_link'
     312 |         name = kasprintf(GFP_KERNEL, "%s:%s", dpcm->be1->dai_link->name,
         |                                                        ^~
>> sound/soc/soc-pcm.c:316:37: error: 'struct snd_soc_dpcm' has no member named 'fe'; did you mean 'fe1'?
     316 |                         name, dpcm->fe->debugfs_dpcm_root);
         |                                     ^~
         |                                     fe1
   sound/soc/soc-pcm.c: In function 'dpcm_set_fe_update_state':
>> sound/soc/soc-pcm.c:349:44: error: passing argument 1 of 'snd_soc_dpcm_get_substream' from incompatible pointer type [-Werror=incompatible-pointer-types]
     349 |                 snd_soc_dpcm_get_substream(fe1, stream);
         |                                            ^~~
         |                                            |
         |                                            struct snd_soc_pcm_runtime1 *
   include/sound/soc-dpcm.h:120:64: note: expected 'struct snd_soc_pcm_runtime *' but argument is of type 'struct snd_soc_pcm_runtime1 *'
     120 |         snd_soc_dpcm_get_substream(struct snd_soc_pcm_runtime *be, int stream);
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
   sound/soc/soc-pcm.c: In function 'dpcm_set_be_update_state':
   sound/soc/soc-pcm.c:362:42: warning: parameter 'stream' set but not used [-Wunused-but-set-parameter]
     362 |                                      int stream, enum snd_soc_dpcm_update state)
         |                                      ~~~~^~~~~~
   sound/soc/soc-pcm.c: At top level:
   sound/soc/soc-pcm.c:427:5: error: conflicting types for 'dpcm_dapm_stream_event'; have 'int(struct snd_soc_pcm_runtime1 *, int,  int)'
     427 | int dpcm_dapm_stream_event(struct snd_soc_pcm_runtime1 *fe1, int dir,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   include/sound/soc-dpcm.h:147:5: note: previous declaration of 'dpcm_dapm_stream_event' with type 'int(struct snd_soc_pcm_runtime *, int,  int)'
     147 | int dpcm_dapm_stream_event(struct snd_soc_pcm_runtime *fe, int dir,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   In file included from sound/soc/soc-pcm.c:24:
   sound/soc/soc-pcm.c: In function 'dpcm_dapm_stream_event':
>> sound/soc/soc-pcm.c:432:40: error: 'fe' undeclared (first use in this function); did you mean 'fe1'?
     432 |         snd_soc_dpcm_mutex_assert_held(fe);
         |                                        ^~
   include/sound/soc.h:1564:53: note: in definition of macro 'snd_soc_dpcm_mutex_assert_held'
    1564 | #define snd_soc_dpcm_mutex_assert_held(x) _Generic((x),         \
         |                                                     ^
>> include/linux/compiler_types.h:458:27: error: expression in static assertion is not an integer
     458 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:612:9: note: in expansion of macro 'list_entry'
     612 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:778:20: note: in expansion of macro 'list_first_entry'
     778 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   include/sound/soc-dpcm.h:111:9: note: in expansion of macro 'list_for_each_entry'
     111 |         list_for_each_entry(_dpcm, &(fe)->dpcm[stream].be_clients, list_be)
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:434:9: note: in expansion of macro 'for_each_dpcm_be'
     434 |         for_each_dpcm_be(fe1, dir, dpcm) {
         |         ^~~~~~~~~~~~~~~~
   include/sound/soc-pcm.h:13:36: error: incompatible types when initializing type 'struct snd_soc_pcm_runtime *' using type 'struct snd_soc_pcm_runtime'
      13 | #define snd_soc_rtd1_to_rtd(_rtd1) (_rtd1->rtd)
         |                                    ^
   sound/soc/soc-pcm.c:436:51: note: in expansion of macro 'snd_soc_rtd1_to_rtd'
     436 |                 struct snd_soc_pcm_runtime  *be = snd_soc_rtd1_to_rtd(be1);
         |                                                   ^~~~~~~~~~~~~~~~~~~
>> sound/soc/soc-pcm.c:445:43: error: passing argument 1 of 'snd_soc_dapm_stream_event' from incompatible pointer type [-Werror=incompatible-pointer-types]
     445 |                 snd_soc_dapm_stream_event(be1, dir, event);
         |                                           ^~~
         |                                           |
         |                                           struct snd_soc_pcm_runtime1 *
   In file included from include/sound/soc.h:440:
   include/sound/soc-dapm.h:488:60: note: expected 'struct snd_soc_pcm_runtime *' but argument is of type 'struct snd_soc_pcm_runtime1 *'
     488 | void snd_soc_dapm_stream_event(struct snd_soc_pcm_runtime *rtd, int stream, int event);
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   sound/soc/soc-pcm.c:448:35: error: passing argument 1 of 'snd_soc_dapm_stream_event' from incompatible pointer type [-Werror=incompatible-pointer-types]
     448 |         snd_soc_dapm_stream_event(fe1, dir, event);
         |                                   ^~~
         |                                   |
         |                                   struct snd_soc_pcm_runtime1 *
   include/sound/soc-dapm.h:488:60: note: expected 'struct snd_soc_pcm_runtime *' but argument is of type 'struct snd_soc_pcm_runtime1 *'
     488 | void snd_soc_dapm_stream_event(struct snd_soc_pcm_runtime *rtd, int stream, int event);
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   sound/soc/soc-pcm.c: In function 'soc_hw_sanity_check':
   sound/soc/soc-pcm.c:841:49: error: passing argument 1 of 'soc_cpu_dai_name' from incompatible pointer type [-Werror=incompatible-pointer-types]
     841 |         const char *name_cpu = soc_cpu_dai_name(rtd);
         |                                                 ^~~
         |                                                 |
         |                                                 struct snd_soc_pcm_runtime *
   sound/soc/soc-pcm.c:155:73: note: expected 'struct snd_soc_pcm_runtime1 *' but argument is of type 'struct snd_soc_pcm_runtime *'
     155 | static inline const char *soc_cpu_dai_name(struct snd_soc_pcm_runtime1 *rtd1)
         |                                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   sound/soc/soc-pcm.c:842:53: error: passing argument 1 of 'soc_codec_dai_name' from incompatible pointer type [-Werror=incompatible-pointer-types]
     842 |         const char *name_codec = soc_codec_dai_name(rtd);
         |                                                     ^~~
         |                                                     |
         |                                                     struct snd_soc_pcm_runtime *
   sound/soc/soc-pcm.c:161:75: note: expected 'struct snd_soc_pcm_runtime1 *' but argument is of type 'struct snd_soc_pcm_runtime *'
     161 | static inline const char *soc_codec_dai_name(struct snd_soc_pcm_runtime1 *rtd1)
         |                                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   sound/soc/soc-pcm.c: In function '__soc_pcm_open':
   sound/soc/soc-pcm.c:912:26: error: 'struct snd_soc_dai_link' has no member named 'dynamic'
     912 |         if (rtd->dai_link->dynamic || rtd->dai_link->no_pcm)
         |                          ^~
>> sound/soc/soc-pcm.c:912:52: error: 'struct snd_soc_dai_link' has no member named 'no_pcm'
     912 |         if (rtd->dai_link->dynamic || rtd->dai_link->no_pcm)
         |                                                    ^~
>> sound/soc/soc-pcm.c:939:28: error: passing argument 1 of '_soc_pcm_ret' from incompatible pointer type [-Werror=incompatible-pointer-types]
     939 |         return soc_pcm_ret(rtd, ret);
         |                            ^~~
         |                            |
         |                            struct snd_soc_pcm_runtime *
   sound/soc/soc-pcm.c:29:44: note: in definition of macro 'soc_pcm_ret'
      29 | #define soc_pcm_ret(rtd, ret) _soc_pcm_ret(rtd, __func__, ret)
         |                                            ^~~
   sound/soc/soc-pcm.c:30:61: note: expected 'struct snd_soc_pcm_runtime1 *' but argument is of type 'struct snd_soc_pcm_runtime *'
      30 | static inline int _soc_pcm_ret(struct snd_soc_pcm_runtime1 *rtd1,
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   sound/soc/soc-pcm.c: In function '__soc_pcm_prepare':
   sound/soc/soc-pcm.c:995:28: error: passing argument 1 of '_soc_pcm_ret' from incompatible pointer type [-Werror=incompatible-pointer-types]
     995 |         return soc_pcm_ret(rtd, ret);
         |                            ^~~
         |                            |
         |                            struct snd_soc_pcm_runtime *
   sound/soc/soc-pcm.c:29:44: note: in definition of macro 'soc_pcm_ret'
      29 | #define soc_pcm_ret(rtd, ret) _soc_pcm_ret(rtd, __func__, ret)
         |                                            ^~~
   sound/soc/soc-pcm.c:30:61: note: expected 'struct snd_soc_pcm_runtime1 *' but argument is of type 'struct snd_soc_pcm_runtime *'
      30 | static inline int _soc_pcm_ret(struct snd_soc_pcm_runtime1 *rtd1,
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   sound/soc/soc-pcm.c: In function '__soc_pcm_hw_params':
   sound/soc/soc-pcm.c:1181:28: error: passing argument 1 of '_soc_pcm_ret' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1181 |         return soc_pcm_ret(rtd, ret);
         |                            ^~~
         |                            |
         |                            struct snd_soc_pcm_runtime *
   sound/soc/soc-pcm.c:29:44: note: in definition of macro 'soc_pcm_ret'
      29 | #define soc_pcm_ret(rtd, ret) _soc_pcm_ret(rtd, __func__, ret)
         |                                            ^~~
   sound/soc/soc-pcm.c:30:61: note: expected 'struct snd_soc_pcm_runtime1 *' but argument is of type 'struct snd_soc_pcm_runtime *'
      30 | static inline int _soc_pcm_ret(struct snd_soc_pcm_runtime1 *rtd1,
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   sound/soc/soc-pcm.c: In function 'dpcm_be_connect':
>> include/sound/soc-dpcm.h:111:43: error: 'struct snd_soc_pcm_runtime' has no member named 'dpcm'; did you mean 'pcm'?
     111 |         list_for_each_entry(_dpcm, &(fe)->dpcm[stream].be_clients, list_be)
         |                                           ^~~~
   include/linux/container_of.h:19:33: note: in definition of macro 'container_of'
      19 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   include/linux/list.h:612:9: note: in expansion of macro 'list_entry'
     612 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:778:20: note: in expansion of macro 'list_first_entry'
     778 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   include/sound/soc-dpcm.h:111:9: note: in expansion of macro 'list_for_each_entry'
     111 |         list_for_each_entry(_dpcm, &(fe)->dpcm[stream].be_clients, list_be)
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:1322:9: note: in expansion of macro 'for_each_dpcm_be'
    1322 |         for_each_dpcm_be(fe, stream, dpcm) {
         |         ^~~~~~~~~~~~~~~~
>> include/sound/soc-dpcm.h:111:43: error: 'struct snd_soc_pcm_runtime' has no member named 'dpcm'; did you mean 'pcm'?
     111 |         list_for_each_entry(_dpcm, &(fe)->dpcm[stream].be_clients, list_be)
         |                                           ^~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:612:9: note: in expansion of macro 'list_entry'
     612 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:778:20: note: in expansion of macro 'list_first_entry'
     778 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   include/sound/soc-dpcm.h:111:9: note: in expansion of macro 'list_for_each_entry'
     111 |         list_for_each_entry(_dpcm, &(fe)->dpcm[stream].be_clients, list_be)
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:1322:9: note: in expansion of macro 'for_each_dpcm_be'
    1322 |         for_each_dpcm_be(fe, stream, dpcm) {
         |         ^~~~~~~~~~~~~~~~
   include/sound/soc-dpcm.h:111:43: error: 'struct snd_soc_pcm_runtime' has no member named 'dpcm'; did you mean 'pcm'?
     111 |         list_for_each_entry(_dpcm, &(fe)->dpcm[stream].be_clients, list_be)
         |                                           ^~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:612:9: note: in expansion of macro 'list_entry'
     612 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:778:20: note: in expansion of macro 'list_first_entry'
     778 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   include/sound/soc-dpcm.h:111:9: note: in expansion of macro 'list_for_each_entry'
     111 |         list_for_each_entry(_dpcm, &(fe)->dpcm[stream].be_clients, list_be)
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:1322:9: note: in expansion of macro 'for_each_dpcm_be'
    1322 |         for_each_dpcm_be(fe, stream, dpcm) {
         |         ^~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:458:27: error: expression in static assertion is not an integer
     458 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:612:9: note: in expansion of macro 'list_entry'
     612 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:778:20: note: in expansion of macro 'list_first_entry'
     778 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   include/sound/soc-dpcm.h:111:9: note: in expansion of macro 'list_for_each_entry'
     111 |         list_for_each_entry(_dpcm, &(fe)->dpcm[stream].be_clients, list_be)
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:1322:9: note: in expansion of macro 'for_each_dpcm_be'
    1322 |         for_each_dpcm_be(fe, stream, dpcm) {
         |         ^~~~~~~~~~~~~~~~
   include/sound/soc-dpcm.h:111:43: error: 'struct snd_soc_pcm_runtime' has no member named 'dpcm'; did you mean 'pcm'?
     111 |         list_for_each_entry(_dpcm, &(fe)->dpcm[stream].be_clients, list_be)
         |                                           ^~~~
   include/linux/list.h:769:37: note: in definition of macro 'list_entry_is_head'
     769 |         list_is_head(&pos->member, (head))
         |                                     ^~~~
   include/sound/soc-dpcm.h:111:9: note: in expansion of macro 'list_for_each_entry'
     111 |         list_for_each_entry(_dpcm, &(fe)->dpcm[stream].be_clients, list_be)
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:1322:9: note: in expansion of macro 'for_each_dpcm_be'
    1322 |         for_each_dpcm_be(fe, stream, dpcm) {
         |         ^~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:1323:27: error: 'struct snd_soc_dpcm' has no member named 'be'; did you mean 'be1'?
    1323 |                 if (dpcm->be == be && dpcm->fe == fe)
         |                           ^~
         |                           be1
   sound/soc/soc-pcm.c:1323:45: error: 'struct snd_soc_dpcm' has no member named 'fe'; did you mean 'fe1'?
    1323 |                 if (dpcm->be == be && dpcm->fe == fe)
         |                                             ^~
         |                                             fe1
..

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +1485 sound/soc/soc-core.c

4d1a98b5f1abaa Kuninori Morimoto  2021-05-27  1452  
eaffeefbd042a4 Kuninori Morimoto  2019-12-10  1453  static int soc_init_pcm_runtime(struct snd_soc_card *card,
46496acbe1c43c Kuninori Morimoto  2019-12-10  1454  				struct snd_soc_pcm_runtime *rtd)
46496acbe1c43c Kuninori Morimoto  2019-12-10  1455  {
46496acbe1c43c Kuninori Morimoto  2019-12-10  1456  	struct snd_soc_dai_link *dai_link = rtd->dai_link;
eeec74aa0ff8af Kuninori Morimoto  2023-09-11  1457  	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
46496acbe1c43c Kuninori Morimoto  2019-12-10  1458  	struct snd_soc_component *component;
613fb50059cf19 Kuninori Morimoto  2020-01-10  1459  	int ret, num, i;
46496acbe1c43c Kuninori Morimoto  2019-12-10  1460  
46496acbe1c43c Kuninori Morimoto  2019-12-10  1461  	/* do machine specific initialization */
02e756363fc936 Kuninori Morimoto  2020-05-25  1462  	ret = snd_soc_link_init(rtd);
02e756363fc936 Kuninori Morimoto  2020-05-25  1463  	if (ret < 0)
46496acbe1c43c Kuninori Morimoto  2019-12-10  1464  		return ret;
46496acbe1c43c Kuninori Morimoto  2019-12-10  1465  
ba9e82a1c89193 Kuninori Morimoto  2021-05-27  1466  	snd_soc_runtime_get_dai_fmt(rtd);
46496acbe1c43c Kuninori Morimoto  2019-12-10  1467  	ret = snd_soc_runtime_set_dai_fmt(rtd, dai_link->dai_fmt);
46496acbe1c43c Kuninori Morimoto  2019-12-10  1468  	if (ret)
dd9f9cc1e6b939 Amadeusz Sławiński 2023-09-29  1469  		goto err;
46496acbe1c43c Kuninori Morimoto  2019-12-10  1470  
46496acbe1c43c Kuninori Morimoto  2019-12-10  1471  	/* add DPCM sysfs entries */
46496acbe1c43c Kuninori Morimoto  2019-12-10  1472  	soc_dpcm_debugfs_add(rtd);
46496acbe1c43c Kuninori Morimoto  2019-12-10  1473  
46496acbe1c43c Kuninori Morimoto  2019-12-10  1474  	num = rtd->num;
46496acbe1c43c Kuninori Morimoto  2019-12-10  1475  
46496acbe1c43c Kuninori Morimoto  2019-12-10  1476  	/*
46496acbe1c43c Kuninori Morimoto  2019-12-10  1477  	 * most drivers will register their PCMs using DAI link ordering but
46496acbe1c43c Kuninori Morimoto  2019-12-10  1478  	 * topology based drivers can use the DAI link id field to set PCM
46496acbe1c43c Kuninori Morimoto  2019-12-10  1479  	 * device number and then use rtd + a base offset of the BEs.
46496acbe1c43c Kuninori Morimoto  2019-12-10  1480  	 */
613fb50059cf19 Kuninori Morimoto  2020-01-10  1481  	for_each_rtd_components(rtd, i, component) {
46496acbe1c43c Kuninori Morimoto  2019-12-10  1482  		if (!component->driver->use_dai_pcm_id)
46496acbe1c43c Kuninori Morimoto  2019-12-10  1483  			continue;
46496acbe1c43c Kuninori Morimoto  2019-12-10  1484  
46496acbe1c43c Kuninori Morimoto  2019-12-10 @1485  		if (rtd->dai_link->no_pcm)
46496acbe1c43c Kuninori Morimoto  2019-12-10  1486  			num += component->driver->be_pcm_base;
46496acbe1c43c Kuninori Morimoto  2019-12-10  1487  		else
46496acbe1c43c Kuninori Morimoto  2019-12-10  1488  			num = rtd->dai_link->id;
46496acbe1c43c Kuninori Morimoto  2019-12-10  1489  	}
46496acbe1c43c Kuninori Morimoto  2019-12-10  1490  
46496acbe1c43c Kuninori Morimoto  2019-12-10  1491  	/* create compress_device if possible */
46496acbe1c43c Kuninori Morimoto  2019-12-10  1492  	ret = snd_soc_dai_compress_new(cpu_dai, rtd, num);
62462e01822089 Kuninori Morimoto  2021-03-15  1493  	if (ret != -ENOTSUPP)
dd9f9cc1e6b939 Amadeusz Sławiński 2023-09-29  1494  		goto err;
46496acbe1c43c Kuninori Morimoto  2019-12-10  1495  
46496acbe1c43c Kuninori Morimoto  2019-12-10  1496  	/* create the pcm */
a9e61b84b7c43c Kuninori Morimoto  2024-09-13  1497  	switch (rtd->dai_link->version) {
a9e61b84b7c43c Kuninori Morimoto  2024-09-13  1498  	case SND_SOC_LINK_VER1:
46496acbe1c43c Kuninori Morimoto  2019-12-10  1499  		ret = soc_new_pcm(rtd, num);
46496acbe1c43c Kuninori Morimoto  2019-12-10  1500  		if (ret < 0) {
46496acbe1c43c Kuninori Morimoto  2019-12-10  1501  			dev_err(card->dev, "ASoC: can't create pcm %s :%d\n",
46496acbe1c43c Kuninori Morimoto  2019-12-10  1502  				dai_link->stream_name, ret);
dd9f9cc1e6b939 Amadeusz Sławiński 2023-09-29  1503  			goto err;
46496acbe1c43c Kuninori Morimoto  2019-12-10  1504  		}
a9e61b84b7c43c Kuninori Morimoto  2024-09-13  1505  		break;
a9e61b84b7c43c Kuninori Morimoto  2024-09-13  1506  	default:
a9e61b84b7c43c Kuninori Morimoto  2024-09-13  1507  		dev_err(card->dev, "unsupported link version is selected\n");
a9e61b84b7c43c Kuninori Morimoto  2024-09-13  1508  		ret = -EINVAL;
a9e61b84b7c43c Kuninori Morimoto  2024-09-13  1509  		goto err;
a9e61b84b7c43c Kuninori Morimoto  2024-09-13  1510  	}
d1eb6d116123b2 Kuninori Morimoto  2020-03-16  1511  
dd9f9cc1e6b939 Amadeusz Sławiński 2023-09-29  1512  	ret = snd_soc_pcm_dai_new(rtd);
dd9f9cc1e6b939 Amadeusz Sławiński 2023-09-29  1513  	if (ret < 0)
dd9f9cc1e6b939 Amadeusz Sławiński 2023-09-29  1514  		goto err;
dd9f9cc1e6b939 Amadeusz Sławiński 2023-09-29  1515  
dd9f9cc1e6b939 Amadeusz Sławiński 2023-09-29  1516  	rtd->initialized = true;
dd9f9cc1e6b939 Amadeusz Sławiński 2023-09-29  1517  
dd9f9cc1e6b939 Amadeusz Sławiński 2023-09-29  1518  	return 0;
dd9f9cc1e6b939 Amadeusz Sławiński 2023-09-29  1519  err:
dd9f9cc1e6b939 Amadeusz Sławiński 2023-09-29  1520  	snd_soc_link_exit(rtd);
dd9f9cc1e6b939 Amadeusz Sławiński 2023-09-29  1521  	return ret;
46496acbe1c43c Kuninori Morimoto  2019-12-10  1522  }
46496acbe1c43c Kuninori Morimoto  2019-12-10  1523  

:::::: The code at line 1485 was first introduced by commit
:::::: 46496acbe1c43cd26f5515b51b5d3c46a97d785d ASoC: soc-core: move soc_link_init()

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
