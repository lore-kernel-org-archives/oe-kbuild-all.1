Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C479BE7C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 14:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692800133; x=1724336133;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lEin9DNR/4qvu5yb3lClxAh8EX1vLZ0tUMaIt4enRYc=;
  b=hCbTZiwSe5kSI/QzbNKWaBKgMiXTnwtitunYqiXBHPmSXxtNp2q4ZeQ1
   Gtxhl+miL8ea7eTlddTKV5BnApwlJ04je6Cnt+ENsBOE4+o10SIlhUkZ/
   /hGmBdr3ShI3zml5hrpXdSQDBu5SKx9ssybG5ayLIHftsu6VWS951C57V
   tUPAyg6RbC6m0EkxIupN99V6a6+KR3nv6sTkl7/6Fc3UB6UCFwbZijzSk
   +2qtA8qey6CbssOr5VJPz9fqMsUVaAyxPrwDgqWKpuW3svIhUAAk93YKn
   8LjK4jVc65NTYe5ZldOJ9AT6POrzHPWfShf5qdud/57qOby2jjuaxZOe9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="374144771"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="374144771"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 07:15:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="771740330"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="771740330"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 23 Aug 2023 07:15:30 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYodu-0001Gc-0Y;
	Wed, 23 Aug 2023 14:15:30 +0000
Date: Wed, 23 Aug 2023 22:14:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.14-stable 16585/29969]
 kernel/bpf/core.c:1532:34: sparse: sparse: incorrect type in initializer
 (different address spaces)
Message-ID: <202308232258.5RZ3pM1I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-4.14-stable
head:   cff28212d5b301e97ca5cfcd6fe1beb83ec93940
commit: 5179a6a673e1bff5b9823b1317c59127bacd4641 [16585/29969] UPSTREAM: bpf: permit multiple bpf attachments for a single perf event
config: i386-randconfig-r112-20230823 (https://download.01.org/0day-ci/archive/20230823/202308232258.5RZ3pM1I-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308232258.5RZ3pM1I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308232258.5RZ3pM1I-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/bpf/core.c:1095:43: sparse: sparse: arithmetics on pointers to functions
   kernel/bpf/core.c:1514:31: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct bpf_prog_array [noderef] <asn:4> * @@     got void * @@
   kernel/bpf/core.c:1514:31: sparse:     expected struct bpf_prog_array [noderef] <asn:4> *
   kernel/bpf/core.c:1514:31: sparse:     got void *
   kernel/bpf/core.c:1518:17: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct bpf_prog_array [noderef] <asn:4> * @@     got struct bpf_prog_array * @@
   kernel/bpf/core.c:1518:17: sparse:     expected struct bpf_prog_array [noderef] <asn:4> *
   kernel/bpf/core.c:1518:17: sparse:     got struct bpf_prog_array *
   kernel/bpf/core.c:1526:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct callback_head *head @@     got struct callback_head [noderef] <asn:4> * @@
   kernel/bpf/core.c:1526:9: sparse:     expected struct callback_head *head
   kernel/bpf/core.c:1526:9: sparse:     got struct callback_head [noderef] <asn:4> *
>> kernel/bpf/core.c:1532:34: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct bpf_prog **prog @@     got struct bpf_prog *[noderef] <asn:4> * @@
   kernel/bpf/core.c:1532:34: sparse:     expected struct bpf_prog **prog
   kernel/bpf/core.c:1532:34: sparse:     got struct bpf_prog *[noderef] <asn:4> *
>> kernel/bpf/core.c:1555:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct bpf_prog **existing_prog @@     got struct bpf_prog *[noderef] <asn:4> * @@
   kernel/bpf/core.c:1555:31: sparse:     expected struct bpf_prog **existing_prog
   kernel/bpf/core.c:1555:31: sparse:     got struct bpf_prog *[noderef] <asn:4> *
>> kernel/bpf/core.c:1577:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct bpf_prog_array *array @@     got struct bpf_prog_array [noderef] <asn:4> * @@
   kernel/bpf/core.c:1577:15: sparse:     expected struct bpf_prog_array *array
   kernel/bpf/core.c:1577:15: sparse:     got struct bpf_prog_array [noderef] <asn:4> *
>> kernel/bpf/core.c:1583:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct bpf_prog **[assigned] existing_prog @@     got struct bpf_prog *[noderef] <asn:4> * @@
   kernel/bpf/core.c:1583:31: sparse:     expected struct bpf_prog **[assigned] existing_prog
   kernel/bpf/core.c:1583:31: sparse:     got struct bpf_prog *[noderef] <asn:4> *
   kernel/bpf/core.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/bpf.h, ...):
   include/trace/events/bpf.h:56:1: sparse: sparse: Using plain integer as NULL pointer
   include/trace/events/bpf.h:92:1: sparse: sparse: Using plain integer as NULL pointer
   include/trace/events/bpf.h:117:1: sparse: sparse: Using plain integer as NULL pointer
   include/trace/events/bpf.h:188:1: sparse: sparse: Using plain integer as NULL pointer
   include/trace/events/bpf.h:228:1: sparse: sparse: Using plain integer as NULL pointer
   include/trace/events/bpf.h:282:1: sparse: sparse: Using plain integer as NULL pointer
   include/trace/events/bpf.h:312:1: sparse: sparse: Using plain integer as NULL pointer
   kernel/bpf/core.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/xdp.h, ...):
   include/trace/events/xdp.h:28:1: sparse: sparse: Using plain integer as NULL pointer
   include/trace/events/xdp.h:53:1: sparse: sparse: Using plain integer as NULL pointer
   include/trace/events/xdp.h:111:1: sparse: sparse: Using plain integer as NULL pointer
   include/trace/events/xdp.h:126:1: sparse: sparse: Using plain integer as NULL pointer
--
   kernel/trace/bpf_trace.c:41:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected int [noderef] <asn:3> *__p @@     got int * @@
   kernel/trace/bpf_trace.c:41:13: sparse:     expected int [noderef] <asn:3> *__p
   kernel/trace/bpf_trace.c:41:13: sparse:     got int *
>> kernel/trace/bpf_trace.c:705:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct bpf_prog_array [noderef] <asn:4> *old_array @@     got struct bpf_prog_array * @@
   kernel/trace/bpf_trace.c:705:19: sparse:     expected struct bpf_prog_array [noderef] <asn:4> *old_array
   kernel/trace/bpf_trace.c:705:19: sparse:     got struct bpf_prog_array *
   kernel/trace/bpf_trace.c:732:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct bpf_prog_array [noderef] <asn:4> *old_array @@     got struct bpf_prog_array * @@
   kernel/trace/bpf_trace.c:732:19: sparse:     expected struct bpf_prog_array [noderef] <asn:4> *old_array
   kernel/trace/bpf_trace.c:732:19: sparse:     got struct bpf_prog_array *
   kernel/trace/bpf_trace.c:41:13: sparse: sparse: dereference of noderef expression
   kernel/trace/bpf_trace.c:41:13: sparse: sparse: dereference of noderef expression
   kernel/trace/bpf_trace.c:114:14: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] <asn:1> * @@     got void *unsafe_ptr @@
   kernel/trace/bpf_trace.c:114:14: sparse:     expected void const volatile [noderef] <asn:1> *
   kernel/trace/bpf_trace.c:114:14: sparse:     got void *unsafe_ptr

vim +1532 kernel/bpf/core.c

  1510	
  1511	struct bpf_prog_array __rcu *bpf_prog_array_alloc(u32 prog_cnt, gfp_t flags)
  1512	{
  1513		if (prog_cnt)
> 1514			return kzalloc(sizeof(struct bpf_prog_array) +
  1515				       sizeof(struct bpf_prog *) * (prog_cnt + 1),
  1516				       flags);
  1517	
> 1518		return &empty_prog_array.hdr;
  1519	}
  1520	
  1521	void bpf_prog_array_free(struct bpf_prog_array __rcu *progs)
  1522	{
  1523		if (!progs ||
  1524		    progs == (struct bpf_prog_array __rcu *)&empty_prog_array.hdr)
  1525			return;
> 1526		kfree_rcu(progs, rcu);
  1527	}
  1528	
  1529	void bpf_prog_array_delete_safe(struct bpf_prog_array __rcu *progs,
  1530					struct bpf_prog *old_prog)
  1531	{
> 1532		struct bpf_prog **prog = progs->progs;
  1533	
  1534		for (; *prog; prog++)
  1535			if (*prog == old_prog) {
  1536				WRITE_ONCE(*prog, &dummy_bpf_prog.prog);
  1537				break;
  1538			}
  1539	}
  1540	
  1541	int bpf_prog_array_copy(struct bpf_prog_array __rcu *old_array,
  1542				struct bpf_prog *exclude_prog,
  1543				struct bpf_prog *include_prog,
  1544				struct bpf_prog_array **new_array)
  1545	{
  1546		int new_prog_cnt, carry_prog_cnt = 0;
  1547		struct bpf_prog **existing_prog;
  1548		struct bpf_prog_array *array;
  1549		int new_prog_idx = 0;
  1550	
  1551		/* Figure out how many existing progs we need to carry over to
  1552		 * the new array.
  1553		 */
  1554		if (old_array) {
> 1555			existing_prog = old_array->progs;
  1556			for (; *existing_prog; existing_prog++) {
  1557				if (*existing_prog != exclude_prog &&
  1558				    *existing_prog != &dummy_bpf_prog.prog)
  1559					carry_prog_cnt++;
  1560				if (*existing_prog == include_prog)
  1561					return -EEXIST;
  1562			}
  1563		}
  1564	
  1565		/* How many progs (not NULL) will be in the new array? */
  1566		new_prog_cnt = carry_prog_cnt;
  1567		if (include_prog)
  1568			new_prog_cnt += 1;
  1569	
  1570		/* Do we have any prog (not NULL) in the new array? */
  1571		if (!new_prog_cnt) {
  1572			*new_array = NULL;
  1573			return 0;
  1574		}
  1575	
  1576		/* +1 as the end of prog_array is marked with NULL */
> 1577		array = bpf_prog_array_alloc(new_prog_cnt + 1, GFP_KERNEL);
  1578		if (!array)
  1579			return -ENOMEM;
  1580	
  1581		/* Fill in the new prog array */
  1582		if (carry_prog_cnt) {
> 1583			existing_prog = old_array->progs;
  1584			for (; *existing_prog; existing_prog++)
  1585				if (*existing_prog != exclude_prog &&
  1586				    *existing_prog != &dummy_bpf_prog.prog)
  1587					array->progs[new_prog_idx++] = *existing_prog;
  1588		}
  1589		if (include_prog)
  1590			array->progs[new_prog_idx++] = include_prog;
  1591		array->progs[new_prog_idx] = NULL;
  1592		*new_array = array;
  1593		return 0;
  1594	}
  1595	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
