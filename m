Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A04341A2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Sep 2023 16:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695141245; x=1726677245;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mku3nYlH2daYeYWoaa1iVAJkUbsmMWbBlzTC8dVRUj4=;
  b=fle3ccTecDdfH9ALEK5x1YsdEjunaU+x8Vpy61utJcX2giyM+dmSv/pd
   zb4TgExdOhFJSX9xERkFxVqlDkbpPLBICaly3mafdBNR/2sRiLPR9fDEi
   PYGpUT5yRnhHtk3sYAWR/3aCrAoiHEkIUO142VS/2xCORj5mDKAQ9L4Yr
   hunTjzDlbB386uvZ/TTNx+ugBZl8MBluVeQx4/KsahxCxhlIEUOmxbuG4
   wknduspYfimQ7lLrCiD0E/9Kx7zg9w0DisQ7A3YnrPBX2lNZT3640/Smz
   3u46iji7BE1TBo7wGU4Ie/M7+fbgdTx7T9as1n8nE5osEIzELhRWM7Q59
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="377304615"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="377304615"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 09:34:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="739786742"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="739786742"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 19 Sep 2023 09:33:59 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qidfh-0007et-05;
	Tue, 19 Sep 2023 16:33:57 +0000
Date: Wed, 20 Sep 2023 00:33:53 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [skeggsb-nouveau:00.02-gsp-rm 76/88]
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:490:21: warning: array
 subscript 0 is outside array bounds of 'PACKED_REGISTRY_ENTRY[0]'
Message-ID: <202309200055.Z061Jep1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/skeggsb/nouveau 00.02-gsp-rm
head:   3897e2d444b49105470ddf8b6beed3f183bc4886
commit: 0f5d9f04ac48c505de7d63b5ed1615a87fa478cb [76/88] drm/nouveau/gsp/r535: add support for booting GSP-RM
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20230920/202309200055.Z061Jep1-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309200055.Z061Jep1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309200055.Z061Jep1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In function 'r535_gsp_rpc_set_registry',
       inlined from 'r535_gsp_oneinit' at drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1492:8:
>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:490:21: warning: array subscript 0 is outside array bounds of 'PACKED_REGISTRY_ENTRY[0]' [-Warray-bounds=]
     490 |         rpc->entries[0].nameOffset = offsetof(typeof(*rpc), entries[1]);
         |         ~~~~~~~~~~~~^~~
   In file included from drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:38:
   drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_os_nvoc.h: In function 'r535_gsp_oneinit':
   drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_os_nvoc.h:41:29: note: while referencing 'entries'
      41 |     PACKED_REGISTRY_ENTRY   entries[0];
         |                             ^~~~~~~
   In function 'r535_gsp_rpc_set_registry',
       inlined from 'r535_gsp_oneinit' at drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1492:8:
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:491:21: warning: array subscript 0 is outside array bounds of 'PACKED_REGISTRY_ENTRY[0]' [-Warray-bounds=]
     491 |         rpc->entries[0].type = 1;
         |         ~~~~~~~~~~~~^~~
   drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_os_nvoc.h: In function 'r535_gsp_oneinit':
   drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_os_nvoc.h:41:29: note: while referencing 'entries'
      41 |     PACKED_REGISTRY_ENTRY   entries[0];
         |                             ^~~~~~~
   In function 'r535_gsp_rpc_set_registry',
       inlined from 'r535_gsp_oneinit' at drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1492:8:
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:492:21: warning: array subscript 0 is outside array bounds of 'PACKED_REGISTRY_ENTRY[0]' [-Warray-bounds=]
     492 |         rpc->entries[0].data = 0;
         |         ~~~~~~~~~~~~^~~
   drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_os_nvoc.h: In function 'r535_gsp_oneinit':
   drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_os_nvoc.h:41:29: note: while referencing 'entries'
      41 |     PACKED_REGISTRY_ENTRY   entries[0];
         |                             ^~~~~~~
   In function 'r535_gsp_rpc_set_registry',
       inlined from 'r535_gsp_oneinit' at drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1492:8:
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:493:21: warning: array subscript 0 is outside array bounds of 'PACKED_REGISTRY_ENTRY[0]' [-Warray-bounds=]
     493 |         rpc->entries[0].length = 4;
         |         ~~~~~~~~~~~~^~~
   drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_os_nvoc.h: In function 'r535_gsp_oneinit':
   drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_os_nvoc.h:41:29: note: while referencing 'entries'
      41 |     PACKED_REGISTRY_ENTRY   entries[0];
         |                             ^~~~~~~


vim +490 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c

   476	
   477	static int
   478	r535_gsp_rpc_set_registry(struct nvkm_gsp *gsp)
   479	{
   480		PACKED_REGISTRY_TABLE *rpc;
   481		char *strings;
   482	
   483		rpc = nvkm_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_SET_REGISTRY,
   484				       sizeof(*rpc) + sizeof(rpc->entries[0]) + 1);
   485		if (IS_ERR(rpc))
   486			return PTR_ERR(rpc);
   487	
   488		rpc->size = sizeof(*rpc);
   489		rpc->numEntries = 1;
 > 490		rpc->entries[0].nameOffset = offsetof(typeof(*rpc), entries[1]);
   491		rpc->entries[0].type = 1;
   492		rpc->entries[0].data = 0;
   493		rpc->entries[0].length = 4;
   494	
   495		strings = (char *)&rpc->entries[1];
   496		strings[0] = '\0';
   497	
   498		return nvkm_gsp_rpc_wr(gsp, rpc, false);
   499	}
   500	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
