Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B336E46B5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Sep 2025 23:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759273794; cv=none; b=Mp2ktFqQWf2cLqRw8nnKjQt+vPep1exTyz3VeE/EZ57ndgugxUv2Hn7Ixab0DvtiDuRNsLjYhVxl2MxlyntFyTJxjUvAnems/RIOx0h50ZTGhMysjpnLTT09gdqHUS85JX950N2DvS/Oj7E6X9xE0C2fEG66Vm2yZnxA22iiDz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759273794; c=relaxed/simple;
	bh=xF80inoNdXkSwSY11gC51c0Q9Er3oeE2AinOxwH23II=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZgAvJdMTVSPs8L1jLYTWtCF+MUfUpY43iiWlcqGasy5gcoQ3qY4dqQrGfySNUm1QVtZY856OwynLVshd0VHtFkH8z71s9qotnrsnCUI5VJftCfC1ZqnSWjZPcZVUDpoSxZJ9vjyPkAlxJCczFp2p5uvrReGGdQJGxFmBp9utWAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JSZCeCbI; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JSZCeCbI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759273792; x=1790809792;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xF80inoNdXkSwSY11gC51c0Q9Er3oeE2AinOxwH23II=;
  b=JSZCeCbIXQ9v2e1QzJMbaHt/fl+r12oAQX1hEtLfBqXG0OI8VzmIQnE1
   koJLFJ+GXtx5Quc4s3f7CWdImYbeXFQomv2HvesLT56k4qvsO+tCKAh7E
   7xtSz0phqlahJL7J+7G0vFPSNvzecdztUw21Iz4zj6tW7H6Ik9UQCC2rt
   Wpu3DxPYWkaD8e9KPwI+eLpIpjKSYZfPVusqPFcjNNAkQXmd35Kzc3mWK
   +kphIQGNSpudbZW4hnnpoXxl9Kg1W1P8oXb8/Cqpf2l9peIQTbQE9iizq
   H2JQkdW0YRV8m37IEr21+H0uvLlyO6xuTyPSd73E19f/ywkpmNve/8Mlx
   w==;
X-CSE-ConnectionGUID: VPhYhZL1R3eiF7pu8eUUJQ==
X-CSE-MsgGUID: KappDmZnQfmEAg+gA3xnCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="60577937"
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; 
   d="scan'208";a="60577937"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2025 16:09:50 -0700
X-CSE-ConnectionGUID: oTmm5JrMRsaCvm3w/5VacA==
X-CSE-MsgGUID: wewtb9tlRfaHVzKdEs+vKw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 Sep 2025 16:09:49 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v3jTf-0002Xn-1C;
	Tue, 30 Sep 2025 23:09:47 +0000
Date: Wed, 1 Oct 2025 07:09:44 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 2/2] mm/unevictable.c:156:6: warning:
 no previous prototype for function 'del_unevict_task'
Message-ID: <202510010721.H5xE82iC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Xin,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   6e46858a22077fce652e4757d5624bf5816c6639
commit: bba8483e73c9dae0b5c67f8143dc8f922a07580b [2/2] anolis: mm: unevictable: adjust three key functions
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251001/202510010721.H5xE82iC-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251001/202510010721.H5xE82iC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510010721.H5xE82iC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/unevictable.c:156:6: warning: no previous prototype for function 'del_unevict_task' [-Wmissing-prototypes]
     156 | void del_unevict_task(struct task_struct *tsk)
         |      ^
   mm/unevictable.c:156:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     156 | void del_unevict_task(struct task_struct *tsk)
         | ^
         | static 
   1 warning generated.


vim +/del_unevict_task +156 mm/unevictable.c

   155	
 > 156	void del_unevict_task(struct task_struct *tsk)
   157	{
   158		struct evict_pid_entry *result;
   159	
   160		if (!tsk) {
   161			struct evict_pid_entry *pid_entry, *tmp;
   162	
   163			mutex_lock(&pid_mutex);
   164			list_for_each_entry_safe(pid_entry, tmp, &pid_list, list) {
   165				rcu_read_lock();
   166				tsk = find_task_by_pid_ns(pid_entry->rootpid,
   167						&init_pid_ns);
   168				rcu_read_unlock();
   169				if (!tsk) {
   170					list_del(&pid_entry->list);
   171					__remove_entry(pid_entry);
   172					kfree(pid_entry);
   173				}
   174			}
   175			mutex_unlock(&pid_mutex);
   176			return;
   177		}
   178	
   179		mutex_lock(&pid_mutex);
   180		result = lookup_unevict_entry(tsk);
   181		if (result) {
   182			list_del(&result->list);
   183			__remove_entry(result);
   184			mutex_unlock(&pid_mutex);
   185			__evict_pid(result);
   186			kfree(result);
   187		} else
   188			mutex_unlock(&pid_mutex);
   189	}
   190	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
