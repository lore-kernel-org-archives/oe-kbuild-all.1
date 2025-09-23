Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F069B111A8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Sep 2025 02:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758594768; cv=none; b=rAG9P8AmuuoJHjzrDvhTpliy9Th0rszoCaaPDOn3t0tnhnFn7b1QNKHKX/YvTgvmVMKom4tra32haq/HgWAz77imLzHfehcc0KfySaD15Wgk1ciUl1+w8Ecbb7nXmh3RONtjkDM/vWGPCrj4diu7w0qY2NcOtzrMCevSH++AUAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758594768; c=relaxed/simple;
	bh=EyCdLM7LQX16r3lTs8P942UlxakZoRf9GXxfcRqGu2w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AVQwZJ/aZbKhQMcsGBkauvICr12vWqTK86sdoDcFCku73tNJY/rnGTc92R4s8+eZIK9vo+m6XPF94u7vtsect+A0OOWY4jH7r5jzgHWbgqBMI5qWRNBXfJI7Z4a23VCaw/b1ow7nJV3r96P0b0BzmjavSwytPUKufB8KwONJwMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GakwIlyD; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GakwIlyD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758594766; x=1790130766;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EyCdLM7LQX16r3lTs8P942UlxakZoRf9GXxfcRqGu2w=;
  b=GakwIlyDbd5MhbSJ9gfHb7NxEhq/YCefYJCLvn8F72mvAgXPg9A8EuK/
   xoRYU4695z8RAV/2mbunVW523n2q4LDivX8cmsky89zHw5xSSzAVuT4RI
   7ol1SAY6zlS2K8UUs47lKOq2XuOFkLtz4ySxAW8VDOraEUFi8fPz+CU9u
   flfUmVj6VxsyTCBNvGL5zzIpoaZpLtMCOQzvz0D00v+2xz8+3WBIHY6hE
   Nj6VQHN6//vH1izxJ2iljDKR75a6we9Rj/O+n6BkcLG+NDCwx/vmNVPyt
   f2tXnMJPlxO9ETN12T7r3YAiiK/0VPVNZVdL6jhEqVZ+dLxgt0OjCcjdT
   A==;
X-CSE-ConnectionGUID: SbZ9WfL+TJutQc7n+pGcKA==
X-CSE-MsgGUID: nszavzVATlu5hiA7vIYvCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="86303364"
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; 
   d="scan'208";a="86303364"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 19:32:45 -0700
X-CSE-ConnectionGUID: 6rXBM+wwRYuDdchWN4mv2g==
X-CSE-MsgGUID: lSshCgwsSLqWSllgCzzr8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; 
   d="scan'208";a="175919631"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 22 Sep 2025 19:32:44 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0spd-0002gA-15;
	Tue, 23 Sep 2025 02:32:41 +0000
Date: Tue, 23 Sep 2025 10:32:07 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ze Zuo <zuoze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2909/2909] mm/mem_sampling.c:35:1: sparse:
 sparse: symbol 'mem_sampling_record_cb_list' was not declared. Should it be
 static?
Message-ID: <202509231035.kkQxDq6u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a159deb279dfe156316d8c3957dc7f253686ff83
commit: cc5f4f44852f9eb4feb22a40cbb4e3d1b10c36a0 [2909/2909] mm_monitor/mm_spe: Add PMU based memory sampling abstract layer
config: arm64-randconfig-r121-20250923 (https://download.01.org/0day-ci/archive/20250923/202509231035.kkQxDq6u-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250923/202509231035.kkQxDq6u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509231035.kkQxDq6u-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/mem_sampling.c:35:1: sparse: sparse: symbol 'mem_sampling_record_cb_list' was not declared. Should it be static?
>> mm/mem_sampling.c:37:6: sparse: sparse: symbol 'mem_sampling_record_cb_register' was not declared. Should it be static?
>> mm/mem_sampling.c:54:6: sparse: sparse: symbol 'mem_sampling_record_cb_unregister' was not declared. Should it be static?
   mm/mem_sampling.c:67:6: sparse: sparse: symbol 'mem_sampling_process' was not declared. Should it be static?

vim +/mem_sampling_record_cb_list +35 mm/mem_sampling.c

    30	
    31	struct mem_sampling_record_cb_list_entry {
    32		struct list_head list;
    33		mem_sampling_record_cb_type cb;
    34	};
  > 35	LIST_HEAD(mem_sampling_record_cb_list);
    36	
  > 37	void mem_sampling_record_cb_register(mem_sampling_record_cb_type cb)
    38	{
    39		struct mem_sampling_record_cb_list_entry *cb_entry, *tmp;
    40	
    41		list_for_each_entry_safe(cb_entry, tmp, &mem_sampling_record_cb_list, list) {
    42			if (cb_entry->cb == cb)
    43				return;
    44		}
    45	
    46		cb_entry = kmalloc(sizeof(struct mem_sampling_record_cb_list_entry), GFP_KERNEL);
    47		if (!cb_entry)
    48			return;
    49	
    50		cb_entry->cb = cb;
    51		list_add(&(cb_entry->list), &mem_sampling_record_cb_list);
    52	}
    53	
  > 54	void mem_sampling_record_cb_unregister(mem_sampling_record_cb_type cb)
    55	{
    56		struct mem_sampling_record_cb_list_entry *cb_entry, *tmp;
    57	
    58		list_for_each_entry_safe(cb_entry, tmp, &mem_sampling_record_cb_list, list) {
    59			if (cb_entry->cb == cb) {
    60				list_del(&cb_entry->list);
    61				kfree(cb_entry);
    62				return;
    63			}
    64		}
    65	}
    66	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
