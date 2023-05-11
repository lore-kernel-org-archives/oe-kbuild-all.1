Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3353804
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 May 2023 08:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683794582; x=1715330582;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Dwbz2PvaYbI3mdZKNwHcNQMAec8v3J/SjmPQdjiJ3jY=;
  b=nmDapXndFoxiDGul6eLY4DpA81KqTbfxqO/NgGTv3e8vXp8zHdGnUQ+R
   0DjJIJ2VHmsB3Tdbv88yb97oW1o++azbLSoUjNBRvngY9Pu5heGsMHa2g
   Kld6+hru2o4AI8kpq799xSYyR3nzNvCRf1/A9kDFduM7dM3lOZLeLZGrT
   EDOCPuY33YVqk5YJjlw6puXfqynxKFsdr1v1bImFetMaYvE9E2iqvDgnE
   GWx6oThOrtx/DZpa1rzE3cQBfauK0Zc/ymDgeYFfsQS4ZL+EaQPkH7dnS
   mUdN4VC+7p9IincDu/f5OM8hxJHK8Da7o2MjO6pEqaFdU+CFGH2240PLb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="334919986"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="334919986"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 01:43:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="650066031"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="650066031"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 11 May 2023 01:43:00 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1px1t5-0003tO-1q;
	Thu, 11 May 2023 08:42:59 +0000
Date: Thu, 11 May 2023 16:42:30 +0800
From: kernel test robot <lkp@intel.com>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	WANG Xuerui <kernel@xen0n.name>,
	Hamza Mahfooz <hamza.mahfooz@amd.com>
Subject: [agd5f:drm-next 226/226]
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/dc_fpu.c:95:17: error:
 implicit declaration of function 'kernel_fpu_begin'; did you mean
 'dc_fpu_begin'?
Message-ID: <202305111617.0zRJPm91-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Huacai,

First bad commit (maybe != root cause):

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   d3295311e589a14a7496f0e14b5be6c3b5d9e134
commit: d3295311e589a14a7496f0e14b5be6c3b5d9e134 [226/226] drm/amdgpu/display: Enable DC_FP for LoongArch
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20230511/202305111617.0zRJPm91-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add agd5f https://gitlab.freedesktop.org/agd5f/linux.git
        git fetch --no-tags agd5f drm-next
        git checkout d3295311e589a14a7496f0e14b5be6c3b5d9e134
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305111617.0zRJPm91-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/dc_fpu.c: In function 'dc_fpu_begin':
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/dc_fpu.c:95:17: error: implicit declaration of function 'kernel_fpu_begin'; did you mean 'dc_fpu_begin'? [-Werror=implicit-function-declaration]
      95 |                 kernel_fpu_begin();
         |                 ^~~~~~~~~~~~~~~~
         |                 dc_fpu_begin
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/dc_fpu.c: In function 'dc_fpu_end':
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/dc_fpu.c:134:17: error: implicit declaration of function 'kernel_fpu_end'; did you mean 'kernel_read'? [-Werror=implicit-function-declaration]
     134 |                 kernel_fpu_end();
         |                 ^~~~~~~~~~~~~~
         |                 kernel_read
   cc1: some warnings being treated as errors


vim +95 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/dc_fpu.c

0ea7ee8217012f Rodrigo Siqueira 2021-07-26   71  
96ee63730fa306 Rodrigo Siqueira 2021-07-26   72  /**
96ee63730fa306 Rodrigo Siqueira 2021-07-26   73   * dc_fpu_begin - Enables FPU protection
96ee63730fa306 Rodrigo Siqueira 2021-07-26   74   * @function_name: A string containing the function name for debug purposes
96ee63730fa306 Rodrigo Siqueira 2021-07-26   75   *   (usually __func__)
96ee63730fa306 Rodrigo Siqueira 2021-07-26   76   *
96ee63730fa306 Rodrigo Siqueira 2021-07-26   77   * @line: A line number where DC_FP_START was invoked for debug purpose
96ee63730fa306 Rodrigo Siqueira 2021-07-26   78   *   (usually __LINE__)
96ee63730fa306 Rodrigo Siqueira 2021-07-26   79   *
96ee63730fa306 Rodrigo Siqueira 2021-07-26   80   * This function is responsible for managing the use of kernel_fpu_begin() with
96ee63730fa306 Rodrigo Siqueira 2021-07-26   81   * the advantage of providing an event trace for debugging.
96ee63730fa306 Rodrigo Siqueira 2021-07-26   82   *
96ee63730fa306 Rodrigo Siqueira 2021-07-26   83   * Note: Do not call this function directly; always use DC_FP_START().
96ee63730fa306 Rodrigo Siqueira 2021-07-26   84   */
96ee63730fa306 Rodrigo Siqueira 2021-07-26   85  void dc_fpu_begin(const char *function_name, const int line)
96ee63730fa306 Rodrigo Siqueira 2021-07-26   86  {
2d8471dc371f36 Rodrigo Siqueira 2021-07-26   87  	int *pcpu;
2d8471dc371f36 Rodrigo Siqueira 2021-07-26   88  
2d8471dc371f36 Rodrigo Siqueira 2021-07-26   89  	pcpu = get_cpu_ptr(&fpu_recursion_depth);
2d8471dc371f36 Rodrigo Siqueira 2021-07-26   90  	*pcpu += 1;
96ee63730fa306 Rodrigo Siqueira 2021-07-26   91  
2d8471dc371f36 Rodrigo Siqueira 2021-07-26   92  	if (*pcpu == 1) {
d3295311e589a1 Huacai Chen      2023-05-08   93  #if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
0c316556d12491 Tianci Yin       2023-02-06   94  		migrate_disable();
96ee63730fa306 Rodrigo Siqueira 2021-07-26  @95  		kernel_fpu_begin();
96ee63730fa306 Rodrigo Siqueira 2021-07-26   96  #elif defined(CONFIG_PPC64)
96ee63730fa306 Rodrigo Siqueira 2021-07-26   97  		if (cpu_has_feature(CPU_FTR_VSX_COMP)) {
96ee63730fa306 Rodrigo Siqueira 2021-07-26   98  			preempt_disable();
96ee63730fa306 Rodrigo Siqueira 2021-07-26   99  			enable_kernel_vsx();
96ee63730fa306 Rodrigo Siqueira 2021-07-26  100  		} else if (cpu_has_feature(CPU_FTR_ALTIVEC_COMP)) {
96ee63730fa306 Rodrigo Siqueira 2021-07-26  101  			preempt_disable();
96ee63730fa306 Rodrigo Siqueira 2021-07-26  102  			enable_kernel_altivec();
96ee63730fa306 Rodrigo Siqueira 2021-07-26  103  		} else if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE)) {
96ee63730fa306 Rodrigo Siqueira 2021-07-26  104  			preempt_disable();
96ee63730fa306 Rodrigo Siqueira 2021-07-26  105  			enable_kernel_fp();
96ee63730fa306 Rodrigo Siqueira 2021-07-26  106  		}
79b72db63392d3 Ao Zhong         2022-10-31  107  #elif defined(CONFIG_ARM64)
79b72db63392d3 Ao Zhong         2022-10-31  108  		kernel_neon_begin();
96ee63730fa306 Rodrigo Siqueira 2021-07-26  109  #endif
96ee63730fa306 Rodrigo Siqueira 2021-07-26  110  	}
96ee63730fa306 Rodrigo Siqueira 2021-07-26  111  
2d8471dc371f36 Rodrigo Siqueira 2021-07-26  112  	TRACE_DCN_FPU(true, function_name, line, *pcpu);
2d8471dc371f36 Rodrigo Siqueira 2021-07-26  113  	put_cpu_ptr(&fpu_recursion_depth);
2d8471dc371f36 Rodrigo Siqueira 2021-07-26  114  }
2d8471dc371f36 Rodrigo Siqueira 2021-07-26  115  
96ee63730fa306 Rodrigo Siqueira 2021-07-26  116  /**
96ee63730fa306 Rodrigo Siqueira 2021-07-26  117   * dc_fpu_end - Disable FPU protection
96ee63730fa306 Rodrigo Siqueira 2021-07-26  118   * @function_name: A string containing the function name for debug purposes
96ee63730fa306 Rodrigo Siqueira 2021-07-26  119   * @line: A-line number where DC_FP_END was invoked for debug purpose
96ee63730fa306 Rodrigo Siqueira 2021-07-26  120   *
96ee63730fa306 Rodrigo Siqueira 2021-07-26  121   * This function is responsible for managing the use of kernel_fpu_end() with
96ee63730fa306 Rodrigo Siqueira 2021-07-26  122   * the advantage of providing an event trace for debugging.
96ee63730fa306 Rodrigo Siqueira 2021-07-26  123   *
96ee63730fa306 Rodrigo Siqueira 2021-07-26  124   * Note: Do not call this function directly; always use DC_FP_END().
96ee63730fa306 Rodrigo Siqueira 2021-07-26  125   */
96ee63730fa306 Rodrigo Siqueira 2021-07-26  126  void dc_fpu_end(const char *function_name, const int line)
96ee63730fa306 Rodrigo Siqueira 2021-07-26  127  {
2d8471dc371f36 Rodrigo Siqueira 2021-07-26  128  	int *pcpu;
2d8471dc371f36 Rodrigo Siqueira 2021-07-26  129  
2d8471dc371f36 Rodrigo Siqueira 2021-07-26  130  	pcpu = get_cpu_ptr(&fpu_recursion_depth);
2d8471dc371f36 Rodrigo Siqueira 2021-07-26  131  	*pcpu -= 1;
2d8471dc371f36 Rodrigo Siqueira 2021-07-26  132  	if (*pcpu <= 0) {
d3295311e589a1 Huacai Chen      2023-05-08  133  #if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
96ee63730fa306 Rodrigo Siqueira 2021-07-26 @134  		kernel_fpu_end();

:::::: The code at line 95 was first introduced by commit
:::::: 96ee63730fa30614e943ac352ef772be49a712d9 drm/amd/display: Add control mechanism for FPU

:::::: TO: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
