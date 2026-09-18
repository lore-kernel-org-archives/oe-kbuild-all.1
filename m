Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8882727466A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Sep 2026 16:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789749064; cv=none; b=E4NGhNHCPZlUSAOrkl+ixaj24deUZRyc6FSbu0Nby3RPq0gBhHBwyGR/XIEoLp8HLJtSYZu4AJP8wQ74SgMqnoAHBqlRqzzXIuC5onm61IxNfKEo+F9uj9UwNcuuCWjANpVEZsqLYNT4ebX9tossa7w27apn2NOP55NCR2sUPk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789749064; c=relaxed/simple;
	bh=ZJPQCGPj+08YzTVDN+X52IIXRuuIDQ+i88UvuuPsYTM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=q2BJ3GP8MPu87HUtuCJo8KsYAUACfWfjX3DR2aZtvPfsZUA6aHSE2cMLam0D2JE2g9aUXKijj96M3JsE6Unq1gEEvsHBJ7RqtFUhcy663i2R13mFP5bRV3yYAuMIuwhcOxlBW1KwALhR0mKW+q+QeOWlMSssgCo14rHDsqe6Tvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KBYNfhQ3; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KBYNfhQ3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789749062; x=1821285062;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ZJPQCGPj+08YzTVDN+X52IIXRuuIDQ+i88UvuuPsYTM=;
  b=KBYNfhQ3CXpNDZe1HmCShGTAg3LNZMNxa7qoY5Yp6af4wJ/UAfRnxKXm
   zfP9efas/uI2eQLOndJ0srArjY/yuI5q2kUbSqnvdN2ftIAL1tjZXRA/C
   fezPOUyU+mn1WFM7abhmReO0F1d/qk0Ht+ewL2UL6rRrbyKgaW/cMxOKq
   nLHayZQbr2CTxBd51BteliwBBI7tIvZFlb4bJhUjvSqeE3DQ8DUvIC/z5
   ws7hc3xjx7j+/tUtsNu6Fu5l4ztMpiJZI77pUL4mk0zqTgYMDlg8+A8Xx
   qdYMCb0JJkNqBsUizCbDz+RgT7JPGXLXuTI/TOkZBqc/3KpF8QzBA2e57
   g==;
X-CSE-ConnectionGUID: bjhzm0IPSwOpsz+BqXZrxQ==
X-CSE-MsgGUID: iWAPvqzfQfWp8LbauLnwLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="775552"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="775552"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 09:31:01 -0700
X-CSE-ConnectionGUID: 83VDEmSZQTygoQ3QzLlTJQ==
X-CSE-MsgGUID: 6Hx4b7sqScuH0taKvg0upg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="270174031"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 Sep 2026 09:30:58 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7bUG-00000000A57-29Bv;
	Fri, 18 Sep 2026 16:30:56 +0000
Date: Sat, 19 Sep 2026 00:30:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 1/1]
 drivers/gpu/drm/ttm/ttm_page_alloc.c:230: warning: bad line:                
 pool_index = 0x0;
Message-ID: <202609190010.DfvE5eyR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Lingfeng,

First bad commit (maybe !=3D root cause):

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   f107467f23d029ae469a0e8acada4336424274ca
commit: 51c9ed876ce194f1f3c6bd778b7bb46a8deb1dd9 [1/1] ANDROID: GKI: Add DR=
M_TTM config to GKI
config: i386-randconfig-r1307-20260917 (https://download.01.org/0day-ci/arc=
hive/20260919/202609190010.DfvE5eyR-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260919/202609190010.DfvE5eyR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609190010.DfvE5eyR-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/ttm/ttm_page_alloc.c:79: warning: Function parameter or =
member 'name' not described in 'ttm_page_pool'
   drivers/gpu/drm/ttm/ttm_page_alloc.c:79: warning: Function parameter or =
member 'nfrees' not described in 'ttm_page_pool'
   drivers/gpu/drm/ttm/ttm_page_alloc.c:79: warning: Function parameter or =
member 'nrefills' not described in 'ttm_page_pool'
   drivers/gpu/drm/ttm/ttm_page_alloc.c:79: warning: Function parameter or =
member 'order' not described in 'ttm_page_pool'
   drivers/gpu/drm/ttm/ttm_page_alloc.c:87: warning: cannot understand func=
tion prototype: 'struct ttm_pool_opts '
   drivers/gpu/drm/ttm/ttm_page_alloc.c:124: warning: Function parameter or=
 member 'kobj' not described in 'ttm_pool_manager'
   drivers/gpu/drm/ttm/ttm_page_alloc.c:124: warning: Function parameter or=
 member 'mm_shrink' not described in 'ttm_pool_manager'
   drivers/gpu/drm/ttm/ttm_page_alloc.c:124: warning: Function parameter or=
 member 'options' not described in 'ttm_pool_manager'
   drivers/gpu/drm/ttm/ttm_page_alloc.c:124: warning: Function parameter or=
 member 'wc_pool' not described in 'ttm_pool_manager'
   drivers/gpu/drm/ttm/ttm_page_alloc.c:124: warning: Function parameter or=
 member 'uc_pool' not described in 'ttm_pool_manager'
   drivers/gpu/drm/ttm/ttm_page_alloc.c:124: warning: Function parameter or=
 member 'wc_pool_dma32' not described in 'ttm_pool_manager'
   drivers/gpu/drm/ttm/ttm_page_alloc.c:124: warning: Function parameter or=
 member 'uc_pool_dma32' not described in 'ttm_pool_manager'
   drivers/gpu/drm/ttm/ttm_page_alloc.c:124: warning: Function parameter or=
 member 'wc_pool_huge' not described in 'ttm_pool_manager'
   drivers/gpu/drm/ttm/ttm_page_alloc.c:124: warning: Function parameter or=
 member 'uc_pool_huge' not described in 'ttm_pool_manager'
   drivers/gpu/drm/ttm/ttm_page_alloc.c:222: warning: bad line:            =
                               enum ttm_caching_state cstate)
   drivers/gpu/drm/ttm/ttm_page_alloc.c:223: warning: bad line: {
   drivers/gpu/drm/ttm/ttm_page_alloc.c:224: warning: bad line:         int=
 pool_index;
   drivers/gpu/drm/ttm/ttm_page_alloc.c:225: warning: bad line:=20
   drivers/gpu/drm/ttm/ttm_page_alloc.c:226: warning: bad line:         if =
(cstate =3D=3D tt_cached)
   drivers/gpu/drm/ttm/ttm_page_alloc.c:227: warning: bad line:            =
     return NULL;
   drivers/gpu/drm/ttm/ttm_page_alloc.c:228: warning: bad line:=20
   drivers/gpu/drm/ttm/ttm_page_alloc.c:229: warning: bad line:         if =
(cstate =3D=3D tt_wc)
>> drivers/gpu/drm/ttm/ttm_page_alloc.c:230: warning: bad line:            =
     pool_index =3D 0x0;
   drivers/gpu/drm/ttm/ttm_page_alloc.c:231: warning: bad line:         else
   drivers/gpu/drm/ttm/ttm_page_alloc.c:232: warning: bad line:            =
     pool_index =3D 0x1;
   drivers/gpu/drm/ttm/ttm_page_alloc.c:233: warning: bad line:=20
   drivers/gpu/drm/ttm/ttm_page_alloc.c:234: warning: bad line:         if =
(flags & TTM_PAGE_FLAG_DMA32) {
   drivers/gpu/drm/ttm/ttm_page_alloc.c:235: warning: bad line:            =
     if (huge)
   drivers/gpu/drm/ttm/ttm_page_alloc.c:236: warning: bad line:            =
             return NULL;
   drivers/gpu/drm/ttm/ttm_page_alloc.c:237: warning: bad line:            =
     pool_index |=3D 0x2;
   drivers/gpu/drm/ttm/ttm_page_alloc.c:238: warning: bad line:=20
   drivers/gpu/drm/ttm/ttm_page_alloc.c:239: warning: bad line:         } e=
lse if (huge) {
   drivers/gpu/drm/ttm/ttm_page_alloc.c:240: warning: bad line:            =
     pool_index |=3D 0x4;
   drivers/gpu/drm/ttm/ttm_page_alloc.c:241: warning: bad line:         }
   drivers/gpu/drm/ttm/ttm_page_alloc.c:242: warning: bad line:=20
   drivers/gpu/drm/ttm/ttm_page_alloc.c:243: warning: bad line:         ret=
urn &_manager->pools[pool_index];
   drivers/gpu/drm/ttm/ttm_page_alloc.c:244: warning: bad line: }
   drivers/gpu/drm/ttm/ttm_page_alloc.c:245: warning: bad line:=20
   drivers/gpu/drm/ttm/ttm_page_alloc.c:249: warning: Function parameter or=
 member 'pages' not described in 'ttm_pages_put'
   drivers/gpu/drm/ttm/ttm_page_alloc.c:249: warning: Function parameter or=
 member 'npages' not described in 'ttm_pages_put'
   drivers/gpu/drm/ttm/ttm_page_alloc.c:249: warning: Function parameter or=
 member 'order' not described in 'ttm_pages_put'
>> drivers/gpu/drm/ttm/ttm_page_alloc.c:285: warning: Function parameter or=
 member 'nr_free' not described in 'ttm_page_pool_free'
   drivers/gpu/drm/ttm/ttm_page_alloc.c:285: warning: Excess function param=
eter 'free_all' description in 'ttm_page_pool_free'
   drivers/gpu/drm/ttm/ttm_page_alloc.c:378: warning: Function parameter or=
 member 'shrink' not described in 'ttm_pool_shrink_scan'
   drivers/gpu/drm/ttm/ttm_page_alloc.c:378: warning: Function parameter or=
 member 'sc' not described in 'ttm_pool_shrink_scan'
   drivers/gpu/drm/ttm/ttm_page_alloc.c:472: warning: Function parameter or=
 member 'pages' not described in 'ttm_handle_caching_state_failure'
   drivers/gpu/drm/ttm/ttm_page_alloc.c:472: warning: Function parameter or=
 member 'ttm_flags' not described in 'ttm_handle_caching_state_failure'
   drivers/gpu/drm/ttm/ttm_page_alloc.c:472: warning: Function parameter or=
 member 'cstate' not described in 'ttm_handle_caching_state_failure'
   drivers/gpu/drm/ttm/ttm_page_alloc.c:472: warning: Function parameter or=
 member 'failed_pages' not described in 'ttm_handle_caching_state_failure'
>> drivers/gpu/drm/ttm/ttm_page_alloc.c:472: warning: Function parameter or=
 member 'cpages' not described in 'ttm_handle_caching_state_failure'
>> drivers/gpu/drm/ttm/ttm_page_alloc.c:490: warning: Function parameter or=
 member 'pages' not described in 'ttm_alloc_new_pages'
   drivers/gpu/drm/ttm/ttm_page_alloc.c:490: warning: Function parameter or=
 member 'gfp_flags' not described in 'ttm_alloc_new_pages'
   drivers/gpu/drm/ttm/ttm_page_alloc.c:490: warning: Function parameter or=
 member 'ttm_flags' not described in 'ttm_alloc_new_pages'
>> drivers/gpu/drm/ttm/ttm_page_alloc.c:490: warning: Function parameter or=
 member 'cstate' not described in 'ttm_alloc_new_pages'
   drivers/gpu/drm/ttm/ttm_page_alloc.c:490: warning: Function parameter or=
 member 'count' not described in 'ttm_alloc_new_pages'
   drivers/gpu/drm/ttm/ttm_page_alloc.c:490: warning: Function parameter or=
 member 'order' not described in 'ttm_alloc_new_pages'
   drivers/gpu/drm/ttm/ttm_page_alloc.c:574: warning: Function parameter or=
 member 'pool' not described in 'ttm_page_pool_fill_locked'
   drivers/gpu/drm/ttm/ttm_page_alloc.c:574: warning: Function parameter or=
 member 'ttm_flags' not described in 'ttm_page_pool_fill_locked'
>> drivers/gpu/drm/ttm/ttm_page_alloc.c:574: warning: Function parameter or=
 member 'cstate' not described in 'ttm_page_pool_fill_locked'
>> drivers/gpu/drm/ttm/ttm_page_alloc.c:574: warning: Function parameter or=
 member 'count' not described in 'ttm_page_pool_fill_locked'
>> drivers/gpu/drm/ttm/ttm_page_alloc.c:574: warning: Function parameter or=
 member 'irq_flags' not described in 'ttm_page_pool_fill_locked'
   drivers/gpu/drm/ttm/ttm_page_alloc.c:634: warning: Function parameter or=
 member 'pool' not described in 'ttm_page_pool_get_pages'
   drivers/gpu/drm/ttm/ttm_page_alloc.c:634: warning: Function parameter or=
 member 'pages' not described in 'ttm_page_pool_get_pages'
>> drivers/gpu/drm/ttm/ttm_page_alloc.c:634: warning: Function parameter or=
 member 'ttm_flags' not described in 'ttm_page_pool_get_pages'
   drivers/gpu/drm/ttm/ttm_page_alloc.c:634: warning: Function parameter or=
 member 'cstate' not described in 'ttm_page_pool_get_pages'
   drivers/gpu/drm/ttm/ttm_page_alloc.c:634: warning: Function parameter or=
 member 'count' not described in 'ttm_page_pool_get_pages'
>> drivers/gpu/drm/ttm/ttm_page_alloc.c:634: warning: Function parameter or=
 member 'order' not described in 'ttm_page_pool_get_pages'
--
   drivers/gpu/drm/ttm/ttm_bo.c:51: warning: Function parameter or member '=
ttm_global_mutex' not described in 'DEFINE_MUTEX'
   drivers/gpu/drm/ttm/ttm_bo.c:374: warning: Function parameter or member =
'bo' not described in 'ttm_bo_cleanup_memtype_use'
   drivers/gpu/drm/ttm/ttm_bo.c:448: warning: Function parameter or member =
'bo' not described in 'ttm_bo_cleanup_refs'
>> drivers/gpu/drm/ttm/ttm_bo.c:448: warning: Function parameter or member =
'interruptible' not described in 'ttm_bo_cleanup_refs'
   drivers/gpu/drm/ttm/ttm_bo.c:448: warning: Function parameter or member =
'no_wait_gpu' not described in 'ttm_bo_cleanup_refs'
   drivers/gpu/drm/ttm/ttm_bo.c:448: warning: Function parameter or member =
'unlock_resv' not described in 'ttm_bo_cleanup_refs'
   drivers/gpu/drm/ttm/ttm_bo.c:513: warning: Function parameter or member =
'bdev' not described in 'ttm_bo_delayed_delete'
>> drivers/gpu/drm/ttm/ttm_bo.c:513: warning: Function parameter or member =
'remove_all' not described in 'ttm_bo_delayed_delete'
   drivers/gpu/drm/ttm/ttm_bo.c:729: warning: Function parameter or member =
'bo' not described in 'ttm_bo_evict_swapout_allowable'
   drivers/gpu/drm/ttm/ttm_bo.c:729: warning: Function parameter or member =
'ctx' not described in 'ttm_bo_evict_swapout_allowable'
>> drivers/gpu/drm/ttm/ttm_bo.c:729: warning: Function parameter or member =
'locked' not described in 'ttm_bo_evict_swapout_allowable'
   drivers/gpu/drm/ttm/ttm_bo.c:729: warning: Function parameter or member =
'busy' not described in 'ttm_bo_evict_swapout_allowable'
>> drivers/gpu/drm/ttm/ttm_bo.c:873: warning: Function parameter or member =
'bo' not described in 'ttm_bo_add_move_fence'
   drivers/gpu/drm/ttm/ttm_bo.c:873: warning: Function parameter or member =
'man' not described in 'ttm_bo_add_move_fence'
   drivers/gpu/drm/ttm/ttm_bo.c:873: warning: Function parameter or member =
'mem' not described in 'ttm_bo_add_move_fence'
   drivers/gpu/drm/ttm/ttm_bo.c:873: warning: Function parameter or member =
'no_wait_gpu' not described in 'ttm_bo_add_move_fence'
   drivers/gpu/drm/ttm/ttm_bo.c:908: warning: Function parameter or member =
'bo' not described in 'ttm_bo_mem_force_space'
   drivers/gpu/drm/ttm/ttm_bo.c:908: warning: Function parameter or member =
'place' not described in 'ttm_bo_mem_force_space'
   drivers/gpu/drm/ttm/ttm_bo.c:908: warning: Function parameter or member =
'mem' not described in 'ttm_bo_mem_force_space'
   drivers/gpu/drm/ttm/ttm_bo.c:908: warning: Function parameter or member =
'ctx' not described in 'ttm_bo_mem_force_space'
   drivers/gpu/drm/ttm/ttm_bo.c:1037: warning: Function parameter or member=
 'bo' not described in 'ttm_bo_mem_space'
   drivers/gpu/drm/ttm/ttm_bo.c:1037: warning: Function parameter or member=
 'placement' not described in 'ttm_bo_mem_space'
   drivers/gpu/drm/ttm/ttm_bo.c:1037: warning: Function parameter or member=
 'mem' not described in 'ttm_bo_mem_space'
   drivers/gpu/drm/ttm/ttm_bo.c:1037: warning: Function parameter or member=
 'ctx' not described in 'ttm_bo_mem_space'
   drivers/gpu/drm/ttm/ttm_bo.c:1787: warning: Function parameter or member=
 'glob' not described in 'ttm_bo_swapout'
   drivers/gpu/drm/ttm/ttm_bo.c:1787: warning: Function parameter or member=
 'ctx' not described in 'ttm_bo_swapout'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=3Dm] && !UML && SND [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=3Dm] && !UML && SND [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=3Dm] && !UML && SND [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=3Dm] && !UML && SND [=3Dn] && SND_JACK [=3Dy]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=3Dm] && !UML && SND [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=3Dm] && !UML && SND [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=3Dy] && ACPI [=3Dy]


vim +230 drivers/gpu/drm/ttm/ttm_page_alloc.c

1403b1a38e8b19 Pauli Nieminen        2010-04-01  218 =20
1403b1a38e8b19 Pauli Nieminen        2010-04-01  219  /**
1403b1a38e8b19 Pauli Nieminen        2010-04-01  220   * Select the right p=
ool or requested caching state and ttm flags. */
6ed4e2e673d348 Christian K=C3=B6nig       2017-10-05  221  static struct tt=
m_page_pool *ttm_get_pool(int flags, bool huge,
1403b1a38e8b19 Pauli Nieminen        2010-04-01  222  					  enum ttm_cachi=
ng_state cstate)
1403b1a38e8b19 Pauli Nieminen        2010-04-01  223  {
1403b1a38e8b19 Pauli Nieminen        2010-04-01  224  	int pool_index;
1403b1a38e8b19 Pauli Nieminen        2010-04-01  225 =20
1403b1a38e8b19 Pauli Nieminen        2010-04-01  226  	if (cstate =3D=3D tt=
_cached)
1403b1a38e8b19 Pauli Nieminen        2010-04-01  227  		return NULL;
1403b1a38e8b19 Pauli Nieminen        2010-04-01  228 =20
1403b1a38e8b19 Pauli Nieminen        2010-04-01  229  	if (cstate =3D=3D tt=
_wc)
1403b1a38e8b19 Pauli Nieminen        2010-04-01 @230  		pool_index =3D 0x0;
1403b1a38e8b19 Pauli Nieminen        2010-04-01  231  	else
1403b1a38e8b19 Pauli Nieminen        2010-04-01  232  		pool_index =3D 0x1;
1403b1a38e8b19 Pauli Nieminen        2010-04-01  233 =20
6ed4e2e673d348 Christian K=C3=B6nig       2017-10-05  234  	if (flags & TTM=
_PAGE_FLAG_DMA32) {
6ed4e2e673d348 Christian K=C3=B6nig       2017-10-05  235  		if (huge)
6ed4e2e673d348 Christian K=C3=B6nig       2017-10-05  236  			return NULL;
1403b1a38e8b19 Pauli Nieminen        2010-04-01  237  		pool_index |=3D 0x2;
1403b1a38e8b19 Pauli Nieminen        2010-04-01  238 =20
6ed4e2e673d348 Christian K=C3=B6nig       2017-10-05  239  	} else if (huge=
) {
6ed4e2e673d348 Christian K=C3=B6nig       2017-10-05  240  		pool_index |=
=3D 0x4;
6ed4e2e673d348 Christian K=C3=B6nig       2017-10-05  241  	}
6ed4e2e673d348 Christian K=C3=B6nig       2017-10-05  242 =20
5870a4d97da136 Francisco Jerez       2010-07-04  243  	return &_manager->po=
ols[pool_index];
1403b1a38e8b19 Pauli Nieminen        2010-04-01  244  }
1403b1a38e8b19 Pauli Nieminen        2010-04-01  245 =20
1403b1a38e8b19 Pauli Nieminen        2010-04-01  246  /* set memory back to=
 wb and free the pages. */
444f8ef3f8f175 Roger He              2017-11-21  247  static void ttm_pages=
_put(struct page *pages[], unsigned npages,
444f8ef3f8f175 Roger He              2017-11-21  248  		unsigned int order)
1403b1a38e8b19 Pauli Nieminen        2010-04-01  249  {
444f8ef3f8f175 Roger He              2017-11-21  250  	unsigned int i, page=
s_nr =3D (1 << order);
444f8ef3f8f175 Roger He              2017-11-21  251 =20
444f8ef3f8f175 Roger He              2017-11-21  252  	if (order =3D=3D 0) {
d55f9b87428f47 Huang Rui             2018-07-26  253  		if (ttm_set_pages_a=
rray_wb(pages, npages))
25d0479a592556 Joe Perches           2012-03-16  254  			pr_err("Failed to =
set %d pages to wb!\n", npages);
444f8ef3f8f175 Roger He              2017-11-21  255  	}
444f8ef3f8f175 Roger He              2017-11-21  256 =20
444f8ef3f8f175 Roger He              2017-11-21  257  	for (i =3D 0; i < np=
ages; ++i) {
444f8ef3f8f175 Roger He              2017-11-21  258  		if (order > 0) {
d55f9b87428f47 Huang Rui             2018-07-26  259  			if (ttm_set_pages_=
wb(pages[i], pages_nr))
444f8ef3f8f175 Roger He              2017-11-21  260  				pr_err("Failed to=
 set %d pages to wb!\n", pages_nr);
444f8ef3f8f175 Roger He              2017-11-21  261  		}
444f8ef3f8f175 Roger He              2017-11-21  262  		__free_pages(pages[=
i], order);
444f8ef3f8f175 Roger He              2017-11-21  263  	}
1403b1a38e8b19 Pauli Nieminen        2010-04-01  264  }
1403b1a38e8b19 Pauli Nieminen        2010-04-01  265 =20
1403b1a38e8b19 Pauli Nieminen        2010-04-01  266  static void ttm_pool_=
update_free_locked(struct ttm_page_pool *pool,
1403b1a38e8b19 Pauli Nieminen        2010-04-01  267  		unsigned freed_page=
s)
1403b1a38e8b19 Pauli Nieminen        2010-04-01  268  {
1403b1a38e8b19 Pauli Nieminen        2010-04-01  269  	pool->npages -=3D fr=
eed_pages;
0745866165598b Pauli Nieminen        2010-04-01  270  	pool->nfrees +=3D fr=
eed_pages;
1403b1a38e8b19 Pauli Nieminen        2010-04-01  271  }
1403b1a38e8b19 Pauli Nieminen        2010-04-01  272 =20
1403b1a38e8b19 Pauli Nieminen        2010-04-01  273  /**
1403b1a38e8b19 Pauli Nieminen        2010-04-01  274   * Free pages from po=
ol.
1403b1a38e8b19 Pauli Nieminen        2010-04-01  275   *
1403b1a38e8b19 Pauli Nieminen        2010-04-01  276   * To prevent hogging=
 the ttm_swap process we only free NUM_PAGES_TO_ALLOC
1403b1a38e8b19 Pauli Nieminen        2010-04-01  277   * number of pages in=
 one go.
1403b1a38e8b19 Pauli Nieminen        2010-04-01  278   *
1403b1a38e8b19 Pauli Nieminen        2010-04-01  279   * @pool: to free the=
 pages from
1403b1a38e8b19 Pauli Nieminen        2010-04-01  280   * @free_all: If set =
to true will free all pages in pool
881fdaa5e4cb0d Tetsuo Handa          2014-11-13  281   * @use_static: Safe =
to use static buffer
1403b1a38e8b19 Pauli Nieminen        2010-04-01  282   **/
a91576d7916f6c Tetsuo Handa          2014-08-03  283  static int ttm_page_p=
ool_free(struct ttm_page_pool *pool, unsigned nr_free,
881fdaa5e4cb0d Tetsuo Handa          2014-11-13  284  			      bool use_sta=
tic)
1403b1a38e8b19 Pauli Nieminen        2010-04-01 @285  {
881fdaa5e4cb0d Tetsuo Handa          2014-11-13  286  	static struct page *=
static_buf[NUM_PAGES_TO_ALLOC];
1403b1a38e8b19 Pauli Nieminen        2010-04-01  287  	unsigned long irq_fl=
ags;
1403b1a38e8b19 Pauli Nieminen        2010-04-01  288  	struct page *p;
1403b1a38e8b19 Pauli Nieminen        2010-04-01  289  	struct page **pages_=
to_free;
1403b1a38e8b19 Pauli Nieminen        2010-04-01  290  	unsigned freed_pages=
 =3D 0,
1403b1a38e8b19 Pauli Nieminen        2010-04-01  291  		 npages_to_free =3D =
nr_free;
1403b1a38e8b19 Pauli Nieminen        2010-04-01  292 =20
1403b1a38e8b19 Pauli Nieminen        2010-04-01  293  	if (NUM_PAGES_TO_ALL=
OC < nr_free)
1403b1a38e8b19 Pauli Nieminen        2010-04-01  294  		npages_to_free =3D =
NUM_PAGES_TO_ALLOC;
1403b1a38e8b19 Pauli Nieminen        2010-04-01  295 =20
881fdaa5e4cb0d Tetsuo Handa          2014-11-13  296  	if (use_static)
881fdaa5e4cb0d Tetsuo Handa          2014-11-13  297  		pages_to_free =3D s=
tatic_buf;
881fdaa5e4cb0d Tetsuo Handa          2014-11-13  298  	else
6da2ec56059c3c Kees Cook             2018-06-12  299  		pages_to_free =3D k=
malloc_array(npages_to_free,
6da2ec56059c3c Kees Cook             2018-06-12  300  					      sizeof(str=
uct page *),
881fdaa5e4cb0d Tetsuo Handa          2014-11-13  301  					      GFP_KERNEL=
);
1403b1a38e8b19 Pauli Nieminen        2010-04-01  302  	if (!pages_to_free) {
767601d100a53e Michel D=C3=A4nzer         2017-11-03  303  		pr_debug("Fail=
ed to allocate memory for pool free operation\n");
1403b1a38e8b19 Pauli Nieminen        2010-04-01  304  		return 0;
1403b1a38e8b19 Pauli Nieminen        2010-04-01  305  	}
1403b1a38e8b19 Pauli Nieminen        2010-04-01  306 =20
1403b1a38e8b19 Pauli Nieminen        2010-04-01  307  restart:
1403b1a38e8b19 Pauli Nieminen        2010-04-01  308  	spin_lock_irqsave(&p=
ool->lock, irq_flags);
1403b1a38e8b19 Pauli Nieminen        2010-04-01  309 =20
1403b1a38e8b19 Pauli Nieminen        2010-04-01  310  	list_for_each_entry_=
reverse(p, &pool->list, lru) {
1403b1a38e8b19 Pauli Nieminen        2010-04-01  311  		if (freed_pages >=
=3D npages_to_free)
1403b1a38e8b19 Pauli Nieminen        2010-04-01  312  			break;
1403b1a38e8b19 Pauli Nieminen        2010-04-01  313 =20
1403b1a38e8b19 Pauli Nieminen        2010-04-01  314  		pages_to_free[freed=
_pages++] =3D p;
1403b1a38e8b19 Pauli Nieminen        2010-04-01  315  		/* We can only remo=
ve NUM_PAGES_TO_ALLOC at a time. */
1403b1a38e8b19 Pauli Nieminen        2010-04-01  316  		if (freed_pages >=
=3D NUM_PAGES_TO_ALLOC) {
1403b1a38e8b19 Pauli Nieminen        2010-04-01  317  			/* remove range of=
 pages from the pool */
1403b1a38e8b19 Pauli Nieminen        2010-04-01  318  			__list_del(p->lru.=
prev, &pool->list);
1403b1a38e8b19 Pauli Nieminen        2010-04-01  319 =20
1403b1a38e8b19 Pauli Nieminen        2010-04-01  320  			ttm_pool_update_fr=
ee_locked(pool, freed_pages);
1403b1a38e8b19 Pauli Nieminen        2010-04-01  321  			/**
1403b1a38e8b19 Pauli Nieminen        2010-04-01  322  			 * Because changin=
g page caching is costly
1403b1a38e8b19 Pauli Nieminen        2010-04-01  323  			 * we unlock the p=
ool to prevent stalling.
1403b1a38e8b19 Pauli Nieminen        2010-04-01  324  			 */
1403b1a38e8b19 Pauli Nieminen        2010-04-01  325  			spin_unlock_irqres=
tore(&pool->lock, irq_flags);
1403b1a38e8b19 Pauli Nieminen        2010-04-01  326 =20
444f8ef3f8f175 Roger He              2017-11-21  327  			ttm_pages_put(page=
s_to_free, freed_pages, pool->order);
1403b1a38e8b19 Pauli Nieminen        2010-04-01  328  			if (likely(nr_free=
 !=3D FREE_ALL_PAGES))
1403b1a38e8b19 Pauli Nieminen        2010-04-01  329  				nr_free -=3D free=
d_pages;
1403b1a38e8b19 Pauli Nieminen        2010-04-01  330 =20
1403b1a38e8b19 Pauli Nieminen        2010-04-01  331  			if (NUM_PAGES_TO_A=
LLOC >=3D nr_free)
1403b1a38e8b19 Pauli Nieminen        2010-04-01  332  				npages_to_free =
=3D nr_free;
1403b1a38e8b19 Pauli Nieminen        2010-04-01  333  			else
1403b1a38e8b19 Pauli Nieminen        2010-04-01  334  				npages_to_free =
=3D NUM_PAGES_TO_ALLOC;
1403b1a38e8b19 Pauli Nieminen        2010-04-01  335 =20
1403b1a38e8b19 Pauli Nieminen        2010-04-01  336  			freed_pages =3D 0;
1403b1a38e8b19 Pauli Nieminen        2010-04-01  337 =20
1403b1a38e8b19 Pauli Nieminen        2010-04-01  338  			/* free all so res=
tart the processing */
1403b1a38e8b19 Pauli Nieminen        2010-04-01  339  			if (nr_free)
1403b1a38e8b19 Pauli Nieminen        2010-04-01  340  				goto restart;
1403b1a38e8b19 Pauli Nieminen        2010-04-01  341 =20
0d74f86f37306d Konrad Rzeszutek Wilk 2011-06-08  342  			/* Not allowed to =
fall through or break because
1403b1a38e8b19 Pauli Nieminen        2010-04-01  343  			 * following conte=
xt is inside spinlock while we are
1403b1a38e8b19 Pauli Nieminen        2010-04-01  344  			 * outside here.
1403b1a38e8b19 Pauli Nieminen        2010-04-01  345  			 */
1403b1a38e8b19 Pauli Nieminen        2010-04-01  346  			goto out;
1403b1a38e8b19 Pauli Nieminen        2010-04-01  347 =20
1403b1a38e8b19 Pauli Nieminen        2010-04-01  348  		}
1403b1a38e8b19 Pauli Nieminen        2010-04-01  349  	}
1403b1a38e8b19 Pauli Nieminen        2010-04-01  350 =20
1403b1a38e8b19 Pauli Nieminen        2010-04-01  351  	/* remove range of p=
ages from the pool */
1403b1a38e8b19 Pauli Nieminen        2010-04-01  352  	if (freed_pages) {
1403b1a38e8b19 Pauli Nieminen        2010-04-01  353  		__list_del(&p->lru,=
 &pool->list);
1403b1a38e8b19 Pauli Nieminen        2010-04-01  354 =20
1403b1a38e8b19 Pauli Nieminen        2010-04-01  355  		ttm_pool_update_fre=
e_locked(pool, freed_pages);
1403b1a38e8b19 Pauli Nieminen        2010-04-01  356  		nr_free -=3D freed_=
pages;
1403b1a38e8b19 Pauli Nieminen        2010-04-01  357  	}
1403b1a38e8b19 Pauli Nieminen        2010-04-01  358 =20
1403b1a38e8b19 Pauli Nieminen        2010-04-01  359  	spin_unlock_irqresto=
re(&pool->lock, irq_flags);
1403b1a38e8b19 Pauli Nieminen        2010-04-01  360 =20
1403b1a38e8b19 Pauli Nieminen        2010-04-01  361  	if (freed_pages)
444f8ef3f8f175 Roger He              2017-11-21  362  		ttm_pages_put(pages=
_to_free, freed_pages, pool->order);
1403b1a38e8b19 Pauli Nieminen        2010-04-01  363  out:
881fdaa5e4cb0d Tetsuo Handa          2014-11-13  364  	if (pages_to_free !=
=3D static_buf)
1403b1a38e8b19 Pauli Nieminen        2010-04-01  365  		kfree(pages_to_free=
);
1403b1a38e8b19 Pauli Nieminen        2010-04-01  366  	return nr_free;
1403b1a38e8b19 Pauli Nieminen        2010-04-01  367  }
1403b1a38e8b19 Pauli Nieminen        2010-04-01  368 =20

:::::: The code at line 230 was first introduced by commit
:::::: 1403b1a38e8b19a4cc17e2c158e278628943a436 drm/ttm: add pool wc/uc pag=
e allocator V3

:::::: TO: Pauli Nieminen <suokkos@gmail.com>
:::::: CC: Dave Airlie <airlied@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
