Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1228817D9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jan 2023 09:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675071542; x=1706607542;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y2/OAZ7d/VGTWmtYqK8QAE7OItpSaFHKA4xGwooqWkQ=;
  b=Pll+nz2Q1Wlwxzng8vEJQ05s9IdKNu33s4bqzpqeFOadZ/NFSzy92qsM
   1i2An54/K7VljDggjTj5Xb1zwGb4D2fRYX0a3pGO0dlG8HZNYoAD60t8S
   vYox6rwz45KaSplOgofTT6kRQ/+l6c9OG1k8mAL2Ypp/wqxjGqJJ0YesG
   /QqcuXAI5d7ieBHWKrJdofTIJ7u+DDCc3Xo+sTRV8ZLs2FBnEk7+BcmNs
   w5d+Vmjs+6PPZXcMlC7MBpDgEocmh7Rn/aSxHUCC3tph00l9fWbdM6h2P
   w3XAtww9+VOLmDwBOdV9WP3ggyqt56MCdvREjCWyH5LFysKMH4jgRpk5f
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="327533318"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; 
   d="scan'208";a="327533318"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 01:39:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="664028538"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; 
   d="scan'208";a="664028538"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 30 Jan 2023 01:38:57 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMQcq-0003XO-2Q;
	Mon, 30 Jan 2023 09:38:56 +0000
Date: Mon, 30 Jan 2023 17:38:35 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Tony Krowiak <akrowiak@linux.ibm.com>
Subject: [linux-next:master 6402/9183] kismet: WARNING: unmet direct
 dependencies detected for VFIO_MDEV when selected by SAMPLE_VFIO_MDEV_MTTY
Message-ID: <202301301722.6fghRppL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ae0c77e1bc6963c67c6c09e8c72959fcb1ed8d5f
commit: 8bf8c5ee1f3863d944c1d8c29335f0c790b4f851 [6402/9183] vfio-mdev: turn VFIO_MDEV into a selectable symbol
config: csky-kismet-CONFIG_VFIO_MDEV-CONFIG_SAMPLE_VFIO_MDEV_MTTY-0-0 (https://download.01.org/0day-ci/archive/20230130/202301301722.6fghRppL-lkp@intel.com/config)
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=8bf8c5ee1f3863d944c1d8c29335f0c790b4f851
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 8bf8c5ee1f3863d944c1d8c29335f0c790b4f851
        # 1. reproduce by kismet
           # install kmax per https://github.com/paulgazz/kmax/blob/master/README.md
           kismet --linux-ksrc=linux --selectees CONFIG_VFIO_MDEV --selectors CONFIG_SAMPLE_VFIO_MDEV_MTTY -a=csky
        # 2. reproduce by make
           # save the config file to linux source tree
           cd linux
           make ARCH=csky olddefconfig

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for VFIO_MDEV when selected by SAMPLE_VFIO_MDEV_MTTY
   .config:4726:warning: symbol value 'ONFIG_ARCH_MMAP_RND_BITS_MI' invalid for ARCH_MMAP_RND_BITS
   
   WARNING: unmet direct dependencies detected for VFIO_MDEV
     Depends on [n]: VFIO [=n]
     Selected by [y]:
     - SAMPLE_VFIO_MDEV_MTTY [=y] && SAMPLES [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
