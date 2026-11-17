Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794876425;
	b=qWSwxIP7TeSusREnzH1zs6E1Lh8eZHuvDWmdPDrUfmIMe1BnqjqS85sFl3EMyClxxWaH
	 8xTYXd/cBBaaSncQQBXFex/9cqJMq1D4HzJEa9mY2YBzU/TM5y7iafAu6T8ClYm4Ozmwm
	 HQbXg7O6qCDTTkLQJyh1pORSj/MRMhhLxyfhdUJu5PqJrlL97ee/P4vf/Z9r+RIOipx8p
	 hFaRE1GBjmrt3AKO1FOMNVQYzyGlLdydHkf01Nl4brtaO1oabM2cbhRXy2ANgyWihfOoE
	 W4gZ/BEGCfcmbSAwBRSOCG6RjK1+Ev+2Iw/9L1lb45nHSaxhRNAIw86SX29QcuWMRDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794876425;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=qHl/VBB8J86LMfO6Se1Kn6Xj1kTa2X6Q37XOi5PS2+4=;
	b=mX8AQuePengccfsLmfudR+ruBhy99UXKX0r91i4Hm9SeMM0IL9K/KTL+sSWNaarZ7s0T
	 CeqO9IE9cT2ajLXANE76GHD+pCglD1FmIz1KCrcaGAZZ3fRcfIf/49wLVLGaCzrEfar5t
	 UbmMlC/DFGsVFoYFGUOBgyWoKEavWjfwi7U6y9Dd0BedPZq6yDawwsLeWPBhQjQyVuOg7
	 bjRvrXBZnLYhUogdR0DsxlltjBsclY1Vr0vEUl/xzYnvFMSLalAyX3TV+tzBMToEunr2B
	 iFl1VnuPMee+B24Bt4RICmxr3Z8MoTl8MxphOGCAGv5YP+L55lnr/WngJpWd9J9Uv6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iyngE+CA;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E66A606A32A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Nov 2026 00:47:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E66A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iyngE+CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794876425; x=1826412425;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3p6iWK+i8Y5WMsOcDkRPrNyxxY+r6cvRHNwxVbjwaNI=;
  b=iyngE+CAtwP1QZvnJcuvFwWvjjiYx/h+wslAGyr0yhuesSVISxi4GnHS
   6g+qF+WoEgr/WyGAil21L1OtPLhYOxi0+teimQH+PZEC/rlC0rm32j0o/
   FwSMAik3aIDaB/RvfsaJoJGBWrnRSZVzb3rHiFhty04+93X7YeNRqZhJs
   n8pMSKiJvOKQn9hI9yXmiFk+v/G5znpBQskUbHyqBQQVFmY1F1FUzSp7F
   1xZCdhe1XizVZ8WRaGTNsYJ/n5bQ5R4kwi4UPfQyWjRmGWekUWd+geKEI
   oqwFAYhfDICdvAvlxrMPgZWf0JPcng82mwjGegzaxfb2+G6zG1iG/La+Y
   A==;
X-CSE-ConnectionGUID: aOpXC6oyR+CyLhwi7TqfvA==
X-CSE-MsgGUID: f3NvmbABTISd1GhiehKXQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3661572"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3661572"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 16:47:04 -0800
X-CSE-ConnectionGUID: Ipcm/VSNS6K1P5ncZ9j+ZQ==
X-CSE-MsgGUID: a0sIrTmUQsSjLwJx4Yanvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9697301"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 16 Nov 2026 16:47:01 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xT7Lf-000000002t8-0YrR;
	Tue, 17 Nov 2026 00:46:59 +0000
Date: Tue, 17 Nov 2026 01:46:04 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-lts 152/152]
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c:157: warning: Function parameter or
 struct member 'flags' not described in 'amdgpu_sync_fence'
Message-ID: <202611170116.ffmj2zKA-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://android.googlesource.com/kernel/common android16-6.12-lts
head:   c5e3d3a3d3b60eb95c36e3c49dbfe7a34c220c5a
commit: 7770f84cf3c19f5f26c90db3466f532f0fed8364 [152/152] drm/amdgpu: use =
GFP_NOWAIT for memory allocations
config: x86_64-randconfig-r2307-20261116 (https://download.01.org/0day-ci/a=
rchive/20261117/202611170116.ffmj2zKA-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933=
e47d3a3451d81e72ac174dcb5aa28b59d1)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261117/202611170116.ffmj2zKA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611170116.ffmj2zKA-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c:157: warning: Function paramete=
r or struct member 'flags' not described in 'amdgpu_sync_fence'


vim +157 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c

832a902f9433b81 Christian K=C3=B6nig 2016-02-15  146 =20
d38ceaf99ed015f Alex Deucher    2015-04-20  147  /**
91e1a5207edec9e Christian K=C3=B6nig 2015-07-06  148   * amdgpu_sync_fence =
- remember to sync to this fence
d38ceaf99ed015f Alex Deucher    2015-04-20  149   *
d38ceaf99ed015f Alex Deucher    2015-04-20  150   * @sync: sync object to a=
dd fence to
e095fc17bbd216c Christian K=C3=B6nig 2019-11-29  151   * @f: fence to sync =
to
d38ceaf99ed015f Alex Deucher    2015-04-20  152   *
e095fc17bbd216c Christian K=C3=B6nig 2019-11-29  153   * Add the fence to t=
he sync object.
d38ceaf99ed015f Alex Deucher    2015-04-20  154   */
7770f84cf3c19f5 Christian K=C3=B6nig 2026-09-22  155  int amdgpu_sync_fence=
(struct amdgpu_sync *sync, struct dma_fence *f,
7770f84cf3c19f5 Christian K=C3=B6nig 2026-09-22  156  		      gfp_t flags)
d38ceaf99ed015f Alex Deucher    2015-04-20 @157  {
f91b3a694181209 Christian K=C3=B6nig 2015-08-20  158  	struct amdgpu_sync_e=
ntry *e;
d38ceaf99ed015f Alex Deucher    2015-04-20  159 =20
91e1a5207edec9e Christian K=C3=B6nig 2015-07-06  160  	if (!f)
91e1a5207edec9e Christian K=C3=B6nig 2015-07-06  161  		return 0;
3c62338c26bf267 Chunming Zhou   2015-08-20  162 =20
174b328bc89b5fa Christian K=C3=B6nig 2020-05-27  163  	if (amdgpu_sync_add_=
later(sync, f))
f91b3a694181209 Christian K=C3=B6nig 2015-08-20  164  		return 0;
f91b3a694181209 Christian K=C3=B6nig 2015-08-20  165 =20
7770f84cf3c19f5 Christian K=C3=B6nig 2026-09-22  166  	e =3D kmem_cache_all=
oc(amdgpu_sync_slab, flags);
f91b3a694181209 Christian K=C3=B6nig 2015-08-20  167  	if (!e)
f91b3a694181209 Christian K=C3=B6nig 2015-08-20  168  		return -ENOMEM;
f91b3a694181209 Christian K=C3=B6nig 2015-08-20  169 =20
f91b3a694181209 Christian K=C3=B6nig 2015-08-20  170  	hash_add(sync->fence=
s, &e->node, f->context);
f54d1867005c332 Chris Wilson    2016-10-25  171  	e->fence =3D dma_fence_ge=
t(f);
f91b3a694181209 Christian K=C3=B6nig 2015-08-20  172  	return 0;
f91b3a694181209 Christian K=C3=B6nig 2015-08-20  173  }
d38ceaf99ed015f Alex Deucher    2015-04-20  174 =20

:::::: The code at line 157 was first introduced by commit
:::::: d38ceaf99ed015f2a0b9af3499791bd3a3daae21 drm/amdgpu: add core driver=
 (v4)

:::::: TO: Alex Deucher <alexander.deucher@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
