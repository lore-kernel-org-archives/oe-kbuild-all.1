Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795696207;
	b=i0sdAO9YXmbldcBg89216Kaqu+8fLFymmxGG8tWmElW3u//5F9KbnCiFDPKrarXLYxK3
	 pP32dXPrv6WGgCVJylHaFW4poWuZR+/Jb09PIEL2I3E+ycxGSLe5iFXN4CGCQOw3LkCCN
	 T1yT+cC4clbxSiS4DPbBkM7wfdkznRt5gw4Q9f6hNnTss7+hSZkKwKN40zySSvKKqx9Lw
	 ON6tn58X/IVD6hkjnvem6xKh2DToxDTGA3NXfYtG9hgZ5oHuYgFhVA9p1zJDP/VAZkJLc
	 Vyqt3nzX3hrE5cnqfAdukhg/ZNqHVr7gC5FCMgGqKtBjtlaZMHOgOc5HbYTDFB3oEIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795696207;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=emrxVPCA7WnnZdsx5Kkn7EfGfWUoxNUPEmj9V1ETgqg=;
	b=yd/u0rsGhI4Q9RYYilDYC9+6EO6CSUpGqmEOU1AFgHxEty6dlJGkcWwqVe0eKAS2yc89
	 trHuC/7GSfhpzcCxPZtXgnMJDSLDIm1PMJW+wQK5RNv3sbCXP0Dy3UtpOvNFKNIqOWRTw
	 gBIszca4bO5OWgw5IvhP/AA6wu7YDBiHXyxh04QPVv/buepfPKp3cUwefauIurt5LcTwe
	 HhkHm+MZ1qUpcwLnUUuE5tiYF2PlqftpgljuoFL/QAJaq8B5ZOAyUvH7pq9Qn8rLnpYDy
	 oE62BxXerl7iXjichTx/keuZ3h8ZKoJ3v21OnUpJeggdEInC0JoLZ6dskBUMOm+KrYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=juhLc+cT;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B04B606A327
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Nov 2026 12:30:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B04B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=juhLc+cT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795696207; x=1827232207;
  h=date:from:to:cc:subject:message-id;
  bh=f7/gFMhiQWckYvONzZWWeosGEt9SPB0edLkBw/1Wdd0=;
  b=juhLc+cTUEuyH1xigaQHOgOTxPHxf41nZIjdwLEAul5w5WrMkLZAf9Y4
   qOyvWa6UWe2W0N2n0r2B5TeanruuHmRV8CCz7AMXfwEzKybFpXl25KjrK
   n+5LxSbQNUs+AWMZhEm+q1o5sOeWt85QpRMwkSH787HpyLWON/rep/WM5
   IDSmCuUGJ+kjtULF660ws3HYexDlntDaLzTSmVjxqz6XU5qfS+6rU98TA
   CUrB289LtBl7vg1jSyRsPoLPEM69SY4FINtBCNcULfgyTYsUxTUKjhGEA
   pO9Ha2BeSX002ObWb255su4gSh4Ze+1TfbXnHCbbp/1ONgNNWcxI48A+O
   w==;
X-CSE-ConnectionGUID: tiC1A1Z+QJKUqc671Dq3hw==
X-CSE-MsgGUID: 2NOAchrqQGySudeDz09DAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4614014"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4614014"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 04:29:57 -0800
X-CSE-ConnectionGUID: u1rG2OqxT9yNRRqSyaH90g==
X-CSE-MsgGUID: nxmHOMl1T0yMBY5rwDpjaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="13930062"
Received: from igk-lkp-server01.igk.intel.com (HELO 800201f3098f) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 26 Nov 2026 04:29:55 -0800
Received: from kbuild by 800201f3098f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWYbp-0000000003S-0JfW;
	Thu, 26 Nov 2026 12:29:53 +0000
Date: Thu, 26 Nov 2026 13:28:59 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Min <Frank.Min@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Subject: [drm-amdgpu:drm-amdgpu-next 242/243]
 drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:3042:73: sparse: sparse: incorrect
 type in argument 2 (different address spaces)
Message-ID: <20261126132141.9Gy8v0dw-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://gitlab.freedesktop.org/drm/amdgpu/kernel drm-amdgpu-next
head:   a69db917063c539fa09325ea22f3ff7b0626b478
commit: bffef1cc5b3d97e503c87f51759a31249d4a3d1e [242/243] drm/amdgpu: Add gfx v13 ip block
config: um-randconfig-r2306-20261126 (https://download.01.org/0day-ci/archive/20261126/20261126132141.9Gy8v0dw-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126132141.9Gy8v0dw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261126132141.9Gy8v0dw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c: note: in included file:
   drivers/gpu/drm/amd/amdgpu/clearstate_gfx13.h:113:7: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpu/drm/amd/amdgpu/clearstate_gfx13.h:118:7: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:506:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:506:28: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:506:28: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:540:13: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:573:36: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:574:41: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:575:36: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:577:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:621:33: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:622:33: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:708:57: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:708:57: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:708:57: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:1172:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:1173:19: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:1178:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:1179:19: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:1189:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:1190:19: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:1195:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:1196:19: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:1206:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:1207:19: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:1212:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:1213:19: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:1227:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:1228:19: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:1232:25: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:1233:25: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:1239:41: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:1240:35: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:1245:41: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:1246:35: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:1254:41: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:1255:35: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:1260:41: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:1261:35: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:1278:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:1279:19: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:1306:33: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:1307:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:1312:33: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:1313:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:2014:28: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:2015:19: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:2036:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:2037:19: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:2050:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:2051:19: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:2080:25: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:2423:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:2424:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:2427:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:2428:24: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:2564:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:2565:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:2568:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:2569:24: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:2795:33: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:2796:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:2799:33: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:2800:24: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:3042:73: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got struct v13_gfx_mqd *mqd @@
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:3042:73: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:3042:73: sparse:     got struct v13_gfx_mqd *mqd
>> drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:3046:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got struct v13_gfx_mqd *mqd @@
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:3046:37: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:3046:37: sparse:     got struct v13_gfx_mqd *mqd
>> drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:3380:74: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got struct v13_compute_mqd *mqd @@
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:3380:74: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:3380:74: sparse:     got struct v13_compute_mqd *mqd
>> drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:3384:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got struct v13_compute_mqd *mqd @@
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:3384:37: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:3384:37: sparse:     got struct v13_compute_mqd *mqd
   drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:4628:21: sparse: sparse: cast to restricted __le32

vim +3042 drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c

  3027	
  3028	static int gfx_v13_0_kgq_init_queue(struct amdgpu_ring *ring, bool reset)
  3029	{
  3030		struct amdgpu_device *adev = ring->adev;
  3031		struct v13_gfx_mqd *mqd = ring->mqd_ptr;
  3032		int mqd_idx = ring - &adev->gfx.gfx_ring[0];
  3033	
  3034		if (!reset && !amdgpu_in_reset(adev) && !adev->in_suspend) {
  3035			memset((void *)mqd, 0, sizeof(*mqd));
  3036			mutex_lock(&adev->srbm_mutex);
  3037			soc_v2_0_grbm_select(adev, ring->me, ring->pipe, ring->queue, 0);
  3038			amdgpu_ring_init_mqd(ring);
  3039			soc_v2_0_grbm_select(adev, 0, 0, 0, 0);
  3040			mutex_unlock(&adev->srbm_mutex);
  3041			if (adev->gfx.me.mqd_backup[mqd_idx])
> 3042				memcpy_fromio(adev->gfx.me.mqd_backup[mqd_idx], mqd, sizeof(*mqd));
  3043		} else {
  3044			/* restore mqd with the backup copy */
  3045			if (adev->gfx.me.mqd_backup[mqd_idx])
> 3046				memcpy_toio(mqd, adev->gfx.me.mqd_backup[mqd_idx], sizeof(*mqd));
  3047			/* reset the ring */
  3048			ring->wptr = 0;
  3049			*(u64 *)ring->wptr_cpu_addr = 0;
  3050			amdgpu_ring_clear_ring(ring);
  3051		}
  3052	
  3053		return 0;
  3054	}
  3055	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
