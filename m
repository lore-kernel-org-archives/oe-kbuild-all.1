Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533D91426E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Nov 2023 16:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N98MWSjo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699807300; x=1731343300;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3IGIpNbLei+8SKFvQGWqvBnlm+HLlt7aBuZEQaNOn4s=;
  b=N98MWSjo8qCubtuMEeHOaWfh83BTPm9KGoiMW+pZXJCuQEKHNW0shrHe
   VU4YbAK1FWFSWDheioFmq3KyvYnNHRyXHW4roF6JmXfWQURRrzsmogLbj
   2vKYZftI7SzDvuMsRW4jdlEY8alsWmvb64Y+pxc1Y4fO7i4t7A8Zx6Mx6
   q/gEgP/dczupHvxFeCFWxYGGfnlqJYA3NkIGJugSUuCWoeYq5BhDFqNJm
   iFC+nXJolh9UvXwUqFkZ3PHY7ySzDQSi8rw0cjgTMTjOM5DKF0AWNCzf/
   ACtzxajKiY9cG5Tlc9YPy6goFIPl47IoDO7UQKgvEMaQZTdDXRmhUJN52
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="3370860"
X-IronPort-AV: E=Sophos;i="6.03,297,1694761200"; 
   d="scan'208";a="3370860"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 08:41:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="881451097"
X-IronPort-AV: E=Sophos;i="6.03,297,1694761200"; 
   d="scan'208";a="881451097"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 12 Nov 2023 08:41:38 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2DWh-000BKe-2d;
	Sun, 12 Nov 2023 16:41:35 +0000
Date: Mon, 13 Nov 2023 00:40:45 +0800
From: kernel test robot <lkp@intel.com>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: include/linux/rculist.h:524:9: sparse: sparse: incompatible types in
 comparison expression (different address spaces):
Message-ID: <202311130034.cLZT80OM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1b907d0507354b74a4f2c286380cd6059af79248
commit: 6b03d1304a32dc8450c7516000a0fe07bef7c446 proc: Ensure we see the exit of each process tid exactly once
date:   3 years, 7 months ago
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20231113/202311130034.cLZT80OM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231113/202311130034.cLZT80OM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311130034.cLZT80OM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/pid.c:377:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/pid.c:377:9: sparse:    struct pid [noderef] <asn:4> *
   kernel/pid.c:377:9: sparse:    struct pid *
   kernel/pid.c:378:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/pid.c:378:9: sparse:    struct pid [noderef] <asn:4> *
   kernel/pid.c:378:9: sparse:    struct pid *
   kernel/pid.c:440:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/pid.c:440:23: sparse:    struct pid [noderef] <asn:4> *
   kernel/pid.c:440:23: sparse:    struct pid *
   kernel/pid.c:499:32: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/pid.c:499:32: sparse:    struct pid [noderef] <asn:4> *
   kernel/pid.c:499:32: sparse:    struct pid *
   kernel/pid.c: note: in included file (through include/linux/pid.h, include/linux/sched.h, include/linux/mm.h):
>> include/linux/rculist.h:524:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/rculist.h:524:9: sparse:    struct hlist_node [noderef] <asn:4> *
>> include/linux/rculist.h:524:9: sparse:    struct hlist_node *
   include/linux/rculist.h:525:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/rculist.h:525:9: sparse:    struct hlist_node [noderef] <asn:4> *
   include/linux/rculist.h:525:9: sparse:    struct hlist_node *

vim +524 include/linux/rculist.h

82524746c27fa4 Franck Bui-Huu    2008-05-12  508  
35fc0e3b0bd5be Eric W. Biederman 2020-04-24  509  /**
35fc0e3b0bd5be Eric W. Biederman 2020-04-24  510   * hlists_swap_heads_rcu - swap the lists the hlist heads point to
35fc0e3b0bd5be Eric W. Biederman 2020-04-24  511   * @left:  The hlist head on the left
35fc0e3b0bd5be Eric W. Biederman 2020-04-24  512   * @right: The hlist head on the right
35fc0e3b0bd5be Eric W. Biederman 2020-04-24  513   *
35fc0e3b0bd5be Eric W. Biederman 2020-04-24  514   * The lists start out as [@left  ][node1 ... ] and
35fc0e3b0bd5be Eric W. Biederman 2020-04-24  515                            [@right ][node2 ... ]
35fc0e3b0bd5be Eric W. Biederman 2020-04-24  516   * The lists end up as    [@left  ][node2 ... ]
35fc0e3b0bd5be Eric W. Biederman 2020-04-24  517   *                        [@right ][node1 ... ]
35fc0e3b0bd5be Eric W. Biederman 2020-04-24  518   */
35fc0e3b0bd5be Eric W. Biederman 2020-04-24  519  static inline void hlists_swap_heads_rcu(struct hlist_head *left, struct hlist_head *right)
35fc0e3b0bd5be Eric W. Biederman 2020-04-24  520  {
35fc0e3b0bd5be Eric W. Biederman 2020-04-24  521  	struct hlist_node *node1 = left->first;
35fc0e3b0bd5be Eric W. Biederman 2020-04-24  522  	struct hlist_node *node2 = right->first;
35fc0e3b0bd5be Eric W. Biederman 2020-04-24  523  
35fc0e3b0bd5be Eric W. Biederman 2020-04-24 @524  	rcu_assign_pointer(left->first, node2);
35fc0e3b0bd5be Eric W. Biederman 2020-04-24  525  	rcu_assign_pointer(right->first, node1);
35fc0e3b0bd5be Eric W. Biederman 2020-04-24  526  	WRITE_ONCE(node2->pprev, &left->first);
35fc0e3b0bd5be Eric W. Biederman 2020-04-24  527  	WRITE_ONCE(node1->pprev, &right->first);
35fc0e3b0bd5be Eric W. Biederman 2020-04-24  528  }
35fc0e3b0bd5be Eric W. Biederman 2020-04-24  529  

:::::: The code at line 524 was first introduced by commit
:::::: 35fc0e3b0bd5be3b059e53ae90c4536ee4922330 rculist: Add hlists_swap_heads_rcu

:::::: TO: Eric W. Biederman <ebiederm@xmission.com>
:::::: CC: Eric W. Biederman <ebiederm@xmission.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
