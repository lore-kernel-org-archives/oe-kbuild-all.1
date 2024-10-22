Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF1145026
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Oct 2024 11:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729597658; cv=none; b=lGvdOCTwLnyrJRy0jnYZS1HS8KHFhivjXPhOi3LE2HXOYz+03fnS6rsjPULH/QIoG891PIQlh3rd8K3Agz/h+/FW7XFadRh4v9/BzummiKIXU6dhzdTztuQ7U0El5gsutMZ+84kck+O8UHUoRBG6KDea275bEMgd/5GW/Zb7mdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729597658; c=relaxed/simple;
	bh=Mo8+scVheApok9QZ/3CgzP+NlzAoTap3Tu6557GORSM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XaGoxJr7sSI2PdqzxeCZzmSmi1TqNO8I8oxSz6b4aLcqwcoSBuUsnDsjmkxGtksbGA8Tf97oytHXeAcgjFJ4+gGGHx1P1KTvImr2Y9mOc/SJhqxto6DGJ3WgXQoT1ilbNIOCOCgCq0dgqu94zB+cEfFK9mp8Fdh1AtVua5kdkRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=faKsWiR1; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="faKsWiR1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729597657; x=1761133657;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mo8+scVheApok9QZ/3CgzP+NlzAoTap3Tu6557GORSM=;
  b=faKsWiR1f7WfZAFoWRU+SQXbwapTkxZkwyw+/LUfbUHsMdZyJ+WAWdvV
   62dAKTO/21b/4CrLIOmTpBffVP58AjVYk2p+XB/sw/+7yJ6RkMzspt1NH
   8TgtG856NjiKizcCGHB3wMtL3+kIyVr3Zf38QDxWWNyJt7pQU41da05AL
   7/BSfStq7z1XX2i3DtrHdxaD7IBvvKAyDRDwjerVXm10M9TRP6FLDuHru
   FH7zx1+JCAibqCJLU1qWyPzfaAGIBwridlQg4TfDUGZ+0hWdKmPThB/s5
   D3Y540Oo2GYIB3dUYGFsvkHkmLsqAjem3dWMsEkCL0olJfzrcV5e3EzP/
   g==;
X-CSE-ConnectionGUID: PX/bAD3QR3mhxBoNQ6CQQg==
X-CSE-MsgGUID: j7tiPqn5RvS8lREJzASAHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="32937062"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="32937062"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 04:47:36 -0700
X-CSE-ConnectionGUID: PZClPQYsSbCfWKqadZKN5w==
X-CSE-MsgGUID: eH+/3FdHRxW/WnBBhWU4TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="84441398"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Oct 2024 04:47:34 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3DMK-000TVp-0U;
	Tue, 22 Oct 2024 11:47:32 +0000
Date: Tue, 22 Oct 2024 19:46:32 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Tejun Heo <tj@kernel.org>
Subject: [linux-next:master 5847/6080] kernel/sched/ext.c:6741:45: error:
 'fmt' undeclared
Message-ID: <202410221938.G3HJVLlx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7436324ebd147598f940dde1335b7979dbccc339
commit: 3e99aee7ce48f504c4a7b0e3c46656c8c55731f4 [5847/6080] sched-ext: Use correct annotation for strings in kfuncs
config: arm-randconfig-002-20241022 (https://download.01.org/0day-ci/archive/20241022/202410221938.G3HJVLlx-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241022/202410221938.G3HJVLlx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410221938.G3HJVLlx-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:63:
   kernel/sched/ext.c: In function 'scx_bpf_exit_bstr':
>> kernel/sched/ext.c:6741:45: error: 'fmt' undeclared (first use in this function)
    6741 |         if (bstr_format(&scx_exit_bstr_buf, fmt, data, data__sz) >= 0)
         |                                             ^~~
   kernel/sched/ext.c:6741:45: note: each undeclared identifier is reported only once for each function it appears in
   kernel/sched/ext.c: In function 'scx_bpf_error_bstr':
   kernel/sched/ext.c:6762:45: error: 'fmt' undeclared (first use in this function)
    6762 |         if (bstr_format(&scx_exit_bstr_buf, fmt, data, data__sz) >= 0)
         |                                             ^~~
   kernel/sched/ext.c: In function 'scx_bpf_dump_bstr':
   kernel/sched/ext.c:6794:61: error: 'fmt' undeclared (first use in this function)
    6794 |                             sizeof(buf->line) - dd->cursor, fmt, data, data__sz);
         |                                                             ^~~


vim +/fmt +6741 kernel/sched/ext.c

f0e1a0643a59bf Tejun Heo               2024-06-18  6724  
f0e1a0643a59bf Tejun Heo               2024-06-18  6725  /**
f0e1a0643a59bf Tejun Heo               2024-06-18  6726   * scx_bpf_exit_bstr - Gracefully exit the BPF scheduler.
f0e1a0643a59bf Tejun Heo               2024-06-18  6727   * @exit_code: Exit value to pass to user space via struct scx_exit_info.
f0e1a0643a59bf Tejun Heo               2024-06-18  6728   * @fmt: error message format string
f0e1a0643a59bf Tejun Heo               2024-06-18  6729   * @data: format string parameters packaged using ___bpf_fill() macro
f0e1a0643a59bf Tejun Heo               2024-06-18  6730   * @data__sz: @data len, must end in '__sz' for the verifier
f0e1a0643a59bf Tejun Heo               2024-06-18  6731   *
f0e1a0643a59bf Tejun Heo               2024-06-18  6732   * Indicate that the BPF scheduler wants to exit gracefully, and initiate ops
f0e1a0643a59bf Tejun Heo               2024-06-18  6733   * disabling.
f0e1a0643a59bf Tejun Heo               2024-06-18  6734   */
3e99aee7ce48f5 Kumar Kartikeya Dwivedi 2024-10-21  6735  __bpf_kfunc void scx_bpf_exit_bstr(s64 exit_code, char *fmt__str,
f0e1a0643a59bf Tejun Heo               2024-06-18  6736  				   unsigned long long *data, u32 data__sz)
f0e1a0643a59bf Tejun Heo               2024-06-18  6737  {
f0e1a0643a59bf Tejun Heo               2024-06-18  6738  	unsigned long flags;
f0e1a0643a59bf Tejun Heo               2024-06-18  6739  
f0e1a0643a59bf Tejun Heo               2024-06-18  6740  	raw_spin_lock_irqsave(&scx_exit_bstr_buf_lock, flags);
f0e1a0643a59bf Tejun Heo               2024-06-18 @6741  	if (bstr_format(&scx_exit_bstr_buf, fmt, data, data__sz) >= 0)
f0e1a0643a59bf Tejun Heo               2024-06-18  6742  		scx_ops_exit_kind(SCX_EXIT_UNREG_BPF, exit_code, "%s",
f0e1a0643a59bf Tejun Heo               2024-06-18  6743  				  scx_exit_bstr_buf.line);
f0e1a0643a59bf Tejun Heo               2024-06-18  6744  	raw_spin_unlock_irqrestore(&scx_exit_bstr_buf_lock, flags);
f0e1a0643a59bf Tejun Heo               2024-06-18  6745  }
f0e1a0643a59bf Tejun Heo               2024-06-18  6746  

:::::: The code at line 6741 was first introduced by commit
:::::: f0e1a0643a59bf1f922fa209cec86a170b784f3f sched_ext: Implement BPF extensible scheduler class

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Tejun Heo <tj@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
