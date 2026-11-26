Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795676828;
	b=P+vwYeNRV6o4JnAEZw74geSQPd+qDDQipOd4SPjEVaxsLhck35xV9Sm59jwzw1nBg0mi
	 Bhmgh0e4z4u889LKtnnLn4GRmAP4usBfIiBqtpf6wcj/7LxCjtPjbb9x9HaLYcO1W6svK
	 GUoTEhGsNWVmmnqAb0VO4uMWEuXkk6ml3BReqaGbjiXKp2Yr9W+Sd8PE9BViMSimx8KKV
	 kb6UJi0OFllHVA3Ank4JmMQuYY8+XSjUQcE4qSwEPB8FszpSSeEpzixX93zI7YnGd+tAb
	 qZvE6AraD5jcVNA9zC43icWiaeTB8mForsSXPTC/Fptg2xdgNw4DkuUtmk1KnqERrxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795676828;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=mvLiZfWWVhJ91aXYFf8fFPJ7+osEasLz6S2oxSW9sFI=;
	b=SM5CDkiAxqk6RsOmadDyauj4srs03bAWJagh3CXnzzU1xud+3YOx/M3VincrdYDAn2Bd
	 2kPvFkNtSQBcnN1vCMeUCnebFXTSRYqCpwUOJ6rlw1GEMIliFoO3aOBlKwFMHjNErt60c
	 9VPH+JhS+ta4RqyyBEpbR2BH+5jRslYOn9aKah19Lhwtwfltg6JpTL6kTvOVkiwFN+3Gn
	 heDOF7ajOcT66vT/h/Btaypo9mWlsiD0WJ6kGONPBP19H78fwpvevaFDC+WAItE2WvCvu
	 oj4HWjOB3lynhZduZpBMTuV8OIBw9XSUKQzTSsHWm9dos7A0Sxxx5Egywq19kIlxHSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TaJ6Q5YE;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193B5606A31C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Nov 2026 07:07:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 193B5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TaJ6Q5YE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795676827; x=1827212827;
  h=date:from:to:cc:subject:message-id;
  bh=6Oq/Yh39uxKqdC0vVsMLngXONSezbKTuOwa2mgX5+d8=;
  b=TaJ6Q5YEnDE25rbqbspwH7vua4SXJXckp37SDmiUGErYhC0UVMrZ7lFn
   ioGQRcakYSuafpxUfC9Uvw8c96lC1FJ54S380J2z9sLl75TBh7xd1T9cJ
   TbqCz6tGHL/G/eo4jOFyPK3gOgSzBatSmY5dRmtcxkvj6PJJeNChIqXrF
   IIDXxvGWIR0xjYQgIQO+ZMt33c7tKL1Oo8no3ivpQS9TozrfvUcagtN2W
   2SX416zxUExDC8RVYYd2sIq4tILYZYIl1sB5hxGhpei6Hpz2bUvRx/hby
   joNp16QtUWcEhxzfE+O+3WsDZPilKPgKIZcP7HlP34f3EBIzGVvW9NBJO
   Q==;
X-CSE-ConnectionGUID: SNhOFHS7RdGEc0t1E50OJg==
X-CSE-MsgGUID: 1ffUGV7BTRas59kK0k/cuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4568568"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4568568"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 23:07:06 -0800
X-CSE-ConnectionGUID: PGfRwpynQV6ISiBEEk1ecw==
X-CSE-MsgGUID: qR+YkfsARWmBMQzdqOWB2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="11995884"
Received: from igk-lkp-server01.igk.intel.com (HELO a03d4d989450) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 25 Nov 2026 23:07:04 -0800
Received: from kbuild by a03d4d989450 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWTZI-000000000Gl-24b2;
	Thu, 26 Nov 2026 07:06:56 +0000
Date: Thu, 26 Nov 2026 08:06:37 +0100
From: kernel test robot <lkp@intel.com>
To: Hawking Zhang <Hawking.Zhang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [drm-amdgpu:drm-amdgpu-next 175/243]
 drivers/gpu/drm/amd/amdgpu/soc_v2_0.c:298:20: sparse: sparse: cast to
 restricted __le32
Message-ID: <20261126075914.E1KsyTLj-lkp@intel.com>
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
commit: db93885e3c9f917b95959937ebbc8ca9ad592526 [175/243] drm/amdgpu: Add soc v2_0 support
config: openrisc-randconfig-r2300-20261125 (https://download.01.org/0day-ci/archive/20261126/20261126075914.E1KsyTLj-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126075914.E1KsyTLj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261126075914.E1KsyTLj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/soc_v2_0.c:298:20: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/amd/amdgpu/soc_v2_0.c:298:20: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/amd/amdgpu/soc_v2_0.c:298:20: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/amd/amdgpu/soc_v2_0.c:298:20: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/amd/amdgpu/soc_v2_0.c:298:20: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/amd/amdgpu/soc_v2_0.c:298:20: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/soc_v2_0.c:300:22: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/soc_v2_0.c:300:22: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/soc_v2_0.c:300:22: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/soc_v2_0.c:300:22: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/soc_v2_0.c:300:22: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/soc_v2_0.c:300:22: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/amd/amdgpu/soc_v2_0.c:301:24: sparse: sparse: cast to restricted __le64
>> drivers/gpu/drm/amd/amdgpu/soc_v2_0.c:301:24: sparse: sparse: cast to restricted __le64
>> drivers/gpu/drm/amd/amdgpu/soc_v2_0.c:301:24: sparse: sparse: cast to restricted __le64
>> drivers/gpu/drm/amd/amdgpu/soc_v2_0.c:301:24: sparse: sparse: cast to restricted __le64
>> drivers/gpu/drm/amd/amdgpu/soc_v2_0.c:301:24: sparse: sparse: cast to restricted __le64
>> drivers/gpu/drm/amd/amdgpu/soc_v2_0.c:301:24: sparse: sparse: cast to restricted __le64
>> drivers/gpu/drm/amd/amdgpu/soc_v2_0.c:301:24: sparse: sparse: cast to restricted __le64
>> drivers/gpu/drm/amd/amdgpu/soc_v2_0.c:301:24: sparse: sparse: cast to restricted __le64
>> drivers/gpu/drm/amd/amdgpu/soc_v2_0.c:301:24: sparse: sparse: cast to restricted __le64
>> drivers/gpu/drm/amd/amdgpu/soc_v2_0.c:301:24: sparse: sparse: cast to restricted __le64
   drivers/gpu/drm/amd/amdgpu/soc_v2_0.c:302:25: sparse: sparse: cast to restricted __le64
   drivers/gpu/drm/amd/amdgpu/soc_v2_0.c:302:25: sparse: sparse: cast to restricted __le64
   drivers/gpu/drm/amd/amdgpu/soc_v2_0.c:302:25: sparse: sparse: cast to restricted __le64
   drivers/gpu/drm/amd/amdgpu/soc_v2_0.c:302:25: sparse: sparse: cast to restricted __le64
   drivers/gpu/drm/amd/amdgpu/soc_v2_0.c:302:25: sparse: sparse: cast to restricted __le64
   drivers/gpu/drm/amd/amdgpu/soc_v2_0.c:302:25: sparse: sparse: cast to restricted __le64
   drivers/gpu/drm/amd/amdgpu/soc_v2_0.c:302:25: sparse: sparse: cast to restricted __le64
   drivers/gpu/drm/amd/amdgpu/soc_v2_0.c:302:25: sparse: sparse: cast to restricted __le64
   drivers/gpu/drm/amd/amdgpu/soc_v2_0.c:302:25: sparse: sparse: cast to restricted __le64
   drivers/gpu/drm/amd/amdgpu/soc_v2_0.c:302:25: sparse: sparse: cast to restricted __le64

vim +298 drivers/gpu/drm/amd/amdgpu/soc_v2_0.c

   279	
   280	static void soc_v2_0_get_fw_reserved_info(struct amdgpu_device *adev,
   281						  u64 *reserve_size,
   282						  u64 *offset)
   283	{
   284		struct mem_reserved_info_table_v1_0 *table =
   285			adev->discovery.mem_reserved_table;
   286		u64 resv_start = U64_MAX, resv_end = 0;
   287		u64 vram_base, vram_end, start, end, size;
   288		u32 list_num, id, i;
   289	
   290		if (!table) {
   291			dev_warn(adev->dev, "MEM_RESERVED_INFO table not available\n");
   292			return;
   293		}
   294	
   295		vram_base = adev->gmc.vram_start - adev->mmhub.funcs->get_fb_location(adev);
   296		vram_end = vram_base + adev->gmc.real_vram_size;
   297	
 > 298		list_num = min_t(u32, le32_to_cpu(table->list_num), MAX_MEM_REGION_NUM);
   299		for (i = 0; i < list_num; i++) {
   300			id = le32_to_cpu(table->list[i].reserved_region_id);
 > 301			size = le64_to_cpu(table->list[i].reserved_region_size);
   302			start = le64_to_cpu(table->list[i].reserved_region_start);
   303	
   304			if (id == NO_RESERVED_REGION_ID ||
   305			    id == SPECIFIC_PURPOSE_REGION_ID || !size)
   306				continue;
   307	
   308			if (check_add_overflow(start, size, &end))
   309				continue;
   310	
   311			if (end <= vram_base || start >= vram_end)
   312				continue;
   313	
   314			resv_start = min(resv_start, max(start, vram_base));
   315			resv_end = max(resv_end, min(end, vram_end));
   316		}
   317	
   318		if (resv_start >= resv_end) {
   319			dev_warn(adev->dev,
   320				 "no MEM_RESERVED_INFO region inside VRAM [0x%llx, 0x%llx)\n",
   321				 vram_base, vram_end);
   322			return;
   323		}
   324	
   325		*offset = resv_start - vram_base;
   326		*reserve_size = resv_end - resv_start;
   327	}
   328	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
