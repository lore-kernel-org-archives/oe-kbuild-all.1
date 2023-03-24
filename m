Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DF620F5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Mar 2023 06:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679637604; x=1711173604;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GFnt8wQIfhP9vRVFHL/JQd3DrMiRkuwhQ4dxicCa0xg=;
  b=lIhX2MgsddswB4aHoe2/wmvkQEnFT6GrboZCWbnDcxcR+YwnONeuXXHN
   ZhMK3K+jbi0TWnEH66R/BYBQYV77C8ovWq/L7fbbTtBZg4bsmsk1z/ivb
   dF+RVbdyZl5BJUCGe9KJ61xWbeIxHHL/I3OVBgexyhzVUjECkoY7UwZBO
   6nd8V3k6fZZOmC7sOVS6Ubp085FI7ZpEGIBfd9uiKLYwU/ze6q6OZwytp
   fYplQpA7BvKZL1NHbyispHxeWpSSRREmcK7KhiozDYy0Gu4LJig+QlKKI
   0ooTbW8MgyACNSC+qwJIqd38anHtzStCDvCWnTwR7vBMoyQE/r5Sb9Mt5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="402285025"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; 
   d="scan'208";a="402285025"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 23:00:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="826119291"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; 
   d="scan'208";a="826119291"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 23 Mar 2023 23:00:02 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfaT3-000F1w-0n;
	Fri, 24 Mar 2023 06:00:01 +0000
Date: Fri, 24 Mar 2023 13:59:33 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: kismet: WARNING: unmet direct dependencies detected for
 RPCSEC_GSS_KRB5 when selected by NFS_V4
Message-ID: <202303241307.f6NeW9gZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1e760fa3596e8c7f08412712c168288b79670d78
commit: e57d06527738798039b8e91af762fbd33881b34d NFS & NFSD: Update GSS dependencies
date:   2 weeks ago
config: csky-kismet-CONFIG_RPCSEC_GSS_KRB5-CONFIG_NFS_V4-0-0 (https://download.01.org/0day-ci/archive/20230324/202303241307.f6NeW9gZ-lkp@intel.com/config)
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e57d06527738798039b8e91af762fbd33881b34d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e57d06527738798039b8e91af762fbd33881b34d
        # 1. reproduce by kismet
           # install kmax per https://github.com/paulgazz/kmax/blob/master/README.md
           kismet --linux-ksrc=linux --selectees CONFIG_RPCSEC_GSS_KRB5 --selectors CONFIG_NFS_V4 -a=csky
        # 2. reproduce by make
           # save the config file to linux source tree
           cd linux
           make ARCH=csky olddefconfig

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303241307.f6NeW9gZ-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for RPCSEC_GSS_KRB5 when selected by NFS_V4
   .config:4761:warning: symbol value 'ONFIG_ARCH_MMAP_RND_BITS_MI' invalid for ARCH_MMAP_RND_BITS
   
   WARNING: unmet direct dependencies detected for RPCSEC_GSS_KRB5
     Depends on [n]: NETWORK_FILESYSTEMS [=y] && SUNRPC [=y] && CRYPTO [=n]
     Selected by [y]:
     - NFS_V4 [=y] && NETWORK_FILESYSTEMS [=y] && NFS_FS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
