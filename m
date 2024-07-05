Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0310745038
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jul 2024 20:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720212248; cv=none; b=kowHv2jFA2bFOLd2pXwecYmG4IoQcdYVMe5pSpSUYGGEknVGODiUV1g4nKf68EluHLBqH/u+QscmI/5xlChbhFxQead/EWKZaYnQ2H0jsFLeoViAdsobzjXpINYEclcVQwMEBtMv/ZWG9RvvgJtHrPSgOojTne/iazMGV5zLQWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720212248; c=relaxed/simple;
	bh=1gpjZkT2oK/a7mEOfJO2WW2rt4oeuAr1ieZrktm7tPM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JZr13lvte+58vxONiyg3ldWAuKiPgG0e/F3J50r+VDulioudU/knGaTzLtmxjLxtH1jXOcTBIzZlK0Ld3tITeGogysfGK2nKt+Ct2szXZQQDQkiGEm/sVsy6qA2LhE8bD3FaoRI8iT0CwkaEjakOlDos1Nhpnkz96TPui8OujeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Flhhr3WE; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Flhhr3WE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720212246; x=1751748246;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1gpjZkT2oK/a7mEOfJO2WW2rt4oeuAr1ieZrktm7tPM=;
  b=Flhhr3WEBKNjZDhJHXavJsYyoGJOP5BnyQjOHUiufFv+sK8mg1vByVQB
   lUUnDes+yjGuOdXOmyonPQ9xFohCDsoEauxIZuMw//JHHH8vtg39zESSC
   Zi0SPuUGTUFjfd5t8XtWwT0KgSqRjTOhhdNpgy79hdICO/ClV9ZT7tDg4
   +Nav0MqIeP/GdRwDzE2fczg2BEaDLr1iemBDFt593qdK5kUlgVS2zPCjO
   snU7cEB0GOXMoIlJ45Ash/1y50agAvN6ViJzu9MJ1lvhak8QOiOafj+6N
   YBnZWJTggR70qKSjsvKNca5byA1T2ZZ3N1RkC70ueFXwmMJ6OGx0LD/6F
   Q==;
X-CSE-ConnectionGUID: KMyH/3TaQlelk7IAl061eA==
X-CSE-MsgGUID: ZTMqJ13tRX+yssTWwfK8Kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17377462"
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; 
   d="scan'208";a="17377462"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2024 13:44:05 -0700
X-CSE-ConnectionGUID: nMoX5aqHRjycOd1A/JXbRw==
X-CSE-MsgGUID: S5nIKl64QYi0iPBO1YKgxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; 
   d="scan'208";a="52140110"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Jul 2024 13:44:03 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPpmj-000SqK-0t;
	Fri, 05 Jul 2024 20:44:01 +0000
Date: Sat, 6 Jul 2024 04:43:37 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:perf/uprobes 11/11] kernel/events/uprobes.c:1775:39:
 error: passing argument 2 of 'task_work_cancel' from incompatible pointer
 type
Message-ID: <202407060447.AaD2BYhG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git perf/uprobes
head:   f0a4c81bcedcbd0d96180c9f48119c73b6b0066f
commit: b9867ee7d141bc8791e501495bafdfdb97283196 [11/11] perf/uprobe: Add uretprobe timer
config: i386-buildonly-randconfig-002-20240706 (https://download.01.org/0day-ci/archive/20240706/202407060447.AaD2BYhG-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240706/202407060447.AaD2BYhG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407060447.AaD2BYhG-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/events/uprobes.c: In function 'uprobe_free_utask':
>> kernel/events/uprobes.c:1775:39: error: passing argument 2 of 'task_work_cancel' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1775 |         task_work_cancel(utask->task, &utask->ri_task_work);
         |                                       ^~~~~~~~~~~~~~~~~~~~
         |                                       |
         |                                       struct callback_head *
   In file included from kernel/events/uprobes.c:26:
   include/linux/task_work.h:33:62: note: expected 'task_work_func_t' {aka 'void (*)(struct callback_head *)'} but argument is of type 'struct callback_head *'
      33 | struct callback_head *task_work_cancel(struct task_struct *, task_work_func_t);
         |                                                              ^~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/task_work_cancel +1775 kernel/events/uprobes.c

  1754	
  1755	/*
  1756	 * Called with no locks held.
  1757	 * Called in context of an exiting or an exec-ing thread.
  1758	 */
  1759	void uprobe_free_utask(struct task_struct *t)
  1760	{
  1761		struct uprobe_task *utask = t->utask;
  1762		struct return_instance *ri;
  1763	
  1764		if (!utask)
  1765			return;
  1766	
  1767		if (utask->active_uprobe)
  1768			srcu_read_unlock(&uretprobes_srcu, utask->active_srcu_idx);
  1769	
  1770		ri = utask->return_instances;
  1771		while (ri)
  1772			ri = free_ret_instance(ri);
  1773	
  1774		timer_delete_sync(&utask->ri_timer);
> 1775		task_work_cancel(utask->task, &utask->ri_task_work);
  1776		xol_free_insn_slot(t);
  1777		kfree(utask);
  1778		t->utask = NULL;
  1779	}
  1780	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
