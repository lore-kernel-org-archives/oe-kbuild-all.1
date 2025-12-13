Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E7C169AD2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 14:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765634677; cv=none; b=Et6g7o/C/f8+R8snC1B0TQY2s7bJLu0jxrEu0Xji0mOmccmGlm5Yd4GPHvPwIIzEQDIAaJMB7o4rkc8fLLOS2WHW8Rd2KVHKXpydXw1nD6z3SU9DefUDA7m7tZt3agsOFS4tztpaGHC8Eg1sJsZLTW0gRmhmnxQHBHIl24DfJFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765634677; c=relaxed/simple;
	bh=y+6eSV9aQydeuU5AXGez7v/t0IyuX/KEkQuYIjCCOBY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V0Witc4hxb5lU2IW0WS2rg/czTUH0M8jFnNxQdaSRN6QvR2M3S2Fqdp0OuTCewSLO0+y+Bpq/DlmMumMUUr6zafdfjifqga5Qm65upHp0kCZ9ywpWP6oE76JKQz/nkGeiFxMg7xfSRGa7x/Bd9v9oyXavQWFlecS20vAswuTIAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h/QLeYzH; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h/QLeYzH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765634673; x=1797170673;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y+6eSV9aQydeuU5AXGez7v/t0IyuX/KEkQuYIjCCOBY=;
  b=h/QLeYzHhx/yK1Uq+Z5IeS2Yfj6Wf/CBuloiO/8KcQoM1W52abTu7OHM
   GwPja4op7XWWcPL3RNUNcYaiZBRNpV8Cmc2XvFGADcwrG8SQe9lgxZurS
   mViVBru6/v3bU9Hk6UCtZ9iUwQswOMY/83NyjNl0HQI2BjOBC0YRUyBwO
   hfv4TpzBzCUc+yYvyTYL6iakM+ciexFa1OIh0WycqVyWFzptkFglVoJJo
   oSDFDWerfU9N7i7mP9ye3kcl3YMVcckEi8Gc3AYCoPNB6CHcYSQcKWjHX
   Ir7KwjFgS0ks7kQ8WET4MWUa+cHkMRXISex41YwkHy5ouJhldJ4LBPhNK
   A==;
X-CSE-ConnectionGUID: e4z14InET1COMR2P3u66lw==
X-CSE-MsgGUID: tt8R3CbaTeO3zJn6TdIrfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="71239284"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="71239284"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 06:04:32 -0800
X-CSE-ConnectionGUID: HPNT2STRRLqqZLdnJOsYOg==
X-CSE-MsgGUID: lxKYKUAWSiWVtC+Hlj2DbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="197316136"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 13 Dec 2025 06:04:32 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUQEX-0000000025Q-17ak;
	Sat, 13 Dec 2025 14:04:29 +0000
Date: Sat, 13 Dec 2025 15:04:16 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 50/50] mm/unevictable.c:160:6:
 warning: no previous prototype for 'del_unevict_task'
Message-ID: <202512131500.AbdbOiSI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   7c285f40a964b427534f3dab33b104ee9cab6245
commit: b9a2e0d8ac85271df6a10641da7513f8e44611d8 [50/50] anolis: mm: unevictable: adjust three key functions
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251213/202512131500.AbdbOiSI-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131500.AbdbOiSI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131500.AbdbOiSI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/unevictable.c:160:6: warning: no previous prototype for 'del_unevict_task' [-Wmissing-prototypes]
     160 | void del_unevict_task(struct task_struct *tsk)
         |      ^~~~~~~~~~~~~~~~


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
