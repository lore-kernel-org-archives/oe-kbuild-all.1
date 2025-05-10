Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2900010F1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 May 2025 22:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746915752; cv=none; b=QK/GwFLAZGhoqkD9FhBJnmYLqQV4UbNggxchb/m5Eu2fmV+vU35y6E/N73TT51ZOySsk0fTsqxkrz+EmpYoSifX/MuKBLEPfRRDQiiVuLGFJdm1MLzBSCJica4DVaEMsQABeXofwrPbShajYWPRCLks2i6+GQIm1KCFpJjZzp3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746915752; c=relaxed/simple;
	bh=84Q/LuEHAVtWoNz0cxglBwlMiqatc312kaL8hisuw6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VZpI0Gk7m6YhSJC8HrwM2/b+lUa3TrXgWnSV2Ak05rJVr+hJ86nYSZabkxsYhyWuIG36X0uMrjb1wYpVX7bQJ9nGemAJEO9cxN4bjRfTzWWcwGylfFIRKQvBP+AWGxXxKkrkcdcXFSzsfjydNGEIy3syPqdFEVkOOM2j+nFYETc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B/CIt9Zw; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B/CIt9Zw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746915750; x=1778451750;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=84Q/LuEHAVtWoNz0cxglBwlMiqatc312kaL8hisuw6Y=;
  b=B/CIt9Zwiza3cuhOmiIir0/NQCjxz2gbLx+6KgO76+cBWvbiIjq9OkK1
   vwuluGmyczapMG4Na2wAIMQFaSncLFZw+n/QECzbngxAgr5GGEgLvkVrK
   cm9qvmd/s654f+rYhmczQUv67OHLcIF8pfrxFzqRqQYYA+8UL4eHFgKJH
   68g2Tba3L1df7saCST72q/K/y0few6ITQXzPqUSQULb8fWIhKT0eLxZwr
   lJLwXD5+eq1NB/MLN8N0tT22O01+79IkWFKGANfSo8uuRu5FKt/rTxEaR
   9oNZFR0vffw0+Fpn7O2tGfHZcaI7kNc1HK3E0UYaAtBTy88dIy6QX3QVt
   Q==;
X-CSE-ConnectionGUID: AEKEHgXORHCJFAsWnl4SOg==
X-CSE-MsgGUID: L0gGPJ2mTYi5KvPDNCeglQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11429"; a="66138904"
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="66138904"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 15:22:29 -0700
X-CSE-ConnectionGUID: lscQ47ITTw2+0KEZPua8sA==
X-CSE-MsgGUID: 5IvkztQ1SSGc8SWOaXa3dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="141728523"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 May 2025 15:22:29 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDsaQ-000DR6-1x;
	Sat, 10 May 2025 22:22:26 +0000
Date: Sun, 11 May 2025 06:21:44 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/94] mm/unevictable.c:160:6: warning:
 no previous prototype for function 'del_unevict_task'
Message-ID: <202505110625.v08JlgBX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   5b7daba404993131fe0d699e5acdccaa5bc3a017
commit: 9fccd3992b49b1773fb24a20db0102fc49590248 [0/94] anolis: mm: unevictable: adjust three key functions
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250511/202505110625.v08JlgBX-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.73.0 (cc66ad468 2023-10-03)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250511/202505110625.v08JlgBX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505110625.v08JlgBX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/unevictable.c:160:6: warning: no previous prototype for function 'del_unevict_task' [-Wmissing-prototypes]
     160 | void del_unevict_task(struct task_struct *tsk)
         |      ^
   mm/unevictable.c:160:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     160 | void del_unevict_task(struct task_struct *tsk)
         | ^
         | static 
   1 warning generated.


vim +/del_unevict_task +160 mm/unevictable.c

   159	
 > 160	void del_unevict_task(struct task_struct *tsk)
   161	{
   162		struct evict_pid_entry *result;
   163	
   164		if (!tsk) {
   165			struct evict_pid_entry *pid_entry, *tmp;
   166	
   167			mutex_lock(&pid_mutex);
   168			list_for_each_entry_safe(pid_entry, tmp, &pid_list, list) {
   169				rcu_read_lock();
   170				tsk = find_task_by_pid_ns(pid_entry->rootpid,
   171						&init_pid_ns);
   172				rcu_read_unlock();
   173				if (!tsk) {
   174					list_del(&pid_entry->list);
   175					__remove_entry(pid_entry);
   176					kfree(pid_entry);
   177				}
   178			}
   179			mutex_unlock(&pid_mutex);
   180			return;
   181		}
   182	
   183		mutex_lock(&pid_mutex);
   184		result = lookup_unevict_entry(tsk);
   185		if (result) {
   186			list_del(&result->list);
   187			__remove_entry(result);
   188			mutex_unlock(&pid_mutex);
   189			__evict_pid(result);
   190			kfree(result);
   191		} else
   192			mutex_unlock(&pid_mutex);
   193	}
   194	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
