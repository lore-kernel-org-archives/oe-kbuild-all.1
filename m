Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B0F36E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jan 2023 04:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675054430; x=1706590430;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XO4Yj3yrUEbOQiqQaCNF9MCq0o7hZELZ+42TD/3//L4=;
  b=n5fBp9+EIeFYVJCDT7fI/PfAWyNoMpjgYBDdijulcocnizb6Vrn5cTPz
   LJXg3OEs69ZDVUV2zDJK+VJVqe2A/qFryna7zZk71HSn7FHV22OxaludD
   SIAlRke91PqsXnhaaVLLnGvw2CD9ouBKSZ0ZxBcQrKGzCWRVZBs9l57F/
   knxodorLQJaq/3ZXuuQO6rGEaa3MLX0Rp5+Hkg0TqTvvZ0vcxk0qJLvhT
   IXaq9tmWEMRofer2KMzRObyOESGx5A6XYDWj4AjZNX63fFxNwJ3pEuT+x
   jaBeXOh/THzH1AuRizSiJRxx5Y7zNhOnqKsxyidvKaFGTNExYLRQfp8nC
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="307122903"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; 
   d="scan'208";a="307122903"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2023 20:53:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="732559388"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; 
   d="scan'208";a="732559388"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 29 Jan 2023 20:53:47 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMMAs-0003OA-1d;
	Mon, 30 Jan 2023 04:53:46 +0000
Date: Mon, 30 Jan 2023 12:53:19 +0800
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
 dependencies detected for VFIO_MDEV when selected by SAMPLE_VFIO_MDEV_MDPY
Message-ID: <202301301239.ht1u9zke-lkp@intel.com>
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
config: csky-kismet-CONFIG_VFIO_MDEV-CONFIG_SAMPLE_VFIO_MDEV_MDPY-0-0 (https://download.01.org/0day-ci/archive/20230130/202301301239.ht1u9zke-lkp@intel.com/config)
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=8bf8c5ee1f3863d944c1d8c29335f0c790b4f851
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 8bf8c5ee1f3863d944c1d8c29335f0c790b4f851
        # 1. reproduce by kismet
           # install kmax per https://github.com/paulgazz/kmax/blob/master/README.md
           kismet --linux-ksrc=linux --selectees CONFIG_VFIO_MDEV --selectors CONFIG_SAMPLE_VFIO_MDEV_MDPY -a=csky
        # 2. reproduce by make
           # save the config file to linux source tree
           cd linux
           make ARCH=csky olddefconfig

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for VFIO_MDEV when selected by SAMPLE_VFIO_MDEV_MDPY
   .config:4648:warning: symbol value 'ONFIG_ARCH_MMAP_RND_BITS_MI' invalid for ARCH_MMAP_RND_BITS
   
   WARNING: unmet direct dependencies detected for VFIO_MDEV
     Depends on [n]: VFIO [=n]
     Selected by [y]:
     - SAMPLE_VFIO_MDEV_MDPY [=y] && SAMPLES [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
