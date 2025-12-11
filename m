Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A655A242D87
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 03:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765425154; cv=none; b=hDSYKSACrvsRyiooAAyAJ6fu2fTTeGOz3tqMmMr1zPtgNdtQ4lqMaZth+ERO1TYkb0ufsBoDyJNX9blxHvDww8qbuEC70X6y6gcXTFi0EIpQ/zHZJ9MJhP7K8jrhSnc+wdwZetdwjKQXD9kaioJq+5rPAdzZm0W7hm4qqNut29w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765425154; c=relaxed/simple;
	bh=yLr3mabkgx5CNKXDJTRrNIZKGUMU3vkUNR0Ce3NDz/8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oAcX4A1CCf9j6Q36HX5D9cgpITye557iKlPJrlCGn4OpRKF6LEqLvi630JxY/HWW0Qzi+Hj5uJdRtfhjRbclfmo2h0aKrMYgIlNsPKMq2PajtOjXdcWA5Y+8q0Ufu2+/Q07hTuf2yISTNIb3+eMFH5HH6xyJUhC6vr4b8AuTl9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EbHCqzdK; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EbHCqzdK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765425153; x=1796961153;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yLr3mabkgx5CNKXDJTRrNIZKGUMU3vkUNR0Ce3NDz/8=;
  b=EbHCqzdKQdF2qWQxDnhIPDzXQLTY33hfeVVW6pnmVxzZsTzuTgMNfcT3
   nTo1XObvUm1mw+GJWmiqh5gav6f6T6FGtILUjQQXnTUPCa/pDqajsIsUi
   SLx8sc4u1ASTiEthBJNoL8NUKEoQUtjzrnQcndrjH6EbNN6ZezWi4CPEz
   TJTDx1FoQMtox5CCCl/0+0KWNvwCbUBrp3Os+RSGBLEKu8NTwbGfgmgyv
   HZXAWedKaQZpMwu79b4kAHYq6DX0ShTyhGcBbharURdkShyjFnnv7slnP
   x46nI3OPxHQYykDSp3YLdRlGE4jlU5KMQxKycfJ/TSf+C5N8vi6Fp1bJU
   w==;
X-CSE-ConnectionGUID: CsLxpsMARjqzNbgqiHDQsA==
X-CSE-MsgGUID: XaDLsmjBT4KsegdPq1TPBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="78769387"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="78769387"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 19:52:32 -0800
X-CSE-ConnectionGUID: ysyX2nwXRoqzgcYjIXdmvw==
X-CSE-MsgGUID: +Jc05+9uTU2x0CRKy5wRdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="201611981"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Dec 2025 19:52:31 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTXjB-0000000047R-02RW;
	Thu, 11 Dec 2025 03:52:29 +0000
Date: Thu, 11 Dec 2025 11:51:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/1]
 kernel/sched/core.c:4976:6: warning: no previous prototype for function
 '__balance_callbacks'
Message-ID: <202512111126.YiWJk4Bb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   1594e8fdf0af3790482e1d7e4d4dd3e5166f4f22
commit: 51ba045c81b3d00225cfe6866e5fd18a1faddf30 [0/1] ANDROID: GKI: vendor code needs __balance_callbacks access
config: i386-randconfig-015-20251211 (https://download.01.org/0day-ci/archive/20251211/202512111126.YiWJk4Bb-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111126.YiWJk4Bb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111126.YiWJk4Bb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/core.c:84:
   kernel/sched/sched.h:1766:15: warning: cast from 'void (*)(struct rq *)' to 'void (*)(struct callback_head *)' converts to incompatible function type [-Wcast-function-type-strict]
    1766 |         head->func = (void (*)(struct callback_head *))func;
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:4918:10: warning: cast from 'void (*)(struct callback_head *)' to 'void (*)(struct rq *)' converts to incompatible function type [-Wcast-function-type-strict]
    4918 |                 func = (void (*)(struct rq *))head->func;
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:4942:10: warning: cast from 'void (*)(struct rq *)' to 'void (*)(struct callback_head *)' converts to incompatible function type [-Wcast-function-type-strict]
    4942 |         .func = (void (*)(struct callback_head *))balance_push,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/core.c:4976:6: warning: no previous prototype for function '__balance_callbacks' [-Wmissing-prototypes]
    4976 | void __balance_callbacks(struct rq *rq)
         |      ^
   kernel/sched/core.c:4976:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4976 | void __balance_callbacks(struct rq *rq)
         | ^
         | static 
   4 warnings generated.


vim +/__balance_callbacks +4976 kernel/sched/core.c

  4975	
> 4976	void __balance_callbacks(struct rq *rq)
  4977	{
  4978		do_balance_callbacks(rq, __splice_balance_callbacks(rq, false));
  4979	}
  4980	EXPORT_SYMBOL_GPL(__balance_callbacks);
  4981	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
