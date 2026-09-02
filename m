Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33EF4CCDC9
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Sep 2026 19:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377284; cv=none; b=LFX7bHW7rLN8m6N245YK1L6o3dDejREkcmp6IHtxpV9ZxIHVoSEtnEB4esacvRObUvzkcaCcUbdLR1b9uNPX2rhpatJkaKf9/7nv/Pd3vEPoKTQ8ve7k62w/RNwOI7t+iIg6XHQWwa48RxDecLvkz2Do8KqDgnI4FRpFUivOaY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377284; c=relaxed/simple;
	bh=JNgAk+iMWCMB/sxSGZvxtpBwF0/EkEWfAfM/8i7JvqE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ub6/zKXbkBWLoblkMGtVz65n0u+swU1IhGKPcus7nLbZYLkTVkxVXp1Vu/NPDu/ABdLz7MDFiYiQv4K99dJ0ZKrT5445CjYiubgy1mF9pJSL0tQHG9H4C/iq3KLLeJ2qTkkAntMU3VydPAWPxuXHf5ENjw58K1f38QIJ2LT3pTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CMerMt6e; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CMerMt6e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788377276; x=1819913276;
  h=date:from:to:cc:subject:message-id;
  bh=JNgAk+iMWCMB/sxSGZvxtpBwF0/EkEWfAfM/8i7JvqE=;
  b=CMerMt6evqeWOep3qvMUW3aAklx8CriJNFzx/iqbvLN2eLIbEvl29YM9
   PsJYUIbNUNH0lx2AHLOTd2eUbon3FmC435M8lmh+GPrkm+E9lpKTjl8MI
   j0wPIxg1hji0Kro3EHU5JT126SVW2RhXl0oV8CDeepK+RCpel305BW9TJ
   1gJzlKMlOJISV9wi1Kq6hw2c1oxdbwTmT1bv5CPUyp8+ZM5cZ/7Xq7aWL
   0CyzsRk7IOUR5hvmi16r/Rhme1vL2s+95lbR+zj4AhhSJezlAIMDcm+Qm
   2nkqibYLg71+PIsHfa++FHk2G0BY6WslBMwZMPvzkdNJTG6DidKIuaMoH
   A==;
X-CSE-ConnectionGUID: wIO3uT/pT/CrVLqEkt2HZw==
X-CSE-MsgGUID: 0Fuyi5k8Q3a4+GhDEIbtJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="99510213"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="99510213"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 12:27:53 -0700
X-CSE-ConnectionGUID: +py1GH5pQUmPlhtvM0WzZQ==
X-CSE-MsgGUID: 56FWUAovQjmDc4RHpBPHPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="267741737"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 02 Sep 2026 12:27:52 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1qcf-000000003FC-27Jm;
	Wed, 02 Sep 2026 19:27:49 +0000
Date: Thu, 03 Sep 2026 03:27:32 +0800
From: kernel test robot <lkp@intel.com>
To: Bokun Zhang <Bokun.Zhang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [linux-next:master 1091/3131]
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_2.c:830:43: sparse: sparse: invalid
 assignment: |=
Message-ID: <202609030309.Brgg9wSf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   32b6ef9a5d0eca44f9cd91f52f4faa89f145a0de
commit: 98ba50b2ef1397635ff03091b396b93d0850d50a [1091/3131] drm/amdgpu: Add VCN v5.0.2 SRIOV code path
config: um-randconfig-r134-20260902 (https://download.01.org/0day-ci/archive/20260903/202609030309.Brgg9wSf-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260903/202609030309.Brgg9wSf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609030309.Brgg9wSf-lkp@intel.com/

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
