Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFA02EE60B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Nov 2025 23:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764199051; cv=none; b=r/emfItKxkz7dMYmhiYN+Ui7Ig92dPz5TxlbMbIlkCkqYU122YkG89eaUkDebAKORloL5WM1q0xm9RqU5EFLDXTcBTCX80LFkZrffdN27/gp+1TIjHUVKb8Y22NRHnYXseboFNfaHMIihrFMD/OlkNwLhbIffWDAVrwKFxMNMiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764199051; c=relaxed/simple;
	bh=C+1X1Y64WGqdyY5WqDTZiQoaKIKZJd0MYskIzURc5eM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZcqcJ31p6vQQupxq80T2X6oFsfbqXcUlCBbGF4CB/rAp6AJAaR44c9+t7zTUlGJ1Na+FkwrXKrrlhojPNO0Ty4q+i92ZB3tQ4R4YWhwN2KtKKWjZjjH0tLJzN2TQHOEROZgZgk0jeh2P49kk7X6FNrUwuLMsUxXbVu/a+ti/XtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ie9SXdg4; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ie9SXdg4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764199050; x=1795735050;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C+1X1Y64WGqdyY5WqDTZiQoaKIKZJd0MYskIzURc5eM=;
  b=ie9SXdg4aeW2e3uC8/R6HteJYcFlNFeOpByRyDoEdHpE7GCJYLhpdJcw
   DpIjO8fuF4GHFORhZzcNTbBYeq51eayPgHck38AGUjBB9hHdr7jt8H9Yh
   lg1IR86AucaPJP8nUIYiuQ7O04tk3RM8cDhLWtZaAO01Nv39yQbGtXij7
   nEMOFHjny+KFPw8ItMUEy/JfbxsOTHoli8/5nveWHdTt8tiA5lRA09J3a
   O+7xKuQkLVe45dpudKHrrAdrMpUZbggvFzKJW+al4ONklOFf2q2DVCjEt
   PMeHMcXFf8F47TYgEIUIQGW/qs4/TRoZZDF+hAwSkhwIhtm5Be3HiMjiL
   Q==;
X-CSE-ConnectionGUID: Bo4voV2VQnu956iSxGQKww==
X-CSE-MsgGUID: UU4l5uVIRr6KspqiI5JKCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="68839824"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="68839824"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 15:17:29 -0800
X-CSE-ConnectionGUID: nfFGGR0KT4+OTLZXsYq67w==
X-CSE-MsgGUID: vRP7Au0oQUuvU7rtynrH1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="192324285"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 26 Nov 2025 15:17:28 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOOlJ-000000003SD-1YDE;
	Wed, 26 Nov 2025 23:17:25 +0000
Date: Thu, 27 Nov 2025 07:16:30 +0800
From: kernel test robot <lkp@intel.com>
To: David Wei <dw@davidwei.uk>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Borkmann <daniel@iogearbox.net>,
	Nikolay Aleksandrov <razor@blackwall.org>
Subject: [cilium:pr/netkit-iouring6 1/2] net/core/netdev-genl.c:1123:5:
 warning: no previous prototype for 'netdev_nl_bind_queue_doit'
Message-ID: <202511270718.SqNXDSNU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cilium/linux.git pr/netkit-iouring6
head:   7bfb4fc5f460441d05b483647e4f4c59c4afaeb1
commit: f54fd4a1c99a85d283ce07ebc4505d09a28b28f5 [1/2] net: Add bind-queue operation
config: arc-randconfig-002-20251127 (https://download.01.org/0day-ci/archive/20251127/202511270718.SqNXDSNU-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511270718.SqNXDSNU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511270718.SqNXDSNU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/core/netdev-genl.c:1123:5: warning: no previous prototype for 'netdev_nl_bind_queue_doit' [-Wmissing-prototypes]
    int netdev_nl_bind_queue_doit(struct sk_buff *skb, struct genl_info *info)
        ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/netdev_nl_bind_queue_doit +1123 net/core/netdev-genl.c

  1122	
> 1123	int netdev_nl_bind_queue_doit(struct sk_buff *skb, struct genl_info *info)
  1124	{
  1125		return -EOPNOTSUPP;
  1126	}
  1127	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
