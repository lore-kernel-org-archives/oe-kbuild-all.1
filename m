Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614C621A01
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Oct 2023 20:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MdO6Zy2h"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696451212; x=1727987212;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ABytWIZ+1hs3kQJtN1pAy7v+IEBhU0zbsQMOB1ac0RM=;
  b=MdO6Zy2hRwy2KfiMdMuzfOyBWyPUhkyL8x4AbOOAeu4X+Qezgez3Z+T+
   MTe1nAe9f8g60Mn9Y/m+kSoSa6TFlNLVbXIl7HDSS2JjMq4Fe2peYMPPo
   MDUFCh3FrSsXjLKG4Y293xfvqItETBtFDYuKdEoY56Qm324RjBAWgEeg7
   scB5Zmu6B1/dsBA7BN02gO0FYMEZbDn5br8QDWKgzJ1TYsk6c9yS4p3LT
   JGChkgBwbDvMu0ApCY6w0YZsshVfDImap0meYU7Vz2OcbycTCx1Hko0Lo
   Bgn85eFsE2XMXCegli9jOHO/U2Y8pe4cdAR9OEGwxeMdFP3OANT96hHyk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="447479204"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="447479204"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 13:26:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="842050531"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="842050531"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Oct 2023 13:26:48 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qo8SE-000Kau-0p;
	Wed, 04 Oct 2023 20:26:46 +0000
Date: Thu, 5 Oct 2023 04:26:10 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:xfrm-next 18/20] net/xfrm/xfrm_state.c:1960:6: error:
 redefinition of 'xfrm_state_update_stats'
Message-ID: <202310050404.7ZF3YgDf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git xfrm-next
head:   0ca93770d3601a53928374cb04c7b5bba53e45c7
commit: e7b8629c3555d0fe5e8b9581d54126a7dbf941e5 [18/20] xfrm: get global statistics from the offloaded device
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20231005/202310050404.7ZF3YgDf-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231005/202310050404.7ZF3YgDf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310050404.7ZF3YgDf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/xfrm/xfrm_state.c:1960:6: error: redefinition of 'xfrm_state_update_stats'
    1960 | void xfrm_state_update_stats(struct net *net)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from net/xfrm/xfrm_state.c:19:
   include/net/xfrm.h:1596:20: note: previous definition of 'xfrm_state_update_stats' with type 'void(struct net *)'
    1596 | static inline void xfrm_state_update_stats(struct net *net) {}
         |                    ^~~~~~~~~~~~~~~~~~~~~~~


vim +/xfrm_state_update_stats +1960 net/xfrm/xfrm_state.c

  1959	
> 1960	void xfrm_state_update_stats(struct net *net)
  1961	{
  1962		struct xfrm_state *x;
  1963		int i;
  1964	
  1965		spin_lock_bh(&net->xfrm.xfrm_state_lock);
  1966		for (i = 0; i <= net->xfrm.state_hmask; i++) {
  1967			hlist_for_each_entry(x, net->xfrm.state_bydst + i, bydst)
  1968				xfrm_dev_state_update_stats(x);
  1969		}
  1970		spin_unlock_bh(&net->xfrm.xfrm_state_lock);
  1971	}
  1972	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
