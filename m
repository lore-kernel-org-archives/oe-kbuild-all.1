Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08262046BA
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Nov 2025 20:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762287011; cv=none; b=JQSbGNWWOrm3i877MUqNUSPovb8Mz9gDtOup9/qqidc5a85cCqfHDvSbUbqlmid+lwW+4beoVbfdrIbAS0kRr/74vH9Yz3YGGVSWOJ4GeiETVN9I27D0W/MIwNOiL7IC+81cUEiLYaSHC0paeNld/87fK1nr8umJRbaCBGo5J88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762287011; c=relaxed/simple;
	bh=+dzNEruzawD16Wov2v6px1/Uq16YfTIBTEtHvvPwhKw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O7LHJjLguKSPYp5yavsJ3cJ0Efms0ZR9RxpVmOG9tc+VcSiDuMpNPILjJIMkAGcdzKJbyxsjhBqbD47I0yIMEjgI9PbKKe8Flq69ASf00FJf3wLzdf3kpXwRGFz5hktqG8lvBOmV8PO/leNB/STjq+UTAJ70DBdjRdEqy/rV+5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jr/Gml/t; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jr/Gml/t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762287009; x=1793823009;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+dzNEruzawD16Wov2v6px1/Uq16YfTIBTEtHvvPwhKw=;
  b=Jr/Gml/tDy+prKP2VEqvmeqQUbCo+JSTZWEQ5Irk/guW9TGjyb6wrHxA
   ZW09g+M9bzbJmBL2TBZGSjAvc7pFURyFfgnLVG8SoJ4+593oFCYCAG9g4
   BH/dMCcfhdlkwkgJ3PckF0CVHfMiz3KBxAgsxxvg4wqH7ZJHgWjJ15ie1
   ycFsj0cgLsKu3BwzhpW7FX742bjWOu4sOoA5mOrJR/8Z/lXx2BSRvOb2y
   bgTZ60nLGfDUpyjeny1ScAEBDKTgoIG9s+QiaMR77SywWGv2J8df74tnY
   3uLVa5CzMvZfEI7TKfM6IgLdg3NhYn/eovBRyNLxoX7Vz0UWmWJxR/pLs
   Q==;
X-CSE-ConnectionGUID: dfEiBdhYQqK6ay1pu01VrQ==
X-CSE-MsgGUID: iJqOL9WLShSANDIwtJ1wuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="63402977"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="63402977"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 12:10:09 -0800
X-CSE-ConnectionGUID: Gr9Oo1+MSuqK6vjW+Kvkkw==
X-CSE-MsgGUID: w36Wo1i9TLqo5n+w2nNLLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; 
   d="scan'208";a="192419617"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 04 Nov 2025 12:10:08 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGNLm-000RnI-0Z;
	Tue, 04 Nov 2025 20:10:02 +0000
Date: Wed, 5 Nov 2025 04:08:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3098/3098] kernel/bpf-rvi/common_kfuncs.c:97:18:
 warning: no previous prototype for 'bpf_seq_file_append'
Message-ID: <202511050410.2c1BvP2L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   faa195bad3afed3c326917fb4cd36e0bd311220c
commit: 1afa15e45da121993a15941b08fef5e3d58f40e5 [3098/3098] bpf-rvi: Add bpf_seq_file_append() kfunc
config: x86_64-randconfig-001-20251104 (https://download.01.org/0day-ci/archive/20251105/202511050410.2c1BvP2L-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511050410.2c1BvP2L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511050410.2c1BvP2L-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf-rvi/common_kfuncs.c:20:32: warning: no previous prototype for 'bpf_mem_cgroup_from_task' [-Wmissing-prototypes]
      20 | __bpf_kfunc struct mem_cgroup *bpf_mem_cgroup_from_task(struct task_struct *p)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:29:35: warning: no previous prototype for 'bpf_task_active_pid_ns' [-Wmissing-prototypes]
      29 | __bpf_kfunc struct pid_namespace *bpf_task_active_pid_ns(struct task_struct *task)
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:34:17: warning: no previous prototype for 'bpf_pidns_nr_tasks' [-Wmissing-prototypes]
      34 | __bpf_kfunc u64 bpf_pidns_nr_tasks(struct pid_namespace *ns)
         |                 ^~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:48:17: warning: no previous prototype for 'bpf_pidns_last_pid' [-Wmissing-prototypes]
      48 | __bpf_kfunc u32 bpf_pidns_last_pid(struct pid_namespace *ns)
         |                 ^~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:77:18: warning: no previous prototype for 'bpf_si_memswinfo' [-Wmissing-prototypes]
      77 | __bpf_kfunc void bpf_si_memswinfo(struct bpf_sysinfo *bsi)
         |                  ^~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:87:27: warning: no previous prototype for 'bpf_page_counter_read' [-Wmissing-prototypes]
      87 | __bpf_kfunc unsigned long bpf_page_counter_read(struct page_counter *counter)
         |                           ^~~~~~~~~~~~~~~~~~~~~
>> kernel/bpf-rvi/common_kfuncs.c:97:18: warning: no previous prototype for 'bpf_seq_file_append' [-Wmissing-prototypes]
      97 | __bpf_kfunc void bpf_seq_file_append(struct seq_file *dst, struct seq_file *src)
         |                  ^~~~~~~~~~~~~~~~~~~


vim +/bpf_seq_file_append +97 kernel/bpf-rvi/common_kfuncs.c

    91	
    92	/*
    93	 * Stat related kfuncs
    94	 */
    95	
    96	/* Moving src's content to the end of dst. Reference: seq_vprintf. */
  > 97	__bpf_kfunc void bpf_seq_file_append(struct seq_file *dst, struct seq_file *src)
    98	{
    99		/*
   100		 * ->count: length of content
   101		 * ->size: available buffer space
   102		 * i.e. seq_printf(dst, "%s", src->buf)
   103		 */
   104		if (dst->count < dst->size)
   105			if (src->count < dst->size - dst->count) {
   106				memmove(dst->buf + dst->count, src->buf, src->count);
   107				dst->count += src->count;
   108			}
   109	}
   110	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
