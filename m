Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D973A19BC1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Aug 2023 22:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692658457; x=1724194457;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8GBQGCXnyOKMazzGnRpCgxffapK3bQ7XaIeHtfy5aFM=;
  b=UIYv/9oICqlAXnu7q2rIYI6HZ3P8nXZ2V8dIpLfvy6+inFlsyVX1PAo0
   c7alSBBZJz8xH0MODmAgHveLKO6DsVdEZgdb1RwOFlLDY+QWAK/mb4lb4
   7HFBTFqh0bBkaUpNG+C15I5EQnlPnOvTWg/GmiCnsEC0Cyl34NGfi/813
   07VqKVY5XQKj9WaDNmre/ca4Iv9Q7aXVsMujtt9rnwfrUAinH9Xt5FZtQ
   LlUInhzsLDcLyc5RYCeHeDLSc3dm6vT6x30OJeC1qNc4Dax02+Zy+LZ2E
   O+gFNNWjcs/o2DgwZMCHa/n143yY9Xg6YAaoguC9GD3jG9Ivf8hKtHmeu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="460085340"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="460085340"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 15:54:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="712935217"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="712935217"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 21 Aug 2023 15:54:15 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYDmF-00011r-0M;
	Mon, 21 Aug 2023 22:54:04 +0000
Date: Tue, 22 Aug 2023 06:52:32 +0800
From: kernel test robot <lkp@intel.com>
To: Shashank Sharma <shashank.sharma@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>
Subject: [linux-next:master 6682/11453]
 drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c:123: warning: Function
 parameter or member 'doorbell_index' not described in
 'amdgpu_doorbell_index_on_bar'
Message-ID: <202308220614.h0EIBlon-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   47d9bb711707d15b19fad18c8e2b4b027a264a3a
commit: d124aa0ac96358042ba34df091a3bfa6e77fcf6f [6682/11453] drm/amdgpu: get absolute offset from doorbell index
config: i386-randconfig-i016-20230821 (https://download.01.org/0day-ci/archive/20230822/202308220614.h0EIBlon-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220614.h0EIBlon-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308220614.h0EIBlon-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c:123: warning: Function parameter or member 'doorbell_index' not described in 'amdgpu_doorbell_index_on_bar'
>> drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c:123: warning: Excess function parameter 'db_index' description in 'amdgpu_doorbell_index_on_bar'


vim +123 drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c

   110	
   111	/**
   112	 * amdgpu_doorbell_index_on_bar - Find doorbell's absolute offset in BAR
   113	 *
   114	 * @adev: amdgpu_device pointer
   115	 * @db_bo: doorbell object's bo
   116	 * @db_index: doorbell relative index in this doorbell object
   117	 *
   118	 * returns doorbell's absolute index in BAR
   119	 */
   120	uint32_t amdgpu_doorbell_index_on_bar(struct amdgpu_device *adev,
   121					       struct amdgpu_bo *db_bo,
   122					       uint32_t doorbell_index)
 > 123	{
   124		int db_bo_offset;
   125	
   126		db_bo_offset = amdgpu_bo_gpu_offset_no_check(db_bo);
   127	
   128		/* doorbell index is 32 bit but doorbell's size is 64-bit, so *2 */
   129		return db_bo_offset / sizeof(u32) + doorbell_index * 2;
   130	}
   131	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
