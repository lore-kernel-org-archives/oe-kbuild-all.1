Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61BE107AE
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Oct 2023 15:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696434504; x=1727970504;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L/UBjLA34d9r2VKMNipkmsJm69jz4a8dHi9E+0J6MNw=;
  b=HWzwWEkayLefz0rMsBf0Lra2bD0VLuSFaywkeX5a8NB3m7nC/V1vfcVZ
   11ZtaVOi++iddxUN/KYeVeDVK73fS9aWNaHV/rkbIJDoW2qBNQgCK0JfL
   U9UGya6idOtSuPwVMdugE47y52hW3bm5qmmgeXFsCeQ1d3+97peeivnVW
   zSqyiJASv4z/mnrSUdfxxOJndA/J6zfASmSnxISYbEuN9McIlvXTiHca6
   jHwA0Sk5H9i3PxeksQ3RWgZ6eriYDh21jibcLLun0VaPoleImocikgiiW
   7FC+WP1BA7EYSEEjP06EA19jkhAm3gWGwvTwF7rp4dXV5aRutJ3umhyfm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="363478714"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; 
   d="scan'208";a="363478714"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 08:48:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="751354329"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; 
   d="scan'208";a="751354329"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 04 Oct 2023 08:48:21 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qo46U-000KMK-2u;
	Wed, 04 Oct 2023 15:48:07 +0000
Date: Wed, 4 Oct 2023 23:47:06 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:xfrm-next 18/20] net/xfrm/xfrm_state.c:1960:6: warning:
 no previous prototype for 'xfrm_state_update_stats'
Message-ID: <202310042352.ozP4fOkt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git xfrm-next
head:   51299d29ce09c08bb0752fe33874c428a825990d
commit: 2e28542db8ba69b6b1ff049aec9e87580137ab06 [18/20] xfrm: get global statistics from the offloaded device
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20231004/202310042352.ozP4fOkt-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231004/202310042352.ozP4fOkt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310042352.ozP4fOkt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/xfrm/xfrm_state.c:1960:6: warning: no previous prototype for 'xfrm_state_update_stats' [-Wmissing-prototypes]
    1960 | void xfrm_state_update_stats(struct net *net)
         |      ^~~~~~~~~~~~~~~~~~~~~~~


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
