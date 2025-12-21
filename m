Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925502F616B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 17:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766339562; cv=none; b=EADcu8hlC1b680XDXeL89zCqeJh4DXrPP6tw+zQRV95l0sylNYoN3/4YiCVQCWFgz9lqJqRiDSrImOxIKou88/DyiRmiuuKVf/N/0Y+UlzT/+nkadspjlc28Ka1UGLiYKsyrRuTa9H0ItMRyHVOzcKGrh4r+IckZp+57IOcWkTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766339562; c=relaxed/simple;
	bh=D5FD1lKIBBbO1KHKz/ypmV26+VT4E9vdIxDLJV8gouI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZjxuNG1PfvwcIDKZJ8pl/Ml+BH316v33Ue9Y0m2Gc7+tiNi5caQlSEKT+kauH/Fie7g8APDNNqfVEjHEFwyC3CNaDdw047KN37CbntfQLqV4YG3OL0zsWODZsbPvFA9tY7bqfCKkaQJRunBRT0rOcZG2EBHKKxG5eH1ogK7bYO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JeKHzGPH; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JeKHzGPH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766339559; x=1797875559;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D5FD1lKIBBbO1KHKz/ypmV26+VT4E9vdIxDLJV8gouI=;
  b=JeKHzGPHeG4ix2Ervqfo5kK6qIG/CSfByEP25BR5jFWZNKAAfkWtvYfs
   /cGzGxmzRbAa/P6Zyvcn/nE1zExZvj0TfE7BQMqW5kID+Ed2U0m4E8Vzc
   iTStF0s36oat4KyU1p7gilS+U99Jbu9bqyCbiiqSeqBJnqbQ9e/6ZLo3A
   /UIUn5Yl8v9MGKyVmbN/tamAUAqRWY8Jwyhigqk7JrXY5pdFiMXBNN6mm
   F/9RSWhms6NPqkhG1wm40MIwdL9xrQOKxGCzjU7qguoav7ANP4/verK+2
   Q0DgB6ItGj0kLM9QZyxfnhtFsbTROw3sM5EuzlQ2Q6HYi9Bu4N1LOY8lh
   g==;
X-CSE-ConnectionGUID: 6Mr9k090SSaENb66QaQORw==
X-CSE-MsgGUID: bb0lUhF9RCuZ7EVw0r6kAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68094927"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="68094927"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 09:52:37 -0800
X-CSE-ConnectionGUID: 34G8B0fFSACBeIgD4inobA==
X-CSE-MsgGUID: fuqFWHIJTSyp/RSXW0qD6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="229997492"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 21 Dec 2025 09:52:36 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXNbd-000000005ur-2Hnz;
	Sun, 21 Dec 2025 17:52:33 +0000
Date: Mon, 22 Dec 2025 01:52:31 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-DMR-PMT-enhancement-ANBZ27534 38/38]
 mm/unevictable.c:160:6: warning: no previous prototype for
 'del_unevict_task'
Message-ID: <202512220115.MuxAZBIX-lkp@intel.com>
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

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-DMR-PMT-enhancement-ANBZ27534
head:   8fd16e3e83fed920d6bd6c026a7d3e5be5fe0f9c
commit: b9a2e0d8ac85271df6a10641da7513f8e44611d8 [38/38] anolis: mm: unevictable: adjust three key functions
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20251222/202512220115.MuxAZBIX-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512220115.MuxAZBIX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512220115.MuxAZBIX-lkp@intel.com/

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
