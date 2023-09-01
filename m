Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53999AD53
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 22:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693606800; x=1725142800;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=so8nVzFUfg2RPLOYuaMrayVIznUe73eQtsJEgD6pRgY=;
  b=S5KzmcTf7kp1YAykdf/xXs6ClnImU0ZQS5qW7o7RR5EPfH8Dmszd1CpC
   315L2iasJHWDM8rIEuqwN6Ed03vqeCvqioGXNhc6Bl03cIXRYQdQpe0SF
   Bz+NLKk5dYGc+q0SfslIS258B9RrZfZ6m8vhQS8glIClQqqTQr0FMs/8R
   dQnOjHzVVSC3TxtwaIiJ2e0VcfsUT54w0prI8GWONx9RY+hAj9/pO9hqR
   0sxS4jsoBaoSM7knAFZ9JkG3Il5Opjdx6Lo3tMe5/y7PEvedaOne8XxUU
   bvr2sVvbEbAsMzm1PKE0NtFY0D6d6LsOhdUm4ByiBRZyUz2ImTLB4IljS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="462680408"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; 
   d="scan'208";a="462680408"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 15:19:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="913845879"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; 
   d="scan'208";a="913845879"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 01 Sep 2023 15:19:56 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcCUc-0001hF-2N;
	Fri, 01 Sep 2023 22:19:54 +0000
Date: Sat, 2 Sep 2023 06:18:58 +0800
From: kernel test robot <lkp@intel.com>
To: Lang Yu <Lang.Yu@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Huang Rui <ray.huang@amd.com>
Subject: [agd5f:drm-next 180/218]
 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c:108:9: sparse: sparse: incompatible
 types in conditional expression (different base types):
Message-ID: <202309020608.FwP8QMht-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   173df1eaa8a91ab0b5352d1efb4192e3e5dc6c8f
commit: 9d4346bdbc6484a1814011315827c258509b483c [180/218] drm/amdgpu: add VPE 6.1.0 support
config: i386-randconfig-062-20230902 (https://download.01.org/0day-ci/archive/20230902/202309020608.FwP8QMht-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230902/202309020608.FwP8QMht-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309020608.FwP8QMht-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c: note: in included file (through drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h, drivers/gpu/drm/amd/amdgpu/amdgpu.h):
   drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:315:49: sparse: sparse: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c:108:9: sparse: sparse: incompatible types in conditional expression (different base types):
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c:108:9: sparse:    void
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c:108:9: sparse:    int

vim +108 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c

    93	
    94	static int vpe_early_init(void *handle)
    95	{
    96		struct amdgpu_device *adev = (struct amdgpu_device *)handle;
    97		struct amdgpu_vpe *vpe = &adev->vpe;
    98	
    99		switch (adev->ip_versions[VPE_HWIP][0]) {
   100		case IP_VERSION(6, 1, 0):
   101			vpe_v6_1_set_funcs(vpe);
   102			break;
   103		default:
   104			return -EINVAL;
   105		}
   106	
   107		vpe_set_ring_funcs(adev);
 > 108		vpe_set_regs(vpe);
   109	
   110		return 0;
   111	}
   112	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
