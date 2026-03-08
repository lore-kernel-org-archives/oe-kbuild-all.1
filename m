Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101962F8BD3
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Mar 2026 11:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772969974; cv=none; b=jjP7PQ5f5zYFl97ClYWJc1YuMMI+5Wf9T30w9ntK0ADQ/fFsP2EkXXF7n5NGzlNyCB5v4avlejtOA+OBKeDkNuZkHgL7ln2QbDuiapVGxzEdFteg4v91NEzcNsg6H6YVTuz2C/kuZMOXTZlQ5/R3Li3FiqJzBR2Fpz7q7Pz1Ycg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772969974; c=relaxed/simple;
	bh=M9EYJ4h4KBRuUgSZtoZlfpgXZLJJGF5D+6HUWrg11S8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=P741zX4k/FCu6ARpvRUCD1ZJ1YZFtZ9wBSyp4BNQGALbbZ9XaEbeZQUXuHQyOqBhN8bk2RynlETLM4aQzGgU36V3qW9H6GpvfGINuo9XBBIk5oHKunwqL/DojXEr5ycUv9Db7I++sC1/8Ximjzf+ZvcjgNZfKmwmDIfJ2DMPzPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PkpyPKTw; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PkpyPKTw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772969973; x=1804505973;
  h=date:from:to:cc:subject:message-id;
  bh=M9EYJ4h4KBRuUgSZtoZlfpgXZLJJGF5D+6HUWrg11S8=;
  b=PkpyPKTw04OmJu7XwhLhGmACpH1RoqLNRLpKZOiak2bUp3TqXY9x6lXI
   Nwmk48JOCmzEcS7auKd2JWgZYBKL3atE8HCRkmaT7j4hG6tE/wwevNSQm
   jAOs0YbXvsRiEpKlo3/M0NrjXECvWCgsXfdc6WGF2ipYOO9sXxTlWWp4a
   np//eBwXybtC12MSHnys7Vy2B2izoEjEGUIeT9Lf0Ibp8Zykfzx8KC0rp
   BrrFUBr1adsBFfN8V19gfCy6ghtm6XKibTb25pEwy+J2fQNbN54QvQJwp
   ACH/nfY+KWEmRvTDqpDO5C9kuDVGhiSYasEW4yHrGdYV567PciITSZCl3
   g==;
X-CSE-ConnectionGUID: fXC66XnVRda6To2F12Mpew==
X-CSE-MsgGUID: tRoW3nw8Rd+sft/8HyMfNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="84339779"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="84339779"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 04:39:31 -0700
X-CSE-ConnectionGUID: a+2uYiPIRMCbcLgoVMHfnQ==
X-CSE-MsgGUID: gW6gKuKhQ8uuiuYDef2eJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="219424954"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 Mar 2026 04:39:28 -0700
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzCTm-0000000034q-0d8y;
	Sun, 08 Mar 2026 11:39:26 +0000
Date: Sun, 08 Mar 2026 19:38:27 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 3465/4591] kernel/sched/ext.c:1030:27:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202603081915.OvMYwcpc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Tejun,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
commit: 0e953de88b928e128ba7ab988739d576e56a9315 [3465/4591] Merge branch 'for-7.0-fixes' into for-7.1
config: parisc-randconfig-r122-20260307 (https://download.01.org/0day-ci/archive/20260308/202603081915.OvMYwcpc-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260308/202603081915.OvMYwcpc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603081915.OvMYwcpc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/rt.c:976:39: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:976:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1493:31: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1493:31: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1493:31: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1815:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/rt.c:1815:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/rt.c:1815:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/rt.c:1512:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/rt.c:1512:14: sparse:     expected struct task_struct *curr
   kernel/sched/rt.c:1512:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:1513:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/rt.c:1513:15: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:1513:15: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:1574:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1574:45: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1574:45: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1616:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1616:39: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:1616:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1641:64: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1641:64: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:1641:64: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1982:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1982:40: sparse:     expected struct task_struct *task
   kernel/sched/rt.c:1982:40: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2005:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:2005:13: sparse:    struct task_struct *
   kernel/sched/rt.c:2005:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:2356:54: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2356:54: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:2356:54: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2358:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:2358:40: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2358:40: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:2358:62: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:2358:62: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2358:62: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:2922:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2922:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2922:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2932:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2932:13: sparse:    struct task_struct *
   kernel/sched/deadline.c:2932:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:3038:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:3038:25: sparse:    struct task_struct *
   kernel/sched/deadline.c:3038:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2539:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2539:42: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2539:42: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:2549:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2549:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2549:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1198:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1198:39: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1198:39: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1198:85: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1198:85: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1198:85: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1296:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1296:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1296:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:1815:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1815:31: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1815:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1815:70: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1815:70: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1815:70: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1941:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1941:39: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:1941:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2758:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/deadline.c:2758:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/deadline.c:2758:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/deadline.c:2419:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2419:14: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:2419:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2420:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2420:15: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:2420:15: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2494:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2494:43: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2494:43: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:3083:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:3083:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:3083:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:3085:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:3085:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:3085:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:3087:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:3087:44: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:3087:44: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:3340:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:3340:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:3340:23: sparse:    struct task_struct *
   kernel/sched/deadline.c:3393:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext.c:2377:41: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:950:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
>> kernel/sched/ext.c:1030:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:1040:48: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:1040:48: sparse:    struct task_struct *
   kernel/sched/ext.c:1040:48: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:1199:66: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:1199:66: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:1199:66: sparse:    struct task_struct *
   kernel/sched/ext.c:1402:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:1402:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:1402:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:1532:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:1532:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:1532:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:1583:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:1583:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:1583:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:1654:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:1654:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:1654:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:1698:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:1698:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:1698:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:1699:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext.c:1699:35: sparse:     expected struct task_struct *p
   kernel/sched/ext.c:1699:35: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/ext.c:1709:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:1709:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:1709:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:1710:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *from @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext.c:1710:38: sparse:     expected struct task_struct *from
   kernel/sched/ext.c:1710:38: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/ext.c:2242:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:2242:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2242:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:2391:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:2391:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2391:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:2447:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:2447:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2447:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:2488:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:2488:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2488:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:2542:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:2542:38: sparse:     expected struct task_struct *prev
   kernel/sched/ext.c:2542:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:2677:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2677:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2677:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2738:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2738:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2738:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2760:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2760:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2760:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2882:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2882:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2882:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2961:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2961:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2961:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3014:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3014:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3014:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3049:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3049:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3049:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3069:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3069:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3069:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3234:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3234:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3234:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3253:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3253:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3253:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3328:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3328:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3328:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3357:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3357:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3357:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3370:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3370:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3370:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3419:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3419:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3419:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3438:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3438:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3438:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3456:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3456:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3456:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3472:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3472:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3472:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3489:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3489:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3489:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:4372:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_kick_syncs **ksyncs @@     got struct scx_kick_syncs [noderef] __rcu ** @@

vim +1030 kernel/sched/ext.c

ebf1ccff79c43f Andrea Righi 2026-02-18  1023  
530b6637c79e72 Tejun Heo    2025-12-11  1024  static void local_dsq_post_enq(struct scx_dispatch_q *dsq, struct task_struct *p,
530b6637c79e72 Tejun Heo    2025-12-11  1025  			       u64 enq_flags)
530b6637c79e72 Tejun Heo    2025-12-11  1026  {
530b6637c79e72 Tejun Heo    2025-12-11  1027  	struct rq *rq = container_of(dsq, struct rq, scx.local_dsq);
530b6637c79e72 Tejun Heo    2025-12-11  1028  	bool preempt = false;
530b6637c79e72 Tejun Heo    2025-12-11  1029  
ebf1ccff79c43f Andrea Righi 2026-02-18 @1030  	call_task_dequeue(scx_root, rq, p, 0);
ebf1ccff79c43f Andrea Righi 2026-02-18  1031  
f5e1e5ec204da1 Tejun Heo    2025-12-11  1032  	/*
f5e1e5ec204da1 Tejun Heo    2025-12-11  1033  	 * If @rq is in balance, the CPU is already vacant and looking for the
f5e1e5ec204da1 Tejun Heo    2025-12-11  1034  	 * next task to run. No need to preempt or trigger resched after moving
f5e1e5ec204da1 Tejun Heo    2025-12-11  1035  	 * @p into its local DSQ.
f5e1e5ec204da1 Tejun Heo    2025-12-11  1036  	 */
f5e1e5ec204da1 Tejun Heo    2025-12-11  1037  	if (rq->scx.flags & SCX_RQ_IN_BALANCE)
f5e1e5ec204da1 Tejun Heo    2025-12-11  1038  		return;
f5e1e5ec204da1 Tejun Heo    2025-12-11  1039  
530b6637c79e72 Tejun Heo    2025-12-11  1040  	if ((enq_flags & SCX_ENQ_PREEMPT) && p != rq->curr &&
530b6637c79e72 Tejun Heo    2025-12-11  1041  	    rq->curr->sched_class == &ext_sched_class) {
530b6637c79e72 Tejun Heo    2025-12-11  1042  		rq->curr->scx.slice = 0;
530b6637c79e72 Tejun Heo    2025-12-11  1043  		preempt = true;
530b6637c79e72 Tejun Heo    2025-12-11  1044  	}
530b6637c79e72 Tejun Heo    2025-12-11  1045  
530b6637c79e72 Tejun Heo    2025-12-11  1046  	if (preempt || sched_class_above(&ext_sched_class, rq->curr->sched_class))
530b6637c79e72 Tejun Heo    2025-12-11  1047  		resched_curr(rq);
530b6637c79e72 Tejun Heo    2025-12-11  1048  }
530b6637c79e72 Tejun Heo    2025-12-11  1049  

:::::: The code at line 1030 was first introduced by commit
:::::: ebf1ccff79c43f860cbd2f9d6cfab9a462d0cb2d sched_ext: Fix ops.dequeue() semantics

:::::: TO: Andrea Righi <arighi@nvidia.com>
:::::: CC: Tejun Heo <tj@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
