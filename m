Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B17F64E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Apr 2023 06:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681367389; x=1712903389;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9ByF2cohrHWY8h+Qav540aKmOgm7QPENmyxcvkfzNuE=;
  b=mQ/uxJrFEWx2hZNNMVKqrg6v8siCOQMOQ27NVpaKYpYPr0j6jo4FW3+q
   7mKloD4FFuTJKdUdnRaFBhdyta0l/L/vjy4YCSMw85QWqScRkwA5FYN9M
   48NTJt7ehgIFBE2ufvLg69ZuX5JYlJZ87EZKcLwo0yJqYSGb+w6VQRCIz
   qi5s6JKePrz+GrFoTKkqoc2M9SDy5B6i3NQ2ourXNK1U5fYJKVhVJOTDA
   3UIc7m/UbVmK74enxGVed+MEM07jXV77QO1CS/jQwVwMmmhgnwFBivZUG
   iA2o/UrASGj4Cyq2NAJuDaT4pF3vHf9WHMb4PLKF28VbcmF4TACmy6ga+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="430387847"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="430387847"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 23:29:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="691830426"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="691830426"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 12 Apr 2023 23:29:38 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmqSf-000YPt-1H;
	Thu, 13 Apr 2023 06:29:37 +0000
Date: Thu, 13 Apr 2023 14:29:25 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <jroedel@suse.de>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-4.14.y 2098/9999] drivers/iommu/intel-iommu.c:4174:9:
 warning: variable 'length' set but not used
Message-ID: <202304131431.KLO474GC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.14.y
head:   f03c8bbaf6d9cbebee390e8353c5df75293aff7c
commit: f7edbb6415098817533b9024694b2a6c05c74fc1 [2098/9999] iommu/vt-d: Duplicate iommu_resv_region objects per device list
config: x86_64-rhel-8.3-ltp (https://download.01.org/0day-ci/archive/20230413/202304131431.KLO474GC-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=f7edbb6415098817533b9024694b2a6c05c74fc1
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-4.14.y
        git checkout f7edbb6415098817533b9024694b2a6c05c74fc1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash LDFLAGS=-z max-page-size=0x200000  drivers/iommu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304131431.KLO474GC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/intel-iommu.c: In function 'domain_context_mapping_one':
   drivers/iommu/intel-iommu.c:2078:15: warning: comparison is always true due to limited range of data type [-Wtype-limits]
      if (did_old >= 0 && did_old < cap_ndoms(iommu->cap)) {
                  ^~
   drivers/iommu/intel-iommu.c: In function 'find_or_alloc_domain':
   drivers/iommu/intel-iommu.c:2556:6: warning: variable 'req_id' set but not used [-Wunused-but-set-variable]
     u16 req_id, dma_alias;
         ^~~~~~
   drivers/iommu/intel-iommu.c: In function 'iommu_prepare_static_identity_mapping':
   drivers/iommu/intel-iommu.c:2994:22: warning: variable 'iommu' set but not used [-Wunused-but-set-variable]
     struct intel_iommu *iommu;
                         ^~~~~
   drivers/iommu/intel-iommu.c: In function 'dmar_parse_one_rmrr':
>> drivers/iommu/intel-iommu.c:4174:9: warning: variable 'length' set but not used [-Wunused-but-set-variable]
     size_t length;
            ^~~~~~
   drivers/iommu/intel-iommu.c: In function 'intel_iommu_unmap':
   drivers/iommu/intel-iommu.c:5083:22: warning: variable 'iommu' set but not used [-Wunused-but-set-variable]
     struct intel_iommu *iommu;
                         ^~~~~


vim +/length +4174 drivers/iommu/intel-iommu.c

f59c7b69bcba31 drivers/pci/intel-iommu.c   Fenghua Yu    2009-03-27  4168  
318fe7df9d8456 drivers/iommu/intel-iommu.c Suresh Siddha 2011-08-23  4169  
c2a0b538d2c778 drivers/iommu/intel-iommu.c Jiang Liu     2014-11-09  4170  int __init dmar_parse_one_rmrr(struct acpi_dmar_header *header, void *arg)
318fe7df9d8456 drivers/iommu/intel-iommu.c Suresh Siddha 2011-08-23  4171  {
318fe7df9d8456 drivers/iommu/intel-iommu.c Suresh Siddha 2011-08-23  4172  	struct acpi_dmar_reserved_memory *rmrr;
318fe7df9d8456 drivers/iommu/intel-iommu.c Suresh Siddha 2011-08-23  4173  	struct dmar_rmrr_unit *rmrru;
0659b8dc45a6b1 drivers/iommu/intel-iommu.c Eric Auger    2017-01-19 @4174  	size_t length;
318fe7df9d8456 drivers/iommu/intel-iommu.c Suresh Siddha 2011-08-23  4175  
318fe7df9d8456 drivers/iommu/intel-iommu.c Suresh Siddha 2011-08-23  4176  	rmrru = kzalloc(sizeof(*rmrru), GFP_KERNEL);
318fe7df9d8456 drivers/iommu/intel-iommu.c Suresh Siddha 2011-08-23  4177  	if (!rmrru)
0659b8dc45a6b1 drivers/iommu/intel-iommu.c Eric Auger    2017-01-19  4178  		goto out;
318fe7df9d8456 drivers/iommu/intel-iommu.c Suresh Siddha 2011-08-23  4179  
318fe7df9d8456 drivers/iommu/intel-iommu.c Suresh Siddha 2011-08-23  4180  	rmrru->hdr = header;
318fe7df9d8456 drivers/iommu/intel-iommu.c Suresh Siddha 2011-08-23  4181  	rmrr = (struct acpi_dmar_reserved_memory *)header;
318fe7df9d8456 drivers/iommu/intel-iommu.c Suresh Siddha 2011-08-23  4182  	rmrru->base_address = rmrr->base_address;
318fe7df9d8456 drivers/iommu/intel-iommu.c Suresh Siddha 2011-08-23  4183  	rmrru->end_address = rmrr->end_address;
0659b8dc45a6b1 drivers/iommu/intel-iommu.c Eric Auger    2017-01-19  4184  
0659b8dc45a6b1 drivers/iommu/intel-iommu.c Eric Auger    2017-01-19  4185  	length = rmrr->end_address - rmrr->base_address + 1;
0659b8dc45a6b1 drivers/iommu/intel-iommu.c Eric Auger    2017-01-19  4186  
2e455289303886 drivers/iommu/intel-iommu.c Jiang Liu     2014-02-19  4187  	rmrru->devices = dmar_alloc_dev_scope((void *)(rmrr + 1),
2e455289303886 drivers/iommu/intel-iommu.c Jiang Liu     2014-02-19  4188  				((void *)rmrr) + rmrr->header.length,
2e455289303886 drivers/iommu/intel-iommu.c Jiang Liu     2014-02-19  4189  				&rmrru->devices_cnt);
0659b8dc45a6b1 drivers/iommu/intel-iommu.c Eric Auger    2017-01-19  4190  	if (rmrru->devices_cnt && rmrru->devices == NULL)
f7edbb64150988 drivers/iommu/intel-iommu.c Eric Auger    2019-06-03  4191  		goto free_rmrru;
318fe7df9d8456 drivers/iommu/intel-iommu.c Suresh Siddha 2011-08-23  4192  
2e455289303886 drivers/iommu/intel-iommu.c Jiang Liu     2014-02-19  4193  	list_add(&rmrru->list, &dmar_rmrr_units);
318fe7df9d8456 drivers/iommu/intel-iommu.c Suresh Siddha 2011-08-23  4194  
2e455289303886 drivers/iommu/intel-iommu.c Jiang Liu     2014-02-19  4195  	return 0;
0659b8dc45a6b1 drivers/iommu/intel-iommu.c Eric Auger    2017-01-19  4196  free_rmrru:
0659b8dc45a6b1 drivers/iommu/intel-iommu.c Eric Auger    2017-01-19  4197  	kfree(rmrru);
0659b8dc45a6b1 drivers/iommu/intel-iommu.c Eric Auger    2017-01-19  4198  out:
0659b8dc45a6b1 drivers/iommu/intel-iommu.c Eric Auger    2017-01-19  4199  	return -ENOMEM;
318fe7df9d8456 drivers/iommu/intel-iommu.c Suresh Siddha 2011-08-23  4200  }
318fe7df9d8456 drivers/iommu/intel-iommu.c Suresh Siddha 2011-08-23  4201  

:::::: The code at line 4174 was first introduced by commit
:::::: 0659b8dc45a6b13a4fec73b2ebb51c96b41974c4 iommu/vt-d: Implement reserved region get/put callbacks

:::::: TO: Eric Auger <eric.auger@redhat.com>
:::::: CC: Will Deacon <will.deacon@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
