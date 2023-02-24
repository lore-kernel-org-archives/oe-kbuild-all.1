Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573CC2570
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Feb 2023 08:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677228766; x=1708764766;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tNy34/neBuWbEXNaViNww3qmkSAqvqwZV87HhJ3/SbI=;
  b=EniYc+jBsYHjkI6zpOnwdnXq8UBC7DZIniEpeO2E3I+ZhcjSxOH7eUai
   bafvP8o3tKQ2DxiZwQkeczj6ju2dCpyub08YiSSdNdiHyIkkjrUGhJ4cw
   Fc/r/UKXt1JTIlaD37KDx2IY7mtoJIXCk4+x/oVZTiNmoc1Q98GSSpO7c
   iDN5AJWf8qLiibHPiWFvWn6zMpSfpxwNRNBRbYk8vcjaGZ8it1mwto2Jd
   b9DChSfavx2lChivbXnBJL/UJXpMs4py5ZKnEfjl8r7bL4sz9IiYoqhig
   yJSIvcsA1M1GvkZaEZrOzEAKpnPJCUbIpszOJcuixZ8ddeSL7mAO9G2fw
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="313818004"
X-IronPort-AV: E=Sophos;i="5.97,324,1669104000"; 
   d="scan'208";a="313818004"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 00:52:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="650288088"
X-IronPort-AV: E=Sophos;i="5.97,324,1669104000"; 
   d="scan'208";a="650288088"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 24 Feb 2023 00:52:44 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVTop-0002H9-1v;
	Fri, 24 Feb 2023 08:52:43 +0000
Date: Fri, 24 Feb 2023 16:52:08 +0800
From: kernel test robot <lkp@intel.com>
To: Georgi Djakov <djakov@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djakov-icc:iommu-map 1/2] include/linux/iommu.h:1217:6: warning: no
 previous prototype for 'iommu_dma_sync_single_for_cpu'
Message-ID: <202302241632.SZ3OJ6yy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djakov/icc.git iommu-map
head:   fb4d192f5ce8218ca4172f2b36249ee3cc07ac4d
commit: 7bd4d27440eb9947782c3f58fd6f049f3e882e55 [1/2] iommu/dma: Export the iommu ops to allow them to be called from dma mapping code
config: openrisc-randconfig-r016-20230222 (https://download.01.org/0day-ci/archive/20230224/202302241632.SZ3OJ6yy-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djakov/icc.git/commit/?id=7bd4d27440eb9947782c3f58fd6f049f3e882e55
        git remote add djakov-icc https://git.kernel.org/pub/scm/linux/kernel/git/djakov/icc.git
        git fetch --no-tags djakov-icc iommu-map
        git checkout 7bd4d27440eb9947782c3f58fd6f049f3e882e55
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc SHELL=/bin/bash drivers/vfio/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302241632.SZ3OJ6yy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/vfio/vfio_main.c:18:
>> include/linux/iommu.h:1217:6: warning: no previous prototype for 'iommu_dma_sync_single_for_cpu' [-Wmissing-prototypes]
    1217 | void iommu_dma_sync_single_for_cpu(struct device *dev,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/iommu.h:1221:6: warning: no previous prototype for 'iommu_dma_sync_single_for_device' [-Wmissing-prototypes]
    1221 | void iommu_dma_sync_single_for_device(struct device *dev,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/iommu.h:1225:6: warning: no previous prototype for 'iommu_dma_sync_sg_for_cpu' [-Wmissing-prototypes]
    1225 | void iommu_dma_sync_sg_for_cpu(struct device *dev,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/iommu.h:1230:6: warning: no previous prototype for 'iommu_dma_sync_sg_for_device' [-Wmissing-prototypes]
    1230 | void iommu_dma_sync_sg_for_device(struct device *dev,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/iommu.h:1235:12: warning: no previous prototype for 'iommu_dma_map_page' [-Wmissing-prototypes]
    1235 | dma_addr_t iommu_dma_map_page(struct device *dev, struct page *page,
         |            ^~~~~~~~~~~~~~~~~~
>> include/linux/iommu.h:1240:6: warning: no previous prototype for 'iommu_dma_unmap_page' [-Wmissing-prototypes]
    1240 | void iommu_dma_unmap_page(struct device *dev, dma_addr_t dma_handle,
         |      ^~~~~~~~~~~~~~~~~~~~
>> include/linux/iommu.h:1244:5: warning: no previous prototype for 'iommu_dma_map_sg' [-Wmissing-prototypes]
    1244 | int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg,
         |     ^~~~~~~~~~~~~~~~
>> include/linux/iommu.h:1249:6: warning: no previous prototype for 'iommu_dma_unmap_sg' [-Wmissing-prototypes]
    1249 | void iommu_dma_unmap_sg(struct device *dev, struct scatterlist *sg,
         |      ^~~~~~~~~~~~~~~~~~
>> include/linux/iommu.h:1253:12: warning: no previous prototype for 'iommu_dma_map_resource' [-Wmissing-prototypes]
    1253 | dma_addr_t iommu_dma_map_resource(struct device *dev, phys_addr_t phys,
         |            ^~~~~~~~~~~~~~~~~~~~~~
>> include/linux/iommu.h:1258:6: warning: no previous prototype for 'iommu_dma_unmap_resource' [-Wmissing-prototypes]
    1258 | void iommu_dma_unmap_resource(struct device *dev, dma_addr_t handle,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/iommu.h:1262:6: warning: no previous prototype for 'iommu_dma_free' [-Wmissing-prototypes]
    1262 | void iommu_dma_free(struct device *dev, size_t size, void *cpu_addr,
         |      ^~~~~~~~~~~~~~
>> include/linux/iommu.h:1266:7: warning: no previous prototype for 'iommu_dma_alloc' [-Wmissing-prototypes]
    1266 | void *iommu_dma_alloc(struct device *dev, size_t size,
         |       ^~~~~~~~~~~~~~~
>> include/linux/iommu.h:1271:5: warning: no previous prototype for 'iommu_dma_mmap' [-Wmissing-prototypes]
    1271 | int iommu_dma_mmap(struct device *dev, struct vm_area_struct *vma,
         |     ^~~~~~~~~~~~~~
>> include/linux/iommu.h:1277:5: warning: no previous prototype for 'iommu_dma_get_sgtable' [-Wmissing-prototypes]
    1277 | int iommu_dma_get_sgtable(struct device *dev, struct sg_table *sgt,
         |     ^~~~~~~~~~~~~~~~~~~~~
>> include/linux/iommu.h:1283:15: warning: no previous prototype for 'iommu_dma_get_merge_boundary' [-Wmissing-prototypes]
    1283 | unsigned long iommu_dma_get_merge_boundary(struct device *dev)
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/iommu.h:1287:8: warning: no previous prototype for 'iommu_dma_opt_mapping_size' [-Wmissing-prototypes]
    1287 | size_t iommu_dma_opt_mapping_size(void)
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/iommu.h: In function 'iommu_dma_map_page':
   include/linux/iommu.h:1239:1: error: control reaches end of non-void function [-Werror=return-type]
    1239 | }
         | ^
   cc1: some warnings being treated as errors


vim +/iommu_dma_sync_single_for_cpu +1217 include/linux/iommu.h

  1206	
  1207	static inline struct sg_table *iommu_dma_alloc_noncontiguous(struct device *dev,
  1208			size_t size, enum dma_data_direction dir, gfp_t gfp,
  1209			unsigned long attrs)
  1210	{
  1211		return NULL;
  1212	}
  1213	static inline void iommu_dma_free_noncontiguous(struct device *dev, size_t size,
  1214			struct sg_table *sgt, enum dma_data_direction dir)
  1215	{
  1216	}
> 1217	void iommu_dma_sync_single_for_cpu(struct device *dev,
  1218			dma_addr_t dma_handle, size_t size, enum dma_data_direction dir)
  1219	{
  1220	}
> 1221	void iommu_dma_sync_single_for_device(struct device *dev,
  1222			dma_addr_t dma_handle, size_t size, enum dma_data_direction dir)
  1223	{
  1224	}
> 1225	void iommu_dma_sync_sg_for_cpu(struct device *dev,
  1226			struct scatterlist *sgl, int nelems,
  1227			enum dma_data_direction dir)
  1228	{
  1229	}
> 1230	void iommu_dma_sync_sg_for_device(struct device *dev,
  1231			struct scatterlist *sgl, int nelems,
  1232			enum dma_data_direction dir)
  1233	{
  1234	}
> 1235	dma_addr_t iommu_dma_map_page(struct device *dev, struct page *page,
  1236			unsigned long offset, size_t size, enum dma_data_direction dir,
  1237			unsigned long attrs)
  1238	{
  1239	}
> 1240	void iommu_dma_unmap_page(struct device *dev, dma_addr_t dma_handle,
  1241			size_t size, enum dma_data_direction dir, unsigned long attrs)
  1242	{
  1243	}
> 1244	int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg,
  1245			int nents, enum dma_data_direction dir, unsigned long attrs)
  1246	{
  1247		return -EOPNOTSUPP;
  1248	}
> 1249	void iommu_dma_unmap_sg(struct device *dev, struct scatterlist *sg,
  1250			int nents, enum dma_data_direction dir, unsigned long attrs)
  1251	{
  1252	}
> 1253	dma_addr_t iommu_dma_map_resource(struct device *dev, phys_addr_t phys,
  1254			size_t size, enum dma_data_direction dir, unsigned long attrs)
  1255	{
  1256		return 0;
  1257	}
> 1258	void iommu_dma_unmap_resource(struct device *dev, dma_addr_t handle,
  1259			size_t size, enum dma_data_direction dir, unsigned long attrs)
  1260	{
  1261	}
> 1262	void iommu_dma_free(struct device *dev, size_t size, void *cpu_addr,
  1263			dma_addr_t handle, unsigned long attrs)
  1264	{
  1265	}
> 1266	void *iommu_dma_alloc(struct device *dev, size_t size,
  1267			dma_addr_t *handle, gfp_t gfp, unsigned long attrs)
  1268	{
  1269		return NULL;
  1270	}
> 1271	int iommu_dma_mmap(struct device *dev, struct vm_area_struct *vma,
  1272			void *cpu_addr, dma_addr_t dma_addr, size_t size,
  1273			unsigned long attrs)
  1274	{
  1275		return -EOPNOTSUPP;
  1276	}
> 1277	int iommu_dma_get_sgtable(struct device *dev, struct sg_table *sgt,
  1278			void *cpu_addr, dma_addr_t dma_addr, size_t size,
  1279			unsigned long attrs)
  1280	{
  1281		return -EOPNOTSUPP;
  1282	}
> 1283	unsigned long iommu_dma_get_merge_boundary(struct device *dev)
  1284	{
  1285		return 0;
  1286	}
> 1287	size_t iommu_dma_opt_mapping_size(void)
  1288	{
  1289		return 0;
  1290	}
  1291	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
