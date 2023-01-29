Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978F22F30
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Jan 2023 20:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675025072; x=1706561072;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QNXFbiz19WXOYlS41uac2lFMLIrugiAEy9hIZcQRmSk=;
  b=I4k5oIOLnvCHgdNcE52YX/vOzWuCz+pZ6tUltzT/FLBROmN1pMd22WMN
   AUotYvwx6qLxQyAe4ppN8/2dJeWsv0fV2YNbQ+NDKFgNRnmirNJ3kgoo2
   /CUMZWUWgvywyNfEsO8C5rh88NCagKK62qDHhx83nsV7Dw+h+BfFA+IBc
   QCLwQ6j/c4AdIQQEGwyvK7IgDhqF0dR+fJo+gNf4UjTxQaM+88Lh6i5Le
   e2VVODtlmYsNQibYS/POn9KGma7w/9yaaaZ8sHQTsSaIAd1uqZN4l1LO6
   pIa3HH4vseveXiJpNmdyVdDWQE1PP0WHnucCD6rGNDs8aC1Ou8eCfgbPx
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="413652222"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="413652222"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2023 12:44:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="909270237"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="909270237"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 29 Jan 2023 12:44:29 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMEXM-00036G-2f;
	Sun, 29 Jan 2023 20:44:28 +0000
Date: Mon, 30 Jan 2023 04:43:59 +0800
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
 dependencies detected for VFIO_MDEV when selected by DRM_I915_GVT_KVMGT
Message-ID: <202301300412.gQ3vUIrE-lkp@intel.com>
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
config: x86_64-kismet-CONFIG_VFIO_MDEV-CONFIG_DRM_I915_GVT_KVMGT-0-0 (https://download.01.org/0day-ci/archive/20230130/202301300412.gQ3vUIrE-lkp@intel.com/config)
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=8bf8c5ee1f3863d944c1d8c29335f0c790b4f851
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 8bf8c5ee1f3863d944c1d8c29335f0c790b4f851
        # 1. reproduce by kismet
           # install kmax per https://github.com/paulgazz/kmax/blob/master/README.md
           kismet --linux-ksrc=linux --selectees CONFIG_VFIO_MDEV --selectors CONFIG_DRM_I915_GVT_KVMGT -a=x86_64
        # 2. reproduce by make
           # save the config file to linux source tree
           cd linux
           make ARCH=x86_64 olddefconfig

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for VFIO_MDEV when selected by DRM_I915_GVT_KVMGT
   
   WARNING: unmet direct dependencies detected for VFIO_MDEV
     Depends on [n]: VFIO [=n]
     Selected by [y]:
     - DRM_I915_GVT_KVMGT [=y] && HAS_IOMEM [=y] && DRM_I915 [=y] && X86 [=y] && 64BIT [=y] && KVM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
