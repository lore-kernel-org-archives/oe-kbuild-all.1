Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485927F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Apr 2023 13:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682168566; x=1713704566;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SFXjwXcpayuVNI0u2aRN1mQW2wIusJCKc32vV+0vylU=;
  b=QPcBK2b7zmZU0QWHC2QKuSJoUCDdwLby6od/lU2BhtvTaz9Glqx95dZp
   9tFWhYojDCW5T8D2M5H0bv3zO8MH4P7Sup888UjyIYyWlOLT7WI8jC3Yx
   SN77oL7yrTE2hNRyNC4ceHK7y+iFbmK7a4OXtnnkfb/4Si+0PXkYNZPff
   tM+a8THupVXE8llY5ErPQuX7aOfJE5HrSkuCxah1u1x6KAiMW8/5dy1P7
   oiE3eoCDBJkat+Gu56/4+smpKvJsAb7cUluXyfCoXmTaZYuj4h29ScBGU
   fYjMgjp3t+m8oGAbWXZ8YSAU1F13mMT1ATp0RMVEv8d1BUaEAYSsVUp+X
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="335040557"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="335040557"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2023 06:02:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="695217559"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="695217559"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 22 Apr 2023 06:02:44 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqCt2-000hJA-0i;
	Sat, 22 Apr 2023 13:02:44 +0000
Date: Sat, 22 Apr 2023 21:01:45 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-block:make-buffer_heads-optional 10/14] ERROR: modpost:
 "direct_write_fallback" [fs/fuse/fuse.ko] undefined!
Message-ID: <202304222146.BCVGEVmJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/block.git make-buffer_heads-optional
head:   174c941608ab09d2dc94900c64dd05128de04796
commit: 36ff0bb9f15b266b0cd17d13e74f598c0d4e9b40 [10/14] fuse: use direct_write_fallback
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20230422/202304222146.BCVGEVmJ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add hch-block git://git.infradead.org/users/hch/block.git
        git fetch --no-tags hch-block make-buffer_heads-optional
        git checkout 36ff0bb9f15b266b0cd17d13e74f598c0d4e9b40
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304222146.BCVGEVmJ-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "direct_write_fallback" [fs/fuse/fuse.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
