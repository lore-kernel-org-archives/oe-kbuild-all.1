Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266AF8838
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Mar 2023 19:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678736505; x=1710272505;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GrC6ZCQTChhQGSTFhYt8h667inQF0PzLbKR2MzixbE4=;
  b=YbSBbbIIH8kKpIY54RtVJk71//+vvRQUFoJzqzJYH/T37lC1heYIMaC2
   A3LhvqHvyZOGB3pgWbjbJDRyUyAv91j+/WufDuMwfosAQGbpR83xFJ0Eq
   BNzmkBwHOeG2zfunjCVsEnrrexpfF7ytXVAW9U1kiNeSfMQwptD2Sgd5r
   +0ymacSu5U+P+MkjVpuFVUNI8i4JbNp7tWUtAEa96phkHwONzoUKtvao8
   qNmwErsrieq8S2CdFFLTaU5cUCpgWbX2AsqvlmbxXJM8ewAPNJJdvlSwY
   Ubz8bwURRze4UBLua1qF26zzedVL193A73zaWQLGSGf6eR2ZSf+hfx5FZ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="399836326"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; 
   d="scan'208";a="399836326"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 12:41:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="681161162"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; 
   d="scan'208";a="681161162"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 13 Mar 2023 12:41:42 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbo3B-000640-2e;
	Mon, 13 Mar 2023 19:41:41 +0000
Date: Tue, 14 Mar 2023 03:41:35 +0800
From: kernel test robot <lkp@intel.com>
To: Guo Ren <guoren@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev, Sasha Levin <sashal@kernel.org>,
	Palmer Dabbelt <palmerdabbelt@google.com>
Subject: [linux-stable-rc:queue/4.19 14/29]
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:654: Error: unrecognized opcode
 `csrs sstatus,s1'
Message-ID: <202303140350.TNwkFGAm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/4.19
head:   89c8cb5c83fd68dac5183ac25c24c6c4899279e4
commit: c5f0f3170661c2294e9ffc3f64d2ff2a3eecee0d [14/29] riscv: Using PATCHABLE_FUNCTION_ENTRY instead of MCOUNT
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230314/202303140350.TNwkFGAm-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=c5f0f3170661c2294e9ffc3f64d2ff2a3eecee0d
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/4.19
        git checkout c5f0f3170661c2294e9ffc3f64d2ff2a3eecee0d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/ kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303140350.TNwkFGAm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../include/dm_pp_interface.h:26,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu.h:51,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:29:
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:76:32: warning: 'dc_fixpt_ln2_div_2' defined but not used [-Wunused-const-variable=]
      76 | static const struct fixed31_32 dc_fixpt_ln2_div_2 = { 1488522236LL };
         |                                ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:75:32: warning: 'dc_fixpt_ln2' defined but not used [-Wunused-const-variable=]
      75 | static const struct fixed31_32 dc_fixpt_ln2 = { 2977044471LL };
         |                                ^~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:74:32: warning: 'dc_fixpt_e' defined but not used [-Wunused-const-variable=]
      74 | static const struct fixed31_32 dc_fixpt_e = { 11674931555LL };
         |                                ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:73:32: warning: 'dc_fixpt_two_pi' defined but not used [-Wunused-const-variable=]
      73 | static const struct fixed31_32 dc_fixpt_two_pi = { 26986075409LL };
         |                                ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:72:32: warning: 'dc_fixpt_pi' defined but not used [-Wunused-const-variable=]
      72 | static const struct fixed31_32 dc_fixpt_pi = { 13493037705LL };
         |                                ^~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c: Assembler messages:
>> drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:654: Error: unrecognized opcode `csrs sstatus,s1'
>> drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:654: Error: unrecognized opcode `csrc sstatus,s1'
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:586: Error: unrecognized opcode `csrs sstatus,s3'
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:586: Error: unrecognized opcode `csrc sstatus,s3'
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:439: Error: unrecognized opcode `csrs sstatus,s3'
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:439: Error: unrecognized opcode `csrc sstatus,s3'
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:401: Error: unrecognized opcode `csrs sstatus,s4'
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:401: Error: unrecognized opcode `csrc sstatus,s4'
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:281: Error: unrecognized opcode `csrs sstatus,s3'
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:281: Error: unrecognized opcode `csrc sstatus,s3'
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:243: Error: unrecognized opcode `csrs sstatus,s4'
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:243: Error: unrecognized opcode `csrc sstatus,s4'
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:360: Error: unrecognized opcode `csrs sstatus,s3'
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:360: Error: unrecognized opcode `csrc sstatus,s3'
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:322: Error: unrecognized opcode `csrs sstatus,s2'
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:322: Error: unrecognized opcode `csrc sstatus,s2'
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:733: Error: unrecognized opcode `csrs sstatus,s4'
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:733: Error: unrecognized opcode `csrc sstatus,s4'
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:528: Error: unrecognized opcode `csrs sstatus,s2'
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:528: Error: unrecognized opcode `csrc sstatus,s2'
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:166: Error: unrecognized opcode `csrs sstatus,s3'
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:166: Error: unrecognized opcode `csrc sstatus,s3'
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:168: Error: unrecognized opcode `csrs sstatus,s3'
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:168: Error: unrecognized opcode `csrc sstatus,s3'
--
   In file included from include/linux/sunrpc/sched.h:19,
                    from include/linux/sunrpc/auth.h:15,
                    from include/linux/nfs_fs.h:31,
                    from kernel/sysctl.c:53:
   include/linux/sunrpc/xdr.h: In function 'xdr_stream_decode_uint32_array':
   include/linux/sunrpc/xdr.h:512:17: warning: comparison is always false due to limited range of data type [-Wtype-limits]
     512 |         if (len > SIZE_MAX / sizeof(*p))
         |                 ^
   kernel/sysctl.c: Assembler messages:
   kernel/sysctl.c:2237: Error: unrecognized opcode `csrs sstatus,a4'
   kernel/sysctl.c:2237: Error: unrecognized opcode `csrc sstatus,a4'
>> kernel/sysctl.c:1987: Error: unrecognized opcode `csrs sstatus,s5'
>> kernel/sysctl.c:1987: Error: unrecognized opcode `csrc sstatus,s5'
   kernel/sysctl.c:2013: Error: unrecognized opcode `csrs sstatus,a3'
   kernel/sysctl.c:2013: Error: unrecognized opcode `csrc sstatus,a3'


vim +654 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c

75758255dc0fae Alex Deucher 2017-12-14  595  
7e4237dbe494f9 Tom St Denis 2018-05-02  596  /** amdgpu_debugfs_wave_read - Read WAVE STATUS data
7e4237dbe494f9 Tom St Denis 2018-05-02  597   *
7e4237dbe494f9 Tom St Denis 2018-05-02  598   * @f: open file handle
7e4237dbe494f9 Tom St Denis 2018-05-02  599   * @buf: User buffer to store read data in
7e4237dbe494f9 Tom St Denis 2018-05-02  600   * @size: Number of bytes to read
7e4237dbe494f9 Tom St Denis 2018-05-02  601   * @pos:  Offset to seek to
7e4237dbe494f9 Tom St Denis 2018-05-02  602   *
7e4237dbe494f9 Tom St Denis 2018-05-02  603   * The offset being sought changes which wave that the status data
7e4237dbe494f9 Tom St Denis 2018-05-02  604   * will be returned for.  The bits are used as follows:
7e4237dbe494f9 Tom St Denis 2018-05-02  605   *
7e4237dbe494f9 Tom St Denis 2018-05-02  606   * Bits 0..6: 	Byte offset into data
7e4237dbe494f9 Tom St Denis 2018-05-02  607   * Bits 7..14:	SE selector
7e4237dbe494f9 Tom St Denis 2018-05-02  608   * Bits 15..22:	SH/SA selector
7e4237dbe494f9 Tom St Denis 2018-05-02  609   * Bits 23..30: CU/{WGP+SIMD} selector
7e4237dbe494f9 Tom St Denis 2018-05-02  610   * Bits 31..36: WAVE ID selector
7e4237dbe494f9 Tom St Denis 2018-05-02  611   * Bits 37..44: SIMD ID selector
7e4237dbe494f9 Tom St Denis 2018-05-02  612   *
7e4237dbe494f9 Tom St Denis 2018-05-02  613   * The returned data begins with one DWORD of version information
7e4237dbe494f9 Tom St Denis 2018-05-02  614   * Followed by WAVE STATUS registers relevant to the GFX IP version
7e4237dbe494f9 Tom St Denis 2018-05-02  615   * being used.  See gfx_v8_0_read_wave_data() for an example output.
7e4237dbe494f9 Tom St Denis 2018-05-02  616   */
75758255dc0fae Alex Deucher 2017-12-14  617  static ssize_t amdgpu_debugfs_wave_read(struct file *f, char __user *buf,
75758255dc0fae Alex Deucher 2017-12-14  618  					size_t size, loff_t *pos)
75758255dc0fae Alex Deucher 2017-12-14  619  {
75758255dc0fae Alex Deucher 2017-12-14  620  	struct amdgpu_device *adev = f->f_inode->i_private;
75758255dc0fae Alex Deucher 2017-12-14  621  	int r, x;
75758255dc0fae Alex Deucher 2017-12-14  622  	ssize_t result=0;
75758255dc0fae Alex Deucher 2017-12-14  623  	uint32_t offset, se, sh, cu, wave, simd, data[32];
75758255dc0fae Alex Deucher 2017-12-14  624  
75758255dc0fae Alex Deucher 2017-12-14  625  	if (size & 3 || *pos & 3)
75758255dc0fae Alex Deucher 2017-12-14  626  		return -EINVAL;
75758255dc0fae Alex Deucher 2017-12-14  627  
75758255dc0fae Alex Deucher 2017-12-14  628  	/* decode offset */
75758255dc0fae Alex Deucher 2017-12-14  629  	offset = (*pos & GENMASK_ULL(6, 0));
75758255dc0fae Alex Deucher 2017-12-14  630  	se = (*pos & GENMASK_ULL(14, 7)) >> 7;
75758255dc0fae Alex Deucher 2017-12-14  631  	sh = (*pos & GENMASK_ULL(22, 15)) >> 15;
75758255dc0fae Alex Deucher 2017-12-14  632  	cu = (*pos & GENMASK_ULL(30, 23)) >> 23;
75758255dc0fae Alex Deucher 2017-12-14  633  	wave = (*pos & GENMASK_ULL(36, 31)) >> 31;
75758255dc0fae Alex Deucher 2017-12-14  634  	simd = (*pos & GENMASK_ULL(44, 37)) >> 37;
75758255dc0fae Alex Deucher 2017-12-14  635  
75758255dc0fae Alex Deucher 2017-12-14  636  	/* switch to the specific se/sh/cu */
75758255dc0fae Alex Deucher 2017-12-14  637  	mutex_lock(&adev->grbm_idx_mutex);
75758255dc0fae Alex Deucher 2017-12-14  638  	amdgpu_gfx_select_se_sh(adev, se, sh, cu);
75758255dc0fae Alex Deucher 2017-12-14  639  
75758255dc0fae Alex Deucher 2017-12-14  640  	x = 0;
75758255dc0fae Alex Deucher 2017-12-14  641  	if (adev->gfx.funcs->read_wave_data)
75758255dc0fae Alex Deucher 2017-12-14  642  		adev->gfx.funcs->read_wave_data(adev, simd, wave, data, &x);
75758255dc0fae Alex Deucher 2017-12-14  643  
75758255dc0fae Alex Deucher 2017-12-14  644  	amdgpu_gfx_select_se_sh(adev, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF);
75758255dc0fae Alex Deucher 2017-12-14  645  	mutex_unlock(&adev->grbm_idx_mutex);
75758255dc0fae Alex Deucher 2017-12-14  646  
75758255dc0fae Alex Deucher 2017-12-14  647  	if (!x)
75758255dc0fae Alex Deucher 2017-12-14  648  		return -EINVAL;
75758255dc0fae Alex Deucher 2017-12-14  649  
75758255dc0fae Alex Deucher 2017-12-14  650  	while (size && (offset < x * 4)) {
75758255dc0fae Alex Deucher 2017-12-14  651  		uint32_t value;
75758255dc0fae Alex Deucher 2017-12-14  652  
75758255dc0fae Alex Deucher 2017-12-14  653  		value = data[offset >> 2];
75758255dc0fae Alex Deucher 2017-12-14 @654  		r = put_user(value, (uint32_t *)buf);
75758255dc0fae Alex Deucher 2017-12-14  655  		if (r)
75758255dc0fae Alex Deucher 2017-12-14  656  			return r;
75758255dc0fae Alex Deucher 2017-12-14  657  
75758255dc0fae Alex Deucher 2017-12-14  658  		result += 4;
75758255dc0fae Alex Deucher 2017-12-14  659  		buf += 4;
75758255dc0fae Alex Deucher 2017-12-14  660  		offset += 4;
75758255dc0fae Alex Deucher 2017-12-14  661  		size -= 4;
75758255dc0fae Alex Deucher 2017-12-14  662  	}
75758255dc0fae Alex Deucher 2017-12-14  663  
75758255dc0fae Alex Deucher 2017-12-14  664  	return result;
75758255dc0fae Alex Deucher 2017-12-14  665  }
75758255dc0fae Alex Deucher 2017-12-14  666  

:::::: The code at line 654 was first introduced by commit
:::::: 75758255dc0fae76a845fd5185cfcdf60990cc99 drm/amdgpu: move debugfs functions to their own file

:::::: TO: Alex Deucher <alexander.deucher@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
