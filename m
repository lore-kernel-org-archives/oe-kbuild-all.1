Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA793CBE7F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 May 2026 11:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778153995; cv=none; b=qoGWsBKR9Jn+HladJ7SDlf9KZtOWu+f1OMNtst87UmTp5imYroMP3gcm4o6RiFY4tBPaezgITxsNRz6w6MSinvOhf/1/4tQRBI1bGi3+NIJhZmVBR6ue4fSftQ8npGSs6lydHdFrN78A0j8fv3cRHR7GZCYqpDxVOLLyRDK4OH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778153995; c=relaxed/simple;
	bh=FhUl+Aef+WQ1w0IIdEMh4J38gcO/LZkcITjvJNdDaeE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PRkjJkJq7fwbIdVYefvGDEBGuaWtjoOmawDKQPTz/3WtF59BGziL6HdmmjBg1KsCR1G290UWoEqxd8Rl0gnTYYXlS91JMsmi5Vd6aHo86CiSKH5q0aC6QMKkwyk6XVptArRu2t+Q5BpsKPPGOEdjJKrheYNJcUsdHlb8JyHCJPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XyNdPcfd; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XyNdPcfd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778153993; x=1809689993;
  h=date:from:to:cc:subject:message-id;
  bh=FhUl+Aef+WQ1w0IIdEMh4J38gcO/LZkcITjvJNdDaeE=;
  b=XyNdPcfd2KJz+I0lNLKBsqk0x8X0BUYbnKtrj2i3grHdfHd8ugQsukZA
   O9oUgdAn5I8Ez5H9pR2pWVY9rkacIS4hl6eKD5awk1kx+1d5WeswTljQa
   2jHOVFd/a3EVkeBCc1ZLIH/QOhyYAg/AKtpDT1LqNZice2EftW5jAKaKN
   GEr3V9S1LdbBQJuGzsfctxhqDBlakRokFKKDqcKqU8KohvESpltPNnRVb
   e24tkkIwO4tOSTYVdXlRZqiMvc+aQNGIerma05rukn3V9RgG2cwlUdQwN
   89ZnhLmLgW/HmVagtyB0Zoek8HKHCif4Y7AMIBo8mwMOMDSw7kpDb0OFJ
   g==;
X-CSE-ConnectionGUID: meyrqWb8TLKidLMdOW8xCA==
X-CSE-MsgGUID: f+3Wt+u3QQOFJQBlWSDQrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="82946549"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="82946549"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 04:39:52 -0700
X-CSE-ConnectionGUID: Y5ditZlTREKIBJZjYmGnLw==
X-CSE-MsgGUID: /6LZhJb/TpaZ/1/7+QaZ+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="231903493"
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 May 2026 04:39:50 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKx51-0000000003X-3eHR;
	Thu, 07 May 2026 11:39:47 +0000
Date: Thu, 07 May 2026 19:39:40 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Thierry Reding <treding@nvidia.com>
Subject: [linux-next:master 3732/3796]
 include/drm/drm_atomic.h:1012:31: error: invalid use of undefined type
 'struct drm_atomic_state'
Message-ID: <202605071908.QZCf2p2Q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   735d2f48cadaa9a87e7c7601667878de70c771c5
commit: 270bf9a32e98cb4a8cd2e63fd1f747eda12784ea [3732/3796] Merge branch 'drm-next' of https://gitlab.freedesktop.org/agd5f/linux.git
config: x86_64-randconfig-073-20260506 (https://download.01.org/0day-ci/archive/20260507/202605071908.QZCf2p2Q-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605071908.QZCf2p2Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605071908.QZCf2p2Q-lkp@intel.com/

Note: the linux-next/master HEAD 735d2f48cadaa9a87e7c7601667878de70c771c5 builds fine.
      It may have been fixed somewhere.

All error/warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:10594:55: warning: 'struct drm_atomic_state' declared inside parameter list will not be visible outside of this definition or declaration
   10594 | static void amdgpu_dm_mod_power_update_streams(struct drm_atomic_state *state,
         |                                                       ^~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_trace.h:40,
                    from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:42:
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function 'amdgpu_dm_mod_power_update_streams':
>> include/drm/drm_atomic.h:1012:31: error: invalid use of undefined type 'struct drm_atomic_state'
    1012 |              (__i) < (__state)->dev->mode_config.num_crtc;              \
         |                               ^~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:10603:9: note: in expansion of macro 'for_each_oldnew_crtc_in_state'
   10603 |         for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/kernel.h:35,
                    from include/linux/random.h:7,
                    from include/linux/nodemask.h:94,
                    from include/linux/numa.h:6,
                    from include/linux/cpumask.h:15,
                    from arch/x86/include/asm/paravirt.h:19,
                    from arch/x86/include/asm/irqflags.h:100,
                    from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:17,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:30:
   include/drm/drm_atomic.h:1014:39: error: invalid use of undefined type 'struct drm_atomic_state'
    1014 |                 for_each_if ((__state)->crtcs[__i].ptr &&               \
         |                                       ^~
   include/linux/util_macros.h:23:38: note: in definition of macro 'for_each_if'
      23 | #define for_each_if(condition) if (!(condition)) {} else
         |                                      ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:10603:9: note: in expansion of macro 'for_each_oldnew_crtc_in_state'
   10603 |         for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_atomic.h:1015:49: error: invalid use of undefined type 'struct drm_atomic_state'
    1015 |                              ((crtc) = (__state)->crtcs[__i].ptr,       \
         |                                                 ^~
   include/linux/util_macros.h:23:38: note: in definition of macro 'for_each_if'
      23 | #define for_each_if(condition) if (!(condition)) {} else
         |                                      ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:10603:9: note: in expansion of macro 'for_each_oldnew_crtc_in_state'
   10603 |         for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/drm/drm_atomic.h:1015:65: warning: left-hand operand of comma expression has no effect [-Wunused-value]
    1015 |                              ((crtc) = (__state)->crtcs[__i].ptr,       \
         |                                                                 ^
   include/linux/util_macros.h:23:38: note: in definition of macro 'for_each_if'
      23 | #define for_each_if(condition) if (!(condition)) {} else
         |                                      ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:10603:9: note: in expansion of macro 'for_each_oldnew_crtc_in_state'
   10603 |         for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_atomic.h:1017:58: error: invalid use of undefined type 'struct drm_atomic_state'
    1017 |                              (old_crtc_state) = (__state)->crtcs[__i].old_state, \
         |                                                          ^~
   include/linux/util_macros.h:23:38: note: in definition of macro 'for_each_if'
      23 | #define for_each_if(condition) if (!(condition)) {} else
         |                                      ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:10603:9: note: in expansion of macro 'for_each_oldnew_crtc_in_state'
   10603 |         for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_atomic.h:1017:80: warning: left-hand operand of comma expression has no effect [-Wunused-value]
    1017 |                              (old_crtc_state) = (__state)->crtcs[__i].old_state, \
         |                                                                                ^
   include/linux/util_macros.h:23:38: note: in definition of macro 'for_each_if'
      23 | #define for_each_if(condition) if (!(condition)) {} else
         |                                      ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:10603:9: note: in expansion of macro 'for_each_oldnew_crtc_in_state'
   10603 |         for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_atomic.h:1019:58: error: invalid use of undefined type 'struct drm_atomic_state'
    1019 |                              (new_crtc_state) = (__state)->crtcs[__i].new_state, \
         |                                                          ^~
   include/linux/util_macros.h:23:38: note: in definition of macro 'for_each_if'
      23 | #define for_each_if(condition) if (!(condition)) {} else
         |                                      ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:10603:9: note: in expansion of macro 'for_each_oldnew_crtc_in_state'
   10603 |         for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_atomic.h:1019:80: warning: left-hand operand of comma expression has no effect [-Wunused-value]
    1019 |                              (new_crtc_state) = (__state)->crtcs[__i].new_state, \
         |                                                                                ^
   include/linux/util_macros.h:23:38: note: in definition of macro 'for_each_if'
      23 | #define for_each_if(condition) if (!(condition)) {} else
         |                                      ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:10603:9: note: in expansion of macro 'for_each_oldnew_crtc_in_state'
   10603 |         for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: At top level:
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:10654:54: warning: 'struct drm_atomic_state' declared inside parameter list will not be visible outside of this definition or declaration
   10654 | static void amdgpu_dm_mod_power_setup_streams(struct drm_atomic_state *state,
         |                                                      ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function 'amdgpu_dm_mod_power_setup_streams':
   include/drm/drm_atomic.h:1055:31: error: invalid use of undefined type 'struct drm_atomic_state'
    1055 |              (__i) < (__state)->dev->mode_config.num_crtc;              \
         |                               ^~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:10663:9: note: in expansion of macro 'for_each_new_crtc_in_state'
   10663 |         for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_atomic.h:1057:39: error: invalid use of undefined type 'struct drm_atomic_state'
    1057 |                 for_each_if ((__state)->crtcs[__i].ptr &&               \
         |                                       ^~
   include/linux/util_macros.h:23:38: note: in definition of macro 'for_each_if'
      23 | #define for_each_if(condition) if (!(condition)) {} else
         |                                      ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:10663:9: note: in expansion of macro 'for_each_new_crtc_in_state'
   10663 |         for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_atomic.h:1058:49: error: invalid use of undefined type 'struct drm_atomic_state'
    1058 |                              ((crtc) = (__state)->crtcs[__i].ptr,       \
         |                                                 ^~
   include/linux/util_macros.h:23:38: note: in definition of macro 'for_each_if'
      23 | #define for_each_if(condition) if (!(condition)) {} else
         |                                      ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:10663:9: note: in expansion of macro 'for_each_new_crtc_in_state'
   10663 |         for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_atomic.h:1058:65: warning: left-hand operand of comma expression has no effect [-Wunused-value]
    1058 |                              ((crtc) = (__state)->crtcs[__i].ptr,       \
         |                                                                 ^
   include/linux/util_macros.h:23:38: note: in definition of macro 'for_each_if'
      23 | #define for_each_if(condition) if (!(condition)) {} else
         |                                      ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:10663:9: note: in expansion of macro 'for_each_new_crtc_in_state'
   10663 |         for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_atomic.h:1060:58: error: invalid use of undefined type 'struct drm_atomic_state'
    1060 |                              (new_crtc_state) = (__state)->crtcs[__i].new_state, \
         |                                                          ^~
   include/linux/util_macros.h:23:38: note: in definition of macro 'for_each_if'
      23 | #define for_each_if(condition) if (!(condition)) {} else
         |                                      ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:10663:9: note: in expansion of macro 'for_each_new_crtc_in_state'
   10663 |         for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_atomic.h:1060:80: warning: left-hand operand of comma expression has no effect [-Wunused-value]
    1060 |                              (new_crtc_state) = (__state)->crtcs[__i].new_state, \
         |                                                                                ^
   include/linux/util_macros.h:23:38: note: in definition of macro 'for_each_if'
      23 | #define for_each_if(condition) if (!(condition)) {} else
         |                                      ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:10663:9: note: in expansion of macro 'for_each_new_crtc_in_state'
   10663 |         for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function 'amdgpu_dm_commit_streams':
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:10724:44: error: passing argument 1 of 'amdgpu_dm_mod_power_update_streams' from incompatible pointer type [-Wincompatible-pointer-types]
   10724 |         amdgpu_dm_mod_power_update_streams(state, dm);
         |                                            ^~~~~
         |                                            |
         |                                            struct drm_atomic_commit *
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:10594:73: note: expected 'struct drm_atomic_state *' but argument is of type 'struct drm_atomic_commit *'
   10594 | static void amdgpu_dm_mod_power_update_streams(struct drm_atomic_state *state,
         |                                                ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function 'amdgpu_dm_atomic_commit_tail':
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:11344:43: error: passing argument 1 of 'amdgpu_dm_mod_power_setup_streams' from incompatible pointer type [-Wincompatible-pointer-types]
   11344 |         amdgpu_dm_mod_power_setup_streams(state, dm);
         |                                           ^~~~~
         |                                           |
         |                                           struct drm_atomic_commit *
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:10654:72: note: expected 'struct drm_atomic_state *' but argument is of type 'struct drm_atomic_commit *'
   10654 | static void amdgpu_dm_mod_power_setup_streams(struct drm_atomic_state *state,
         |                                               ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~


vim +1012 include/drm/drm_atomic.h

6559c901cb4840e Rob Clark         2016-11-05   930  
f9a769555db4c5c Simona Vetter     2017-03-28   931  /**
f9a769555db4c5c Simona Vetter     2017-03-28   932   * for_each_oldnew_connector_in_state - iterate over all connectors in an atomic update
5164f7e7ff8ec7d Maxime Ripard     2026-04-27   933   * @__state: &struct drm_atomic_commit pointer
f9a769555db4c5c Simona Vetter     2017-03-28   934   * @connector: &struct drm_connector iteration cursor
f9a769555db4c5c Simona Vetter     2017-03-28   935   * @old_connector_state: &struct drm_connector_state iteration cursor for the
f9a769555db4c5c Simona Vetter     2017-03-28   936   * 	old state
f9a769555db4c5c Simona Vetter     2017-03-28   937   * @new_connector_state: &struct drm_connector_state iteration cursor for the
f9a769555db4c5c Simona Vetter     2017-03-28   938   * 	new state
f9a769555db4c5c Simona Vetter     2017-03-28   939   * @__i: int iteration cursor, for macro-internal use
f9a769555db4c5c Simona Vetter     2017-03-28   940   *
f9a769555db4c5c Simona Vetter     2017-03-28   941   * This iterates over all connectors in an atomic update, tracking both old and
f9a769555db4c5c Simona Vetter     2017-03-28   942   * new state. This is useful in places where the state delta needs to be
f9a769555db4c5c Simona Vetter     2017-03-28   943   * considered, for example in atomic check functions.
f9a769555db4c5c Simona Vetter     2017-03-28   944   */
581e49fe6b411f4 Maarten Lankhorst 2017-01-16   945  #define for_each_oldnew_connector_in_state(__state, connector, old_connector_state, new_connector_state, __i) \
581e49fe6b411f4 Maarten Lankhorst 2017-01-16   946  	for ((__i) = 0;								\
331494eb51002d0 Maarten Lankhorst 2017-09-27   947  	     (__i) < (__state)->num_connector;					\
331494eb51002d0 Maarten Lankhorst 2017-09-27   948  	     (__i)++)								\
331494eb51002d0 Maarten Lankhorst 2017-09-27   949  		for_each_if ((__state)->connectors[__i].ptr &&			\
581e49fe6b411f4 Maarten Lankhorst 2017-01-16   950  			     ((connector) = (__state)->connectors[__i].ptr,	\
bf5d837a0a4ced7 Benjamin Gaignard 2019-10-08   951  			     (void)(connector) /* Only to avoid unused-but-set-variable warning */, \
581e49fe6b411f4 Maarten Lankhorst 2017-01-16   952  			     (old_connector_state) = (__state)->connectors[__i].old_state,	\
331494eb51002d0 Maarten Lankhorst 2017-09-27   953  			     (new_connector_state) = (__state)->connectors[__i].new_state, 1))
581e49fe6b411f4 Maarten Lankhorst 2017-01-16   954  
f9a769555db4c5c Simona Vetter     2017-03-28   955  /**
f9a769555db4c5c Simona Vetter     2017-03-28   956   * for_each_old_connector_in_state - iterate over all connectors in an atomic update
5164f7e7ff8ec7d Maxime Ripard     2026-04-27   957   * @__state: &struct drm_atomic_commit pointer
f9a769555db4c5c Simona Vetter     2017-03-28   958   * @connector: &struct drm_connector iteration cursor
f9a769555db4c5c Simona Vetter     2017-03-28   959   * @old_connector_state: &struct drm_connector_state iteration cursor for the
f9a769555db4c5c Simona Vetter     2017-03-28   960   * 	old state
f9a769555db4c5c Simona Vetter     2017-03-28   961   * @__i: int iteration cursor, for macro-internal use
f9a769555db4c5c Simona Vetter     2017-03-28   962   *
f9a769555db4c5c Simona Vetter     2017-03-28   963   * This iterates over all connectors in an atomic update, tracking only the old
f9a769555db4c5c Simona Vetter     2017-03-28   964   * state. This is useful in disable functions, where we need the old state the
f9a769555db4c5c Simona Vetter     2017-03-28   965   * hardware is still in.
f9a769555db4c5c Simona Vetter     2017-03-28   966   */
581e49fe6b411f4 Maarten Lankhorst 2017-01-16   967  #define for_each_old_connector_in_state(__state, connector, old_connector_state, __i) \
581e49fe6b411f4 Maarten Lankhorst 2017-01-16   968  	for ((__i) = 0;								\
331494eb51002d0 Maarten Lankhorst 2017-09-27   969  	     (__i) < (__state)->num_connector;					\
581e49fe6b411f4 Maarten Lankhorst 2017-01-16   970  	     (__i)++)								\
331494eb51002d0 Maarten Lankhorst 2017-09-27   971  		for_each_if ((__state)->connectors[__i].ptr &&			\
331494eb51002d0 Maarten Lankhorst 2017-09-27   972  			     ((connector) = (__state)->connectors[__i].ptr,	\
bf5d837a0a4ced7 Benjamin Gaignard 2019-10-08   973  			     (void)(connector) /* Only to avoid unused-but-set-variable warning */, \
331494eb51002d0 Maarten Lankhorst 2017-09-27   974  			     (old_connector_state) = (__state)->connectors[__i].old_state, 1))
581e49fe6b411f4 Maarten Lankhorst 2017-01-16   975  
f9a769555db4c5c Simona Vetter     2017-03-28   976  /**
f9a769555db4c5c Simona Vetter     2017-03-28   977   * for_each_new_connector_in_state - iterate over all connectors in an atomic update
5164f7e7ff8ec7d Maxime Ripard     2026-04-27   978   * @__state: &struct drm_atomic_commit pointer
f9a769555db4c5c Simona Vetter     2017-03-28   979   * @connector: &struct drm_connector iteration cursor
f9a769555db4c5c Simona Vetter     2017-03-28   980   * @new_connector_state: &struct drm_connector_state iteration cursor for the
f9a769555db4c5c Simona Vetter     2017-03-28   981   * 	new state
f9a769555db4c5c Simona Vetter     2017-03-28   982   * @__i: int iteration cursor, for macro-internal use
f9a769555db4c5c Simona Vetter     2017-03-28   983   *
f9a769555db4c5c Simona Vetter     2017-03-28   984   * This iterates over all connectors in an atomic update, tracking only the new
f9a769555db4c5c Simona Vetter     2017-03-28   985   * state. This is useful in enable functions, where we need the new state the
f9a769555db4c5c Simona Vetter     2017-03-28   986   * hardware should be in when the atomic commit operation has completed.
f9a769555db4c5c Simona Vetter     2017-03-28   987   */
581e49fe6b411f4 Maarten Lankhorst 2017-01-16   988  #define for_each_new_connector_in_state(__state, connector, new_connector_state, __i) \
581e49fe6b411f4 Maarten Lankhorst 2017-01-16   989  	for ((__i) = 0;								\
331494eb51002d0 Maarten Lankhorst 2017-09-27   990  	     (__i) < (__state)->num_connector;					\
581e49fe6b411f4 Maarten Lankhorst 2017-01-16   991  	     (__i)++)								\
331494eb51002d0 Maarten Lankhorst 2017-09-27   992  		for_each_if ((__state)->connectors[__i].ptr &&			\
331494eb51002d0 Maarten Lankhorst 2017-09-27   993  			     ((connector) = (__state)->connectors[__i].ptr,	\
bf5d837a0a4ced7 Benjamin Gaignard 2019-10-08   994  			     (void)(connector) /* Only to avoid unused-but-set-variable warning */, \
bf5d837a0a4ced7 Benjamin Gaignard 2019-10-08   995  			     (new_connector_state) = (__state)->connectors[__i].new_state, \
bf5d837a0a4ced7 Benjamin Gaignard 2019-10-08   996  			     (void)(new_connector_state) /* Only to avoid unused-but-set-variable warning */, 1))
581e49fe6b411f4 Maarten Lankhorst 2017-01-16   997  
f9a769555db4c5c Simona Vetter     2017-03-28   998  /**
f9a769555db4c5c Simona Vetter     2017-03-28   999   * for_each_oldnew_crtc_in_state - iterate over all CRTCs in an atomic update
5164f7e7ff8ec7d Maxime Ripard     2026-04-27  1000   * @__state: &struct drm_atomic_commit pointer
f9a769555db4c5c Simona Vetter     2017-03-28  1001   * @crtc: &struct drm_crtc iteration cursor
f9a769555db4c5c Simona Vetter     2017-03-28  1002   * @old_crtc_state: &struct drm_crtc_state iteration cursor for the old state
f9a769555db4c5c Simona Vetter     2017-03-28  1003   * @new_crtc_state: &struct drm_crtc_state iteration cursor for the new state
f9a769555db4c5c Simona Vetter     2017-03-28  1004   * @__i: int iteration cursor, for macro-internal use
f9a769555db4c5c Simona Vetter     2017-03-28  1005   *
f9a769555db4c5c Simona Vetter     2017-03-28  1006   * This iterates over all CRTCs in an atomic update, tracking both old and
f9a769555db4c5c Simona Vetter     2017-03-28  1007   * new state. This is useful in places where the state delta needs to be
f9a769555db4c5c Simona Vetter     2017-03-28  1008   * considered, for example in atomic check functions.
f9a769555db4c5c Simona Vetter     2017-03-28  1009   */
581e49fe6b411f4 Maarten Lankhorst 2017-01-16  1010  #define for_each_oldnew_crtc_in_state(__state, crtc, old_crtc_state, new_crtc_state, __i) \
581e49fe6b411f4 Maarten Lankhorst 2017-01-16  1011  	for ((__i) = 0;							\
331494eb51002d0 Maarten Lankhorst 2017-09-27 @1012  	     (__i) < (__state)->dev->mode_config.num_crtc;		\
331494eb51002d0 Maarten Lankhorst 2017-09-27  1013  	     (__i)++)							\
331494eb51002d0 Maarten Lankhorst 2017-09-27  1014  		for_each_if ((__state)->crtcs[__i].ptr &&		\
581e49fe6b411f4 Maarten Lankhorst 2017-01-16 @1015  			     ((crtc) = (__state)->crtcs[__i].ptr,	\
bf5d837a0a4ced7 Benjamin Gaignard 2019-10-08  1016  			      (void)(crtc) /* Only to avoid unused-but-set-variable warning */, \
581e49fe6b411f4 Maarten Lankhorst 2017-01-16  1017  			     (old_crtc_state) = (__state)->crtcs[__i].old_state, \
bf5d837a0a4ced7 Benjamin Gaignard 2019-10-08  1018  			     (void)(old_crtc_state) /* Only to avoid unused-but-set-variable warning */, \
94ffd9b86284ab0 Lee Jones         2020-11-16  1019  			     (new_crtc_state) = (__state)->crtcs[__i].new_state, \
94ffd9b86284ab0 Lee Jones         2020-11-16  1020  			     (void)(new_crtc_state) /* Only to avoid unused-but-set-variable warning */, 1))
581e49fe6b411f4 Maarten Lankhorst 2017-01-16  1021  

:::::: The code at line 1012 was first introduced by commit
:::::: 331494eb51002d0ee99414e3918e06d5e9a3962d drm/atomic: Make atomic iterators less surprising

:::::: TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
:::::: CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
