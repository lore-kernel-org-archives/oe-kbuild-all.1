Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052B35398
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Oct 2023 07:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FtUffAtb"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696492349; x=1728028349;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bOIx5ZvNkmWlVrlxC5CEUCIBAFH5iBa1kgKwJPBRaeU=;
  b=FtUffAtbgkzi5w+I6o35FzLKdehLWAkmVd4Twc48NQN111zaWDmvfP58
   dXwqBXUM4q+bgyG8nIiRCYkQQd8V0FrQ/+Wp9oXCL9QHAMCembjswIxPW
   xi7RETjJ/7qd/GCOxWFsCp/Ir8NbLb2+1uYY1+pskVJ09ekkRcwbivgYs
   Cn8x6SIqiSn6tilVViqfZ61AOkxaZKBNyZ2xzKM4kPFNYk32CwnzvjDgi
   3r+b4p/U2E54QyxgU2WqfFkwcrYMExuzio3xmk4VlkVbtCv4bQPm1qivX
   motyNZLTcTWRHpcS2eXhh3UW8s5NBh0xSicXdI7iopInsjkucUA7x42WD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="449924520"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="449924520"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 00:52:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="842295651"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="842295651"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Oct 2023 00:52:26 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoJ9k-000LBA-19;
	Thu, 05 Oct 2023 07:52:24 +0000
Date: Thu, 5 Oct 2023 15:51:35 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: [linux-next:master 9799/9984]
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c:274: warning: Function parameter or
 member 'gart_placement' not described in 'amdgpu_gmc_gart_location'
Message-ID: <202310051547.40nm4Sif-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7d730f1bf6f39ece2d9f3ae682f12e5b593d534d
commit: 917f91d8d8e866965f2193d7962e064a4d139d8d [9799/9984] drm/amdgpu/gmc: add a way to force a particular placement for GART
config: i386-randconfig-s002-20211104 (https://download.01.org/0day-ci/archive/20231005/202310051547.40nm4Sif-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231005/202310051547.40nm4Sif-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310051547.40nm4Sif-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c:274: warning: Function parameter or member 'gart_placement' not described in 'amdgpu_gmc_gart_location'


vim +274 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c

f527f310bb6aa9 Oak Zeng          2020-09-15  261  
961c75cf203179 Christian König   2018-08-23  262  /**
961c75cf203179 Christian König   2018-08-23  263   * amdgpu_gmc_gart_location - try to find GART location
961c75cf203179 Christian König   2018-08-23  264   *
53c9c89ac118c9 Rajneesh Bhardwaj 2020-04-05  265   * @adev: amdgpu device structure holding all necessary information
53c9c89ac118c9 Rajneesh Bhardwaj 2020-04-05  266   * @mc: memory controller structure holding memory information
961c75cf203179 Christian König   2018-08-23  267   *
961c75cf203179 Christian König   2018-08-23  268   * Function will place try to place GART before or after VRAM.
961c75cf203179 Christian König   2018-08-23  269   * If GART size is bigger than space left then we ajust GART size.
961c75cf203179 Christian König   2018-08-23  270   * Thus function will never fails.
961c75cf203179 Christian König   2018-08-23  271   */
917f91d8d8e866 Alex Deucher      2023-09-14  272  void amdgpu_gmc_gart_location(struct amdgpu_device *adev, struct amdgpu_gmc *mc,
917f91d8d8e866 Alex Deucher      2023-09-14  273  			      enum amdgpu_gart_placement gart_placement)
961c75cf203179 Christian König   2018-08-23 @274  {
ec210e3226dc0b Christian König   2018-08-24  275  	const uint64_t four_gb = 0x100000000ULL;
961c75cf203179 Christian König   2018-08-23  276  	u64 size_af, size_bf;
f2d9bbc9968997 Emily Deng        2018-10-10  277  	/*To avoid the hole, limit the max mc address to AMDGPU_GMC_HOLE_START*/
f2d9bbc9968997 Emily Deng        2018-10-10  278  	u64 max_mc_address = min(adev->gmc.mc_mask, AMDGPU_GMC_HOLE_START - 1);
961c75cf203179 Christian König   2018-08-23  279  
0be655d1c6c6a9 Christian König   2018-08-23  280  	/* VCE doesn't like it when BOs cross a 4GB segment, so align
0be655d1c6c6a9 Christian König   2018-08-23  281  	 * the GART base on a 4GB boundary as well.
0be655d1c6c6a9 Christian König   2018-08-23  282  	 */
6fdd68b14a943e Alex Deucher      2018-06-19  283  	size_bf = mc->fb_start;
f2d9bbc9968997 Emily Deng        2018-10-10  284  	size_af = max_mc_address + 1 - ALIGN(mc->fb_end + 1, four_gb);
0be655d1c6c6a9 Christian König   2018-08-23  285  
0be655d1c6c6a9 Christian König   2018-08-23  286  	if (mc->gart_size > max(size_bf, size_af)) {
961c75cf203179 Christian König   2018-08-23  287  		dev_warn(adev->dev, "limiting GART\n");
0be655d1c6c6a9 Christian König   2018-08-23  288  		mc->gart_size = max(size_bf, size_af);
961c75cf203179 Christian König   2018-08-23  289  	}
0be655d1c6c6a9 Christian König   2018-08-23  290  
917f91d8d8e866 Alex Deucher      2023-09-14  291  	switch (gart_placement) {
917f91d8d8e866 Alex Deucher      2023-09-14  292  	case AMDGPU_GART_PLACEMENT_HIGH:
917f91d8d8e866 Alex Deucher      2023-09-14  293  		mc->gart_start = max_mc_address - mc->gart_size + 1;
917f91d8d8e866 Alex Deucher      2023-09-14  294  		break;
917f91d8d8e866 Alex Deucher      2023-09-14  295  	case AMDGPU_GART_PLACEMENT_LOW:
917f91d8d8e866 Alex Deucher      2023-09-14  296  		mc->gart_start = 0;
917f91d8d8e866 Alex Deucher      2023-09-14  297  		break;
917f91d8d8e866 Alex Deucher      2023-09-14  298  	case AMDGPU_GART_PLACEMENT_BEST_FIT:
917f91d8d8e866 Alex Deucher      2023-09-14  299  	default:
5f232bd79b2417 Christian König   2018-08-24  300  		if ((size_bf >= mc->gart_size && size_bf < size_af) ||
5f232bd79b2417 Christian König   2018-08-24  301  		    (size_af < mc->gart_size))
961c75cf203179 Christian König   2018-08-23  302  			mc->gart_start = 0;
0be655d1c6c6a9 Christian König   2018-08-23  303  		else
f2d9bbc9968997 Emily Deng        2018-10-10  304  			mc->gart_start = max_mc_address - mc->gart_size + 1;
917f91d8d8e866 Alex Deucher      2023-09-14  305  		break;
917f91d8d8e866 Alex Deucher      2023-09-14  306  	}
ec210e3226dc0b Christian König   2018-08-24  307  
feabaad8aae0f6 Christian König   2018-09-14  308  	mc->gart_start &= ~(four_gb - 1);
961c75cf203179 Christian König   2018-08-23  309  	mc->gart_end = mc->gart_start + mc->gart_size - 1;
961c75cf203179 Christian König   2018-08-23  310  	dev_info(adev->dev, "GART: %lluM 0x%016llX - 0x%016llX\n",
961c75cf203179 Christian König   2018-08-23  311  			mc->gart_size >> 20, mc->gart_start, mc->gart_end);
961c75cf203179 Christian König   2018-08-23  312  }
d76364fc7fde36 Christian König   2018-08-24  313  

:::::: The code at line 274 was first introduced by commit
:::::: 961c75cf203179d0c546722290bf4b1147e5feb1 drm/amdgpu: move amdgpu_device_(vram|gtt)_location

:::::: TO: Christian König <christian.koenig@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
