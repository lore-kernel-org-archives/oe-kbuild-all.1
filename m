Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB821768FC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jan 2025 06:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738044715; cv=none; b=hyecLvEyF+xigIr+kC2Mzf3DsJhl4oN0zJQFPkVs+rbNVG8xB0CKac3OFNAvThurxJwSEjrkhNJQvqdfVS18KLzWvAOEqqu1xBkp/8JI+QzIqq50KW1OQxj0ciAhgKdRdNT/89Z6UMLT3juvmntr8SoZOoTcYhJS9nZadgvhK44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738044715; c=relaxed/simple;
	bh=Je3B40+ET50e67kyJ9TfdImVi2FsfvBLpSpKMQwt3ts=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SQc3siY9PH/3oNwmNaIUu4IQiWwK8u55qloh8Diws86iWZ1W380z/pTT5cEhqIIuW/qYD6H3c14JNpsx35op82Go5hPCgMN14rQ921+JeTooNrJOdwfgoJzzV18Q92rVIS8dB0dcfa8nGn8k7b8hPyP3vdQyIDWgOoGo7zc+iFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EaSWiMYO; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EaSWiMYO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738044714; x=1769580714;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Je3B40+ET50e67kyJ9TfdImVi2FsfvBLpSpKMQwt3ts=;
  b=EaSWiMYOFGCjqKLnf1oX1ljYLBuT2ancmhDZ1JWdQ+eWAA2vNrgiRthX
   GbGhxMy5xoGvlKJrZFOaCBO0+gKQ8X7L0CGIqTMe5t/ZZh8Yy9AptvonX
   BxidDP1Ds6XqqQHidEebweAhJje+V6ZmGMJumaJwKmFxHdjroAQgVLNUW
   E/2Wp/FgKQ05CdnEzWRTRwQVx6nj0v7y1+X2bJZ0YGC1uXlljUOWtIo5s
   6IqXNr/bRT1IJnrLdfoSw0A+O+Ur2kbCEWhLpzVD511Bu8YTGYac0+/b8
   nok2S5s0lvUQwzxZDKcimshFUMs7ZdSic8IoOXOEj7W3ADK4wCUrcNgKc
   w==;
X-CSE-ConnectionGUID: nuxN5v2oTpi02HX+0S5Kyw==
X-CSE-MsgGUID: 5+iWT5gAQ6ilI7cOGzcE7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="56058793"
X-IronPort-AV: E=Sophos;i="6.13,240,1732608000"; 
   d="scan'208";a="56058793"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 22:11:53 -0800
X-CSE-ConnectionGUID: 4ZEgkvmRThWqQpeyMrQ5ow==
X-CSE-MsgGUID: vNlUbx9mSDK9w1VkXJsczw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="113606861"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 27 Jan 2025 22:11:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcepB-000hUz-1U;
	Tue, 28 Jan 2025 06:11:49 +0000
Date: Tue, 28 Jan 2025 14:10:52 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20250124 15/15]
 kernel/bpf/core.c:2510:29: sparse: sparse: incompatible types in comparison
 expression (different base types):
Message-ID: <202501281414.ABnepGOJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20250124
head:   86b653e4edef7b0f7b7afe5dd8e0241fc1165238
commit: 9fcf89847632bd963953b2f945fb3ce2277f1f97 [15/15] treewide_some: fix multiple -Wfamnae warnings that must be audited separately
config: i386-randconfig-062-20250128 (https://download.01.org/0day-ci/archive/20250128/202501281414.ABnepGOJ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250128/202501281414.ABnepGOJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501281414.ABnepGOJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/bpf/core.c:243:49: sparse: sparse: arithmetics on pointers to functions
   kernel/bpf/core.c:2015:43: sparse: sparse: arithmetics on pointers to functions
   kernel/bpf/core.c:2020:48: sparse: sparse: arithmetics on pointers to functions
   kernel/bpf/core.c:2288:77: sparse: sparse: subtraction of functions? Share your drugs
>> kernel/bpf/core.c:2510:29: sparse: sparse: incompatible types in comparison expression (different base types):
   kernel/bpf/core.c:2510:29: sparse:    struct bpf_prog_array *
   kernel/bpf/core.c:2510:29: sparse:    struct bpf_prog_array_hdr *
   kernel/bpf/core.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/xdp.h, ...):
   include/trace/events/xdp.h:321:1: sparse: sparse: Using plain integer as NULL pointer
   include/trace/events/xdp.h:348:1: sparse: sparse: Using plain integer as NULL pointer
   include/trace/events/xdp.h:382:1: sparse: sparse: Using plain integer as NULL pointer
   kernel/bpf/core.c: note: in included file (through include/linux/rbtree_latch.h, include/linux/bpf.h, include/linux/filter.h):
   include/linux/rbtree.h:74:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/rbtree.h:74:9: sparse:    struct rb_node [noderef] __rcu *
   include/linux/rbtree.h:74:9: sparse:    struct rb_node *
   include/linux/rbtree.h:74:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/rbtree.h:74:9: sparse:    struct rb_node [noderef] __rcu *
   include/linux/rbtree.h:74:9: sparse:    struct rb_node *

vim +2510 kernel/bpf/core.c

8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2507  
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2508  void bpf_prog_array_free_sleepable(struct bpf_prog_array *progs)
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2509  {
8c7dcb84e3b744 Delyan Kratunov 2022-06-14 @2510  	if (!progs || progs == &bpf_empty_prog_array.hdr)
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2511  		return;
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2512  	call_rcu_tasks_trace(&progs->rcu, __bpf_prog_array_free_sleepable_cb);
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2513  }
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2514  

:::::: The code at line 2510 was first introduced by commit
:::::: 8c7dcb84e3b744b2b70baa7a44a9b1881c33a9c9 bpf: implement sleepable uprobes by chaining gps

:::::: TO: Delyan Kratunov <delyank@fb.com>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
