Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3E835C1BA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 10:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768301340; cv=none; b=qY2MUHTvaQ3bSTv6ZQoA0m8amy9zXd4ZbLX5Or0FhrEZeaGzfOBjyN6O6ESsUOm/M/1406cZY6b7v8WHFbHQZWVRj4SQgnwSsgeYs68afilMHnejWc48wr4qO2Q7mdr7p0UE/vK2mXYloZu4t0AIirhy8a3OBa9yTn/mLCWxhwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768301340; c=relaxed/simple;
	bh=yWMhG4M/vbDjWJb9krezkgxjD6EDfhain6GOBBAJ9S0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QVYdtUb6a/ONU8xvDzKDGhEjEGVT6qL2pgkX5o5E+5w6HigzEpBvDYMNJy1Hj5dBu8xs4Uz5RJmgdTlVu/iA2HIuZkwF6GRjNOMt+EUG7LC7BXTivzbDK7ESQOt5J9Owm2rdHQiutxl7lyilgpSGRdeG2bgwrn5pv/NY1f55ES8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KZxKDLOS; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KZxKDLOS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768301339; x=1799837339;
  h=date:from:to:cc:subject:message-id;
  bh=yWMhG4M/vbDjWJb9krezkgxjD6EDfhain6GOBBAJ9S0=;
  b=KZxKDLOSv06ODk8MzeNwM7iJ56DMgpRfF3C3bLAN1R4z/dL37y2z3CnJ
   nr2it6EFLVsCWUUg1K/ASrnX+KuEg1XGFaLFkV4IFwS7A1C3gV7BJvuJ7
   WcLWwfNpYSg0i8yzgRjBSaUfvnpUOSBQ1hyVf+rAKMNj8rCNUkzXZCPt+
   6Yaj7ZqPQt5KMtxZ/iCXAGLGjb6YtheuOq+6SOJwwAkVNQxtgTo1Ggs2J
   YYOrX67m55ScMT3ROsfo9ja4LwlfWB+drR0leWuLIYmuJISEqBjPGOFbl
   mG9T4R6jSyjTaJfhiBVvHiRWtMY+VUKeUyQvsBUAwavCZFoNCJseWNOUM
   g==;
X-CSE-ConnectionGUID: TtFFYtUXSTeDbc8UDOsaRg==
X-CSE-MsgGUID: mJUzD+62Q8Wd8+TyorDmZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="92251021"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="92251021"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 02:48:56 -0800
X-CSE-ConnectionGUID: 59FRs9ioQo6z3cfmLUqhfA==
X-CSE-MsgGUID: VkmxooscT62SjYNZvd50LQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Jan 2026 02:48:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfbxE-00000000Ece-3LjO;
	Tue, 13 Jan 2026 10:48:52 +0000
Date: Tue, 13 Jan 2026 18:47:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20260113 15/16]
 kernel/bpf/core.c:2628:29: warning: comparison of distinct pointer types
 lacks a cast
Message-ID: <202601131854.Y2IYQIYV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20260113
head:   52754522a0ac00706210372e66bc73f60fa759d2
commit: 3d33febc0f4b127981e2da9f1443f584b40c4d6b [15/16] treewide_some: fix multiple -Wfamnae warnings that must be audited separately
config: parisc-randconfig-002-20260113 (https://download.01.org/0day-ci/archive/20260113/202601131854.Y2IYQIYV-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131854.Y2IYQIYV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601131854.Y2IYQIYV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/core.c: In function 'bpf_prog_array_free_sleepable':
>> kernel/bpf/core.c:2628:29: warning: comparison of distinct pointer types lacks a cast [-Wcompare-distinct-pointer-types]
    2628 |         if (!progs || progs == &bpf_empty_prog_array.hdr)
         |                             ^~
   kernel/bpf/core.c: In function 'bpf_prog_kallsyms_add':
   kernel/bpf/core.c:590:54: warning: '%s' directive argument is null [-Wformat-truncation=]
     590 |                 snprintf(sym, (size_t)(end - sym), "_%s", func_name);
         |                                                      ^~


vim +2628 kernel/bpf/core.c

8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2625  
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2626  void bpf_prog_array_free_sleepable(struct bpf_prog_array *progs)
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2627  {
8c7dcb84e3b744 Delyan Kratunov 2022-06-14 @2628  	if (!progs || progs == &bpf_empty_prog_array.hdr)
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2629  		return;
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2630  	call_rcu_tasks_trace(&progs->rcu, __bpf_prog_array_free_sleepable_cb);
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2631  }
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2632  

:::::: The code at line 2628 was first introduced by commit
:::::: 8c7dcb84e3b744b2b70baa7a44a9b1881c33a9c9 bpf: implement sleepable uprobes by chaining gps

:::::: TO: Delyan Kratunov <delyank@fb.com>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
