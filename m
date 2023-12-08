Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43A41F61F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Dec 2023 19:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JIxSZlEo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702063164; x=1733599164;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8Bgkj91w6gSW3fz6KbSzBzAD4jOqxbVia76/GQnZg6Y=;
  b=JIxSZlEoRuxbSeYYt3Ga9THO0grZsy+c7fJEV9l98M0VgCYHA7MD7Zox
   ERzJ2ok6HhQuCQzO3LUoxCrjaHkSsJpQ/lWNdYsMohBp7SzyRFRVVJWX9
   MXfdIXaOvG3j16sh8hXaZFNEDydlEpSUg3EIrMVdfW7yOir7kYPLPhgy3
   RQ88GgJhZRCwD3Rs+fFU1dx/2NRyPicJ4/YdYbxoQtjc1htI1BMMPWL2a
   2EL1GpQqAuRhIxu/XGybnXHFZi18VurdTJr7mTgcRG8ws5dfox/8WpQG6
   fyFQjOW1SvYhSM+c7ubIW3kcKjokDLgA6byT9wmK73LOUn+2U+IY16PnE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="425582083"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; 
   d="scan'208";a="425582083"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 11:19:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="1103660087"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; 
   d="scan'208";a="1103660087"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 08 Dec 2023 11:19:19 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBgNY-000EFT-36;
	Fri, 08 Dec 2023 19:19:16 +0000
Date: Sat, 9 Dec 2023 03:19:11 +0800
From: kernel test robot <lkp@intel.com>
To: Stafford Horne <shorne@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: drivers/vhost/vringh.c:567:18: sparse: sparse: cast to restricted
 __virtio16
Message-ID: <202312090326.3IgZoXQW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4df7c5fde316820286dfa6d203a1005d7fbe007d
commit: d877322bc1adcab9850732275670409e8bcca4c4 openrisc: Fix issue with get_user for 64-bit values
date:   3 years, 3 months ago
config: openrisc-randconfig-r131-20231102 (https://download.01.org/0day-ci/archive/20231209/202312090326.3IgZoXQW-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231209/202312090326.3IgZoXQW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312090326.3IgZoXQW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/vhost/vringh.c:567:18: sparse: sparse: cast to restricted __virtio16
>> drivers/vhost/vringh.c:567:18: sparse: sparse: cast to restricted __virtio16
>> drivers/vhost/vringh.c:567:18: sparse: sparse: cast to restricted __virtio16
>> drivers/vhost/vringh.c:567:18: sparse: sparse: restricted __virtio16 degrades to integer
>> drivers/vhost/vringh.c:567:18: sparse: sparse: restricted __virtio16 degrades to integer
>> drivers/vhost/vringh.c:567:18: sparse: sparse: cast to restricted __virtio16
>> drivers/vhost/vringh.c:567:18: sparse: sparse: cast to restricted __virtio16

vim +567 drivers/vhost/vringh.c

f87d0fbb579818 Rusty Russell      2013-03-20  562  
f87d0fbb579818 Rusty Russell      2013-03-20  563  /* Userspace access helpers: in this case, addresses are really userspace. */
b9f7ac8c72894c Michael S. Tsirkin 2014-12-12  564  static inline int getu16_user(const struct vringh *vrh, u16 *val, const __virtio16 *p)
f87d0fbb579818 Rusty Russell      2013-03-20  565  {
b9f7ac8c72894c Michael S. Tsirkin 2014-12-12  566  	__virtio16 v = 0;
b9f7ac8c72894c Michael S. Tsirkin 2014-12-12 @567  	int rc = get_user(v, (__force __virtio16 __user *)p);
b9f7ac8c72894c Michael S. Tsirkin 2014-12-12  568  	*val = vringh16_to_cpu(vrh, v);
b9f7ac8c72894c Michael S. Tsirkin 2014-12-12  569  	return rc;
f87d0fbb579818 Rusty Russell      2013-03-20  570  }
f87d0fbb579818 Rusty Russell      2013-03-20  571  

:::::: The code at line 567 was first introduced by commit
:::::: b9f7ac8c72894c19bf258a54ecaa708df4ffbe80 vringh: update for virtio 1.0 APIs

:::::: TO: Michael S. Tsirkin <mst@redhat.com>
:::::: CC: Michael S. Tsirkin <mst@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
