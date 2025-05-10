Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D7A234964
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 May 2025 10:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746874329; cv=none; b=mDFCL/DTAtmfnVvV0ugZVVTXKDOjxxEgtOkJIPEHw5EfTn64jCC1ftUa+sKDTsGb9WMXDqyN6RDwBuxo7dqFkXDtWE9TJVFFuJp/9mL6Tj4fIoEAP4G7vezh1nKvIFiE4bnnRnL0LuG6tyNN6ru2xx70CeDE2sQpAdlE5LRPY40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746874329; c=relaxed/simple;
	bh=+m2xG+zcmijM11YvSWgx1cFzrOANPfqCz9oXfgUyoTg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q96B1ifdWSDIeh2ozsNknKaqUjxJL+KdavghBToqHFmbf51Z75RDF95bIPhhTR9xovp39i++E80d2xyS9Eegv0OgZJDkSJhHAXanWhudhRPvSHp62lgn0S2j9u85q94WJJbC/5PcImNmm2Xiyn9XAjmVLgw2dvQu53Pg8m8qDSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bL/vjA1I; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bL/vjA1I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746874327; x=1778410327;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+m2xG+zcmijM11YvSWgx1cFzrOANPfqCz9oXfgUyoTg=;
  b=bL/vjA1I3K2Mc845pAWtCoFjteW9+wHkiBYbLbFiGPbTNOc3Wabq8+YB
   D7FyPheuJuE4PMT6pQIiQ19pvLG7saDSfP2EZDGnLtB75IpQxVTfA7tPa
   7MjXjy+2J8pAchoIKFgn2mD7yy5vzvhOVbN6fw1ZI36KijT//r3P6VOAz
   tZlegAqrF3B/BqKioiF1/mPlmDpSsxxR1rA95w2tnyTT0E9Vk3kYhbT4/
   rp9i+tLCkuX83F5SUDcVTpHMUkaPALZmdVzsNmN+1IzTKSPWKSm5O3LnT
   T3/02jkq1hTWMhWxA0YDTfpLfBnq5tE3YLdD/t7O9Ymq0OOOJGdBdsCbD
   Q==;
X-CSE-ConnectionGUID: urebTRKvRd2Xh2U6qfnHSg==
X-CSE-MsgGUID: NvNvx4xRQYG3Mva+tECD0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59361784"
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="59361784"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 03:52:06 -0700
X-CSE-ConnectionGUID: KJgSVY+qR1aKeZvFrwbUDw==
X-CSE-MsgGUID: r3cA7IH1Q0u3Lp44pXh2zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="137803582"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 May 2025 03:52:05 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDhoJ-000D0x-0Z;
	Sat, 10 May 2025 10:52:03 +0000
Date: Sat, 10 May 2025 18:51:11 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 11/11] kernel/sched/fair.c:1679:22:
 warning: no previous prototype for function '__pick_first_entity'
Message-ID: <202505101851.J7y3tjnn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Michael,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   135e4e84e5a63d5ee88888402c3f84836ab97e95
commit: 9372f9beab4213be5b70136fe15a6cdc3b034be3 [11/11] ck: sched: introduce group identity 'smt expeller'
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250510/202505101851.J7y3tjnn-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250510/202505101851.J7y3tjnn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505101851.J7y3tjnn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/fair.c:1679:22: warning: no previous prototype for function '__pick_first_entity' [-Wmissing-prototypes]
    1679 | struct sched_entity *__pick_first_entity(struct cfs_rq *cfs_rq)
         |                      ^
   kernel/sched/fair.c:1679:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1679 | struct sched_entity *__pick_first_entity(struct cfs_rq *cfs_rq)
         | ^
         | static 
   kernel/sched/fair.c:8052:7: warning: variable 'min_vruntime' set but not used [-Wunused-but-set-variable]
    8052 |                 u64 min_vruntime;
         |                     ^
   kernel/sched/fair.c:794:20: warning: unused function 'is_underclass_task' [-Wunused-function]
     794 | static inline bool is_underclass_task(struct task_struct *p)
         |                    ^~~~~~~~~~~~~~~~~~
   3 warnings generated.


vim +/__pick_first_entity +1679 kernel/sched/fair.c

9372f9beab4213 kernel/sched/fair.c Michael Wang   2020-08-05  1678  
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra 2011-10-25 @1679  struct sched_entity *__pick_first_entity(struct cfs_rq *cfs_rq)
bf0f6f24a1ece8 kernel/sched_fair.c Ingo Molnar    2007-07-09  1680  {
b37e67a6c64803 kernel/sched/fair.c Michael Wang   2020-08-04  1681  	struct rb_node *left = id_rb_first_cached(cfs_rq);
f4b6755fb37595 kernel/sched_fair.c Peter Zijlstra 2008-11-04  1682  
f4b6755fb37595 kernel/sched_fair.c Peter Zijlstra 2008-11-04  1683  	if (!left)
f4b6755fb37595 kernel/sched_fair.c Peter Zijlstra 2008-11-04  1684  		return NULL;
f4b6755fb37595 kernel/sched_fair.c Peter Zijlstra 2008-11-04  1685  
1e922847e9c480 kernel/sched/fair.c Peter Zijlstra 2021-05-31  1686  	return __node_2_se(left);
bf0f6f24a1ece8 kernel/sched_fair.c Ingo Molnar    2007-07-09  1687  }
bf0f6f24a1ece8 kernel/sched_fair.c Ingo Molnar    2007-07-09  1688  

:::::: The code at line 1679 was first introduced by commit
:::::: 029632fbb7b7c9d85063cc9eb470de6c54873df3 sched: Make separate sched*.c translation units

:::::: TO: Peter Zijlstra <a.p.zijlstra@chello.nl>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
