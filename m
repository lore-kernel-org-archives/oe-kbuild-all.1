Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62676ABA
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Mar 2023 13:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678281528; x=1709817528;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uWaO33/6S2A465EuxnH3FeXvCBqZccS+M5414m2SxVM=;
  b=RWmYYFVWn0VzknG+nlatX3XAih89wHjaVY2SXSu/RrWxxg+tX1VwT2zo
   2y1pQhafOh5p5Dt0MyiDcx/j5LRyHrT/+lB0ZW6PofZIvqge/W+tvJvOv
   oZyNTD3GaBADKr86I8Zr5Bf2ihkJNBlIXriAi0hS2Px64NVfNHtZZd7LC
   7bckPs7usflaPUnPX0oovD9TGmIY/QIFdk7NZ4tskDLbPxF8rHAvaM8+n
   ZmQXdRS7LYWU5r6ld5JZW7yTF5nF9b6Wtk9HairFlf6ANQdoAUYCsOgvk
   kBFtVxbKmePK0PzHbz0nFN9hrGsk0IBeAADxNeLqIboQEySNfVGwo9zvG
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="333619840"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; 
   d="scan'208";a="333619840"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 05:18:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="851079525"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; 
   d="scan'208";a="851079525"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 08 Mar 2023 05:18:46 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZtgr-000298-1P;
	Wed, 08 Mar 2023 13:18:45 +0000
Date: Wed, 8 Mar 2023 21:18:18 +0800
From: kernel test robot <lkp@intel.com>
To: Lijo Lazar <lijo.lazar@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>
Subject: [linux-next:master 1761/1915]
 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:315:17:
 sparse: sparse: incompatible types in conditional expression (different base
 types):
Message-ID: <202303082135.NjdX1Bij-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fc31900c948610e7b5c2f15fb7795832c8325327
commit: 511a95552ec878fc59a294652ebbf73a0e8e0c76 [1761/1915] drm/amd/pm: Add SMU 13.0.6 support
config: alpha-randconfig-s033-20230305 (https://download.01.org/0day-ci/archive/20230308/202303082135.NjdX1Bij-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=511a95552ec878fc59a294652ebbf73a0e8e0c76
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 511a95552ec878fc59a294652ebbf73a0e8e0c76
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=alpha SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303082135.NjdX1Bij-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c: note: in included file (through drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_virt.h, drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h):
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:315:49: sparse: sparse: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:319:49: sparse: sparse: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
>> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:315:17: sparse: sparse: incompatible types in conditional expression (different base types):
>> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:315:17: sparse:    void
>> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:315:17: sparse:    int

vim +315 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c

   296	
   297	static int smu_v13_0_6_get_metrics_table(struct smu_context *smu,
   298						 void *metrics_table, bool bypass_cache)
   299	{
   300		struct smu_table_context *smu_table = &smu->smu_table;
   301		uint32_t table_size = smu_table->tables[SMU_TABLE_SMU_METRICS].size;
   302		struct smu_table *table = &smu_table->driver_table;
   303		int ret;
   304	
   305		if (bypass_cache || !smu_table->metrics_time ||
   306		    time_after(jiffies,
   307			       smu_table->metrics_time + msecs_to_jiffies(1))) {
   308			ret = smu_cmn_send_smc_msg(smu, SMU_MSG_GetMetricsTable, NULL);
   309			if (ret) {
   310				dev_info(smu->adev->dev,
   311					 "Failed to export SMU metrics table!\n");
   312				return ret;
   313			}
   314	
 > 315			amdgpu_asic_invalidate_hdp(smu->adev, NULL);
   316			memcpy(smu_table->metrics_table, table->cpu_addr, table_size);
   317	
   318			smu_table->metrics_time = jiffies;
   319		}
   320	
   321		if (metrics_table)
   322			memcpy(metrics_table, smu_table->metrics_table, table_size);
   323	
   324		return 0;
   325	}
   326	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
