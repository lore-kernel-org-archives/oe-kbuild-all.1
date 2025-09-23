Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BFF18024
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Sep 2025 01:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758590207; cv=none; b=t8LejSU3Hu/xrjz57xI9g+ZtC2moVyRQmSEnd8bhCC8kJrYAtgkl20K/7FUz7JWzmhuXjn6WoNe5zG0iqCS/C98TlIqZfElIesyG5olsEkNdv65AzgJaF1A7H6BVcmBPXcD+r0DkLH8LbTNqBihO+sTLrukQX7megdzvAPLeQGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758590207; c=relaxed/simple;
	bh=u1WKpQ08rbjS0DZEai3nKKzvYSTe4FXGDMOyfoisaC8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lHpC2WSyBhmqprmyeWN3UWFlig5yX05B0EYLIy11plr8Wvfq6Bk3xddyhl+sEfe/oc447Uvftrvb/112aHASYVc+ozvseeUV1eK7WtCxJBVosO0vPcJIiphVYjexWEXjwB/DY92U62QiRn3Q0o9fHc1U2c777aQ+M/qW0I9R/1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gOqwf5so; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gOqwf5so"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758590205; x=1790126205;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u1WKpQ08rbjS0DZEai3nKKzvYSTe4FXGDMOyfoisaC8=;
  b=gOqwf5soSu0lX85J7WAhcF6VFJIXERp44ST8O6rCEGDeZ2TsV54MaTBr
   C2CJroLT7OGKdunn3A412SpA+xS7xVjJZN0Gf2Kx9crlYsED/K1VbURov
   BdDOiuwCEMNh5Zzkeb5rcX7ZfD7FWbom5qAb8iEWO8IrW6ej5nv4Pgjgh
   Wyf43572YgBJgrNg10MKaQzEqlz9CSoGPYlpAauAQH/85lhGqsfM/kcbk
   wl5LvOO1u6Vigl3gWBNzHt6+TVRELv1pIRCWcTXxl8nv0tgwVk/Ubpi9y
   kN142/+bpltrnJIpwACmNdwkT3N3jC8D29PuqClseVE0x7QG1+Z3yRxLe
   A==;
X-CSE-ConnectionGUID: XaA+/jWJQu+AQYB41STjBg==
X-CSE-MsgGUID: 7YNb5A2ESZalBJlGeKzM2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="86298826"
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; 
   d="scan'208";a="86298826"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 18:16:44 -0700
X-CSE-ConnectionGUID: 5uCSmiIAQQeBIHuPvWki8A==
X-CSE-MsgGUID: HN++34bdStu3PGpwDVymSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; 
   d="scan'208";a="175903942"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 22 Sep 2025 18:16:41 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0rdy-0002cH-0R;
	Tue, 23 Sep 2025 01:16:34 +0000
Date: Tue, 23 Sep 2025 09:15:38 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yangxiangkai <yangxiangkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2909/2909]
 drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:315:22: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202509230956.SzqfHlZe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a159deb279dfe156316d8c3957dc7f253686ff83
commit: ed007ade0cef81fb47328683b8a7eec5edfa8494 [2909/2909] virtcca feature: secure smmu init
config: arm64-randconfig-r121-20250923 (https://download.01.org/0day-ci/archive/20250923/202509230956.SzqfHlZe-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250923/202509230956.SzqfHlZe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509230956.SzqfHlZe-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:315:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] cmd0 @@     got restricted __le64 [usertype] @@
   drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:315:22: sparse:     expected unsigned long long [usertype] cmd0
   drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:315:22: sparse:     got restricted __le64 [usertype]
>> drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:316:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] cmd1 @@     got restricted __le64 [usertype] @@
   drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:316:22: sparse:     expected unsigned long long [usertype] cmd1
   drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:316:22: sparse:     got restricted __le64 [usertype]
   drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:509:13: sparse: sparse: symbol 'virtcca_smmu_evtq_thread' was not declared. Should it be static?
>> drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:527:13: sparse: sparse: symbol 'virtcca_smmu_gerror_handler' was not declared. Should it be static?

vim +315 drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c

   296	
   297	/**
   298	 * Write queue command to TMM
   299	 * @smmu: An SMMUv3 instance
   300	 * @src: Command information
   301	 * @n_dwords: Num of command
   302	 */
   303	static void virtcca_smmu_queue_write(struct arm_smmu_device *smmu, u64 *src, size_t n_dwords)
   304	{
   305		u64 cmd0, cmd1;
   306		u64 forward = 0;
   307	
   308		if (!is_virtcca_cvm_enable())
   309			return;
   310	
   311		if (!virtcca_smmu_enable(smmu))
   312			return;
   313	
   314		if (n_dwords == ARM_S_SMMU_CMD_COUNT) {
 > 315			cmd0 = cpu_to_le64(src[0]);
 > 316			cmd1 = cpu_to_le64(src[1]);
   317			virtcca_smmu_cmdq_need_forward(cmd0, cmd1, &forward);
   318	
   319			/* need forward queue command to TMM */
   320			if (forward) {
   321				if (tmi_smmu_queue_write(cmd0, cmd1, smmu->s_smmu_id))
   322					dev_err(smmu->dev, "S_SMMU: s queue write failed\n");
   323			}
   324		}
   325	}
   326	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
