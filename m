Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717D22139A8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 13:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739540361; cv=none; b=cjPsicNqK1860DhZ46ZWfID6bneXC5kQ7dttNN5bDLOss//SduinRp4aLngwS6A55f6HReu9yguMryrmgcfm0aX3QoSefxRu+yXnJelK25FbONSVttxjIMrcUtgZE2BcwRh/7P70dtlG8Bf6Xiw/xdyXsrtWTGvcxW0yecg3/Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739540361; c=relaxed/simple;
	bh=y1kA39e0jqS5hT76lHzjP/3zpimA6VEL8I7NwwLRDsw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pbl56b3Ci0Ow93lLUCdYSfWnc6pnPIiOA+maCkpZRN0HVuQUN8sRUH6cWXUlwTfJcgnZ9OqrgbT5oqFOI8BOimyV7BVnvw2+DF4BPZqowvJyT4LUKcRGdrlXtQo5xVhXmSGvW+MePt4LwGXHFV6hPzwyL4gIcX1vqhQKLz40pnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WEgCvSTm; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WEgCvSTm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739540360; x=1771076360;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y1kA39e0jqS5hT76lHzjP/3zpimA6VEL8I7NwwLRDsw=;
  b=WEgCvSTmAY23LuhgYp3psijtKKCYpSjG8yuRufXSSZ6Cn0Ln0LNTcPAF
   dZEFuDEM7ShUQ/aHPRmuTyV95JFtclxPmcuY0gr48Ibn9R7G04iTjfcpS
   d30TqhA8PCsu1qldxDkdvYobjl4ljKOnVo+RaDRk0esKNvTOXU1s2T8mI
   Kax/K5I4K8h3NRkj6lmLE/MuHsv4QGQBhELWMPV7w17fVC42mSTRyEnZw
   +nVSfLG2hfi4UPdNjusNCPx2F4opkMIWgYrxDxISKGt299o1MN8UzD25f
   IfIwAQ3DWoyE/73UICsX7cVvqI7LsLCU2s+j2/gYxXQtOY1WueZfVzvrg
   g==;
X-CSE-ConnectionGUID: Dn7OdNzhRyakgXii8oWlNg==
X-CSE-MsgGUID: /PLfysj9TiyP++06JdL/Zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="57695379"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="57695379"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 05:39:19 -0800
X-CSE-ConnectionGUID: rwkNDF1nQyusyLbcYiJlpQ==
X-CSE-MsgGUID: 3hg/CJH1R+a4Z/wuKlcG8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="113433886"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Feb 2025 05:39:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tivuV-0019bP-2q;
	Fri, 14 Feb 2025 13:39:15 +0000
Date: Fri, 14 Feb 2025 21:38:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 249/249] mm/oom_kill.c:753:
 warning: Function parameter or member 'tsk' not described in
 '__mark_oom_victim'
Message-ID: <202502142142.BqttRVa6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   d2ae202da688a9a795c238142e01da921b3e4b81
commit: 6e5f1821281fd8b67e7033f3a07d14d4d18588f9 [249/249] ANDROID: signal: Add vendor hook for memory reap
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250214/202502142142.BqttRVa6-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250214/202502142142.BqttRVa6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502142142.BqttRVa6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/oom_kill.c:753: warning: Function parameter or member 'tsk' not described in '__mark_oom_victim'
>> mm/oom_kill.c:753: warning: expecting prototype for tsk(). Prototype was for __mark_oom_victim() instead


vim +753 mm/oom_kill.c

   747	
   748	/**
   749	 * tsk->mm has to be non NULL and caller has to guarantee it is stable (either
   750	 * under task_lock or operate on the current).
   751	 */
   752	static void __mark_oom_victim(struct task_struct *tsk)
 > 753	{
   754		struct mm_struct *mm = tsk->mm;
   755	
   756		if (!cmpxchg(&tsk->signal->oom_mm, NULL, mm)) {
   757			mmgrab(tsk->signal->oom_mm);
   758		}
   759	}
   760	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
