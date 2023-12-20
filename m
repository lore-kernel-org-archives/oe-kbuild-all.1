Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF498358B2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Dec 2023 13:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lwZ1El00"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703078586; x=1734614586;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3sSSYWiThe+UjmB7UE5uYaSf46om+FelbCK0sUF8kzg=;
  b=lwZ1El00JMWQEt+WH+ejebUCHtEzQ1U+4EL2ZyZMN95K+LSF9cLp5KqR
   pxkuf558nNyWuciQ75g/5ZM7lDEKPCDJA3uCWorm0XlyEZqZsAWbfmphG
   Uzxt8LiiYtLXsVFe7LhbWDE9cldSp3DGnHrWgBvYZxHLCnN4j5i8XISnV
   6Uj8lGDgYklHMdZZRpPlmE/ZCAKdw46Cyns2ot4XVWXaXWneTuO+Hfj53
   3EtGq79+gKoJI7/MEhBPRatFgQIZCKqvF994O8EUitTeu6nO1T7KJJ65i
   qyk/nJoa7Li8qj3Ub1f8bVScYckw9koT4xLeogD5SpeDwE4YcP10GkWkv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="398591825"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="398591825"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 05:23:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="919970544"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="919970544"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 20 Dec 2023 05:23:03 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFwXM-0006uV-0u;
	Wed, 20 Dec 2023 13:23:01 +0000
Date: Wed, 20 Dec 2023 21:19:14 +0800
From: kernel test robot <lkp@intel.com>
To: Yishai Hadas <yishaih@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Kevin Tian <kevin.tian@intel.com>
Subject: [linux-next:master 9106/9550] drivers/vfio/pci/virtio/main.c:550:6:
 warning: no previous prototype for 'virtiovf_pci_aer_reset_done'
Message-ID: <202312202115.oDmvN1VE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   20d857259d7d10cd0d5e8b60608455986167cfad
commit: eb61eca0e8c3efbdd6d3c9d2b7f70bf67e165f7d [9106/9550] vfio/virtio: Introduce a vfio driver over virtio devices
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20231220/202312202115.oDmvN1VE-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231220/202312202115.oDmvN1VE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312202115.oDmvN1VE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/vfio/pci/virtio/main.c:550:6: warning: no previous prototype for 'virtiovf_pci_aer_reset_done' [-Wmissing-prototypes]
     550 | void virtiovf_pci_aer_reset_done(struct pci_dev *pdev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/virtiovf_pci_aer_reset_done +550 drivers/vfio/pci/virtio/main.c

   549	
 > 550	void virtiovf_pci_aer_reset_done(struct pci_dev *pdev)
   551	{
   552		struct virtiovf_pci_core_device *virtvdev = dev_get_drvdata(&pdev->dev);
   553	
   554		virtvdev->pci_cmd = 0;
   555	}
   556	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
