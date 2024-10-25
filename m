Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D036D2064E7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 12:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729860731; cv=none; b=D/Xn0YpUmtYcUNjcAjAViXZoo9lMiFX/Vx59vpARW+NHakGQYbDtL19HlHJd350fVkoaCNZ5ysjDJYBkkz2ZETy6vQxhl4hFZdZ+PsXWmlAWCc4bUCzzMXNlTGejfpd4f/0XCyRH4TiidHNl23en/c7Nlk9V/sqIZVpHijG0xA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729860731; c=relaxed/simple;
	bh=FLinjkwPu3thMdzwn7iuzhc+eukAP8n7ShMkBQLtiNo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CqQ5GkhCrXgRmPX1kWIbt2clMClh7uuKJpGeg3Bw4Njw461tSzKiW7xAhQt2JL0XLoRV7ReQpjXjw2ckkUOeK5xjrTJBWUSJoRanXJl9fzcYpAgP4F4qycID28KIkUR4xvfwASslp0A1zR3zsKGHd5ds09t0oU8ZFdhwWsVPKl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yt7iYqVM; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yt7iYqVM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729860726; x=1761396726;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FLinjkwPu3thMdzwn7iuzhc+eukAP8n7ShMkBQLtiNo=;
  b=Yt7iYqVMvYsVSwDjX7RZUGh6fvMWe1fnXRoAKcO/PIA0o77utk/GOucg
   y2OzQ4x/4ZNUGbIYxdebpd5J8G0QR3NdEq7UXsqkR1IvZRNuDmVq+Ev2z
   lJIE4B6lwJhTGdX8FG4JTQdmjV0M2YT0p63EP/e7gdJl93q1ZAyINLOD8
   aTu1a55M0Sobk8xJUdRk1YGyLU98BNovt//KcT0j4sQlPeCpvngs+zVQz
   tYv4KvijG56QTjsLx6aeBe5b4tcmuSZWYVBFD3CYqBD2PD9ur1GeqCy2m
   2eHLg6RrQ3IgMkKRBI4yIOHk/In67uEoEEba/GJsJtTEuYeprTXxNxZ+r
   g==;
X-CSE-ConnectionGUID: wL3jn4pQSpeRjpFfFBGscA==
X-CSE-MsgGUID: BnSmhZgySlKhB+H2tbYlYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="40922507"
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="40922507"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 05:52:06 -0700
X-CSE-ConnectionGUID: YI54Gb15SI6omiFAV80p0g==
X-CSE-MsgGUID: QNOz0mx1Qhu+in0/P5E+Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="85466271"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 Oct 2024 05:52:06 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4JnO-000YGW-2u;
	Fri, 25 Oct 2024 12:52:02 +0000
Date: Fri, 25 Oct 2024 20:51:54 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-pcmv2-2024-10-22 3/3] sound/soc/soc-dapm.c:1086:20:
 error: 'struct snd_soc_pcm_runtime' has no member named 'version'
Message-ID: <202410252032.gt2Lbkgy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-pcmv2-2024-10-22
head:   ad08834668b453f25c4d160e515f18b8f3d5fd39
commit: ad08834668b453f25c4d160e515f18b8f3d5fd39 [3/3] rtd1 / dai_link1
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20241025/202410252032.gt2Lbkgy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410252032.gt2Lbkgy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410252032.gt2Lbkgy-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   sound/soc/soc-dapm.c: In function 'dapm_new_dai_link':
>> sound/soc/soc-dapm.c:1086:20: error: 'struct snd_soc_pcm_runtime' has no member named 'version'
    1086 |         switch (rtd->version) {
         |                    ^~
>> sound/soc/soc-dapm.c:1088:55: error: implicit declaration of function 'snd_soc_dai_link_to_link1'; did you mean 'snd_soc_link_to_codec'? [-Werror=implicit-function-declaration]
    1088 |                 struct snd_soc_dai_link1 *dai_link1 = snd_soc_dai_link_to_link1(rtd->dai_link);
         |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                       snd_soc_link_to_codec
>> sound/soc/soc-dapm.c:1088:55: warning: initialization of 'struct snd_soc_dai_link1 *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/soc-dapm.c:1090:34: error: 'struct snd_soc_dai_link' has no member named 'num_c2c_params'
    1090 |                 if (rtd->dai_link->num_c2c_params <= 1)
         |                                  ^~
>> sound/soc/soc-dapm.c:1088:43: warning: unused variable 'dai_link1' [-Wunused-variable]
    1088 |                 struct snd_soc_dai_link1 *dai_link1 = snd_soc_dai_link_to_link1(rtd->dai_link);
         |                                           ^~~~~~~~~
   sound/soc/soc-dapm.c: In function 'snd_soc_dapm_mux_update_power':
   sound/soc/soc-dapm.c:2381:17: error: implicit declaration of function 'snd_soc_dpcm_runtime_update' [-Werror=implicit-function-declaration]
    2381 |                 snd_soc_dpcm_runtime_update(card);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-dapm.c: In function 'snd_soc_dapm_dai_link_get':
>> sound/soc/soc-dapm.c:3984:45: error: implicit declaration of function 'snd_soc_rtd_to_rtd1'; did you mean 'snd_soc_rtd_to_codec'? [-Werror=implicit-function-declaration]
    3984 |         struct snd_soc_pcm_runtime1 *rtd1 = snd_soc_rtd_to_rtd1(rtd);
         |                                             ^~~~~~~~~~~~~~~~~~~
         |                                             snd_soc_rtd_to_codec
>> sound/soc/soc-dapm.c:3984:45: warning: initialization of 'struct snd_soc_pcm_runtime1 *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>> sound/soc/soc-dapm.c:3986:50: error: invalid use of undefined type 'struct snd_soc_pcm_runtime1'
    3986 |         ucontrol->value.enumerated.item[0] = rtd1->c2c_params_select;
         |                                                  ^~
   sound/soc/soc-dapm.c: In function 'snd_soc_dapm_dai_link_put':
   sound/soc/soc-dapm.c:3996:45: warning: initialization of 'struct snd_soc_pcm_runtime1 *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    3996 |         struct snd_soc_pcm_runtime1 *rtd1 = snd_soc_rtd_to_rtd1(rtd);
         |                                             ^~~~~~~~~~~~~~~~~~~
   sound/soc/soc-dapm.c:3997:47: warning: initialization of 'struct snd_soc_dai_link1 *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    3997 |         struct snd_soc_dai_link1 *dai_link1 = snd_soc_dai_link_to_link1(rtd->dai_link);
         |                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-dapm.c:4003:55: error: invalid use of undefined type 'struct snd_soc_pcm_runtime1'
    4003 |         if (ucontrol->value.enumerated.item[0] == rtd1->c2c_params_select)
         |                                                       ^~
>> sound/soc/soc-dapm.c:4006:60: error: invalid use of undefined type 'struct snd_soc_dai_link1'
    4006 |         if (ucontrol->value.enumerated.item[0] >= dai_link1->num_c2c_params)
         |                                                            ^~
   sound/soc/soc-dapm.c:4009:13: error: invalid use of undefined type 'struct snd_soc_pcm_runtime1'
    4009 |         rtd1->c2c_params_select = ucontrol->value.enumerated.item[0];
         |             ^~
   sound/soc/soc-dapm.c: In function 'snd_soc_dapm_new_dai':
>> sound/soc/soc-dapm.c:4106:73: error: 'dai_link' undeclared (first use in this function); did you mean 'dai_link1'?
    4106 |         struct snd_soc_dai_link1 *dai_link1 = snd_soc_dai_link_to_link1(dai_link);
         |                                                                         ^~~~~~~~
         |                                                                         dai_link1
   sound/soc/soc-dapm.c:4106:73: note: each undeclared identifier is reported only once for each function it appears in
   sound/soc/soc-dapm.c:4125:26: error: 'struct snd_soc_dai_link' has no member named 'num_c2c_params'
    4125 |         if (rtd->dai_link->num_c2c_params > 1) {
         |                          ^~
   sound/soc/soc-dapm.c:4127:54: error: invalid use of undefined type 'struct snd_soc_dai_link1'
    4127 |                                             dai_link1->num_c2c_params,
         |                                                      ^~
   sound/soc/soc-dapm.c:4134:70: error: invalid use of undefined type 'struct snd_soc_dai_link1'
    4134 |                                                             dai_link1->c2c_params,
         |                                                                      ^~
   sound/soc/soc-dapm.c:4135:70: error: invalid use of undefined type 'struct snd_soc_dai_link1'
    4135 |                                                             dai_link1->num_c2c_params,
         |                                                                      ^~
   sound/soc/soc-dapm.c:4166:45: error: invalid use of undefined type 'struct snd_soc_dai_link1'
    4166 |                                    dai_link1->num_c2c_params, w_param_text);
         |                                             ^~
   sound/soc/soc-dapm.c: In function 'dapm_connect_dai_pair':
   sound/soc/soc-dapm.c:4310:47: warning: initialization of 'struct snd_soc_dai_link1 *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    4310 |         struct snd_soc_dai_link1 *dai_link1 = snd_soc_dai_link_to_link1(dai_link);
         |                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-dapm.c:4311:45: warning: initialization of 'struct snd_soc_pcm_runtime1 *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    4311 |         struct snd_soc_pcm_runtime1 *rtd1 = snd_soc_rtd_to_rtd1(rtd);
         |                                             ^~~~~~~~~~~~~~~~~~~
   sound/soc/soc-dapm.c:4334:30: error: invalid use of undefined type 'struct snd_soc_dai_link1'
    4334 |                 if (dai_link1->c2c_params && !rtd1->c2c_widget[stream]) {
         |                              ^~
   sound/soc/soc-dapm.c:4334:51: error: invalid use of undefined type 'struct snd_soc_pcm_runtime1'
    4334 |                 if (dai_link1->c2c_params && !rtd1->c2c_widget[stream]) {
         |                                                   ^~
   sound/soc/soc-dapm.c:4342:29: error: invalid use of undefined type 'struct snd_soc_pcm_runtime1'
    4342 |                         rtd1->c2c_widget[stream] = dai;
         |                             ^~
   sound/soc/soc-dapm.c:4346:45: error: invalid use of undefined type 'struct snd_soc_pcm_runtime1'
    4346 |                                         rtd1->c2c_widget[stream],
         |                                             ^~
   sound/soc/soc-dapm.c: In function 'snd_soc_dapm_connect_dai_link_widgets':
   sound/soc/soc-dapm.c:4404:34: error: 'struct snd_soc_dai_link' has no member named 'dynamic'
    4404 |                 if (rtd->dai_link->dynamic)
         |                                  ^~
   cc1: some warnings being treated as errors
--
   sound/soc/soc-pcm.c: In function 'snd_soc_dpcm_check_state':
>> sound/soc/soc-pcm.c:89:52: warning: comparison of distinct pointer types lacks a cast
      89 |                 if (snd_soc_rtd1_to_rtd(dpcm->fe1) == fe1)
         |                                                    ^~
   In file included from include/linux/kernel.h:22,
                    from sound/soc/soc-pcm.c:13:
   sound/soc/soc-pcm.c: In function 'dpcm_show_state':
   include/linux/container_of.h:18:41: error: initialization of 'struct snd_soc_pcm_runtime *' from incompatible pointer type 'struct snd_soc_pcm_runtime1 *' [-Werror=incompatible-pointer-types]
      18 | #define container_of(ptr, type, member) ({                              \
         |                                         ^
   include/sound/soc-pcm.h:12:35: note: in expansion of macro 'container_of'
      12 | #define snd_soc_rtd_to_rtd1(_rtd) container_of((_rtd), struct snd_soc_pcm_runtime1, rtd)
         |                                   ^~~~~~~~~~~~
   sound/soc/soc-pcm.c:197:43: note: in expansion of macro 'snd_soc_rtd_to_rtd1'
     197 |         struct snd_soc_pcm_runtime *fe1 = snd_soc_rtd_to_rtd1(fe);
         |                                           ^~~~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:198:50: error: 'struct snd_soc_pcm_runtime' has no member named 'dpcm'; did you mean 'pcm'?
     198 |         struct snd_pcm_hw_params *params = &fe1->dpcm[stream].hw_params;
         |                                                  ^~~~
         |                                                  pcm
   sound/soc/soc-pcm.c:208:51: error: 'struct snd_soc_pcm_runtime' has no member named 'dpcm'; did you mean 'pcm'?
     208 |                            dpcm_state_string(fe1->dpcm[stream].state));
         |                                                   ^~~~
         |                                                   pcm
   sound/soc/soc-pcm.c:210:19: error: 'struct snd_soc_pcm_runtime' has no member named 'dpcm'; did you mean 'pcm'?
     210 |         if ((fe1->dpcm[stream].state >= SND_SOC_DPCM_STATE_HW_PARAMS) &&
         |                   ^~~~
         |                   pcm
   sound/soc/soc-pcm.c:211:19: error: 'struct snd_soc_pcm_runtime' has no member named 'dpcm'; did you mean 'pcm'?
     211 |             (fe1->dpcm[stream].state <= SND_SOC_DPCM_STATE_STOP))
         |                   ^~~~
         |                   pcm
   sound/soc/soc-pcm.c:222:29: error: 'struct snd_soc_pcm_runtime' has no member named 'dpcm'; did you mean 'pcm'?
     222 |         if (list_empty(&fe->dpcm[stream].be_clients)) {
         |                             ^~~~
         |                             pcm
   include/sound/soc-dpcm.h:112:43: error: 'struct snd_soc_pcm_runtime' has no member named 'dpcm'; did you mean 'pcm'?
     112 |         list_for_each_entry(_dpcm, &(fe)->dpcm[stream].be_clients, list_be)
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
   include/sound/soc-dpcm.h:112:9: note: in expansion of macro 'list_for_each_entry'
     112 |         list_for_each_entry(_dpcm, &(fe)->dpcm[stream].be_clients, list_be)
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:228:9: note: in expansion of macro 'for_each_dpcm_be'
     228 |         for_each_dpcm_be(fe1, stream, dpcm) {
         |         ^~~~~~~~~~~~~~~~
   In file included from include/linux/container_of.h:5:
   include/sound/soc-dpcm.h:112:43: error: 'struct snd_soc_pcm_runtime' has no member named 'dpcm'; did you mean 'pcm'?
     112 |         list_for_each_entry(_dpcm, &(fe)->dpcm[stream].be_clients, list_be)
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
   include/sound/soc-dpcm.h:112:9: note: in expansion of macro 'list_for_each_entry'
     112 |         list_for_each_entry(_dpcm, &(fe)->dpcm[stream].be_clients, list_be)
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:228:9: note: in expansion of macro 'for_each_dpcm_be'
     228 |         for_each_dpcm_be(fe1, stream, dpcm) {
         |         ^~~~~~~~~~~~~~~~
   include/sound/soc-dpcm.h:112:43: error: 'struct snd_soc_pcm_runtime' has no member named 'dpcm'; did you mean 'pcm'?
     112 |         list_for_each_entry(_dpcm, &(fe)->dpcm[stream].be_clients, list_be)
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
--
   sound/soc/generic/audio-graph-card2.c: In function 'audio_graph2_link_dpcm':
   sound/soc/generic/audio-graph-card2.c:922:25: error: 'struct snd_soc_dai_link' has no member named 'dynamic'
     922 |                 dai_link->dynamic               = 1;
         |                         ^~
   sound/soc/generic/audio-graph-card2.c:923:25: error: 'struct snd_soc_dai_link' has no member named 'dpcm_merged_format'
     923 |                 dai_link->dpcm_merged_format    = 1;
         |                         ^~
   sound/soc/generic/audio-graph-card2.c:958:25: error: 'struct snd_soc_dai_link' has no member named 'no_pcm'
     958 |                 dai_link->no_pcm                = 1;
         |                         ^~
   sound/soc/generic/audio-graph-card2.c: In function 'audio_graph2_link_c2c':
>> sound/soc/generic/audio-graph-card2.c:1027:53: error: invalid application of 'sizeof' to incomplete type 'struct snd_soc_dai_link1'
    1027 |                 dai_link1 = devm_kzalloc(dev, sizeof(*dai_link1), GFP_KERNEL);
         |                                                     ^
>> sound/soc/generic/audio-graph-card2.c:1038:26: error: invalid use of undefined type 'struct snd_soc_dai_link1'
    1038 |                 dai_link1->c2c_params           = c2c_conf;
         |                          ^~
   sound/soc/generic/audio-graph-card2.c:1039:26: error: invalid use of undefined type 'struct snd_soc_dai_link1'
    1039 |                 dai_link1->num_c2c_params       = 1;
         |                          ^~
   sound/soc/generic/audio-graph-card2.c:1043:26: error: invalid use of undefined type 'struct snd_soc_dai_link1'
    1043 |                 dai_link1->dai_link     = dai_link;
         |                          ^~
--
   sound/soc/fsl/fsl-asoc-card.c:320:18: error: 'const struct snd_soc_dai_link' has no member named 'dpcm_playback'
     320 |                 .dpcm_playback = 1,
         |                  ^~~~~~~~~~~~~
   sound/soc/fsl/fsl-asoc-card.c:321:18: error: 'const struct snd_soc_dai_link' has no member named 'dpcm_capture'
     321 |                 .dpcm_capture = 1,
         |                  ^~~~~~~~~~~~
>> sound/soc/fsl/fsl-asoc-card.c:321:33: warning: initialization of 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     321 |                 .dpcm_capture = 1,
         |                                 ^
   sound/soc/fsl/fsl-asoc-card.c:321:33: note: (near initialization for 'fsl_asoc_card_dai[1].version_data')
   sound/soc/fsl/fsl-asoc-card.c:322:18: error: 'const struct snd_soc_dai_link' has no member named 'dynamic'
     322 |                 .dynamic = 1,
         |                  ^~~~~~~
   sound/soc/fsl/fsl-asoc-card.c:322:28: warning: initialization of 'struct snd_soc_dai_link_component *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     322 |                 .dynamic = 1,
         |                            ^
   sound/soc/fsl/fsl-asoc-card.c:322:28: note: (near initialization for 'fsl_asoc_card_dai[1].cpus')
   sound/soc/fsl/fsl-asoc-card.c:329:18: error: 'const struct snd_soc_dai_link' has no member named 'dpcm_playback'
     329 |                 .dpcm_playback = 1,
         |                  ^~~~~~~~~~~~~
   sound/soc/fsl/fsl-asoc-card.c:330:18: error: 'const struct snd_soc_dai_link' has no member named 'dpcm_capture'
     330 |                 .dpcm_capture = 1,
         |                  ^~~~~~~~~~~~
   sound/soc/fsl/fsl-asoc-card.c:331:18: error: 'const struct snd_soc_dai_link' has no member named 'no_pcm'
     331 |                 .no_pcm = 1,
         |                  ^~~~~~
   sound/soc/fsl/fsl-asoc-card.c: In function 'fsl_asoc_card_spdif_init':
   sound/soc/fsl/fsl-asoc-card.c:507:34: error: 'struct snd_soc_dai_link' has no member named 'dpcm_capture'
     507 |                 priv->dai_link[1].dpcm_capture = false;
         |                                  ^
   sound/soc/fsl/fsl-asoc-card.c:508:34: error: 'struct snd_soc_dai_link' has no member named 'dpcm_capture'
     508 |                 priv->dai_link[2].dpcm_capture = false;
         |                                  ^
   sound/soc/fsl/fsl-asoc-card.c:512:34: error: 'struct snd_soc_dai_link' has no member named 'dpcm_playback'
     512 |                 priv->dai_link[1].dpcm_playback = false;
         |                                  ^
   sound/soc/fsl/fsl-asoc-card.c:513:34: error: 'struct snd_soc_dai_link' has no member named 'dpcm_playback'
     513 |                 priv->dai_link[2].dpcm_playback = false;
         |                                  ^
   sound/soc/fsl/fsl-asoc-card.c: In function 'fsl_asoc_card_probe':
   sound/soc/fsl/fsl-asoc-card.c:767:34: error: 'struct snd_soc_dai_link' has no member named 'dpcm_capture'
     767 |                 priv->dai_link[1].dpcm_capture = 0;
         |                                  ^
   sound/soc/fsl/fsl-asoc-card.c:768:34: error: 'struct snd_soc_dai_link' has no member named 'dpcm_capture'
     768 |                 priv->dai_link[2].dpcm_capture = 0;
         |                                  ^
   sound/soc/fsl/fsl-asoc-card.c:794:34: error: 'struct snd_soc_dai_link' has no member named 'dpcm_capture'
     794 |                 priv->dai_link[1].dpcm_capture = 0;
         |                                  ^
   sound/soc/fsl/fsl-asoc-card.c:795:34: error: 'struct snd_soc_dai_link' has no member named 'dpcm_capture'
     795 |                 priv->dai_link[2].dpcm_capture = 0;
         |                                  ^
   sound/soc/fsl/fsl-asoc-card.c:801:34: error: 'struct snd_soc_dai_link' has no member named 'dpcm_capture'
     801 |                 priv->dai_link[1].dpcm_capture = 0;
         |                                  ^
   sound/soc/fsl/fsl-asoc-card.c:802:34: error: 'struct snd_soc_dai_link' has no member named 'dpcm_capture'
     802 |                 priv->dai_link[2].dpcm_capture = 0;
         |                                  ^
--
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:647:18: error: 'struct snd_soc_dai_link' has no member named 'trigger'
     647 |                 .trigger = {SND_SOC_DPCM_TRIGGER_PRE,
         |                  ^~~~~~~
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:647:17: warning: braces around scalar initializer
     647 |                 .trigger = {SND_SOC_DPCM_TRIGGER_PRE,
         |                 ^
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:647:17: note: (near initialization for 'mt8186_mt6366_rt1019_rt5682s_dai_links[0].version')
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:647:29: error: 'SND_SOC_DPCM_TRIGGER_PRE' undeclared here (not in a function); did you mean 'SND_SOC_DAPM_MIXER_E'?
     647 |                 .trigger = {SND_SOC_DPCM_TRIGGER_PRE,
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~
         |                             SND_SOC_DAPM_MIXER_E
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:648:29: warning: excess elements in scalar initializer
     648 |                             SND_SOC_DPCM_TRIGGER_PRE},
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:648:29: note: (near initialization for 'mt8186_mt6366_rt1019_rt5682s_dai_links[0].version')
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:649:18: error: 'struct snd_soc_dai_link' has no member named 'dynamic'
     649 |                 .dynamic = 1,
         |                  ^~~~~~~
>> sound/soc/mediatek/mt8186/mt8186-mt6366.c:649:28: warning: initialization of 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     649 |                 .dynamic = 1,
         |                            ^
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:649:28: note: (near initialization for 'mt8186_mt6366_rt1019_rt5682s_dai_links[0].version_data')
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:650:18: error: 'struct snd_soc_dai_link' has no member named 'dpcm_playback'
     650 |                 .dpcm_playback = 1,
         |                  ^~~~~~~~~~~~~
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:650:34: warning: initialization of 'struct snd_soc_dai_link_component *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     650 |                 .dpcm_playback = 1,
         |                                  ^
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:650:34: note: (near initialization for 'mt8186_mt6366_rt1019_rt5682s_dai_links[0].cpus')
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:651:18: error: 'struct snd_soc_dai_link' has no member named 'dpcm_merged_format'
     651 |                 .dpcm_merged_format = 1,
         |                  ^~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:652:18: error: 'struct snd_soc_dai_link' has no member named 'dpcm_merged_chan'
     652 |                 .dpcm_merged_chan = 1,
         |                  ^~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:652:37: warning: initialization of 'struct snd_soc_dai_link_component *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     652 |                 .dpcm_merged_chan = 1,
         |                                     ^
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:652:37: note: (near initialization for 'mt8186_mt6366_rt1019_rt5682s_dai_links[0].codecs')
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:653:18: error: 'struct snd_soc_dai_link' has no member named 'dpcm_merged_rate'
     653 |                 .dpcm_merged_rate = 1,
         |                  ^~~~~~~~~~~~~~~~
   In file included from sound/soc/mediatek/mt8186/mt8186-mt6366.c:20:
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:655:37: warning: initialized field overwritten [-Woverride-init]
     655 |                 SND_SOC_DAILINK_REG(playback1),
         |                                     ^~~~~~~~~
   include/sound/soc.h:921:27: note: in definition of macro 'SND_SOC_DAILINK_REG3'
     921 |         .cpus           = cpu,                          \
         |                           ^~~
   include/linux/args.h:25:24: note: in expansion of macro 'SND_SOC_DAILINK_REG1'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:655:17: note: in expansion of macro 'SND_SOC_DAILINK_REG'
     655 |                 SND_SOC_DAILINK_REG(playback1),
         |                 ^~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:655:37: note: (near initialization for 'mt8186_mt6366_rt1019_rt5682s_dai_links[0].cpus')
     655 |                 SND_SOC_DAILINK_REG(playback1),
         |                                     ^~~~~~~~~
   include/sound/soc.h:921:27: note: in definition of macro 'SND_SOC_DAILINK_REG3'
     921 |         .cpus           = cpu,                          \
         |                           ^~~
   include/linux/args.h:25:24: note: in expansion of macro 'SND_SOC_DAILINK_REG1'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:655:17: note: in expansion of macro 'SND_SOC_DAILINK_REG'
     655 |                 SND_SOC_DAILINK_REG(playback1),
         |                 ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/string.h:6,
                    from arch/x86/include/asm/page_32.h:18,
                    from arch/x86/include/asm/page.h:14,
                    from arch/x86/include/asm/processor.h:20,
                    from arch/x86/include/asm/timex.h:5,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/input.h:8,
                    from sound/soc/mediatek/mt8186/mt8186-mt6366.c:14:
   include/linux/array_size.h:11:25: warning: initialized field overwritten [-Woverride-init]
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                         ^
   include/sound/soc.h:922:27: note: in expansion of macro 'ARRAY_SIZE'
     922 |         .num_cpus       = ARRAY_SIZE(cpu),              \
         |                           ^~~~~~~~~~
   include/sound/soc.h:918:42: note: in expansion of macro 'SND_SOC_DAILINK_REG3'
     918 | #define SND_SOC_DAILINK_REG1(name)       SND_SOC_DAILINK_REG3(name##_cpus, name##_codecs, name##_platforms)
         |                                          ^~~~~~~~~~~~~~~~~~~~
   include/linux/args.h:25:24: note: in expansion of macro 'SND_SOC_DAILINK_REG1'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/args.h:26:27: note: in expansion of macro '__CONCAT'
      26 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^~~~~~~~
   include/sound/soc.h:929:9: note: in expansion of macro 'CONCATENATE'
     929 |         CONCATENATE(SND_SOC_DAILINK_REG, COUNT_ARGS(__VA_ARGS__))(__VA_ARGS__)
         |         ^~~~~~~~~~~
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:655:17: note: in expansion of macro 'SND_SOC_DAILINK_REG'
     655 |                 SND_SOC_DAILINK_REG(playback1),
         |                 ^~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:25: note: (near initialization for 'mt8186_mt6366_rt1019_rt5682s_dai_links[0].num_cpus')
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                         ^
   include/sound/soc.h:922:27: note: in expansion of macro 'ARRAY_SIZE'
     922 |         .num_cpus       = ARRAY_SIZE(cpu),              \
         |                           ^~~~~~~~~~
   include/sound/soc.h:918:42: note: in expansion of macro 'SND_SOC_DAILINK_REG3'
     918 | #define SND_SOC_DAILINK_REG1(name)       SND_SOC_DAILINK_REG3(name##_cpus, name##_codecs, name##_platforms)
         |                                          ^~~~~~~~~~~~~~~~~~~~
   include/linux/args.h:25:24: note: in expansion of macro 'SND_SOC_DAILINK_REG1'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/args.h:26:27: note: in expansion of macro '__CONCAT'
      26 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^~~~~~~~
   include/sound/soc.h:929:9: note: in expansion of macro 'CONCATENATE'
     929 |         CONCATENATE(SND_SOC_DAILINK_REG, COUNT_ARGS(__VA_ARGS__))(__VA_ARGS__)
         |         ^~~~~~~~~~~
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:655:17: note: in expansion of macro 'SND_SOC_DAILINK_REG'
     655 |                 SND_SOC_DAILINK_REG(playback1),
         |                 ^~~~~~~~~~~~~~~~~~~
..

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +1086 sound/soc/soc-dapm.c

  1078	
  1079	/* create new dapm dai link control */
  1080	static int dapm_new_dai_link(struct snd_soc_dapm_widget *w)
  1081	{
  1082		int i;
  1083		struct snd_soc_pcm_runtime *rtd = w->priv;
  1084	
  1085		/* create control for links with > 1 config */
> 1086		switch (rtd->version) {
  1087		case SND_SOC_LINK_VER1:
> 1088			struct snd_soc_dai_link1 *dai_link1 = snd_soc_dai_link_to_link1(rtd->dai_link);
  1089	
  1090			if (rtd->dai_link->num_c2c_params <= 1)
  1091				return 0;
  1092			break;
  1093		default:
  1094			/* do nothing */
  1095		}
  1096	
  1097		/* add kcontrol */
  1098		for (i = 0; i < w->num_kcontrols; i++) {
  1099			struct snd_soc_dapm_context *dapm = w->dapm;
  1100			struct snd_card *card = dapm->card->snd_card;
  1101			struct snd_kcontrol *kcontrol = snd_soc_cnew(&w->kcontrol_news[i],
  1102								     w, w->name, NULL);
  1103			int ret = snd_ctl_add(card, kcontrol);
  1104	
  1105			if (ret < 0) {
  1106				dev_err(dapm->dev,
  1107					"ASoC: failed to add widget %s dapm kcontrol %s: %d\n",
  1108					w->name, w->kcontrol_news[i].name, ret);
  1109				return ret;
  1110			}
  1111			kcontrol->private_data = w;
  1112			w->kcontrols[i] = kcontrol;
  1113		}
  1114	
  1115		return 0;
  1116	}
  1117	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
