Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F19110E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Dec 2023 01:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZLRsSBQ+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701913496; x=1733449496;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j/c/2RW0A9KrwmtiIiliODk+EQHhq4qpdxkGqdEbF4I=;
  b=ZLRsSBQ+IS5wVqgb1dTnbWGMxt0cRXYHPqLuIDIEoJhT7Gz9w+OAp2uo
   1jcgAv6s6JFDE+liSlqvliBhEfv/QEIrtSWPK+cNNl6qzDV7MTAw6OtRE
   +WnAhuHl033gG2b2VrucbxIeUOsIWymWi4oAhhgyxBFwyKkuXoDFdfvSs
   j2RXq3Tq1neJk9vHBFc1oHhIi7rKNPeTomvtuYaP/v2ejJBrpQOTW9j6/
   b0OzCBstcprzivfVT2BFFG5YZnA+qtfVOe/qY11obpSRTWA4Q8y65+W//
   g9prTfOg41v+aZIbqMGqpIj6Koov5T1oc7w0xZMJBM0Zj/Ul5wpfqo9gQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="458481295"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="458481295"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 17:44:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="915388874"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="915388874"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 06 Dec 2023 17:44:54 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rB3Rc-000BgI-0L;
	Thu, 07 Dec 2023 01:44:52 +0000
Date: Thu, 7 Dec 2023 09:44:47 +0800
From: kernel test robot <lkp@intel.com>
To: Stafford Horne <shorne@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: drivers/vhost/vringh.c:567:18: sparse: sparse: cast to restricted
 __virtio16
Message-ID: <202312070936.yD6WY4mR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bee0e7762ad2c6025b9f5245c040fcc36ef2bde8
commit: d877322bc1adcab9850732275670409e8bcca4c4 openrisc: Fix issue with get_user for 64-bit values
date:   3 years, 3 months ago
config: openrisc-randconfig-r131-20231102 (https://download.01.org/0day-ci/archive/20231207/202312070936.yD6WY4mR-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231207/202312070936.yD6WY4mR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312070936.yD6WY4mR-lkp@intel.com/

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
