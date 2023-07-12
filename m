Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26D9200A9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jul 2023 10:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689156834; x=1720692834;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6jByQsRCloBAm9WCTXzWFZGbRJr3KVAvd99twUzyDAM=;
  b=SrNjrH/6qmGSGFUHWBN8gi5TPbjdstCcGpMzE1tpgKSCyrEwifYVT9+O
   /+aMxlTPCTR4CYyX9fGuaesL6gcp2DpdOLVGy9bTO07LHzfzbvlUh+diw
   Mpb8J4yVfcjRK5nyzSpTqa7D4LGGkbhGQviXONWNoLf+J14kvB1yeFjYY
   PM/TXHmSeEd7KEhIArqPBtzFHhDpym+JrURWI1ooiH0tBxPgitMrXpI/2
   55kJ5qIhSOL5RPmBCbEhR5X47alJYA8QzwdaS91QQiYpVIxUgCp9aftya
   pUgWwToftcAL/l9X+VIs+2He5VbTTX66/YsTPb+D8QU0/coxLnihGNxa/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="430983238"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; 
   d="scan'208";a="430983238"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 03:13:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="721456441"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; 
   d="scan'208";a="721456441"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 12 Jul 2023 03:13:51 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJWr0-0005bj-2V;
	Wed, 12 Jul 2023 10:13:50 +0000
Date: Wed, 12 Jul 2023 18:13:02 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_pasid 67/70]
 drivers/iommu/iommufd/pasid.c:119: warning: expecting prototype for
 iommufd_device_attach_pasid(). Prototype was for
 iommufd_device_pasid_attach() instead
Message-ID: <202307121817.9V3HrNXJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_pasid
head:   8db4af69ff01c9d7e21e41bf884c6c727dd8525a
commit: b737865f47b20f2304d429eec76eaa778f355955 [67/70] iommufd: Allow attach/replace hwpt per pasid
config: arm-randconfig-r046-20230712 (https://download.01.org/0day-ci/archive/20230712/202307121817.9V3HrNXJ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230712/202307121817.9V3HrNXJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307121817.9V3HrNXJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/iommufd/pasid.c:119: warning: expecting prototype for iommufd_device_attach_pasid(). Prototype was for iommufd_device_pasid_attach() instead


vim +119 drivers/iommu/iommufd/pasid.c

   105	
   106	/**
   107	 * iommufd_device_attach_pasid - Connect a {device, pasid} to an iommu_domain
   108	 * @idev: device to attach
   109	 * @pasid: pasid to attach
   110	 * @pt_id: IOMMUFD_OBJ_HW_PAGETABLE to attach
   111	 *
   112	 * This connects a pasid in the device to an iommu_domain. Once this
   113	 * completes the device could do DMA with the pasid. Caller should
   114	 * guarantee the pasid is usable by the current user.
   115	 *
   116	 * This function is undone by calling iommufd_device_detach_pasid().
   117	 */
   118	int iommufd_device_pasid_attach(struct iommufd_device *idev, u32 pasid, u32 pt_id)
 > 119	{
   120		return iommufd_device_pasid_change_pt(idev, pasid, pt_id,
   121						      &iommufd_device_pasid_do_attach);
   122	}
   123	EXPORT_SYMBOL_NS_GPL(iommufd_device_pasid_attach, IOMMUFD);
   124	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
