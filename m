Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D27D18E14
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jan 2024 11:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="APuHWWsw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704281063; x=1735817063;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hRjpOoUZZkcnKGVmrvB0UgnjF4/yqv+HzeHwo9bglBA=;
  b=APuHWWswvc/4PIKuCTGycx0liXHJ20cnR3c7NOhtjOOo9PURwgFZ/x5E
   l+MuwhNRH454PLdqqK2jcSneOJ3gaS+89LG2st6ciO6/bz+bUD1uokmKy
   kr8y1aFjy0YKQBxW3ICTbXUde9QY4RlhfTl6UrV3Z6oIxcHe86yV6Z/vU
   rQB2k3mZwxBkYYW5m1n4irY31gfAwqQZIpWdVAFam+lMSapssi10vWbsv
   r6qAE9wefbVlY0de53rVHflKlzBNiHNGXTHHR3GUf30kPPb5u902LSc4R
   894TZgrIsnA0jVxwAuRBsGOUVaSH4Tw2isTMzCpGUIY+AjWCEliUsgp8I
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="463398421"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; 
   d="scan'208";a="463398421"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2024 03:24:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="729762883"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; 
   d="scan'208";a="729762883"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 03 Jan 2024 03:24:20 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rKzMA-000M1K-0I;
	Wed, 03 Jan 2024 11:24:18 +0000
Date: Wed, 3 Jan 2024 19:23:59 +0800
From: kernel test robot <lkp@intel.com>
To: Guixin Liu <kanie@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-nvme@lists.infradead.org,
	Keith Busch <kbusch@kernel.org>, Sagi Grimberg <sagi@grimberg.me>,
	Christoph Hellwig <hch@lst.de>,
	Liu Song <liusong@linux.alibaba.com>
Subject: [linux-nvme:nvme-6.8 4/16] drivers/nvme/host/sysfs.c:42: undefined
 reference to `nvme_ns_head_ops'
Message-ID: <202401031943.0N72Tkji-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/nvme.git nvme-6.8
head:   3b99fc0cd3a7e44fb294d9f6c13173f3dadf4136
commit: 44bc827e396809faa6a4e2dc9bd5f148373ce88b [4/16] nvme: introduce nvme_disk_is_ns_head helper
config: i386-randconfig-015-20240103 (https://download.01.org/0day-ci/archive/20240103/202401031943.0N72Tkji-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240103/202401031943.0N72Tkji-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401031943.0N72Tkji-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/nvme/host/sysfs.o: in function `dev_to_ns_head':
>> drivers/nvme/host/sysfs.c:42: undefined reference to `nvme_ns_head_ops'
>> ld: drivers/nvme/host/sysfs.c:42: undefined reference to `nvme_ns_head_ops'
>> ld: drivers/nvme/host/sysfs.c:42: undefined reference to `nvme_ns_head_ops'
>> ld: drivers/nvme/host/sysfs.c:42: undefined reference to `nvme_ns_head_ops'
>> ld: drivers/nvme/host/sysfs.c:42: undefined reference to `nvme_ns_head_ops'
   ld: drivers/nvme/host/sysfs.o:drivers/nvme/host/sysfs.c:42: more undefined references to `nvme_ns_head_ops' follow


vim +42 drivers/nvme/host/sysfs.c

    37	
    38	static inline struct nvme_ns_head *dev_to_ns_head(struct device *dev)
    39	{
    40		struct gendisk *disk = dev_to_disk(dev);
    41	
  > 42		if (nvme_disk_is_ns_head(disk))
    43			return disk->private_data;
    44		return nvme_get_ns_from_dev(dev)->head;
    45	}
    46	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
