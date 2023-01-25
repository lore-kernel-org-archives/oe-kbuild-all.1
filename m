Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D211102
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Jan 2023 06:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674627888; x=1706163888;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eZrBv8MY5Sh8ZiAs2iNLtKIR/Et7dZ9XRYSI2Itlpu8=;
  b=PqZCJJT/GNrim+BfZkNoDtXXMb/RPNkhSef8T1DWINydQHvBjs04L56Q
   BBwMfrl68DVutDk5wnYvhzIIJ4iGZdcPpCUYdlFm3nDWWhV1aM1K9SImL
   hgGX5GAZE4MC7lteQehSC/kw9laPXO5JSA2mUCPk+r5BRUCUtVutWDXzu
   nFZsQ8Y2jilVXsywJbR/z94lPUAe5Lp4Ar6z5oXRXLYsY6tIaHgH892si
   vz8cOXGakzf7pumjGVriooDr8NJNaiMJRfLVApqYJFLJWxcBReNNoHZyn
   95fEnCTP8XCo8GPkRorpmmUkiH5v1MrmjhIkYlogcc8BWnb+ZVFgN53rU
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="306155829"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; 
   d="scan'208";a="306155829"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 22:24:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="655704494"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; 
   d="scan'208";a="655704494"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 24 Jan 2023 22:24:46 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKZDB-00076e-0H;
	Wed, 25 Jan 2023 06:24:45 +0000
Date: Wed, 25 Jan 2023 14:23:56 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/android-4.14-stable
 642/9999] kernel/bpf/core.c:1532:34: sparse: sparse: incorrect type in
 initializer (different address spaces)
Message-ID: <202301251455.2ZoHaqyn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android-4.14-stable
head:   2021317cc8a9d505844f4fb12e28bbcd9a554e0d
commit: 5179a6a673e1bff5b9823b1317c59127bacd4641 [642/9999] UPSTREAM: bpf: permit multiple bpf attachments for a single perf event
config: i386-randconfig-s002-20230123 (https://download.01.org/0day-ci/archive/20230125/202301251455.2ZoHaqyn-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/ammarfaizi2/linux-block/commit/5179a6a673e1bff5b9823b1317c59127bacd4641
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android-4.14-stable
        git checkout 5179a6a673e1bff5b9823b1317c59127bacd4641
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash kernel/bpf/ kernel/trace/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

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
https://github.com/intel/lkp-tests
