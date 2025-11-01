Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C7B1FDA
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Nov 2025 22:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762035155; cv=none; b=j+8B7ZajhKv0x6PajCQplsOrVN0+wgZcIv6ix+7DQB+SewlL/AljF3MOxulislzCN/UuoJTB9OQiVKeohfse44pZL2UKT6+dLU/j6n3kLi0MHQOpnWOdJySyWTYT5U+mqS22nxAg/mY047IxM88MIXILlYaYbVNOlsk1J9qgcVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762035155; c=relaxed/simple;
	bh=c9t1olyV9HxGUasjn1kN/1IAmLjtVC6uhjPy5J4gCFE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TiFD0XYDmzDRUrnnAjnbJrwlCISKGeiy1TpUK+ALEY8GDhwiS9N/FE/vyjXppjQhs9pZjrhv0BglyoZeoIbAqQMCmvMW2JqyhjcJHfMjmeIZuAYd4HCBIaXMx7QLNcrSMBsOl/cTnGs5QQ1TNob4hGQ/9WojwcXcOnZ37CJ8OWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MBDJT3sQ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MBDJT3sQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762035153; x=1793571153;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c9t1olyV9HxGUasjn1kN/1IAmLjtVC6uhjPy5J4gCFE=;
  b=MBDJT3sQeEooY4Hxdpg2/d6iGcFsLRhg1Rj8Nt/we3Y3+gk9XNE/QMyV
   x/uFyTkt9PsmKK8wlT4K5nLR+2T0T1zUFSnM4z0JcCVu33pxwxbKlobM9
   MpJcSEftq/Gdmex1y79YwRTJIHmEe8QQI/Nul4NW8GFFqvFxTYuYrcfk2
   uZAPorQJwaHqn1M7HEif2EEtz+TquLVToIuVLqkJ7bjmal1nT+Y2cxvQk
   JmU9E+qpCZgmWAvESKTjgX1Zn36HuJhYI0sWbz6W4DNeBl+pRNplaZMjh
   lTXleriM5JXXyRo6aFWwJ/HqG7zTaIlw5+ecFtmu+yRm9jJHubB3KQ8o6
   A==;
X-CSE-ConnectionGUID: X/ZncEjdTcOIKe9dyiFsDA==
X-CSE-MsgGUID: NJUx5gXhRT6xbik5AvtkhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="81574475"
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="81574475"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 15:12:32 -0700
X-CSE-ConnectionGUID: xpPt3R+gQD2NhLEa4d9k8Q==
X-CSE-MsgGUID: BMwYvQWDSFaOOaoMRYdsqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="210079223"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 01 Nov 2025 15:12:32 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFJpl-000Oiu-33;
	Sat, 01 Nov 2025 22:12:29 +0000
Date: Sun, 2 Nov 2025 06:11:47 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 16/16] mm/unevictable.c:156:6:
 warning: no previous prototype for function 'del_unevict_task'
Message-ID: <202511020650.vrKU2u7H-lkp@intel.com>
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
head:   7103f9d5c75b142fc88eb149bc55d2e8c8ed76f3
commit: bba8483e73c9dae0b5c67f8143dc8f922a07580b [16/16] anolis: mm: unevictable: adjust three key functions
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251102/202511020650.vrKU2u7H-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project cc271437553452ede002d871d32abc02084341a8)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251102/202511020650.vrKU2u7H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511020650.vrKU2u7H-lkp@intel.com/

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
