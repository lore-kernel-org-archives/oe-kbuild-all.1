Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E8E7E2
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Aug 2023 01:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691197565; x=1722733565;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zWZ8b6ntgyCvGQySWqklP0ypuwGETJGEd/7mNhfNq/s=;
  b=PV5Ajb451DKfgMav0WT1PcQ4A5FgDiFshywj5AAYlUZo0oQgxB691WB6
   ZZ2vGYGQpllzNZhJf/aFtrZc3o3SRA6qSIva3WdhEtyTWEsi590iC9y0D
   rKZi5WMHM7ldIqRCH8vu3p9FeJW+inmcrMpFFJMaqIHlCMenAEflOAyn3
   9v8/pVEYcmPmg5ict343/QGD4f3Vcg5u4xLyDgMS8ZpKigpw1bEDWEPOs
   RlaHJ+GWjyafa1jfGtuU3uP7IwKatjaypN6qpjWvjHr69htFNL+VBd2uC
   Vlb6FLnTOVzTvUqaUwgjv/FJvIVngmD2571VFrxAaKYgpekgPOhBYnUOJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="456657217"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; 
   d="scan'208";a="456657217"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 18:06:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="854003291"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; 
   d="scan'208";a="854003291"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 04 Aug 2023 18:06:02 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qS5k1-0003ED-0S;
	Sat, 05 Aug 2023 01:06:01 +0000
Date: Sat, 5 Aug 2023 09:05:03 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	Dave Airlie <airlied@redhat.com>
Subject: [drm-misc:for-linux-next 10/12]
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c:422:31: warning: cast to
 pointer from integer of different size
Message-ID: <202308050843.67KjqpqZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next
head:   82d750e9d2f5d0594c8f7057ce59127e701af781
commit: 6b252cf42281045a9f803d2198023500cfa6ebd2 [10/12] drm/nouveau: nvkm/vmm: implement raw ops to manage uvmm
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230805/202308050843.67KjqpqZ-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230805/202308050843.67KjqpqZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308050843.67KjqpqZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h:4,
                    from drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.h:5,
                    from drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c:22:
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c: In function 'nvkm_uvmm_mthd_raw_map':
>> drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c:422:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     422 |                               (void *)args->argv, args->argc);
         |                               ^
   drivers/gpu/drm/nouveau/include/nvkm/core/memory.h:66:43: note: in definition of macro 'nvkm_memory_map'
      66 |         (p)->func->map((p),(o),(vm),(va),(av),(ac))
         |                                           ^~


vim +422 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c

   388	
   389	static int
   390	nvkm_uvmm_mthd_raw_map(struct nvkm_uvmm *uvmm, struct nvif_vmm_raw_v0 *args)
   391	{
   392		struct nvkm_client *client = uvmm->object.client;
   393		struct nvkm_vmm *vmm = uvmm->vmm;
   394		struct nvkm_vma vma = {
   395			.addr = args->addr,
   396			.size = args->size,
   397			.used = true,
   398			.mapref = false,
   399			.no_comp = true,
   400		};
   401		struct nvkm_memory *memory;
   402		u64 handle = args->memory;
   403		u8 refd;
   404		int ret;
   405	
   406		if (!nvkm_vmm_in_managed_range(vmm, args->addr, args->size))
   407			return -EINVAL;
   408	
   409		ret = nvkm_uvmm_page_index(uvmm, args->size, args->shift, &refd);
   410		if (ret)
   411			return ret;
   412	
   413		vma.page = vma.refd = refd;
   414	
   415		memory = nvkm_umem_search(client, args->memory);
   416		if (IS_ERR(memory)) {
   417			VMM_DEBUG(vmm, "memory %016llx %ld\n", handle, PTR_ERR(memory));
   418			return PTR_ERR(memory);
   419		}
   420	
   421		ret = nvkm_memory_map(memory, args->offset, vmm, &vma,
 > 422				      (void *)args->argv, args->argc);
   423	
   424		nvkm_memory_unref(&vma.memory);
   425		nvkm_memory_unref(&memory);
   426		return ret;
   427	}
   428	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
