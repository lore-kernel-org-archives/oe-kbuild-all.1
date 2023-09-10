Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCE93C16
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Sep 2023 13:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694351816; x=1725887816;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NRlH3oZGbbuCMekb6i/2KsmZ0rPCDwFh9Uc0JpBXUmE=;
  b=AGyErL/DI3Lr4igp7wPApW5+34JrP9ThRzTq50/E8WYAd/yHrutLPCTE
   rqWfL9QSijD9E9dVGP9RxHM351am3huRja+bY8aTbA95lp8FSZz64JCjp
   mmGhayJT1TbvqaF5bpYj7OZ/cdZKz4zD1FJhz/lj7Fjv+vYlxL/Xz+Oxi
   k0U1zmKes5KybSzWQSCBtn3wB8ja6aSol7RfMoVNRQZ+ineLNM7fhOYd4
   UZZwo86WBJLfbrLFgGY7l1wBVDEvfdu7Df5GjkSD9S0tPl8alazZelRSp
   2MB8sr7DQ6BmsQuAT4bFs1+I6eMpapUmTh01hwxhojvuQiJTsxwSIs/5m
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="464262005"
X-IronPort-AV: E=Sophos;i="6.02,241,1688454000"; 
   d="scan'208";a="464262005"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2023 06:16:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="886191806"
X-IronPort-AV: E=Sophos;i="6.02,241,1688454000"; 
   d="scan'208";a="886191806"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 10 Sep 2023 06:16:32 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfKJ1-0004y0-1o;
	Sun, 10 Sep 2023 13:16:51 +0000
Date: Sun, 10 Sep 2023 21:16:06 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Kevin Tian <kevin.tian@intel.com>,
	Eric Auger <eric.auger@redhat.com>,
	Nicolin Chen <nicolinc@nvidia.com>
Subject: drivers/iommu/iommufd/vfio_compat.c:315:17: sparse: sparse: cast
 removes address space '__user' of expression
Message-ID: <202309102158.44x6nW0r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   535a265d7f0dd50d8c3a4f8b4f3a452d56bd160f
commit: d624d6652a65ad4f47a58b8651a1ec1163bb81d3 iommufd: vfio container FD ioctl compatibility
date:   9 months ago
config: i386-randconfig-063-20230910 (https://download.01.org/0day-ci/archive/20230910/202309102158.44x6nW0r-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230910/202309102158.44x6nW0r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309102158.44x6nW0r-lkp@intel.com/

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
