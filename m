Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AE11B85FD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jun 2025 08:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750149495; cv=none; b=WC3Ruho4OsTctVKzjeQ/wSx8NTtHwdBRugj0U35b2o6Y41HxaoIiPtWtlueQTyT4MEZJ1h0tEc58vaTxxtGXHpR91l1rlL+rByjca5NV6naCLmPbwhcyXLVEv3+/yandvWZK/pe6//4JWb6fBlL/BNcEVa/SQzfSecxHk45SbbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750149495; c=relaxed/simple;
	bh=pZPMBf6XW8KOlwTImEYjkwiEBAZLYo0A4D+XNUnx2zg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=snYdCO7hWTohQfFno6SHdO78Oz6/PQXGBdSrFNwS/A3WnG8NLL6xUI3qV3anOIK5+418sJXcG6z4WusY0CNBZ7qLmTnnNln2VfoGBnQ3O9S8qRGBXwxphcJfaUWYACnbXP967A5425oyEd9W57NrNLI51YtJr7WY6FhaTv1woUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ii9qGtHr; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ii9qGtHr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750149493; x=1781685493;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pZPMBf6XW8KOlwTImEYjkwiEBAZLYo0A4D+XNUnx2zg=;
  b=Ii9qGtHrLpZJ/7A5syT2C4nKz9hF4jKf4xXEirWguW+WeDfYuZGEnzfK
   +nuqOsjtZotl6GHpk89qrCAc6TI3XkV+r5EocRqpusk/QiDuVvxjqHuGa
   V6AlCh0QQ+YImKQjE8PZJZAiYu1okyqFemEK7fZ2PUWYxFe/iGz+OL+U1
   mkjmfLE4LGUJnLAny4Y1m/PASu2lEm7SzaumlvgHzO/EtFELw/ykgMNz3
   EDyrog8tQDTkoUU4czPAs0aS7iba1NU2QI41P5OaIcVrjcduxsWWiQUz8
   64VbpV95JsqAQOt51pHgd1oZ1jrnXiWfOJZBEZUZt+UUN/h6w/cj2x2Pr
   g==;
X-CSE-ConnectionGUID: +6CG7tjBQ16RbKztx/t/Cw==
X-CSE-MsgGUID: zaj9EJUsRKuvUKp0UmhV9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="77712758"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="77712758"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 01:38:12 -0700
X-CSE-ConnectionGUID: ejpR7jA0T56g7H4gGaHhmg==
X-CSE-MsgGUID: qYBWOkzUTQOdn8i4l0DEiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="153667484"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Jun 2025 01:38:06 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRRpT-000FmG-2g;
	Tue, 17 Jun 2025 08:38:03 +0000
Date: Tue, 17 Jun 2025 16:37:59 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/25] mm/unevictable.c:160:6: warning:
 no previous prototype for function 'del_unevict_task'
Message-ID: <202506171650.fQKRXxqP-lkp@intel.com>
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

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   52f058371994dd007ac842b38bab3e576e84ab5a
commit: 9fccd3992b49b1773fb24a20db0102fc49590248 [0/25] anolis: mm: unevictable: adjust three key functions
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250617/202506171650.fQKRXxqP-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.73.0 (cc66ad468 2023-10-03)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250617/202506171650.fQKRXxqP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506171650.fQKRXxqP-lkp@intel.com/

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
