Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AF712B6E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Nov 2023 12:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cPjNgWHQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698842196; x=1730378196;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HE7OUuTeza2+S01BoJ6/sOEz0I3DCneouK94RPoG83I=;
  b=cPjNgWHQHzz+k4nb7VeGHhEyabG1EolB/WUiVd6hKGSYeqQgapiaA6uU
   CDYGN25Z1s+buZn5oKHGeXXUNXaNzgcPN4a48+5fOuxLlsKnnBpwVh1ay
   l/74t+rZbC5zFWBM8hXbqSvIyUHWHdyO7RBdbKwsBG5VCQGs1VRTokfW3
   FPNJysvLJw3GvZQFBm66RCgTSYXd9ApGHZnbj9XMLTYCtEUNEfbAbWlZw
   3GtWggFQDabv3yNcmr5XLuZAi4h5CTVGzi1bPLsixhYAY3UKmHgf4zg/x
   5xg+bsbaZJADdQMJUFiew6Yanqitnfxju8lQnoWen2Oi/tR+qhzjaoSvu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="10020527"
X-IronPort-AV: E=Sophos;i="6.03,268,1694761200"; 
   d="scan'208";a="10020527"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 05:36:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="790104175"
X-IronPort-AV: E=Sophos;i="6.03,268,1694761200"; 
   d="scan'208";a="790104175"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 01 Nov 2023 05:36:33 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyASV-0000o0-0Z;
	Wed, 01 Nov 2023 12:36:31 +0000
Date: Wed, 1 Nov 2023 20:36:13 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Borkmann <daniel@iogearbox.net>,
	Nikolay Aleksandrov <razor@blackwall.org>
Subject: [cilium:pr/netkit7 4/4] drivers/net/veth.c:465:20: warning: no
 previous prototype for 'veth_peer_dev'
Message-ID: <202311012021.s4sC5Gm8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cilium/linux.git pr/netkit7
head:   d567f22d2c3adbdf15ad1be35fd66467b562c68b
commit: d567f22d2c3adbdf15ad1be35fd66467b562c68b [4/4] bpf, netkit, veth: Add indirect call wrapper for ndo_get_peer_dev
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20231101/202311012021.s4sC5Gm8-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231101/202311012021.s4sC5Gm8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311012021.s4sC5Gm8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/veth.c:465:20: warning: no previous prototype for 'veth_peer_dev' [-Wmissing-prototypes]
     465 | struct net_device *veth_peer_dev(struct net_device *dev)
         |                    ^~~~~~~~~~~~~


vim +/veth_peer_dev +465 drivers/net/veth.c

   464	
 > 465	struct net_device *veth_peer_dev(struct net_device *dev)
   466	{
   467		struct veth_priv *priv = netdev_priv(dev);
   468	
   469		/* Callers must be under RCU read side. */
   470		return rcu_dereference(priv->peer);
   471	}
   472	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
