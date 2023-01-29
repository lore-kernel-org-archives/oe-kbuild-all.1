Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023173C27
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Jan 2023 23:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675035493; x=1706571493;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IueGkLQU04/Gp9hZESbAJAhmPrAVLSQTo1/ddWRUX0c=;
  b=FD9ckgZSSd7VnPB+7p95mgRUwlT8ImK+VbeHA2asEz2M5uTYtdMAaBrY
   QycJsO3pWi8jyFxKnW90rEsCq8h4K+asC0XZofoaqaUFwMrvkj3wyh87S
   23p7Me1HMSvOU93l5eS6H8XLOwk0A5KpMZUS0w7nBbx7WJwJ8JGlEZm33
   f1akMn/C3qfeC5iUWUhsu6tJfYcGBCH5DAmuQiLgXyWHZGo64cUHOY8t5
   C2Cdjws+CR+YSeNbHEgePLhDbqfG69cwcQH+qXv2z+m2GfFiuuK0hhUxI
   QOMZd/5hBrU2csQ7WnfpY4/SgIavLYR5YEVeNnnL4M9YFhayLdHUZWyNk
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="389822764"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="389822764"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2023 15:38:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="663906622"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="663906622"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 29 Jan 2023 15:38:07 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMHFO-0003Aw-2A;
	Sun, 29 Jan 2023 23:38:06 +0000
Date: Mon, 30 Jan 2023 07:37:44 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Tony Krowiak <akrowiak@linux.ibm.com>
Subject: [linux-next:master 6744/8766] kismet: WARNING: unmet direct
 dependencies detected for VFIO_MDEV when selected by SAMPLE_VFIO_MDEV_MBOCHS
Message-ID: <202301300723.WYomTQPr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e2f86c02fdc96ca29ced53221a3cbf50aa6f8b49
commit: 8bf8c5ee1f3863d944c1d8c29335f0c790b4f851 [6744/8766] vfio-mdev: turn VFIO_MDEV into a selectable symbol
config: csky-kismet-CONFIG_VFIO_MDEV-CONFIG_SAMPLE_VFIO_MDEV_MBOCHS-0-0 (https://download.01.org/0day-ci/archive/20230130/202301300723.WYomTQPr-lkp@intel.com/config)
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=8bf8c5ee1f3863d944c1d8c29335f0c790b4f851
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 8bf8c5ee1f3863d944c1d8c29335f0c790b4f851
        # 1. reproduce by kismet
           # install kmax per https://github.com/paulgazz/kmax/blob/master/README.md
           kismet --linux-ksrc=linux --selectees CONFIG_VFIO_MDEV --selectors CONFIG_SAMPLE_VFIO_MDEV_MBOCHS -a=csky
        # 2. reproduce by make
           # save the config file to linux source tree
           cd linux
           make ARCH=csky olddefconfig

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for VFIO_MDEV when selected by SAMPLE_VFIO_MDEV_MBOCHS
   
   WARNING: unmet direct dependencies detected for VFIO_MDEV
     Depends on [n]: VFIO [=n]
     Selected by [y]:
     - SAMPLE_VFIO_MDEV_MBOCHS [=y] && SAMPLES [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
