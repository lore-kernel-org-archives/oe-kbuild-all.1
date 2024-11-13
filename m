Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5974418BC0E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 22:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731538251; cv=none; b=iXZyOX/zZ1MvyOHYDR6mmnbtKlpm7W7m9whdV6P2nOWVQmZa8S4erKnfoqKQ/IOI0IQWmG4x0L+/PTDwU86gNqv11vB2VyrFNLmppnlEHBy9TBDpU1KCn90Pd47zC1WcOWYonhAc4gccxOIhH+bVYao7dUkYaV8U6VtRZtmHYak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731538251; c=relaxed/simple;
	bh=6toVV5zZpAqyUXN4Ze8SgSgulyrXTOusoriOePCbo9o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WVg7ULbu/KkFRYWeULhFXWGbTJ87qklh8FvObwynvzSZS8KjImVZgCTAvHVtTi6iZvcedR78Iu9oChqp4zobFGtM264lQZY7xSTeFb6aZd104GI0sCgdAHM2geVfEuyEKTGiDgZ63GjJMKbfzZGPA+4rrMYWP/8p4qhgGJc0xbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AwX+kGs0; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AwX+kGs0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731538248; x=1763074248;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6toVV5zZpAqyUXN4Ze8SgSgulyrXTOusoriOePCbo9o=;
  b=AwX+kGs03QGYeIZLpsIGyPHD9v0JmhcXrLcAzyr4JJ+cVbAb56BncqoE
   RPXJMjtk6IHn39prkyd7ibNTFxqc/nV8bUbBECkp88hrAs30j2oVW86wY
   VPr9ah4zUz4A7JaQgn8Nx0VXfN4dvEGyAl0gDpQ6OfXlB78gypqGDnkJs
   BC8JgKlTONKQk0RSj9c9ALkAhbgi2qU1elbGcc6EBmZ8BS0ueHd5jMArk
   jIAiqN4DmjijxOGKQqsWzmsLT4pec7rDMTUUAfYgH/zk4TnDkwb0n9Jms
   i1zAwHfz3ZiaZYw8PkTB83czn21VYiHnGCTevkcH57TwczjLpud37Fd2V
   Q==;
X-CSE-ConnectionGUID: N9NMsJlZRuO7C87iYUpSTQ==
X-CSE-MsgGUID: CTts3Xe1SKiR+K2MRhJ+6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="30862585"
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="30862585"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 14:50:46 -0800
X-CSE-ConnectionGUID: b4z9UBeNTU65bUIzT7Nzfg==
X-CSE-MsgGUID: 5der/EVsTje2vbrm5WBWSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="88806294"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Nov 2024 14:50:45 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBMCB-0000o9-0t;
	Wed, 13 Nov 2024 22:50:43 +0000
Date: Thu, 14 Nov 2024 06:50:38 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tj-sched-ext:scx-api-rename-dispatch-v2 36/38]
 select_cpu_dispatch.bpf.c:32:2: warning: label followed by a declaration is
 a C23 extension
Message-ID: <202411140656.z07YDfik-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git scx-api-rename-dispatch-v2
head:   02d0b499d4fbbe1774069509aad0920f06f4df03
commit: 6fb3113c1be677723097094830f8600b49a5afc7 [36/38] sched_ext: Rename scx_bpf_dispatch[_vtime]() to scx_bpf_dsq_insert[_vtime]()
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241114/202411140656.z07YDfik-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411140656.z07YDfik-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from select_cpu_dispatch.bpf.c:11:
   tools/sched_ext/include/scx/common.bpf.h:33:17: error: use of undeclared identifier 'SCX_DSQ_FLAG_BUILTIN'
      33 |         _Static_assert(SCX_DSQ_FLAG_BUILTIN,
         |                        ^
   tools/sched_ext/include/scx/common.bpf.h:44:49: warning: declaration of 'struct bpf_iter_scx_dsq' will not be visible outside of this function [-Wvisibility]
      44 | void scx_bpf_dispatch_from_dsq_set_slice(struct bpf_iter_scx_dsq *it__iter, u64 slice) __ksym __weak;
         |                                                 ^
   tools/sched_ext/include/scx/common.bpf.h:45:49: warning: declaration of 'struct bpf_iter_scx_dsq' will not be visible outside of this function [-Wvisibility]
      45 | void scx_bpf_dispatch_from_dsq_set_vtime(struct bpf_iter_scx_dsq *it__iter, u64 vtime) __ksym __weak;
         |                                                 ^
   tools/sched_ext/include/scx/common.bpf.h:46:39: warning: declaration of 'struct bpf_iter_scx_dsq' will not be visible outside of this function [-Wvisibility]
      46 | bool scx_bpf_dispatch_from_dsq(struct bpf_iter_scx_dsq *it__iter, struct task_struct *p, u64 dsq_id, u64 enq_flags) __ksym __weak;
         |                                       ^
   tools/sched_ext/include/scx/common.bpf.h:47:45: warning: declaration of 'struct bpf_iter_scx_dsq' will not be visible outside of this function [-Wvisibility]
      47 | bool scx_bpf_dispatch_vtime_from_dsq(struct bpf_iter_scx_dsq *it__iter, struct task_struct *p, u64 dsq_id, u64 enq_flags) __ksym __weak;
         |                                             ^
   tools/sched_ext/include/scx/common.bpf.h:52:33: warning: declaration of 'struct bpf_iter_scx_dsq' will not be visible outside of this function [-Wvisibility]
      52 | int bpf_iter_scx_dsq_new(struct bpf_iter_scx_dsq *it, u64 dsq_id, u64 flags) __ksym __weak;
         |                                 ^
   tools/sched_ext/include/scx/common.bpf.h:53:50: warning: declaration of 'struct bpf_iter_scx_dsq' will not be visible outside of this function [-Wvisibility]
      53 | struct task_struct *bpf_iter_scx_dsq_next(struct bpf_iter_scx_dsq *it) __ksym __weak;
         |                                                  ^
   tools/sched_ext/include/scx/common.bpf.h:54:38: warning: declaration of 'struct bpf_iter_scx_dsq' will not be visible outside of this function [-Wvisibility]
      54 | void bpf_iter_scx_dsq_destroy(struct bpf_iter_scx_dsq *it) __ksym __weak;
         |                                      ^
   select_cpu_dispatch.bpf.c:18:15: error: use of undeclared identifier 'SCX_DSQ_LOCAL'
      18 |         u64 dsq_id = SCX_DSQ_LOCAL;
         |                      ^
   select_cpu_dispatch.bpf.c:28:11: error: use of undeclared identifier 'SCX_DSQ_GLOBAL'
      28 |         dsq_id = SCX_DSQ_GLOBAL;
         |                  ^
   select_cpu_dispatch.bpf.c:32:2: error: static assertion failed due to requirement 'false': scx_bpf_dispatch() renamed to scx_bpf_dsq_insert()
      32 |         scx_bpf_dispatch(p, dsq_id, SCX_SLICE_DFL, 0);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/sched_ext/include/scx/compat.bpf.h:58:17: note: expanded from macro 'scx_bpf_dispatch'
      58 |         _Static_assert(false, "scx_bpf_dispatch() renamed to scx_bpf_dsq_insert()")
         |                        ^~~~~
>> select_cpu_dispatch.bpf.c:32:2: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
   tools/sched_ext/include/scx/compat.bpf.h:58:2: note: expanded from macro 'scx_bpf_dispatch'
      58 |         _Static_assert(false, "scx_bpf_dispatch() renamed to scx_bpf_dsq_insert()")
         |         ^
   select_cpu_dispatch.bpf.c:37:22: error: variable has incomplete type 'struct sched_ext_ops'
      37 | struct sched_ext_ops select_cpu_dispatch_ops = {
         |                      ^
   select_cpu_dispatch.bpf.c:37:8: note: forward declaration of 'struct sched_ext_ops'
      37 | struct sched_ext_ops select_cpu_dispatch_ops = {
         |        ^
   8 warnings and 5 errors generated.
--
   In file included from select_cpu_vtime.bpf.c:13:
   tools/sched_ext/include/scx/common.bpf.h:33:17: error: use of undeclared identifier 'SCX_DSQ_FLAG_BUILTIN'
      33 |         _Static_assert(SCX_DSQ_FLAG_BUILTIN,
         |                        ^
   tools/sched_ext/include/scx/common.bpf.h:44:49: warning: declaration of 'struct bpf_iter_scx_dsq' will not be visible outside of this function [-Wvisibility]
      44 | void scx_bpf_dispatch_from_dsq_set_slice(struct bpf_iter_scx_dsq *it__iter, u64 slice) __ksym __weak;
         |                                                 ^
   tools/sched_ext/include/scx/common.bpf.h:45:49: warning: declaration of 'struct bpf_iter_scx_dsq' will not be visible outside of this function [-Wvisibility]
      45 | void scx_bpf_dispatch_from_dsq_set_vtime(struct bpf_iter_scx_dsq *it__iter, u64 vtime) __ksym __weak;
         |                                                 ^
   tools/sched_ext/include/scx/common.bpf.h:46:39: warning: declaration of 'struct bpf_iter_scx_dsq' will not be visible outside of this function [-Wvisibility]
      46 | bool scx_bpf_dispatch_from_dsq(struct bpf_iter_scx_dsq *it__iter, struct task_struct *p, u64 dsq_id, u64 enq_flags) __ksym __weak;
         |                                       ^
   tools/sched_ext/include/scx/common.bpf.h:47:45: warning: declaration of 'struct bpf_iter_scx_dsq' will not be visible outside of this function [-Wvisibility]
      47 | bool scx_bpf_dispatch_vtime_from_dsq(struct bpf_iter_scx_dsq *it__iter, struct task_struct *p, u64 dsq_id, u64 enq_flags) __ksym __weak;
         |                                             ^
   tools/sched_ext/include/scx/common.bpf.h:52:33: warning: declaration of 'struct bpf_iter_scx_dsq' will not be visible outside of this function [-Wvisibility]
      52 | int bpf_iter_scx_dsq_new(struct bpf_iter_scx_dsq *it, u64 dsq_id, u64 flags) __ksym __weak;
         |                                 ^
   tools/sched_ext/include/scx/common.bpf.h:53:50: warning: declaration of 'struct bpf_iter_scx_dsq' will not be visible outside of this function [-Wvisibility]
      53 | struct task_struct *bpf_iter_scx_dsq_next(struct bpf_iter_scx_dsq *it) __ksym __weak;
         |                                                  ^
   tools/sched_ext/include/scx/common.bpf.h:54:38: warning: declaration of 'struct bpf_iter_scx_dsq' will not be visible outside of this function [-Wvisibility]
      54 | void bpf_iter_scx_dsq_destroy(struct bpf_iter_scx_dsq *it) __ksym __weak;
         |                                      ^
   select_cpu_vtime.bpf.c:30:17: error: no member named 'scx' in 'struct task_struct'
      30 |         u64 vtime = p->scx.dsq_vtime;
         |                     ~  ^
   select_cpu_vtime.bpf.c:32:38: error: use of undeclared identifier 'SCX_SLICE_DFL'
      32 |         if (vtime_before(vtime, vtime_now - SCX_SLICE_DFL))
         |                                             ^
   select_cpu_vtime.bpf.c:33:22: error: use of undeclared identifier 'SCX_SLICE_DFL'
      33 |                 return vtime_now - SCX_SLICE_DFL;
         |                                    ^
   select_cpu_vtime.bpf.c:50:2: error: static assertion failed due to requirement 'false': scx_bpf_dispatch_vtime() renamed to scx_bpf_dsq_insert_vtime()
      50 |         scx_bpf_dispatch_vtime(p, VTIME_DSQ, SCX_SLICE_DFL, task_vtime(p), 0);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/sched_ext/include/scx/compat.bpf.h:61:17: note: expanded from macro 'scx_bpf_dispatch_vtime'
      61 |         _Static_assert(false, "scx_bpf_dispatch_vtime() renamed to scx_bpf_dsq_insert_vtime()")
         |                        ^~~~~
>> select_cpu_vtime.bpf.c:50:2: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
   tools/sched_ext/include/scx/compat.bpf.h:61:2: note: expanded from macro 'scx_bpf_dispatch_vtime'
      61 |         _Static_assert(false, "scx_bpf_dispatch_vtime() renamed to scx_bpf_dsq_insert_vtime()")
         |         ^
   select_cpu_vtime.bpf.c:62:33: error: no member named 'scx' in 'struct task_struct'
      62 |         if (vtime_before(vtime_now, p->scx.dsq_vtime))
         |                                     ~  ^
   select_cpu_vtime.bpf.c:63:18: error: no member named 'scx' in 'struct task_struct'
      63 |                 vtime_now = p->scx.dsq_vtime;
         |                             ~  ^
   select_cpu_vtime.bpf.c:69:5: error: no member named 'scx' in 'struct task_struct'
      69 |         p->scx.dsq_vtime += (SCX_SLICE_DFL - p->scx.slice) * 100 / p->scx.weight;
         |         ~  ^
   select_cpu_vtime.bpf.c:69:42: error: no member named 'scx' in 'struct task_struct'
      69 |         p->scx.dsq_vtime += (SCX_SLICE_DFL - p->scx.slice) * 100 / p->scx.weight;
         |                                              ~  ^
   select_cpu_vtime.bpf.c:69:23: error: use of undeclared identifier 'SCX_SLICE_DFL'
      69 |         p->scx.dsq_vtime += (SCX_SLICE_DFL - p->scx.slice) * 100 / p->scx.weight;
         |                              ^
   select_cpu_vtime.bpf.c:69:64: error: no member named 'scx' in 'struct task_struct'
      69 |         p->scx.dsq_vtime += (SCX_SLICE_DFL - p->scx.slice) * 100 / p->scx.weight;
         |                                                                    ~  ^
   select_cpu_vtime.bpf.c:74:5: error: no member named 'scx' in 'struct task_struct'
      74 |         p->scx.dsq_vtime = vtime_now;
         |         ~  ^
   select_cpu_vtime.bpf.c:83:22: error: variable has incomplete type 'struct sched_ext_ops'
      83 | struct sched_ext_ops select_cpu_vtime_ops = {
         |                      ^
   select_cpu_vtime.bpf.c:83:8: note: forward declaration of 'struct sched_ext_ops'
      83 | struct sched_ext_ops select_cpu_vtime_ops = {
         |        ^
   8 warnings and 13 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
