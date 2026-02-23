Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C591BC46
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Feb 2026 20:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771878769; cv=none; b=B3s47GgB1P3DMZmBe3lUToplPjBdKQG3QQjsw8MC7LGY4BFFosVOWZmZ24mSRSo74YERKw1axKpEvAM/dhZMl5TuiJKAUgCKCERVKXA2oYH5Q9WKLASmsL2CZVYTUsjBPFcthKJeMvKqmYnt471E7FHAXqWYFESTqOZVf1z6DA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771878769; c=relaxed/simple;
	bh=6LRf6luC58CIR1vsepvYrZwpD6zQRYC7lg2Hj06/Mz4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jZBIykMjW+LekZTExUt+aJkChn0BX2zbfK84P8OVRInnBTHu2PaPV0N31JkwJjSIijbzAACkvo9oz4W8lszJH/B6E/X4kEXBfwVFro3l0+VvLMkAUhjOAT73z/x8NxQYZ+aXQ0913dgqxqteazTw5d8W6M8AwoRuH68Gg/GoN34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QWwGEl9V; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QWwGEl9V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771878767; x=1803414767;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6LRf6luC58CIR1vsepvYrZwpD6zQRYC7lg2Hj06/Mz4=;
  b=QWwGEl9VdJLVOk1ANBvICkKxEKG7ERm9/tfo1X2M6z6hdovy0XOP7uQ0
   PG85uL9oXd+E34/it1H/8RH3k3zbDyehgVQxprPtvSFOgaV6SkRlwYDZp
   Nv7So+Otc9K/fsLGGeKPwgZ3dLjVba59zurDjuRijQwb6qlBfK5HYL1nC
   t5PpgGPf6bDoKUtTz6PNWCLy6zCQENWwzyJZ+00bfMrvZ/1dD/9bGypJb
   wzW31MKkWDGflUOH46l9RyeKmQC8b/ui2wTDnXeRVvUe1vMHytdTLu42m
   22s17XM39MFbTvrW93YFH5UpYTiFnb1IoLkQPicGJhSvmzgeOZKImUDFz
   A==;
X-CSE-ConnectionGUID: jpy3l5L3SZOh7sHwyIhCPg==
X-CSE-MsgGUID: Qnm1c7ooTV6wydYgSNOpdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="84248089"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="84248089"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 12:32:46 -0800
X-CSE-ConnectionGUID: uQzbOfwRRJWuQvezqTatpA==
X-CSE-MsgGUID: J+oWczlITAuSfou4OAtWMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="213568991"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 23 Feb 2026 12:32:44 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vucbF-000000000kx-35NU;
	Mon, 23 Feb 2026 20:32:18 +0000
Date: Tue, 24 Feb 2026 04:29:01 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-timens-decoupling 3/3]
 include/linux/time_namespace.h:170:20: error: static declaration of
 'timens_commit' follows non-static declaration
Message-ID: <202602240435.fEIzGO0v-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-timens-decoupling
head:   55f9453595003a8f348722b205fa879337d2f9e6
commit: 55f9453595003a8f348722b205fa879337d2f9e6 [3/3] timens: Remove dependency on the vDSO
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260224/202602240435.fEIzGO0v-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260224/202602240435.fEIzGO0v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602240435.fEIzGO0v-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from init/main.c:106:
>> include/linux/time_namespace.h:170:20: error: static declaration of 'timens_commit' follows non-static declaration
     170 | static inline void timens_commit(struct task_struct *tsk, struct time_namespace *ns)
         |                    ^~~~~~~~~~~~~
   include/linux/time_namespace.h:43:13: note: previous declaration of 'timens_commit' with type 'void(struct task_struct *, struct time_namespace *)'
      43 | extern void timens_commit(struct task_struct *tsk, struct time_namespace *ns);
         |             ^~~~~~~~~~~~~
--
   In file included from kernel/time/namespace.c:7:
>> include/linux/time_namespace.h:170:20: error: static declaration of 'timens_commit' follows non-static declaration
     170 | static inline void timens_commit(struct task_struct *tsk, struct time_namespace *ns)
         |                    ^~~~~~~~~~~~~
   include/linux/time_namespace.h:43:13: note: previous declaration of 'timens_commit' with type 'void(struct task_struct *, struct time_namespace *)'
      43 | extern void timens_commit(struct task_struct *tsk, struct time_namespace *ns);
         |             ^~~~~~~~~~~~~
   kernel/time/namespace.c: In function 'clone_time_ns':
>> kernel/time/namespace.c:96:11: error: 'struct time_namespace' has no member named 'vvar_page'
      96 |         ns->vvar_page = alloc_page(GFP_KERNEL_ACCOUNT | __GFP_ZERO);
         |           ^~


vim +/timens_commit +170 include/linux/time_namespace.h

   165	
   166	#ifdef CONFIG_TIME_NS_VDSO
   167	extern void timens_commit(struct task_struct *tsk, struct time_namespace *ns);
   168	struct page *find_timens_vvar_page(struct vm_area_struct *vma);
   169	#else /* !CONFIG_TIME_NS_VDSO */
 > 170	static inline void timens_commit(struct task_struct *tsk, struct time_namespace *ns)
   171	{
   172	}
   173	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
