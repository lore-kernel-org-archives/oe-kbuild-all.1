Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FEA215787
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Jun 2025 20:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749069335; cv=none; b=MOuFnk5nR5qAsQLNpkCV+GJDOWo+QIfuX5YckFHb3bOmQgiQMCKTMnmVdUwHv1tPQwrwX6IqIT+f7RBBj/zHJoO1uKNslXo4XpSYgbbQ+X5SL14WFsccRxROCgMyLZxefxCfCwK8Itfz+cFySKpj+oi4oLqKIQKJBu5XWxN0tio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749069335; c=relaxed/simple;
	bh=f3mgFfqzl62og4UU3MdtoToQ2Lg24PJnTVOhTEFxK+8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k1ZD60T5aRXpoXJ6cTDGu/ToZvKDVxfPQTaNxlm4JjPpBb+nM/dnpWOLvefxnRXeeLQw+kxOBVNNkQ3efBijxuAaqowqMUAwaiV4fkAqdyE8/avd6THNfEX26zRDIcxNymCTGDpQtauq8zXj0pe0S+YvNZFt9byHS2tXApN+368=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ataNtPkA; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ataNtPkA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749069334; x=1780605334;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f3mgFfqzl62og4UU3MdtoToQ2Lg24PJnTVOhTEFxK+8=;
  b=ataNtPkAcxFh1wrP8WGo5CK/ah4V5AOA8EdTouMycVEhXaVnunx9B2aR
   9h5RX/II/4ZCxmR9peyLGEDyLESCj6FSADQb+Irz/1oMm4Ok36/MKbPo6
   3GDTgBexvF22QFGhMs9pblO+f354gGqRmCJRaAo+5YLiToxKBEXxLiONO
   9aF+/n9LA6apGtKy75T84QMM8emY6NBiaPvh5bMbtgvuU60HfjsFQGtmn
   C9kmq14goq3o1sre/wBTnZTtowSxVMpmc8/oUiy4p45xzEvHngdDTe0MJ
   RF9uw7JWG+Iqpoo57qkxndLrDXm+k/NSbt+0fyox6RIivBZzjNlFkcFCe
   g==;
X-CSE-ConnectionGUID: 0dp0DwbwSe6ZHqRFPCOmmQ==
X-CSE-MsgGUID: SMqIYnVtQ7iXEh9x/e8vCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51317850"
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; 
   d="scan'208";a="51317850"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 13:35:33 -0700
X-CSE-ConnectionGUID: 525ORdsMTuixOiHXb4rmJw==
X-CSE-MsgGUID: QrfykUSvTba79d0h2iOoUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; 
   d="scan'208";a="145636087"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 04 Jun 2025 13:35:32 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMupd-0003SP-2h;
	Wed, 04 Jun 2025 20:35:29 +0000
Date: Thu, 5 Jun 2025 04:35:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yu Liao <liaoyu15@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2357/2357] mm/clear_freelist_page.c:133:50:
 sparse: sparse: incorrect type in argument 3 (different address spaces)
Message-ID: <202506050455.Zu20ul1z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a9e6ec001662a376522f36604dfec47c30530549
commit: beb43b9e2640c0662a78e1417b1861729cf6c729 [2357/2357] mm: Add sysctl to clear free list pages
config: arm64-randconfig-r123-20250605 (https://download.01.org/0day-ci/archive/20250605/202506050455.Zu20ul1z-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250605/202506050455.Zu20ul1z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506050455.Zu20ul1z-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/clear_freelist_page.c:133:50: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got void [noderef] __user *buffer @@
   mm/clear_freelist_page.c:133:50: sparse:     expected void *
   mm/clear_freelist_page.c:133:50: sparse:     got void [noderef] __user *buffer
>> mm/clear_freelist_page.c:147:36: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   mm/clear_freelist_page.c:147:36: sparse:     expected int ( [usertype] *proc_handler )( ... )
   mm/clear_freelist_page.c:147:36: sparse:     got int ( * )( ... )

vim +133 mm/clear_freelist_page.c

   125	
   126	static int sysctl_clear_freelist_handler(struct ctl_table *table, int write,
   127			void __user *buffer, size_t *lenp, loff_t *ppos)
   128	{
   129		int ret;
   130		int val;
   131	
   132		table->data = &val;
 > 133		ret = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
   134	
   135		if (!ret && write)
   136			clear_freelist_pages();
   137	
   138		return ret;
   139	}
   140	
   141	static struct ctl_table clear_freelist_table[] = {
   142		{
   143			.procname   = "clear_freelist_pages",
   144			.data       = NULL,
   145			.maxlen     = sizeof(int),
   146			.mode       = 0200,
 > 147			.proc_handler   = &sysctl_clear_freelist_handler,
   148			.extra1     = SYSCTL_ONE,
   149			.extra2     = SYSCTL_ONE,
   150		}
   151	};
   152	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
