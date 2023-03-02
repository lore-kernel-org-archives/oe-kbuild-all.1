Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18219EA1
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Mar 2023 01:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677721320; x=1709257320;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4bCvczC9nQfg6F3snW7W9/7xtDazjeS+Ki7afO6x+jk=;
  b=bXHlHOKPIlZp1W4P7HHXD1AvA90AsrIG6d14JWrRVAQlH5/ICGDgVHah
   EPcXfXX8SxkY1mziWUp1uniFhF03onKGd6WwarQyfoyec9f/ZdMdOQ7vk
   GRjzXPrXzsJc0rbdiqvHHsHK1Dk02zgtSlhNTNfrt8fXQYo/ZkEjGNk1O
   TcC7ITrccDmIpoH/WAbr6BzaRMPBt7+ConjCud3mBTLlB2sl4ggQh2pD3
   y6Y5cnRGD/vpyyyg6Jb56QMwl9Qvrh1RxgSYnahc1coZbpUuKDVDHNTbn
   9GXWdhqO6dYyFqrqd+vCPjbaPFqYYJvglifN0q+DfpAs6hRtafStck7Db
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="397150348"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="397150348"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 17:41:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="798636233"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="798636233"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 01 Mar 2023 17:41:54 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXXxC-00003R-0H;
	Thu, 02 Mar 2023 01:41:54 +0000
Date: Thu, 2 Mar 2023 09:41:07 +0800
From: kernel test robot <lkp@intel.com>
To: Tom St Denis <tom.stdenis@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alex Deucher <alexander.deucher@amd.com>
Subject: [stable:linux-4.19.y 1123/9999]
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:733: Error: unrecognized opcode
 `csrs sstatus,s7'
Message-ID: <202303020929.wsWWGO5t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   2e3d9118e4e62b90603d61abd45d8bb29ebe7920
commit: 053a9862f0202cdcda9c56778dd98396a7cb3513 [1123/9999] drm/amd/amdgpu: Fix GPR read from debugfs (v2)
config: riscv-randconfig-r026-20230227 (https://download.01.org/0day-ci/archive/20230302/202303020929.wsWWGO5t-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=053a9862f0202cdcda9c56778dd98396a7cb3513
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-4.19.y
        git checkout 053a9862f0202cdcda9c56778dd98396a7cb3513
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash M=drivers/gpu/drm/amd/amdgpu

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303020929.wsWWGO5t-lkp@intel.com/

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
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:67:32: warning: 'dc_fixpt_zero' defined but not used [-Wunused-const-variable=]
      67 | static const struct fixed31_32 dc_fixpt_zero = { 0 };
         |                                ^~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c: Assembler messages:
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:654: Error: unrecognized opcode `csrs sstatus,s8'
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:654: Error: unrecognized opcode `csrc sstatus,s8'
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:586: Error: unrecognized opcode `csrs sstatus,s5'
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:586: Error: unrecognized opcode `csrc sstatus,s5'
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:439: Error: unrecognized opcode `csrs sstatus,s3'
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:439: Error: unrecognized opcode `csrc sstatus,s3'
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:401: Error: unrecognized opcode `csrs sstatus,s5'
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:401: Error: unrecognized opcode `csrc sstatus,s5'
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:281: Error: unrecognized opcode `csrs sstatus,s3'
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:281: Error: unrecognized opcode `csrc sstatus,s3'
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:243: Error: unrecognized opcode `csrs sstatus,s4'
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:243: Error: unrecognized opcode `csrc sstatus,s4'
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:360: Error: unrecognized opcode `csrs sstatus,s3'
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:360: Error: unrecognized opcode `csrc sstatus,s3'
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:322: Error: unrecognized opcode `csrs sstatus,s4'
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:322: Error: unrecognized opcode `csrc sstatus,s4'
>> drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:733: Error: unrecognized opcode `csrs sstatus,s7'
>> drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:733: Error: unrecognized opcode `csrc sstatus,s7'
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:528: Error: unrecognized opcode `csrs sstatus,s11'
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:528: Error: unrecognized opcode `csrc sstatus,s11'
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:168: Error: unrecognized opcode `csrs sstatus,s5'
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:168: Error: unrecognized opcode `csrc sstatus,s5'
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:166: Error: unrecognized opcode `csrs sstatus,s5'
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:166: Error: unrecognized opcode `csrc sstatus,s5'


vim +733 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c

75758255dc0fae Alex Deucher 2017-12-14  666  
7e4237dbe494f9 Tom St Denis 2018-05-02  667  /** amdgpu_debugfs_gpr_read - Read wave gprs
7e4237dbe494f9 Tom St Denis 2018-05-02  668   *
7e4237dbe494f9 Tom St Denis 2018-05-02  669   * @f: open file handle
7e4237dbe494f9 Tom St Denis 2018-05-02  670   * @buf: User buffer to store read data in
7e4237dbe494f9 Tom St Denis 2018-05-02  671   * @size: Number of bytes to read
7e4237dbe494f9 Tom St Denis 2018-05-02  672   * @pos:  Offset to seek to
7e4237dbe494f9 Tom St Denis 2018-05-02  673   *
7e4237dbe494f9 Tom St Denis 2018-05-02  674   * The offset being sought changes which wave that the status data
7e4237dbe494f9 Tom St Denis 2018-05-02  675   * will be returned for.  The bits are used as follows:
7e4237dbe494f9 Tom St Denis 2018-05-02  676   *
7e4237dbe494f9 Tom St Denis 2018-05-02  677   * Bits 0..11:	Byte offset into data
7e4237dbe494f9 Tom St Denis 2018-05-02  678   * Bits 12..19:	SE selector
7e4237dbe494f9 Tom St Denis 2018-05-02  679   * Bits 20..27:	SH/SA selector
7e4237dbe494f9 Tom St Denis 2018-05-02  680   * Bits 28..35: CU/{WGP+SIMD} selector
7e4237dbe494f9 Tom St Denis 2018-05-02  681   * Bits 36..43: WAVE ID selector
7e4237dbe494f9 Tom St Denis 2018-05-02  682   * Bits 37..44: SIMD ID selector
7e4237dbe494f9 Tom St Denis 2018-05-02  683   * Bits 52..59: Thread selector
7e4237dbe494f9 Tom St Denis 2018-05-02  684   * Bits 60..61: Bank selector (VGPR=0,SGPR=1)
7e4237dbe494f9 Tom St Denis 2018-05-02  685   *
7e4237dbe494f9 Tom St Denis 2018-05-02  686   * The return data comes from the SGPR or VGPR register bank for
7e4237dbe494f9 Tom St Denis 2018-05-02  687   * the selected operational unit.
7e4237dbe494f9 Tom St Denis 2018-05-02  688   */
75758255dc0fae Alex Deucher 2017-12-14  689  static ssize_t amdgpu_debugfs_gpr_read(struct file *f, char __user *buf,
75758255dc0fae Alex Deucher 2017-12-14  690  					size_t size, loff_t *pos)
75758255dc0fae Alex Deucher 2017-12-14  691  {
75758255dc0fae Alex Deucher 2017-12-14  692  	struct amdgpu_device *adev = f->f_inode->i_private;
75758255dc0fae Alex Deucher 2017-12-14  693  	int r;
75758255dc0fae Alex Deucher 2017-12-14  694  	ssize_t result = 0;
75758255dc0fae Alex Deucher 2017-12-14  695  	uint32_t offset, se, sh, cu, wave, simd, thread, bank, *data;
75758255dc0fae Alex Deucher 2017-12-14  696  
053a9862f0202c Tom St Denis 2020-03-10  697  	if (size > 4096 || size & 3 || *pos & 3)
75758255dc0fae Alex Deucher 2017-12-14  698  		return -EINVAL;
75758255dc0fae Alex Deucher 2017-12-14  699  
75758255dc0fae Alex Deucher 2017-12-14  700  	/* decode offset */
053a9862f0202c Tom St Denis 2020-03-10  701  	offset = (*pos & GENMASK_ULL(11, 0)) >> 2;
75758255dc0fae Alex Deucher 2017-12-14  702  	se = (*pos & GENMASK_ULL(19, 12)) >> 12;
75758255dc0fae Alex Deucher 2017-12-14  703  	sh = (*pos & GENMASK_ULL(27, 20)) >> 20;
75758255dc0fae Alex Deucher 2017-12-14  704  	cu = (*pos & GENMASK_ULL(35, 28)) >> 28;
75758255dc0fae Alex Deucher 2017-12-14  705  	wave = (*pos & GENMASK_ULL(43, 36)) >> 36;
75758255dc0fae Alex Deucher 2017-12-14  706  	simd = (*pos & GENMASK_ULL(51, 44)) >> 44;
75758255dc0fae Alex Deucher 2017-12-14  707  	thread = (*pos & GENMASK_ULL(59, 52)) >> 52;
75758255dc0fae Alex Deucher 2017-12-14  708  	bank = (*pos & GENMASK_ULL(61, 60)) >> 60;
75758255dc0fae Alex Deucher 2017-12-14  709  
68340db992f670 Wang Xiayang 2019-07-27  710  	data = kcalloc(1024, sizeof(*data), GFP_KERNEL);
75758255dc0fae Alex Deucher 2017-12-14  711  	if (!data)
75758255dc0fae Alex Deucher 2017-12-14  712  		return -ENOMEM;
75758255dc0fae Alex Deucher 2017-12-14  713  
75758255dc0fae Alex Deucher 2017-12-14  714  	/* switch to the specific se/sh/cu */
75758255dc0fae Alex Deucher 2017-12-14  715  	mutex_lock(&adev->grbm_idx_mutex);
75758255dc0fae Alex Deucher 2017-12-14  716  	amdgpu_gfx_select_se_sh(adev, se, sh, cu);
75758255dc0fae Alex Deucher 2017-12-14  717  
75758255dc0fae Alex Deucher 2017-12-14  718  	if (bank == 0) {
75758255dc0fae Alex Deucher 2017-12-14  719  		if (adev->gfx.funcs->read_wave_vgprs)
75758255dc0fae Alex Deucher 2017-12-14  720  			adev->gfx.funcs->read_wave_vgprs(adev, simd, wave, thread, offset, size>>2, data);
75758255dc0fae Alex Deucher 2017-12-14  721  	} else {
75758255dc0fae Alex Deucher 2017-12-14  722  		if (adev->gfx.funcs->read_wave_sgprs)
75758255dc0fae Alex Deucher 2017-12-14  723  			adev->gfx.funcs->read_wave_sgprs(adev, simd, wave, offset, size>>2, data);
75758255dc0fae Alex Deucher 2017-12-14  724  	}
75758255dc0fae Alex Deucher 2017-12-14  725  
75758255dc0fae Alex Deucher 2017-12-14  726  	amdgpu_gfx_select_se_sh(adev, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF);
75758255dc0fae Alex Deucher 2017-12-14  727  	mutex_unlock(&adev->grbm_idx_mutex);
75758255dc0fae Alex Deucher 2017-12-14  728  
75758255dc0fae Alex Deucher 2017-12-14  729  	while (size) {
75758255dc0fae Alex Deucher 2017-12-14  730  		uint32_t value;
75758255dc0fae Alex Deucher 2017-12-14  731  
053a9862f0202c Tom St Denis 2020-03-10  732  		value = data[result >> 2];
75758255dc0fae Alex Deucher 2017-12-14 @733  		r = put_user(value, (uint32_t *)buf);
75758255dc0fae Alex Deucher 2017-12-14  734  		if (r) {
75758255dc0fae Alex Deucher 2017-12-14  735  			result = r;
75758255dc0fae Alex Deucher 2017-12-14  736  			goto err;
75758255dc0fae Alex Deucher 2017-12-14  737  		}
75758255dc0fae Alex Deucher 2017-12-14  738  
75758255dc0fae Alex Deucher 2017-12-14  739  		result += 4;
75758255dc0fae Alex Deucher 2017-12-14  740  		buf += 4;
75758255dc0fae Alex Deucher 2017-12-14  741  		size -= 4;
75758255dc0fae Alex Deucher 2017-12-14  742  	}
75758255dc0fae Alex Deucher 2017-12-14  743  
75758255dc0fae Alex Deucher 2017-12-14  744  err:
75758255dc0fae Alex Deucher 2017-12-14  745  	kfree(data);
75758255dc0fae Alex Deucher 2017-12-14  746  	return result;
75758255dc0fae Alex Deucher 2017-12-14  747  }
75758255dc0fae Alex Deucher 2017-12-14  748  

:::::: The code at line 733 was first introduced by commit
:::::: 75758255dc0fae76a845fd5185cfcdf60990cc99 drm/amdgpu: move debugfs functions to their own file

:::::: TO: Alex Deucher <alexander.deucher@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
