Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5751C1AAA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 17:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755191648; cv=none; b=m1YatpFLO4qSwQp3/JgjFqWPaYWSuSM5hPbYTj3PIfbD/qX+qPRo8D6tRnP/XJtb/FJXzFhMdHPnSKK2yoEU7W+lGp8oQcY636ERG4LQznmZyroHJKvlkjkRby2cSTgpz86QdTrc5XNP3QP4U9zsEriq4QqMZithi0n/tVo8GsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755191648; c=relaxed/simple;
	bh=SoYjDusyJGc83T0HqpBoxfnsUJkJD8QviSk02Vclpqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kBsQ/Y8ZLGWHTgxzu0krufEb+D4aAXokAc/OQ1R7iMM6Ln1BYC2We87IWiVQEZ0+1YFRxWsHt6aTmgvLIdG29cD5hT7Sp4G1fi5rHsqP2rFJUUTdrMLNy0wFxlg8eYz8ho9ezPwnXTqD+mlfQPNtl8IVFjFNE58aLNTJiBYGBHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YJStuJKb; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YJStuJKb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755191647; x=1786727647;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SoYjDusyJGc83T0HqpBoxfnsUJkJD8QviSk02Vclpqk=;
  b=YJStuJKbVzdPYfDdAyWNWZhBjAV+6tWq/9zaO95RsYTxRPIEhBdhhlrU
   /iwZJyi+qsAa8X9TCBirifqeKFFWYZBHWxRmltzpvh6GdEuCZY8zF58Sy
   at9lR+cD70i5J38wj1hLgD8/hTIzPuy8Bxkvnnm1JIS3Soc+ubwQYUZeH
   yGGv+uCUjlb/vEMmMoxv5iENL4tzlqP6YDyi0yMG2ZBEZy+hANX+/B7ef
   R8Rjr+YndQwOK5SlPBU7siRaSQxMv1D//0un8UaY+ruEm34vv1QrY0AVb
   7HQKkSDjMNahBpMsQ2Uu81jAFlqT2mkmVIQX+R+T3F696NH1h1I/sew7c
   Q==;
X-CSE-ConnectionGUID: Xxptw1GnQO6ccIyv2sAGlA==
X-CSE-MsgGUID: eGHqQq1pR5iiLsDO4rStDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="68119887"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="68119887"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 10:14:07 -0700
X-CSE-ConnectionGUID: 5VmJumOtSy+r/tlAGhgOEQ==
X-CSE-MsgGUID: AVwlxgLASjqllTBNOE0L9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="167176947"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 14 Aug 2025 10:14:05 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umbWd-000BC0-1P;
	Thu, 14 Aug 2025 17:14:03 +0000
Date: Fri, 15 Aug 2025 01:13:14 +0800
From: kernel test robot <lkp@intel.com>
To: Xuewen Yan <xuewen.yan@unisoc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] sched: psi: Add psi events trace point
Message-ID: <202508150007.A1SNODpy-lkp@intel.com>
References: <20250814070719.865-1-xuewen.yan@unisoc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814070719.865-1-xuewen.yan@unisoc.com>

Hi Xuewen,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on trace/for-next]
[also build test ERROR on linus/master v6.17-rc1 next-20250814]
[cannot apply to tip/sched/core peterz-queue/sched/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xuewen-Yan/sched-psi-Add-psi-events-trace-point/20250814-151309
base:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace for-next
patch link:    https://lore.kernel.org/r/20250814070719.865-1-xuewen.yan%40unisoc.com
patch subject: [RFC PATCH] sched: psi: Add psi events trace point
config: x86_64-buildonly-randconfig-003-20250814 (https://download.01.org/0day-ci/archive/20250815/202508150007.A1SNODpy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508150007.A1SNODpy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508150007.A1SNODpy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/sched.h:74,
                    from kernel/sched/build_utility.c:52:
>> include/trace/events/sched.h:899:22: error: expected ';' before 'extern'
     899 | struct psi_trigger *t
         |                      ^
         |                      ;
--
   In file included from kernel/sched/core.c:85:
>> include/trace/events/sched.h:899:22: error: expected ';' before 'extern'
     899 | struct psi_trigger *t
         |                      ^
         |                      ;
   In file included from include/trace/define_trace.h:118,
                    from include/trace/events/sched.h:907:
>> include/trace/events/sched.h:899:22: error: expected ';' before 'static'
     899 | struct psi_trigger *t
         |                      ^
         |                      ;


vim +899 include/trace/events/sched.h

   828	
   829	/*
   830	 * Following tracepoints are not exported in tracefs and provide hooking
   831	 * mechanisms only for testing and debugging purposes.
   832	 */
   833	DECLARE_TRACE(pelt_cfs,
   834		TP_PROTO(struct cfs_rq *cfs_rq),
   835		TP_ARGS(cfs_rq));
   836	
   837	DECLARE_TRACE(pelt_rt,
   838		TP_PROTO(struct rq *rq),
   839		TP_ARGS(rq));
   840	
   841	DECLARE_TRACE(pelt_dl,
   842		TP_PROTO(struct rq *rq),
   843		TP_ARGS(rq));
   844	
   845	DECLARE_TRACE(pelt_hw,
   846		TP_PROTO(struct rq *rq),
   847		TP_ARGS(rq));
   848	
   849	DECLARE_TRACE(pelt_irq,
   850		TP_PROTO(struct rq *rq),
   851		TP_ARGS(rq));
   852	
   853	DECLARE_TRACE(pelt_se,
   854		TP_PROTO(struct sched_entity *se),
   855		TP_ARGS(se));
   856	
   857	DECLARE_TRACE(sched_cpu_capacity,
   858		TP_PROTO(struct rq *rq),
   859		TP_ARGS(rq));
   860	
   861	DECLARE_TRACE(sched_overutilized,
   862		TP_PROTO(struct root_domain *rd, bool overutilized),
   863		TP_ARGS(rd, overutilized));
   864	
   865	DECLARE_TRACE(sched_util_est_cfs,
   866		TP_PROTO(struct cfs_rq *cfs_rq),
   867		TP_ARGS(cfs_rq));
   868	
   869	DECLARE_TRACE(sched_util_est_se,
   870		TP_PROTO(struct sched_entity *se),
   871		TP_ARGS(se));
   872	
   873	DECLARE_TRACE(sched_update_nr_running,
   874		TP_PROTO(struct rq *rq, int change),
   875		TP_ARGS(rq, change));
   876	
   877	DECLARE_TRACE(sched_compute_energy,
   878		TP_PROTO(struct task_struct *p, int dst_cpu, unsigned long energy,
   879			 unsigned long max_util, unsigned long busy_time),
   880		TP_ARGS(p, dst_cpu, energy, max_util, busy_time));
   881	
   882	DECLARE_TRACE(sched_entry,
   883		TP_PROTO(bool preempt),
   884		TP_ARGS(preempt));
   885	
   886	DECLARE_TRACE(sched_exit,
   887		TP_PROTO(bool is_switch),
   888		TP_ARGS(is_switch));
   889	
   890	DECLARE_TRACE_CONDITION(sched_set_state,
   891		TP_PROTO(struct task_struct *tsk, int state),
   892		TP_ARGS(tsk, state),
   893		TP_CONDITION(!!(tsk->__state) != !!state));
   894	
   895	DECLARE_TRACE(sched_set_need_resched,
   896		TP_PROTO(struct task_struct *tsk, int cpu, int tif),
   897		TP_ARGS(tsk, cpu, tif));
   898	
 > 899	struct psi_trigger *t
   900	DECLARE_TRACE(psi_event,
   901		TP_PROTO(struct psi_trigger *t),
   902		TP_ARGS(t));
   903	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
