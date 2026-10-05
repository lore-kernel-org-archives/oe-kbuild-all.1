Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49561EFFA1
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Oct 2026 00:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791160034; cv=none; b=dJ1zrnvvg3bN2j5i1okZjHEZmCoHyRlq4xod7R/az82ZJI3yhNnLrVBS0K9tx4nz4kZ9z58tlPBN8fM/rJabEStfOb9v47mvdipzHkYZbPC0mqT5dFmse1tiwD+BH4QAMfhK5ydQpiP9LRlWRIF74CawnQCX0b/iRy7cb6LTteM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791160034; c=relaxed/simple;
	bh=VoWWdXXgPNHTe2Hr+4PtKbtEKN4ffE9S/3nqWVURVkI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aSMlG80NX4W+FGAXnCZTzDZoEF1S1IUhccb49PVfVq0wRXarx86sgp4Kqnox75nfpazwGKGUackl/2h2+Kx+1GxFo9nWYlL36yHJyEcI064jujpGZMpNhORmNNVB286R+ImUkEW+fGuVBmuT9D+qWCRTfkc7O9rxPvejv4yYJh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j5aydnED; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j5aydnED"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791160033; x=1822696033;
  h=date:from:to:cc:subject:message-id;
  bh=VoWWdXXgPNHTe2Hr+4PtKbtEKN4ffE9S/3nqWVURVkI=;
  b=j5aydnED2camt7bEXSCWejT+umQKEJ4f5c1qxx2LanHJtpDIQX/QIap5
   wFARPyKnbjVUp61V7F/eI7Vg8Y0JtWRZFAmK+EKXWTSEwv9HqTSd45WsB
   S5t0pp3rZMDJ9ZHZ9VTICbbXZgXwQ9eFqWy9fE65tAHe9fmX1TkZYDGwb
   kK69a27tWQYYBd7lqOEPdEyYmp2efRYmbgjaohpSK+HQCbUkZZWlUvkOc
   MbonlXtwpg6cQ5iOGEhH5xH+OBxK6NTPrS8H6/33e+LIdIUs5wGoCt9Y5
   xM/wJ4QtASH844YnT/SC3rD0dQm33vw/uac6vnIZD5bF7tlbocKiL8CQL
   w==;
X-CSE-ConnectionGUID: 4HbGlBXITl6lv4HMhl13QQ==
X-CSE-MsgGUID: Djn/mcHMRAa77l3YyuJRJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="113607574"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="113607574"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 17:27:12 -0700
X-CSE-ConnectionGUID: eoUdzmTEQxS4bS8RBjUCZQ==
X-CSE-MsgGUID: m9L8fDe+RRemmBZEgIV08Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="280433887"
Received: from igk-lkp-server01.igk.intel.com (HELO 3a02ec7efc9f) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 04 Oct 2026 17:27:10 -0700
Received: from kbuild by 3a02ec7efc9f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDWXr-000000000V1-2CEn;
	Mon, 05 Oct 2026 00:27:07 +0000
Date: Mon, 05 Oct 2026 02:26:27 +0200
From: kernel test robot <lkp@intel.com>
To: Bokun Zhang <Bokun.Zhang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [linux-next:master 741/14185]
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_2.c:830:43: sparse: sparse: invalid
 assignment: |=
Message-ID: <202610050223.DK7qfzId-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f0406245cb9855e6318335a8a223551354291a46
commit: 98ba50b2ef1397635ff03091b396b93d0850d50a [741/14185] drm/amdgpu: Add VCN v5.0.2 SRIOV code path
config: alpha-randconfig-r2303-20261004 (https://download.01.org/0day-ci/archive/20261005/202610050223.DK7qfzId-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261005/202610050223.DK7qfzId-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610050223.DK7qfzId-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/vcn_v5_0_2.c:830:43: sparse: sparse: invalid assignment: |=
   drivers/gpu/drm/amd/amdgpu/vcn_v5_0_2.c:830:43: sparse:    left side has type unsigned int
   drivers/gpu/drm/amd/amdgpu/vcn_v5_0_2.c:830:43: sparse:    right side has type restricted __le32
   drivers/gpu/drm/amd/amdgpu/vcn_v5_0_2.c:90:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] present_flag_0 @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/vcn_v5_0_2.c:90:35: sparse:     expected unsigned int [usertype] present_flag_0
   drivers/gpu/drm/amd/amdgpu/vcn_v5_0_2.c:90:35: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/vcn_v5_0_2.c:358:16: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/vcn_v5_0_2.c:423:16: sparse: sparse: cast to restricted __le32

vim +830 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_2.c

   707	
   708	
   709	/**
   710	 * vcn_v5_0_2_start_sriov - VCN start under SRIOV env
   711	 */
   712	
   713	static int vcn_v5_0_2_start_sriov(struct amdgpu_device *adev)
   714	{
   715		int i, vcn_inst;
   716		struct amdgpu_ring *ring_enc;
   717		uint64_t cache_addr;
   718		uint64_t rb_enc_addr;
   719		uint64_t ctx_addr;
   720		uint32_t param, resp, expected;
   721		uint32_t offset, cache_size;
   722		uint32_t tmp, timeout;
   723	
   724		struct amdgpu_mm_table *table = &adev->virt.mm_table;
   725		uint32_t *table_loc;
   726		uint32_t table_size;
   727		uint32_t size, size_dw;
   728		uint32_t init_status;
   729	
   730		struct mmsch_v5_0_cmd_direct_write
   731			direct_wt = { {0} };
   732		struct mmsch_v5_0_cmd_direct_read_modify_write
   733			direct_rd_mod_wt = { {0} };
   734		struct mmsch_v5_0_cmd_end end = { {0} };
   735		struct mmsch_v5_0_init_header header;
   736	
   737		struct amdgpu_vcn5_fw_shared *fw_shared;
   738		struct amdgpu_fw_shared_rb_setup *rb_setup;
   739	
   740		direct_wt.cmd_header.command_type =
   741			MMSCH_COMMAND__DIRECT_REG_WRITE;
   742		direct_rd_mod_wt.cmd_header.command_type =
   743			MMSCH_COMMAND__DIRECT_REG_READ_MODIFY_WRITE;
   744		end.cmd_header.command_type = MMSCH_COMMAND__END;
   745	
   746		for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
   747			vcn_inst = GET_INST(VCN, i);
   748	
   749			vcn_v5_0_2_fw_shared_init(adev, vcn_inst);
   750	
   751			memset(&header, 0, sizeof(struct mmsch_v5_0_init_header));
   752			header.version = MMSCH_VERSION;
   753			header.total_size = sizeof(struct mmsch_v5_0_init_header) >> 2;
   754	
   755			table_loc = (uint32_t *)table->cpu_addr;
   756			table_loc += header.total_size;
   757	
   758			table_size = 0;
   759	
   760			MMSCH_V5_0_INSERT_DIRECT_RD_MOD_WT(SOC15_REG_OFFSET(VCN, 0, regUVD_STATUS),
   761				~UVD_STATUS__UVD_BUSY, UVD_STATUS__UVD_BUSY);
   762	
   763			cache_size = AMDGPU_GPU_PAGE_ALIGN(adev->vcn.inst[i].fw->size + 4);
   764	
   765			if (adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) {
   766				MMSCH_V5_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCN, 0,
   767					regUVD_LMI_VCPU_CACHE_64BIT_BAR_LOW),
   768					adev->firmware.ucode[AMDGPU_UCODE_ID_VCN + i].tmr_mc_addr_lo);
   769	
   770				MMSCH_V5_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCN, 0,
   771					regUVD_LMI_VCPU_CACHE_64BIT_BAR_HIGH),
   772					adev->firmware.ucode[AMDGPU_UCODE_ID_VCN + i].tmr_mc_addr_hi);
   773	
   774				offset = 0;
   775				MMSCH_V5_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCN, 0,
   776					regUVD_VCPU_CACHE_OFFSET0), 0);
   777			} else {
   778				MMSCH_V5_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCN, 0,
   779					regUVD_LMI_VCPU_CACHE_64BIT_BAR_LOW),
   780					lower_32_bits(adev->vcn.inst[i].gpu_addr));
   781				MMSCH_V5_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCN, 0,
   782					regUVD_LMI_VCPU_CACHE_64BIT_BAR_HIGH),
   783					upper_32_bits(adev->vcn.inst[i].gpu_addr));
   784			offset = cache_size;
   785				MMSCH_V5_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCN, 0,
   786					regUVD_VCPU_CACHE_OFFSET0),
   787					AMDGPU_UVD_FIRMWARE_OFFSET >> 3);
   788			}
   789	
   790			MMSCH_V5_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCN, 0,
   791				regUVD_VCPU_CACHE_SIZE0),
   792				cache_size);
   793	
   794			cache_addr = adev->vcn.inst[vcn_inst].gpu_addr + offset;
   795			MMSCH_V5_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCN, 0,
   796				regUVD_LMI_VCPU_CACHE1_64BIT_BAR_LOW), lower_32_bits(cache_addr));
   797			MMSCH_V5_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCN, 0,
   798				regUVD_LMI_VCPU_CACHE1_64BIT_BAR_HIGH), upper_32_bits(cache_addr));
   799			MMSCH_V5_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCN, 0,
   800				regUVD_VCPU_CACHE_OFFSET1), 0);
   801			MMSCH_V5_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCN, 0,
   802				regUVD_VCPU_CACHE_SIZE1), AMDGPU_VCN_STACK_SIZE);
   803	
   804			cache_addr = adev->vcn.inst[vcn_inst].gpu_addr + offset +
   805				AMDGPU_VCN_STACK_SIZE;
   806	
   807			MMSCH_V5_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCN, 0,
   808				regUVD_LMI_VCPU_CACHE2_64BIT_BAR_LOW), lower_32_bits(cache_addr));
   809	
   810			MMSCH_V5_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCN, 0,
   811			regUVD_LMI_VCPU_CACHE2_64BIT_BAR_HIGH), upper_32_bits(cache_addr));
   812	
   813			MMSCH_V5_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCN, 0,
   814				regUVD_VCPU_CACHE_OFFSET2), 0);
   815	
   816			MMSCH_V5_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCN, 0,
   817				regUVD_VCPU_CACHE_SIZE2), AMDGPU_VCN_CONTEXT_SIZE);
   818	
   819			fw_shared = adev->vcn.inst[vcn_inst].fw_shared.cpu_addr;
   820			rb_setup = &fw_shared->rb_setup;
   821	
   822			ring_enc = &adev->vcn.inst[vcn_inst].ring_enc[0];
   823			ring_enc->wptr = 0;
   824			rb_enc_addr = ring_enc->gpu_addr;
   825	
   826			rb_setup->is_rb_enabled_flags |= RB_ENABLED;
   827			rb_setup->rb_addr_lo = lower_32_bits(rb_enc_addr);
   828			rb_setup->rb_addr_hi = upper_32_bits(rb_enc_addr);
   829			rb_setup->rb_size = ring_enc->ring_size / 4;
 > 830			fw_shared->present_flag_0 |= cpu_to_le32(AMDGPU_VCN_VF_RB_SETUP_FLAG);
   831	
   832			MMSCH_V5_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCN, 0,
   833				regUVD_LMI_VCPU_NC0_64BIT_BAR_LOW),
   834				lower_32_bits(adev->vcn.inst[vcn_inst].fw_shared.gpu_addr));
   835			MMSCH_V5_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCN, 0,
   836				regUVD_LMI_VCPU_NC0_64BIT_BAR_HIGH),
   837				upper_32_bits(adev->vcn.inst[vcn_inst].fw_shared.gpu_addr));
   838			MMSCH_V5_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCN, 0,
   839				regUVD_VCPU_NONCACHE_SIZE0),
   840				AMDGPU_GPU_PAGE_ALIGN(sizeof(struct amdgpu_vcn4_fw_shared)));
   841			MMSCH_V5_0_INSERT_END();
   842	
   843			header.vcn0.init_status = 0;
   844			header.vcn0.table_offset = header.total_size;
   845			header.vcn0.table_size = table_size;
   846			header.total_size += table_size;
   847	
   848			/* Send init table to mmsch */
   849			size = sizeof(struct mmsch_v5_0_init_header);
   850			table_loc = (uint32_t *)table->cpu_addr;
   851			memcpy((void *)table_loc, &header, size);
   852	
   853			ctx_addr = table->gpu_addr;
   854			WREG32_SOC15(VCN, vcn_inst, regMMSCH_VF_CTX_ADDR_LO, lower_32_bits(ctx_addr));
   855			WREG32_SOC15(VCN, vcn_inst, regMMSCH_VF_CTX_ADDR_HI, upper_32_bits(ctx_addr));
   856	
   857			tmp = RREG32_SOC15(VCN, vcn_inst, regMMSCH_VF_VMID);
   858			tmp &= ~MMSCH_VF_VMID__VF_CTX_VMID_MASK;
   859			tmp |= (0 << MMSCH_VF_VMID__VF_CTX_VMID__SHIFT);
   860			WREG32_SOC15(VCN, vcn_inst, regMMSCH_VF_VMID, tmp);
   861	
   862			size = header.total_size;
   863			WREG32_SOC15(VCN, vcn_inst, regMMSCH_VF_CTX_SIZE, size);
   864	
   865			WREG32_SOC15(VCN, vcn_inst, regMMSCH_VF_MAILBOX_RESP, 0);
   866	
   867			param = 0x00000001;
   868			WREG32_SOC15(VCN, vcn_inst, regMMSCH_VF_MAILBOX_HOST, param);
   869			tmp = 0;
   870			timeout = amdgpu_emu_mode ? 1000000 : 1000;
   871			resp = 0;
   872			expected = MMSCH_VF_MAILBOX_RESP__OK;
   873			while (resp != expected) {
   874				resp = RREG32_SOC15(VCN, vcn_inst, regMMSCH_VF_MAILBOX_RESP);
   875				if (resp != 0)
   876					break;
   877	
   878				udelay(10);
   879				tmp = tmp + 10;
   880				if (tmp >= timeout) {
   881					DRM_ERROR("failed to init MMSCH. TIME-OUT after %d usec"\
   882						" waiting for regMMSCH_VF_MAILBOX_RESP "\
   883						"(expected=0x%08x, readback=0x%08x)\n",
   884						tmp, expected, resp);
   885					return -EBUSY;
   886				}
   887			}
   888	
   889			init_status = ((struct mmsch_v5_0_init_header *)(table_loc))->vcn0.init_status;
   890			if (resp != expected && resp != MMSCH_VF_MAILBOX_RESP__INCOMPLETE
   891						&& init_status != MMSCH_VF_ENGINE_STATUS__PASS) {
   892				DRM_ERROR("MMSCH init status is incorrect! readback=0x%08x, header init "\
   893					"status for VCN%x: 0x%x\n", resp, vcn_inst, init_status);
   894			}
   895		}
   896	
   897		return 0;
   898	}
   899	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
