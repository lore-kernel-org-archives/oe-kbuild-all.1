Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC08827E060
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Nov 2025 22:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763419811; cv=none; b=h6RNUsdJzaG0cAkPsa4ag0MMUPhn07jpuaar91xKmQmcgqee12krhsQQ5ftIpFRAzsthlG+KIAbraScLkRr3OPgf65/tahfNERRWaShtatPSYtPgDguM+FoETUThesgbpBY1Uc2vhgLBRQLoQkAlVptrNi+HhyGhsIx75tvWDd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763419811; c=relaxed/simple;
	bh=DJmzreIoe9onx7CmdB3QAZebla9teeWe9EEPvW7EWbY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SeqmMQHBOjdmwUr2CQ2qqkB8JosBYJHoZuWqwlX/QFfDvag1jlcyreEy+VcC7roH+5iJuX14qEF18w/xhs35KzkcMAtYWmqjpxgySPzxzos5fPNgWZ+pwU/87Zr7ejzwLzBIez8Yz2bGQQYWDFl7Ltgjlm2xqeeMMJFylcRhazA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GSBMoNYz; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GSBMoNYz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763419809; x=1794955809;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DJmzreIoe9onx7CmdB3QAZebla9teeWe9EEPvW7EWbY=;
  b=GSBMoNYzSFK8RtkCnP2d96iFr62N+xqcQ/bY+xnNtq045nOWpIRYr+ZY
   dkvi5sQiV/X5jLAXZoqWW4cFSh9ddNnPzcYRmM0y7brCYiXZCHcK9UjFj
   yjTWhZCCmd3hrPRgBTiTO2RyCgbA834RbGNfilb95C83FhOFJtUTmYQTu
   +JFpPGeixOprVUBepvuPecyISBhgf0fz5zLTPEhcKRjNWiX9DuYTtfgwY
   jcvfpOzX1sjQ2tTGiAAtNgHVNMxb02VV0ld2lLVKyPB3Th/OrER43pMx5
   Ef/eKhT5SW3qgZjMQ+9IJqRwroy8Kgg4p2mFpW/5YIGZ0Hj6r+Lr8L85r
   A==;
X-CSE-ConnectionGUID: OTORDVi0T/KPjvfTTpV5aw==
X-CSE-MsgGUID: 24LTLBrAQI2azWdLPdafTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="76533886"
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; 
   d="scan'208";a="76533886"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 14:50:01 -0800
X-CSE-ConnectionGUID: EwukxIgNTIS69cX/I/a8KQ==
X-CSE-MsgGUID: 880OcxbuS3KqB+SryyC5Yw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Nov 2025 14:50:00 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vL82n-00017h-3A;
	Mon, 17 Nov 2025 22:49:57 +0000
Date: Tue, 18 Nov 2025 06:49:41 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 20/20] mm/unevictable.c:160:6:
 warning: no previous prototype for 'del_unevict_task'
Message-ID: <202511180635.ECUZR7u6-lkp@intel.com>
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
head:   9d34d6ebdb86ead0a87c19b7054416f8da8a0b77
commit: b9a2e0d8ac85271df6a10641da7513f8e44611d8 [20/20] anolis: mm: unevictable: adjust three key functions
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251118/202511180635.ECUZR7u6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511180635.ECUZR7u6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511180635.ECUZR7u6-lkp@intel.com/

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
