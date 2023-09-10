Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDF010E3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Sep 2023 03:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694316382; x=1725852382;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wlYt8SEVq9neiT3RT+ZQgBNicRyh7LcLToF+p88+HgE=;
  b=hgNWe9+phfbBK1x4DYZOur44XEp81PKmd01KLloSycAcKT8+IN/t0ncd
   5S1g4Rp8HEqH7/7AdnzOh+8ANUjYRC1HHNT/InLZvNlx8xfzWXlQ/J1Yx
   OkQQ9NZxchIR09VdjKTCAA/2bmVWn8NhmdlqlyR/5ZqHMRZdVsZXFB3Bt
   RQ6s3uIK2O4sHm2ZoxgaRewB2DkgpjKojU/zFRZ2zDhMBBsgiKOxxDdDD
   wkz9QEUVyWeSek441fK8Mk28StOn/m6aWBVl6f1ILpAeLO8qdYAlhT7mc
   986zbtBQSKYLjJ+C8c0PWjGqb6LJ5TIpvGfYThN2R/Nu2FbYbEdZT35TU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="376772560"
X-IronPort-AV: E=Sophos;i="6.02,241,1688454000"; 
   d="scan'208";a="376772560"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2023 20:26:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="916606147"
X-IronPort-AV: E=Sophos;i="6.02,241,1688454000"; 
   d="scan'208";a="916606147"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 09 Sep 2023 20:26:19 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfB5V-0004JI-0e;
	Sun, 10 Sep 2023 03:26:17 +0000
Date: Sun, 10 Sep 2023 11:25:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Kevin Tian <kevin.tian@intel.com>,
	Eric Auger <eric.auger@redhat.com>,
	Nicolin Chen <nicolinc@nvidia.com>
Subject: drivers/iommu/iommufd/vfio_compat.c:315:17: sparse: sparse: cast
 removes address space '__user' of expression
Message-ID: <202309101137.iD6jQg4Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a3c57ab79a06e333a869ae340420cb3c6f5921d3
commit: d624d6652a65ad4f47a58b8651a1ec1163bb81d3 iommufd: vfio container FD ioctl compatibility
date:   9 months ago
config: i386-randconfig-063-20230910 (https://download.01.org/0day-ci/archive/20230910/202309101137.iD6jQg4Q-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230910/202309101137.iD6jQg4Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309101137.iD6jQg4Q-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iommu/iommufd/vfio_compat.c:315:17: sparse: sparse: cast removes address space '__user' of expression

vim +/__user +315 drivers/iommu/iommufd/vfio_compat.c

   309	
   310	static int iommufd_fill_cap_iova(struct iommufd_ioas *ioas,
   311					 struct vfio_info_cap_header __user *cur,
   312					 size_t avail)
   313	{
   314		struct vfio_iommu_type1_info_cap_iova_range __user *ucap_iovas =
 > 315			container_of(cur,
   316				     struct vfio_iommu_type1_info_cap_iova_range __user,
   317				     header);
   318		struct vfio_iommu_type1_info_cap_iova_range cap_iovas = {
   319			.header = {
   320				.id = VFIO_IOMMU_TYPE1_INFO_CAP_IOVA_RANGE,
   321				.version = 1,
   322			},
   323		};
   324		struct interval_tree_span_iter span;
   325	
   326		interval_tree_for_each_span(&span, &ioas->iopt.reserved_itree, 0,
   327					    ULONG_MAX) {
   328			struct vfio_iova_range range;
   329	
   330			if (!span.is_hole)
   331				continue;
   332			range.start = span.start_hole;
   333			range.end = span.last_hole;
   334			if (avail >= struct_size(&cap_iovas, iova_ranges,
   335						 cap_iovas.nr_iovas + 1) &&
   336			    copy_to_user(&ucap_iovas->iova_ranges[cap_iovas.nr_iovas],
   337					 &range, sizeof(range)))
   338				return -EFAULT;
   339			cap_iovas.nr_iovas++;
   340		}
   341		if (avail >= struct_size(&cap_iovas, iova_ranges, cap_iovas.nr_iovas) &&
   342		    copy_to_user(ucap_iovas, &cap_iovas, sizeof(cap_iovas)))
   343			return -EFAULT;
   344		return struct_size(&cap_iovas, iova_ranges, cap_iovas.nr_iovas);
   345	}
   346	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
