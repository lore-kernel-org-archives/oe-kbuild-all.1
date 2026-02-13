Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C67D279334
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Feb 2026 18:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771007686; cv=none; b=AqCEeR3ZyGyEa1o63tBGSHg+dTQf6PM6pxCZUS+pTK6PfCm2lDwbOJ92MAPpwPdALSXhOyAjiLEmdd7oYcTRU6dJC52pCT0ANIh1wKx+tD+KQtcYjcP1dmx8Tv5Z5jpqMGBF5LdEAwi4ilgzV9xNmvqsq7EiNOi5A4LYUgtIxc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771007686; c=relaxed/simple;
	bh=3mjWYbnpem5q3s50nhLv7UAoE9gOQ1s8C504nUkSfWI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fOOOrE8+TlkcR++3bhThVh9Pshhf1j2s1PZZA13x5WO3/80n45sHpRkwgSny4oJ6KB4nPbJWbifcGlXlN7EPsvE3NQqo+ZMmMfkWrXWjOKFPadwKRIivLCCmt5msRf+s5ETwOrQUU8Vvm3YlDjHRncpjINwXP0RxtzFT6D3ROY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WQPbBvGt; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WQPbBvGt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771007685; x=1802543685;
  h=date:from:to:cc:subject:message-id;
  bh=3mjWYbnpem5q3s50nhLv7UAoE9gOQ1s8C504nUkSfWI=;
  b=WQPbBvGt7oibdXXBEkcxfxA35ZAP89vN/LAFnWxWi6qSKwkgoyKWbRu3
   tefGyD0uSRDQ2pnvW4hkmMicAw7i+3II+eMV8Nexmin6ESQmi74wYZyjy
   I95DTcuU74Lxw59+PwICaiSc0Zm0bWUpg9gzxquVrOcRhj7cJBTlkwac1
   CCW2Sk/2WyHIuuBRXq+g2q3BZHZu1XWRuzKni5ayRSz5E+YHB6AmWQHtj
   y88GLbTFOAcBC+MrzahPv8NsMh1NtVIIqlMtHR29pyZyhk0Fggcp8asap
   0Zn3xq4BKBhRe9xJ6urBmiBuXC5W1cbYl5cM4OREm+uVy0DQ0fcXqjUn/
   Q==;
X-CSE-ConnectionGUID: k7+2pMBwQr2O7F8pUFZkTQ==
X-CSE-MsgGUID: mPoDqAchSB2NPtPY/PBCqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="71221988"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="71221988"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 10:34:43 -0800
X-CSE-ConnectionGUID: 4nrxDP9YTy28xJ5nrKx74w==
X-CSE-MsgGUID: wA68/JOKTyiJI/gk2Tql/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="212826627"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Feb 2026 10:34:41 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqxzz-00000000vku-1VFA;
	Fri, 13 Feb 2026 18:34:39 +0000
Date: Sat, 14 Feb 2026 02:33:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jack Xiao <Jack.Xiao@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>,
 Mukul Joshi <mukul.joshi@amd.com>
Subject: drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:1352:74: warning:
 '%hhu' directive output may be truncated writing 1 byte into a region of size
 between 0 and 2
Message-ID: <202602140200.2bCDckFo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Jack,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cee73b1e840c154f64ace682cb477c1ae2e29cc4
commit: e220edf2d6fd6dbf08fa93790809500a80217948 drm/amdgpu/mes_v12_1: initial support for mes_v12_1
date:   10 weeks ago
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20260214/202602140200.2bCDckFo-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602140200.2bCDckFo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602140200.2bCDckFo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/mes_v12_1.c: In function 'mes_v12_1_sw_init':
>> drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:1352:74: warning: '%hhu' directive output may be truncated writing 1 byte into a region of size between 0 and 2 [-Wformat-truncation=]
    1352 |         snprintf(ring->name, sizeof(ring->name), "mes_kiq_%hhu.%hhu.%hhu.%hhu",
         |                                                                          ^~~~
   In function 'mes_v12_1_kiq_ring_init',
       inlined from 'mes_v12_1_sw_init' at drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:1425:9:
   drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:1352:9: note: 'snprintf' output between 16 and 18 bytes into a destination of size 16
    1352 |         snprintf(ring->name, sizeof(ring->name), "mes_kiq_%hhu.%hhu.%hhu.%hhu",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1353 |                  (unsigned char)xcc_id, (unsigned char)ring->me,
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1354 |                  (unsigned char)ring->pipe, (unsigned char)ring->queue);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1352 drivers/gpu/drm/amd/amdgpu/mes_v12_1.c

  1326	
  1327	static int mes_v12_1_kiq_ring_init(struct amdgpu_device *adev, int xcc_id)
  1328	{
  1329		struct amdgpu_ring *ring;
  1330		int inst = MES_PIPE_INST(xcc_id, AMDGPU_MES_KIQ_PIPE);
  1331	
  1332		spin_lock_init(&adev->gfx.kiq[xcc_id].ring_lock);
  1333	
  1334		ring = &adev->gfx.kiq[xcc_id].ring;
  1335	
  1336		ring->me = 3;
  1337		ring->pipe = 1;
  1338		ring->queue = 0;
  1339		ring->xcc_id = xcc_id;
  1340		ring->vm_hub = AMDGPU_GFXHUB(xcc_id);
  1341	
  1342		ring->adev = NULL;
  1343		ring->ring_obj = NULL;
  1344		ring->use_doorbell = true;
  1345		ring->eop_gpu_addr = adev->mes.eop_gpu_addr[inst];
  1346		ring->no_scheduler = true;
  1347		ring->doorbell_index =
  1348			(adev->doorbell_index.mes_ring1 +
  1349			 xcc_id * adev->doorbell_index.xcc_doorbell_range)
  1350			<< 1;
  1351	
> 1352		snprintf(ring->name, sizeof(ring->name), "mes_kiq_%hhu.%hhu.%hhu.%hhu",
  1353			 (unsigned char)xcc_id, (unsigned char)ring->me,
  1354			 (unsigned char)ring->pipe, (unsigned char)ring->queue);
  1355	
  1356		return amdgpu_ring_init(adev, ring, 1024, NULL, 0,
  1357					AMDGPU_RING_PRIO_DEFAULT, NULL);
  1358	}
  1359	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
