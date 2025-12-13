Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB1D22D7B5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 13:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765633670; cv=none; b=RknOtq1Fd+IfGeNmEl4y6uZXnIf6ZpcGBgteHgR5JjE/4HtSrWnB9yN7g5ea57yR69lwvExA1cHZIY7u6spx3qpxhvi8qKRZTatHZpAyyknvVolJjZG71MUUU++ZTsSGjPMHLrkRIvo8NA6dR+0n4E7jOB8wTCZPtmb5rsyoXsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765633670; c=relaxed/simple;
	bh=EXXtrjoSYcBEnrMVRjT4FcIEw66glPamVBc0EDCK67c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qmHdFXnIz0uPmcrPcPGsyo2Kpk/P6QTq/z+G0A2275kItFUbSXxzAl1KDqmug/k1xSf7RREf0xFVBOh4rOW6GXoPRy0Xttgqq0LglP+2ApgXioi4cYeVuOkJvqlgLOw0VSyCHkcDw26tMGq+y7rivshZpXADA+yjyO98XCdz80g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JlcE04mN; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JlcE04mN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765633669; x=1797169669;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EXXtrjoSYcBEnrMVRjT4FcIEw66glPamVBc0EDCK67c=;
  b=JlcE04mNIA9NrzFw77kjpul+7L2EYt4K/WHOGUN36ohLZG3SN/a7iBOr
   07R9W4O6oX1IS3gHIrNEbOwS6WmU9hPh0jSbVnFQ5uOo8PQ7z0nhRTb7l
   mKZMNO0u+Wm0thtPNPzObGmz+aGKjTHndEcy0+zkPjQejXBsr4Ft99jGS
   P4RnD1WDn/MdvSv4+n4EEswjVfoH9Ot0w0SvaEecXy8Kyb3kRjaIQq6vA
   uGjIhczPx/A8+5pO1ozrVtszDWfgc3G7eI/sn0oflipvWoFFvPgtX2x2w
   uzKc9GBeoUnyXwEz0njVb+kAgtrB7i5FMDg/C4SfLRY5n+l/Er1shXkiB
   w==;
X-CSE-ConnectionGUID: ZLkBuPn0Swm3rkREjv6oAw==
X-CSE-MsgGUID: G3PsHEwWRrGlsl9+x0YTAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="70193102"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="70193102"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 05:47:46 -0800
X-CSE-ConnectionGUID: KtRMz9kJR9urWzvZkaOwtA==
X-CSE-MsgGUID: 94+9WtRSSiqCMQRac8ZigQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="198145268"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Dec 2025 05:47:45 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUPyI-000000007hB-40sp;
	Sat, 13 Dec 2025 13:47:42 +0000
Date: Sat, 13 Dec 2025 21:47:38 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20251212 21/21]
 kernel/bpf/core.c:2624:29: sparse: sparse: incompatible types in comparison
 expression (different base types):
Message-ID: <202512132156.6jTMbPEC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20251212
head:   c3cc47915438797b3342f426772472b7c3dee6df
commit: c3cc47915438797b3342f426772472b7c3dee6df [21/21] treewide_some: fix multiple -Wfamnae warnings that must be audited separately
config: s390-randconfig-r112-20251213 (https://download.01.org/0day-ci/archive/20251213/202512132156.6jTMbPEC-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512132156.6jTMbPEC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512132156.6jTMbPEC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/bpf/core.c:250:49: sparse: sparse: arithmetics on pointers to functions
   kernel/bpf/core.c:2037:43: sparse: sparse: arithmetics on pointers to functions
   kernel/bpf/core.c:2042:48: sparse: sparse: arithmetics on pointers to functions
   kernel/bpf/core.c:2363:77: sparse: sparse: subtraction of functions? Share your drugs
>> kernel/bpf/core.c:2624:29: sparse: sparse: incompatible types in comparison expression (different base types):
   kernel/bpf/core.c:2624:29: sparse:    struct bpf_prog_array *
   kernel/bpf/core.c:2624:29: sparse:    struct bpf_prog_array_hdr *
   kernel/bpf/core.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/xdp.h, ...):
   include/trace/events/xdp.h:304:1: sparse: sparse: Using plain integer as NULL pointer
   include/trace/events/xdp.h:331:1: sparse: sparse: Using plain integer as NULL pointer
   kernel/bpf/core.c: note: in included file (through include/linux/rbtree_latch.h, include/linux/bpf.h, include/linux/filter.h):
   include/linux/rbtree.h:102:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/rbtree.h:102:9: sparse:    struct rb_node [noderef] __rcu *
   include/linux/rbtree.h:102:9: sparse:    struct rb_node *
   include/linux/rbtree.h:102:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/rbtree.h:102:9: sparse:    struct rb_node [noderef] __rcu *
   include/linux/rbtree.h:102:9: sparse:    struct rb_node *

vim +2624 kernel/bpf/core.c

8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2621  
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2622  void bpf_prog_array_free_sleepable(struct bpf_prog_array *progs)
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2623  {
8c7dcb84e3b744 Delyan Kratunov 2022-06-14 @2624  	if (!progs || progs == &bpf_empty_prog_array.hdr)
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2625  		return;
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2626  	call_rcu_tasks_trace(&progs->rcu, __bpf_prog_array_free_sleepable_cb);
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2627  }
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2628  

:::::: The code at line 2624 was first introduced by commit
:::::: 8c7dcb84e3b744b2b70baa7a44a9b1881c33a9c9 bpf: implement sleepable uprobes by chaining gps

:::::: TO: Delyan Kratunov <delyank@fb.com>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
