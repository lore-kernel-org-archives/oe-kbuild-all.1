Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7C45F546
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Mar 2024 06:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709274185; cv=none; b=NjBI0wcI96AVcP0cmQOgK9C7ibVzjCOYqCcHOt2z8dybp9qF2sOUu44+7CLwBeoZWXP5rKsQe2ZP04B5pt7bXT9IIVlOND2dKD1WobiTPpcZRjKH6UkDCFUdwC6HWJrTtzbglax71ZJlJ9QYcLf7osvrBcr5mheam5jmQyw+ixU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709274185; c=relaxed/simple;
	bh=A9Dzo0/4S7DIrl5L1/Lw9AVypBhjc/YcVTTR3x/OcGc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZzQil0esKFqK7oAIoOsv1L8MM49d27nXBzT4/0VjOQKeXvGdsAooG0Km6bIy2Ay6aOoMEPZgzGhVQ4Nroy7sN07esyrklz7LWV+COf1ZKn2IgWJtCJmRnnR3CmAFZHY0b7UxmOcf/cm//1wJMJaUOj84XtqKyLWnNc7LmRxHKBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DPqs0nKL; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DPqs0nKL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709274183; x=1740810183;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A9Dzo0/4S7DIrl5L1/Lw9AVypBhjc/YcVTTR3x/OcGc=;
  b=DPqs0nKLbTSFl6hE7NbAyb1mK3iXzRWyrGKVQIj9L1s3nQuEHo7oh7Si
   SI8WT2JtuZnIpSLtUhEfeXowE+e5Frl3GQD7lKVD3EMQVAwsThV3bnkL4
   zyUcag/czyw6dqOEmvPomFY33cuLeix/CuWXeLGL0SmyCqsH00j1NXbqG
   a5oAsIQ3poX84bdbt1w9GK/xGQr6qerfci5fqGbOvv9pCXilYFA9KVwYr
   3SBYWMBMuQ+swnn2a+oHqrG+vma1FpL/OQAJ4m3WRUHPkm3mLEjKDcYmt
   ZrsfpZ2yUJBWs0cj2ddD59y5nyXMuskMeDAyzH0B+KKeciKnTsqIRFZEp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="15207230"
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="15207230"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 22:23:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="8161321"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 29 Feb 2024 22:23:00 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfwIL-000DaZ-1U;
	Fri, 01 Mar 2024 06:22:57 +0000
Date: Fri, 1 Mar 2024 14:22:33 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Will Deacon <will@kernel.org>,
	Michael Shavit <mshavit@google.com>
Subject: [arm-perf:for-joerg/arm-smmu/updates 5/20]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1144:39: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202403011441.5WqGrYjp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git for-joerg/arm-smmu/updates
head:   327e10b47ae99f76ac53f0b8b73a0539f390d2d2
commit: 7da51af9125c624318c8099de13c5ddefd47e9e8 [5/20] iommu/arm-smmu-v3: Make STE programming independent of the callers
config: arm64-randconfig-r131-20240301 (https://download.01.org/0day-ci/archive/20240301/202403011441.5WqGrYjp-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce: (https://download.01.org/0day-ci/archive/20240301/202403011441.5WqGrYjp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403011441.5WqGrYjp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1144:52: sparse: sparse: restricted __le64 degrades to integer
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1144:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 @@     got unsigned long long @@
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1144:39: sparse:     expected restricted __le64
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1144:39: sparse:     got unsigned long long
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c: note: in included file (through arch/arm64/include/asm/atomic.h, include/linux/atomic.h, include/asm-generic/bitops/atomic.h, ...):
   arch/arm64/include/asm/cmpxchg.h:168:1: sparse: sparse: cast truncates bits from constant value (ffffffff80000000 becomes 0)
   arch/arm64/include/asm/cmpxchg.h:168:1: sparse: sparse: cast truncates bits from constant value (ffffffff80000000 becomes 0)
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c: note: in included file (through include/linux/resource_ext.h, include/linux/acpi.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +1144 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c

  1080	
  1081	/*
  1082	 * Update the STE/CD to the target configuration. The transition from the
  1083	 * current entry to the target entry takes place over multiple steps that
  1084	 * attempts to make the transition hitless if possible. This function takes care
  1085	 * not to create a situation where the HW can perceive a corrupted entry. HW is
  1086	 * only required to have a 64 bit atomicity with stores from the CPU, while
  1087	 * entries are many 64 bit values big.
  1088	 *
  1089	 * The difference between the current value and the target value is analyzed to
  1090	 * determine which of three updates are required - disruptive, hitless or no
  1091	 * change.
  1092	 *
  1093	 * In the most general disruptive case we can make any update in three steps:
  1094	 *  - Disrupting the entry (V=0)
  1095	 *  - Fill now unused qwords, execpt qword 0 which contains V
  1096	 *  - Make qword 0 have the final value and valid (V=1) with a single 64
  1097	 *    bit store
  1098	 *
  1099	 * However this disrupts the HW while it is happening. There are several
  1100	 * interesting cases where a STE/CD can be updated without disturbing the HW
  1101	 * because only a small number of bits are changing (S1DSS, CONFIG, etc) or
  1102	 * because the used bits don't intersect. We can detect this by calculating how
  1103	 * many 64 bit values need update after adjusting the unused bits and skip the
  1104	 * V=0 process. This relies on the IGNORED behavior described in the
  1105	 * specification.
  1106	 */
  1107	static void arm_smmu_write_ste(struct arm_smmu_master *master, u32 sid,
  1108				       struct arm_smmu_ste *entry,
  1109				       const struct arm_smmu_ste *target)
  1110	{
  1111		unsigned int num_entry_qwords = ARRAY_SIZE(target->data);
  1112		struct arm_smmu_device *smmu = master->smmu;
  1113		struct arm_smmu_ste unused_update;
  1114		u8 used_qword_diff;
  1115	
  1116		used_qword_diff =
  1117			arm_smmu_entry_qword_diff(entry, target, &unused_update);
  1118		if (hweight8(used_qword_diff) == 1) {
  1119			/*
  1120			 * Only one qword needs its used bits to be changed. This is a
  1121			 * hitless update, update all bits the current STE is ignoring
  1122			 * to their new values, then update a single "critical qword" to
  1123			 * change the STE and finally 0 out any bits that are now unused
  1124			 * in the target configuration.
  1125			 */
  1126			unsigned int critical_qword_index = ffs(used_qword_diff) - 1;
  1127	
  1128			/*
  1129			 * Skip writing unused bits in the critical qword since we'll be
  1130			 * writing it in the next step anyways. This can save a sync
  1131			 * when the only change is in that qword.
  1132			 */
  1133			unused_update.data[critical_qword_index] =
  1134				entry->data[critical_qword_index];
  1135			entry_set(smmu, sid, entry, &unused_update, 0, num_entry_qwords);
  1136			entry_set(smmu, sid, entry, target, critical_qword_index, 1);
  1137			entry_set(smmu, sid, entry, target, 0, num_entry_qwords);
  1138		} else if (used_qword_diff) {
  1139			/*
  1140			 * At least two qwords need their inuse bits to be changed. This
  1141			 * requires a breaking update, zero the V bit, write all qwords
  1142			 * but 0, then set qword 0
  1143			 */
> 1144			unused_update.data[0] = entry->data[0] & (~STRTAB_STE_0_V);
  1145			entry_set(smmu, sid, entry, &unused_update, 0, 1);
  1146			entry_set(smmu, sid, entry, target, 1, num_entry_qwords - 1);
  1147			entry_set(smmu, sid, entry, target, 0, 1);
  1148		} else {
  1149			/*
  1150			 * No inuse bit changed. Sanity check that all unused bits are 0
  1151			 * in the entry. The target was already sanity checked by
  1152			 * compute_qword_diff().
  1153			 */
  1154			WARN_ON_ONCE(
  1155				entry_set(smmu, sid, entry, target, 0, num_entry_qwords));
  1156		}
  1157	
  1158		/* It's likely that we'll want to use the new STE soon */
  1159		if (!(smmu->options & ARM_SMMU_OPT_SKIP_PREFETCH)) {
  1160			struct arm_smmu_cmdq_ent
  1161				prefetch_cmd = { .opcode = CMDQ_OP_PREFETCH_CFG,
  1162						 .prefetch = {
  1163							 .sid = sid,
  1164						 } };
  1165	
  1166			arm_smmu_cmdq_issue_cmd(smmu, &prefetch_cmd);
  1167		}
  1168	}
  1169	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
