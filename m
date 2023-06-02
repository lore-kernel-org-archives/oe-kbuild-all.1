Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161F4A55
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Jun 2023 00:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685666155; x=1717202155;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bWHPZ0685lTcEuTnEgSVLgiuo9YO7pQ+A1jNRHepReE=;
  b=A27aFiwqNK/OSlSFx82LJK79v+xrPw47MPdd/GPa5QGLeDANbhcko4dZ
   yMFFcovQ3Dco07Cfg9Sqrs/c3HYSajur9o9N7+0aW1UtG4RmWDR27Wcs2
   aiyibskTrtQhLz/89xye0l3x20RSdcrv/rvdVdKkhQ+fffBLGuPw5tX4y
   /rLFfJnIQDbWACy9IVa8e4ISkiarYEBTZJ/j0JOO3+otVkCLFubajr4TP
   Sb0hSjAycvDfU69Zxy8PBB6oCzYbA+0GhRwPL1HT//13VjKH6l+GWKH31
   jOzSdq6GA3Gse2Jzy83+KDd+5Pv44bSKLexpfi0YD/d9NAw9OvttyxuGN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="336092084"
X-IronPort-AV: E=Sophos;i="6.00,211,1681196400"; 
   d="scan'208";a="336092084"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 17:35:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="685067097"
X-IronPort-AV: E=Sophos;i="6.00,211,1681196400"; 
   d="scan'208";a="685067097"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 01 Jun 2023 17:35:52 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4slj-0002pO-12;
	Fri, 02 Jun 2023 00:35:51 +0000
Date: Fri, 2 Jun 2023 08:35:27 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Wang <peter.wang@mediatek.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Stanley Chu <stanley.chu@mediatek.com>
Subject: kismet: WARNING: unmet direct dependencies detected for
 RESET_TI_SYSCON when selected by SCSI_UFS_MEDIATEK
Message-ID: <202306020859.1wHg9AaT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9e87b63ed37e202c77aa17d4112da6ae0c7c097c
commit: de48898d0cb6a3750558f35e14af799eafc3e6db scsi: ufs-mediatek: Create reset control device_link
date:   2 years ago
config: arm64-kismet-CONFIG_RESET_TI_SYSCON-CONFIG_SCSI_UFS_MEDIATEK-0-0 (https://download.01.org/0day-ci/archive/20230602/202306020859.1wHg9AaT-lkp@intel.com/config)
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=de48898d0cb6a3750558f35e14af799eafc3e6db
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout de48898d0cb6a3750558f35e14af799eafc3e6db
        # 1. reproduce by kismet
           # install kmax per https://github.com/paulgazz/kmax/blob/master/README.md
           kismet --linux-ksrc=linux --selectees CONFIG_RESET_TI_SYSCON --selectors CONFIG_SCSI_UFS_MEDIATEK -a=arm64
        # 2. reproduce by make
           # save the config file to linux source tree
           cd linux
           make ARCH=arm64 olddefconfig

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306020859.1wHg9AaT-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for RESET_TI_SYSCON when selected by SCSI_UFS_MEDIATEK
   .config:4634:warning: symbol value 'ONFIG_ARCH_MMAP_RND_BITS_MI' invalid for ARCH_MMAP_RND_BITS
   
   WARNING: unmet direct dependencies detected for RESET_TI_SYSCON
     Depends on [n]: RESET_CONTROLLER [=n] && HAS_IOMEM [=y]
     Selected by [y]:
     - SCSI_UFS_MEDIATEK [=y] && SCSI_LOWLEVEL [=y] && SCSI [=y] && SCSI_UFSHCD_PLATFORM [=y] && ARCH_MEDIATEK [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
