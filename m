Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAC130C37D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Sep 2025 07:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757490169; cv=none; b=M2AlqAJzUljg8r6UCvgQ8C0Z1Uek7rWngS5212WKcO8YHaWn3w3D0ALXkNCfqF58t48lt3lQ5AtQWYvZDM1YogIQX/VIMyhUi0LKEk1Mv3U1zz5rzFMbbWws01BE58VeqF7mPk7x9+r4hTCkAbUDDU8n0Ywrvx40sXqfDYkW6qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757490169; c=relaxed/simple;
	bh=EequveTKwxAA+Cjw3/30r3Q6SKusSxLg+LGf3sY03pU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iH5PFf+hIrNRTGtxNt09+eneddgwSELqBgqf6z2dL2z12rPAeKI4aMdEMzlvNc2OYillT828vUEXjqtREON4V2j1KMfEVUg/SOa0qs8S7yqxu4YycDC2R1geo+Bchcu5Cv0zaKrIgVu0rUswK2lk3gZPW6yIafPFt+z3J16W0F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hjEX4V1n; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hjEX4V1n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757490168; x=1789026168;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EequveTKwxAA+Cjw3/30r3Q6SKusSxLg+LGf3sY03pU=;
  b=hjEX4V1nWF3wfBJaKrTDNT7hL5Lhh4uDTuVNgAAB3mt+vb4DWr2Q8jKr
   lQFIqRrgxPGQFjEdvLdIn2w8H+EXc3nhUP3R+uensws2uZRk70o6538gj
   9q3Wnf2Tj1k679PshmkMG9GCkKq22yQMuqRivJWbOMEJNyGKq63rrWVm/
   6eCs4SoRVInMbHDts0lh1Lb4rhXU/iyOw/KSyXauqeUIMJ4NYn9XKKrsL
   ivlMkHtqCjkgEeQMjWbpbrmjrOBjVUNSN7cEfWsHjQ8xgKA2WThmWTiFa
   3YjFNdV/DJQEA9CRsmtOr01iXK6GK8qQVR8UVPrv8/VWLG0HvZ9t5awxy
   Q==;
X-CSE-ConnectionGUID: i1Ao4ifsSbOH+b3iDrHxZA==
X-CSE-MsgGUID: AanlqwirR4292mRF2ccxYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59855265"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59855265"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 00:42:47 -0700
X-CSE-ConnectionGUID: s78BZSpuQKuuB7NEAjKsxg==
X-CSE-MsgGUID: FDShaDf5Ryif9FlceRXPIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; 
   d="scan'208";a="178518145"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Sep 2025 00:42:45 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwFTX-0005eV-0G;
	Wed, 10 Sep 2025 07:42:43 +0000
Date: Wed, 10 Sep 2025 15:42:05 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 47/47] mm/unevictable.c:160:6:
 warning: no previous prototype for 'del_unevict_task'
Message-ID: <202509101539.b3cQ9mBg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   74ccdef35856059981fff496fcd63f81e901fc17
commit: b9a2e0d8ac85271df6a10641da7513f8e44611d8 [47/47] anolis: mm: unevictable: adjust three key functions
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250910/202509101539.b3cQ9mBg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250910/202509101539.b3cQ9mBg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509101539.b3cQ9mBg-lkp@intel.com/

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
