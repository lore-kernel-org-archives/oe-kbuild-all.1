Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E61131ED93
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 01:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778722745; cv=none; b=bto3hgWRBKG8BvRUBLUKznjFsuEEgjyGbkjur63qQBSb9CfDE4nYC6rrOpC7quVf4xbN7O7lcA1yzhkMkV5pOwkNw3ydpUva+mzVqrg6EL+uZ/nFR8D8Tb+JDsB2xTn1gZ9lyXQaomB7aKy+9dF978/y1rZ1rEtGhCsZAXo35Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778722745; c=relaxed/simple;
	bh=fjen7rZh5/DFPq2WrAOC+LIiajsn6srg5HkdeSJKpLw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gG0hvaOz7Da/lYFNozZ6WLJnHQdryW19dbFA0X+n+3QANjpbFhxVz6yXPYZYkOUyM6oVtlcVOAHs3YfcJIR7/skJam3folJ4h74WmkzcGpwN4NhTVWi4nhC6PkIv+3lQgK3DnT63mjijB89wsKm2pCvGrhx/0y5CTzIQJqwoXFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CIugXkDl; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CIugXkDl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778722743; x=1810258743;
  h=date:from:to:cc:subject:message-id;
  bh=fjen7rZh5/DFPq2WrAOC+LIiajsn6srg5HkdeSJKpLw=;
  b=CIugXkDlsvzXJ3UFXiXsViEfTVV1veiyLZpbmuGQcqe6LjraWO34DWf8
   XJ4/S+rSKbtJnlisgCCkeyqyVEtTyY8cgBWz6gM7ROyhu005JdGdQV2BI
   WPNEC2l6Kovck4tmi5WLj5W8cmHGZb01N/jhnDEqzZAtfnFWBZJVY/T2q
   3Ry50I4JvtZRiC9qR/GE6gyVLqH9s7vKEFPpmRkGMALmyo26Sg83VXmNH
   tKDDXcDWVO12kvJ0FiDdwWqDZIY/f5hD6luZ0gQQpboy6/woaq+7mh7tt
   DppoiNVLFzv6oFsKAouGgH/FkaKpJlMbE0LGqCznd3Qwn5Nbap1KV4ICe
   g==;
X-CSE-ConnectionGUID: zZactIlbQNOqqcvwAsTu2g==
X-CSE-MsgGUID: 6hQFDB2lTkObpJVQJD9eNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79519179"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="79519179"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 18:39:03 -0700
X-CSE-ConnectionGUID: 30m9zS/tRey3ZrIeYiMxKw==
X-CSE-MsgGUID: JN4KY9UkQOmjJgSfQAhfAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="243228400"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 May 2026 18:39:01 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNL2Q-000000005Xx-21zN;
	Thu, 14 May 2026 01:38:58 +0000
Date: Thu, 14 May 2026 09:38:05 +0800
From: kernel test robot <lkp@intel.com>
To: Amery Hung <amery.hung@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Martin KaFai Lau <martin.lau@kernel.org>
Subject: net/sched/bpf_qdisc.c:224:18: sparse: sparse: symbol
 'bpf_qdisc_init_prologue' was not declared. Should it be static?
Message-ID: <202605140924.F1UhDGzd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e1914add2799225a87502051415fc5c32aeb02ae
commit: 7a2dafda950b78611dc441c83d105dfdc7082681 bpf: net_sched: Add a qdisc watchdog timer
date:   1 year, 1 month ago
config: arc-randconfig-r122-20260513 (https://download.01.org/0day-ci/archive/20260514/202605140924.F1UhDGzd-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605140924.F1UhDGzd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7a2dafda950b ("bpf: net_sched: Add a qdisc watchdog timer")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605140924.F1UhDGzd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/sched/bpf_qdisc.c:224:18: sparse: sparse: symbol 'bpf_qdisc_init_prologue' was not declared. Should it be static?
>> net/sched/bpf_qdisc.c:234:18: sparse: sparse: symbol 'bpf_qdisc_reset_destroy_epilogue' was not declared. Should it be static?

vim +/bpf_qdisc_init_prologue +224 net/sched/bpf_qdisc.c

   222	
   223	/* bpf_qdisc_init_prologue - Hidden kfunc called in prologue of .init. */
 > 224	__bpf_kfunc void bpf_qdisc_init_prologue(struct Qdisc *sch)
   225	{
   226		struct bpf_sched_data *q = qdisc_priv(sch);
   227	
   228		qdisc_watchdog_init(&q->watchdog, sch);
   229	}
   230	
   231	/* bpf_qdisc_reset_destroy_epilogue - Hidden kfunc called in epilogue of .reset
   232	 * and .destroy
   233	 */
 > 234	__bpf_kfunc void bpf_qdisc_reset_destroy_epilogue(struct Qdisc *sch)
   235	{
   236		struct bpf_sched_data *q = qdisc_priv(sch);
   237	
   238		qdisc_watchdog_cancel(&q->watchdog);
   239	}
   240	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
