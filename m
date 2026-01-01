Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFE6246774
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jan 2026 03:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767239578; cv=none; b=ruMryzIACOkHDBR8b/Cn+vZBECXHSyscHXF1+erk0pBGv8cL+ZwgaCAbivm0+iJ+Xa6REf5KPY3eM3CNiSfBRMdBsOUnSIz0CGWqxuo7mjS7hnrb4aIqLqnkYmCd8g0wEgD+n6ITLt5hp890DohyvbR0XWtjLhrOshA6Nr9hR/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767239578; c=relaxed/simple;
	bh=a8ZwPKkKCV1zqMLBB1bJGxfYNQOPUVPm/Eih/k+s8Oo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=I9LyA9Jr+vllby9dlDZxagAop0nwuj80qK+fLW2pX001Pdec3v9AqodyQ8Iqy+jdbPjSt7WUs4mRO20m2lTY+haCaugSPiugF4BnCj3XAjvRFCi42SQq0ZJhC9jcyk9ZYXcBYvcolw4tcIHY5E/he25dIDGA3OzY1iLmpE3ooiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eJOr3AHC; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eJOr3AHC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767239577; x=1798775577;
  h=date:from:to:cc:subject:message-id;
  bh=a8ZwPKkKCV1zqMLBB1bJGxfYNQOPUVPm/Eih/k+s8Oo=;
  b=eJOr3AHCGGnizvuMw7NpARRDvB0fQM+v6F/RuKE26pHmrQ6VQXg3m62E
   4j7SG5p31S5e7xYdAFcSmO4AqSjO6t+6jTU4IaJ9EzBAYaIDghZt+0XiZ
   CM8LWrX8Dmnhu956AnHigJRhBZGgL4pipjl1Noq/zEwarigLK7x82rhGb
   6WHP6cQXRZCLMpUnfgkmp+/wwBGAx2hTmTVpRjfI+pZQanulD1cvqAZCa
   fZMWNZyn3fddmO8XR+rfaCBJUlK3uJnqPp8gqi3hG6Lp/BtP9V9TFbILX
   X/wGUAEk7x3+6Q/rVwJLvQzZitKwDQC+Qp825xyX6JF4HYWa0oleXrUHg
   w==;
X-CSE-ConnectionGUID: QLZ9PUcZRu2toVi4q6bYKQ==
X-CSE-MsgGUID: jPXrxGYyT66l1+xX/9ewMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="72637435"
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; 
   d="scan'208";a="72637435"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2025 19:52:57 -0800
X-CSE-ConnectionGUID: 3rnLXo5qSfaF4RJtvr13rQ==
X-CSE-MsgGUID: fR3CWKZlTTqKtyt1lxJE/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; 
   d="scan'208";a="206441330"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 31 Dec 2025 19:52:55 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vb9k4-000000000BZ-2xGn;
	Thu, 01 Jan 2026 03:52:52 +0000
Date: Thu, 01 Jan 2026 04:52:46 +0100
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:timers/core 3/10]
 progs/hid_bpf_helpers.h:117:31: error: declaration of 'struct bpf_wq' will
 not be visible outside of this function
Message-ID: <202601010421.akEr6xAy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/core
head:   e2e8796db56999913bd1cf839e933af6e5d5b23e
commit: ba82eb2e56c31d2b7d28f9159882e3db8c8dab69 [3/10] sched/cputime: Correctly support vtime idle time
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260101/202601010421.akEr6xAy-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260101/202601010421.akEr6xAy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601010421.akEr6xAy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from progs/hid.c:3:
>> progs/hid_bpf_helpers.h:117:31: error: declaration of 'struct bpf_wq' will not be visible outside of this function [-Werror,-Wvisibility]
     117 | extern int bpf_wq_init(struct bpf_wq *wq, void *p__map, unsigned int flags) __weak __ksym;
         |                               ^
   progs/hid_bpf_helpers.h:118:32: error: declaration of 'struct bpf_wq' will not be visible outside of this function [-Werror,-Wvisibility]
     118 | extern int bpf_wq_start(struct bpf_wq *wq, unsigned int flags) __weak __ksym;
         |                                ^
   progs/hid_bpf_helpers.h:119:44: error: declaration of 'struct bpf_wq' will not be visible outside of this function [-Werror,-Wvisibility]
     119 | extern int bpf_wq_set_callback_impl(struct bpf_wq *wq,
         |                                            ^
>> progs/hid.c:448:16: error: field has incomplete type 'struct bpf_wq'
     448 |         struct bpf_wq work;
         |                       ^
   progs/hid.c:448:9: note: forward declaration of 'struct bpf_wq'
     448 |         struct bpf_wq work;
         |                ^
>> progs/hid.c:487:18: error: incompatible pointer types passing 'struct bpf_wq *' to parameter of type 'struct bpf_wq *' [-Wincompatible-pointer-types]
     487 |         if (bpf_wq_init(wq, &hmap, 0) != 0)
         |                         ^~
   progs/hid_bpf_helpers.h:117:39: note: passing argument to parameter 'wq' here
     117 | extern int bpf_wq_init(struct bpf_wq *wq, void *p__map, unsigned int flags) __weak __ksym;
         |                                       ^
   progs/hid.c:490:26: error: incompatible pointer types passing 'struct bpf_wq *' to parameter of type 'struct bpf_wq *' [-Wincompatible-pointer-types]
     490 |         if (bpf_wq_set_callback(wq, wq_cb_sleepable, 0))
         |                                 ^~
   progs/hid_bpf_helpers.h:119:52: note: passing argument to parameter 'wq' here
     119 | extern int bpf_wq_set_callback_impl(struct bpf_wq *wq,
         |                                                    ^
   progs/hid.c:493:19: error: incompatible pointer types passing 'struct bpf_wq *' to parameter of type 'struct bpf_wq *' [-Wincompatible-pointer-types]
     493 |         if (bpf_wq_start(wq, 0))
         |                          ^~
   progs/hid_bpf_helpers.h:118:40: note: passing argument to parameter 'wq' here
     118 | extern int bpf_wq_start(struct bpf_wq *wq, unsigned int flags) __weak __ksym;
         |                                        ^
   progs/hid.c:503:24: error: incomplete definition of type 'struct hid_device'
     503 |         int hid = hid_ctx->hid->id;
         |                   ~~~~~~~~~~~~^
   progs/hid_bpf_helpers.h:59:9: note: forward declaration of 'struct hid_device'
      59 |         struct hid_device *hid;
         |                ^
   8 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
