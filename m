Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992C227F736
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Oct 2025 20:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760475345; cv=none; b=Y7Ig+B6ZYmFfSNw0tLGaagy+xvbtH+p1pkwmQo7V7p0/wyfrUFSQw1FJTJEj4QqlN/+ZMAcLD9xnHBI4FxnIx2ogkEdBrLDdt+4aq8mZOkAh6CGsLb5ZzcmZeoyuiFpC5GGbT0BtnkwHxl7FZRQqpEezRExjVRBD4BBm8gptK+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760475345; c=relaxed/simple;
	bh=A4bEs4JJjm+HEWyXFHvmZO4cdwUuCAOwUzboNJtiu+U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K4KapZ4pV4NRdsPS55VI+dsmsBfstkdHwrT392Elkqe+Kl6acFHwV9cbVwjZZNFTx7FkLxqizcm0FIYQxjcLZRRfrYUSAx6gkjQbhxO843eNmhfpOufUlbvn2nOSGswfYjPwjoUV18UjhsdjaCbHiSHtaFYPA7l6RjFRWGtE5No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NrLoDq5l; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NrLoDq5l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760475343; x=1792011343;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A4bEs4JJjm+HEWyXFHvmZO4cdwUuCAOwUzboNJtiu+U=;
  b=NrLoDq5lVM0CCj3rSTtBCa8C/sVeqP4HtoDoSdOYxvRlYaBT0Ih5Plle
   zAXyO5uwLBF/NVee27dV32t8a4Ft10g0OmR0zGOruroPfqMfxzuoeb9Ov
   Pxo9KxcnJ6stZUe24Fu2NWZpBT80InDfZPqgpn5yLEZ/PyK6XStjfT6sE
   hXfcx/xZNQeIgzCvEC+vGiKKew6HCCZmcsdyVTfJTPcHz5A9Ia7SgGCnx
   hd5AqtjklFWxFLhWMHZZr+PNIflsMCr192lDkILKrEG8HF2ntywMkLgzf
   mTZ55gn4xz/pDdDLj9iFhcWF0EOjLmpiLW4RPrZII5AydqOPae+gu/Ork
   g==;
X-CSE-ConnectionGUID: h7tjDq3lQMW2fUMLiZpv4Q==
X-CSE-MsgGUID: wUaqmqlBTkWoC+YIuo3C0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62534764"
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; 
   d="scan'208";a="62534764"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 13:55:43 -0700
X-CSE-ConnectionGUID: JkLaql3nReme3a9d6LShbA==
X-CSE-MsgGUID: tA5uGP5fSC+4y3sWcwIBEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; 
   d="scan'208";a="181203141"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 14 Oct 2025 13:55:42 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8m3X-0003Bv-1A;
	Tue, 14 Oct 2025 20:55:39 +0000
Date: Wed, 15 Oct 2025 04:55:05 +0800
From: kernel test robot <lkp@intel.com>
To: zhidao su <suzhidao@xiaomi.com>
Cc: oe-kbuild-all@lists.linux.dev, Tejun Heo <tj@kernel.org>
Subject: [linux-next:master 1252/1572] kernel/sched/ext.c:3220:20: error:
 'scx_cgroup_rwsem' undeclared; did you mean 'scx_cgroup_ops_rwsem'?
Message-ID: <202510150406.kosHadG1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   13863a59e410cab46d26751941980dc8f088b9b3
commit: d579dc6eb4fd03c43622cf94ccc8d8b508c6d6ff [1252/1572] sched/ext: Implement cgroup_set_idle() callback
config: parisc-randconfig-002-20251015 (https://download.01.org/0day-ci/archive/20251015/202510150406.kosHadG1-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251015/202510150406.kosHadG1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510150406.kosHadG1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:62:
   kernel/sched/ext.c: In function 'scx_group_set_idle':
>> kernel/sched/ext.c:3220:20: error: 'scx_cgroup_rwsem' undeclared (first use in this function); did you mean 'scx_cgroup_ops_rwsem'?
     percpu_down_read(&scx_cgroup_rwsem);
                       ^~~~~~~~~~~~~~~~
                       scx_cgroup_ops_rwsem
   kernel/sched/ext.c:3220:20: note: each undeclared identifier is reported only once for each function it appears in
   kernel/sched/ext.c: In function 'scx_vexit':
   kernel/sched/ext.c:4411:2: warning: function 'scx_vexit' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     vscnprintf(ei->msg, SCX_EXIT_MSG_LEN, fmt, args);
     ^~~~~~~~~~
   In file included from kernel/sched/build_policy.c:62:
   kernel/sched/ext.c: In function '__bstr_format':
   kernel/sched/ext.c:6324:6: warning: function '__bstr_format' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
         bprintf_data.bin_args);
         ^~~~~~~~~~~~


vim +3220 kernel/sched/ext.c

  3215	
  3216	void scx_group_set_idle(struct task_group *tg, bool idle)
  3217	{
  3218		struct scx_sched *sch = scx_root;
  3219	
> 3220		percpu_down_read(&scx_cgroup_rwsem);
  3221	
  3222		if (scx_cgroup_enabled && SCX_HAS_OP(sch, cgroup_set_idle))
  3223			SCX_CALL_OP(sch, SCX_KF_UNLOCKED, cgroup_set_idle, NULL,
  3224				    tg_cgrp(tg), idle);
  3225	
  3226		/* Update the task group's idle state */
  3227		tg->scx.idle = idle;
  3228	
  3229		percpu_up_read(&scx_cgroup_rwsem);
  3230	}
  3231	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
