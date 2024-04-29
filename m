Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E590213AA5D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Apr 2024 21:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714425183; cv=none; b=i1HJUFtHclkTXEYVhQ9taA9s0cO3bZ7ZmWMschDuB2od9Mlh88CTFZgSrCm9+MgAf0A5gl3YWE6vgdPbwLnyEyKGJ7pMWk50Ii5X1DuR0tuLtXPbf83lTPZx1s6O/AawBBSy7jetYXWnHT6mHG6M5tBeULIv/RhO0IreK2b+Kto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714425183; c=relaxed/simple;
	bh=wvJvn2RqXHt5KKSA+LcbgUhwmtPqAFiBePS6s+K7WZs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cLIct7Z84/uWn13+aFzMaQuxi5392AQnanPeS7F3OWRuaWliVYlrpFegEflikGlrnO6sQM4p5HjlZk80aY8hrnZP349WlrgTQXuXESWoATna8+h5DcbZFR0DL4yMh5q6uzt7LYZoNwE0zav+QV3a0CFnjEfWEhc6PczB/boarEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RyiXz+MS; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RyiXz+MS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714425181; x=1745961181;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wvJvn2RqXHt5KKSA+LcbgUhwmtPqAFiBePS6s+K7WZs=;
  b=RyiXz+MSqwSR7QTJvpfQpRuyD8fVu6QMIfCK0GeqlT5PFs7dr0xjBaqi
   W/gdjw8wQER+0UWJqBD+irfbJl1WnrY8JWQAATsZ3WZEnaA8pOEaO/6Tx
   s2iMn1ZvKukEQW/zu6rZr+SjH2ZMMlWRy0tnpuaOQmmEnUbyVCQBkJ2K+
   7DUTmeAGXkaWOhltL/JzGmGoJmhA4U7E94Ne+5Wbm7ZcRYnh2qV9CKpvc
   S3USzoaZ2GLLxpS1JZxpPtvoOLv545PPdU4bIAOTBnJv8IURAk65qa6IW
   /mtwcs/FxLuBq19UaK+sHQWBTWZ74Oc3BeEweX7fM3fAOmXb16BekVBXu
   w==;
X-CSE-ConnectionGUID: A1uZShmNTlKm9ksndskiJA==
X-CSE-MsgGUID: wDFRyylWRlq95Q6+WJAojA==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="10030295"
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; 
   d="scan'208";a="10030295"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 14:13:01 -0700
X-CSE-ConnectionGUID: VdKjnFBiQT64CvZz7lscgw==
X-CSE-MsgGUID: 2GoUOzOVQW6miaU/7ZuXRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; 
   d="scan'208";a="26857205"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 Apr 2024 14:12:59 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1YIz-0007Qs-0K;
	Mon, 29 Apr 2024 21:12:57 +0000
Date: Tue, 30 Apr 2024 05:12:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 262/11597]
 net/core/net-procfs.c:305:undefined reference to `wext_proc_exit'
Message-ID: <202404300504.75zzyezZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   65994b8c0220790d4b5b5aaf9d47ccf9bd42a473
commit: 8a167346a33aa28c6e422739e69abc87f57f81bc [262/11597] ANDROID: net: enable wireless core features with GKI_LEGACY_WEXT_ALLCONFIG
config: x86_64-randconfig-103-20240430 (https://download.01.org/0day-ci/archive/20240430/202404300504.75zzyezZ-lkp@intel.com/config)
compiler: gcc-11 (Ubuntu 11.4.0-4ubuntu1) 11.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240430/202404300504.75zzyezZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404300504.75zzyezZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   ld: net/socket.o: in function `sock_ioctl':
   net/socket.c:1110:(.text+0x611c): undefined reference to `wext_handle_ioctl'
   ld: net/socket.o: in function `compat_sock_ioctl':
   net/socket.c:3478:(.text+0x6a36): undefined reference to `compat_wext_handle_ioctl'
   ld: net/core/net-procfs.o: in function `dev_proc_net_exit':
>> net/core/net-procfs.c:305:(.text+0x6ad): undefined reference to `wext_proc_exit'
   ld: net/core/net-procfs.o: in function `dev_proc_net_init':
>> net/core/net-procfs.c:289:(.text+0x83d): undefined reference to `wext_proc_init'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +305 net/core/net-procfs.c

900ff8c6321418 Cong Wang         2013-02-18  274  
900ff8c6321418 Cong Wang         2013-02-18  275  static int __net_init dev_proc_net_init(struct net *net)
900ff8c6321418 Cong Wang         2013-02-18  276  {
900ff8c6321418 Cong Wang         2013-02-18  277  	int rc = -ENOMEM;
900ff8c6321418 Cong Wang         2013-02-18  278  
c3506372277779 Christoph Hellwig 2018-04-10  279  	if (!proc_create_net("dev", 0444, net->proc_net, &dev_seq_ops,
c3506372277779 Christoph Hellwig 2018-04-10  280  			sizeof(struct seq_net_private)))
900ff8c6321418 Cong Wang         2013-02-18  281  		goto out;
fddda2b7b52118 Christoph Hellwig 2018-04-13  282  	if (!proc_create_seq("softnet_stat", 0444, net->proc_net,
fddda2b7b52118 Christoph Hellwig 2018-04-13  283  			 &softnet_seq_ops))
900ff8c6321418 Cong Wang         2013-02-18  284  		goto out_dev;
c3506372277779 Christoph Hellwig 2018-04-10  285  	if (!proc_create_net("ptype", 0444, net->proc_net, &ptype_seq_ops,
c3506372277779 Christoph Hellwig 2018-04-10  286  			sizeof(struct seq_net_private)))
900ff8c6321418 Cong Wang         2013-02-18  287  		goto out_softnet;
900ff8c6321418 Cong Wang         2013-02-18  288  
900ff8c6321418 Cong Wang         2013-02-18 @289  	if (wext_proc_init(net))
900ff8c6321418 Cong Wang         2013-02-18  290  		goto out_ptype;
900ff8c6321418 Cong Wang         2013-02-18  291  	rc = 0;
900ff8c6321418 Cong Wang         2013-02-18  292  out:
900ff8c6321418 Cong Wang         2013-02-18  293  	return rc;
900ff8c6321418 Cong Wang         2013-02-18  294  out_ptype:
900ff8c6321418 Cong Wang         2013-02-18  295  	remove_proc_entry("ptype", net->proc_net);
900ff8c6321418 Cong Wang         2013-02-18  296  out_softnet:
900ff8c6321418 Cong Wang         2013-02-18  297  	remove_proc_entry("softnet_stat", net->proc_net);
900ff8c6321418 Cong Wang         2013-02-18  298  out_dev:
900ff8c6321418 Cong Wang         2013-02-18  299  	remove_proc_entry("dev", net->proc_net);
900ff8c6321418 Cong Wang         2013-02-18  300  	goto out;
900ff8c6321418 Cong Wang         2013-02-18  301  }
900ff8c6321418 Cong Wang         2013-02-18  302  
900ff8c6321418 Cong Wang         2013-02-18  303  static void __net_exit dev_proc_net_exit(struct net *net)
900ff8c6321418 Cong Wang         2013-02-18  304  {
900ff8c6321418 Cong Wang         2013-02-18 @305  	wext_proc_exit(net);
900ff8c6321418 Cong Wang         2013-02-18  306  
900ff8c6321418 Cong Wang         2013-02-18  307  	remove_proc_entry("ptype", net->proc_net);
900ff8c6321418 Cong Wang         2013-02-18  308  	remove_proc_entry("softnet_stat", net->proc_net);
900ff8c6321418 Cong Wang         2013-02-18  309  	remove_proc_entry("dev", net->proc_net);
900ff8c6321418 Cong Wang         2013-02-18  310  }
900ff8c6321418 Cong Wang         2013-02-18  311  

:::::: The code at line 305 was first introduced by commit
:::::: 900ff8c6321418dafa03c22e215cb9646a2541b9 net: move procfs code to net/core/net-procfs.c

:::::: TO: Cong Wang <xiyou.wangcong@gmail.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
