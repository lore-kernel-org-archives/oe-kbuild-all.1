Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927766123
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Sep 2023 08:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694765517; x=1726301517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3sD/F1x4Vk8RxtcDGShr2uNowwS+rPTINPjF2LUV4rY=;
  b=TN+T1VjzjpSaj+n7vFShDpR5YI8ZVVSaa6fEISXMRnkb1q/JLcy4ksUl
   CtmMArRd4JSX8p5g7D/iCy/RlPhHd0M65jYeyg4Fl8h6Ze6euoqdLry9V
   PJmoHgtumpI8AOnazxsTp+hQY60G4p9fccUxcvc1wDFbJNJezcTiJpjjU
   5jhQlfTab6uMrii/yg5dBrV4SEmoQHnCZ/2W/i1kEDtkrEv56bsf5O+P9
   niC2igFgqhM4m8Yk5PW+Ik/KS7Dr55VwENMGFsaaVUo/Td1q0lz+mMtej
   oHS7XUTiBNdc2H2ol3DT9/CA5AuhJxk0PTj8ZtCTrYLydRAAKpyZRDgd8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="359451601"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; 
   d="scan'208";a="359451601"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 01:11:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="888150360"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; 
   d="scan'208";a="888150360"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 15 Sep 2023 01:11:20 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qh3vb-0002gH-1T;
	Fri, 15 Sep 2023 08:11:51 +0000
Date: Fri, 15 Sep 2023 16:11:19 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	David Sterba <dsterba@suse.com>
Subject: [linux-next:master 5242/5666]
 raid-stripe-tree.c:(.text.btrfs_insert_striped_mirrored_raid_extents+0x124):
 undefined reference to `__udivdi3'
Message-ID: <202309151634.xIz7JdoB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   dfa449a58323de195773cf928d99db4130702bf7
commit: 564654867daa781a21b67d952b3d18353a85c73a [5242/5666] btrfs: add support for inserting raid stripe extents
config: powerpc-randconfig-r012-20220307 (https://download.01.org/0day-ci/archive/20230915/202309151634.xIz7JdoB-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230915/202309151634.xIz7JdoB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309151634.xIz7JdoB-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: fs/btrfs/raid-stripe-tree.o: in function `btrfs_insert_striped_mirrored_raid_extents':
>> raid-stripe-tree.c:(.text.btrfs_insert_striped_mirrored_raid_extents+0x124): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
