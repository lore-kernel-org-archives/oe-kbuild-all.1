Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB7337EFF4
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Apr 2026 08:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205728; cv=none; b=CzipovO/7897pDfD0ZvxaoJ5P70kyZ0cvn3DGJ4Jn1NEuT0m8HxzQ0p1AFk7aW43VQhwPFhI2zQ1nLWZpfERZzj+ppxiHkX9oTJ8M79jXRU5Rmubd9dZIx4D0KssvDOYhm3aD6jyUWqYYExAmgQ8VTXxuRgOjfTFdk0bbnt5YhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205728; c=relaxed/simple;
	bh=e8mYC+wt9NDP3xUBeUrU3a5ScOubJ6K9Nuwj42yWz2w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L6UZzwBWRLm42QIIfhxUHan1tIqk61biKsK/jf7+vWrP/eRx9gYP3SdOoAfUL8lq/bt/lYu8NJ7njaUfTqrzoT4mKAIinnP9w1awKeEXt9f+cOt0cIBShjlXf/IZ2qKz7qw5ipv+m3oTfw6YAIEAWvbnDLAUHS9MB2SVHPF2XwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MxiX23Sg; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MxiX23Sg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205725; x=1806741725;
  h=date:from:to:cc:subject:message-id;
  bh=e8mYC+wt9NDP3xUBeUrU3a5ScOubJ6K9Nuwj42yWz2w=;
  b=MxiX23SgkqM1B3gAgznJo8SdnPCztnu4z0gY1w+e0crrFCmLjw7GlO4z
   4xAaoxJczqa5DK+9djPiAorYFG8KLL8WshTDLlw4FwQXyAoZ39jkBNuCG
   v0TyJPAkEtooG1RjlwJK3QrMz40UgLaRpEHSpL+ob8wN1heAFIQTX13/m
   SYq1+f3axqLBcDrpXSEgkgFkL0JKoYjkCMWwdrpWwx3D4vMi6GatTfIz2
   +K0D7LhA8huFJ6bzOFlZJQsfghpa0r4boe2VRzvHF6SCM++eHVJBeCesn
   sMzLXEZvOKy8JVapTJGa6IKWK3NbbqqrZI4q+riPtcs6x2dH5NQCr+GCn
   Q==;
X-CSE-ConnectionGUID: jGIYYqHRTOCWg+ziF/Prww==
X-CSE-MsgGUID: vbN3Il33TKijn44swlvgYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="86973954"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="86973954"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:41:58 -0700
X-CSE-ConnectionGUID: SsRqKrW1TWqDNxs9VZlxiw==
X-CSE-MsgGUID: yRaqCEFkQp+PKfAtX8Illw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="228834236"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Apr 2026 01:41:57 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a6E-0000000012x-2cBm;
	Fri, 03 Apr 2026 08:41:54 +0000
Date: Fri, 03 Apr 2026 16:41:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2026-04 1/1]
 mm/oom_kill.c:756: warning: Function parameter or member 'tsk' not described
 in '__mark_oom_victim'
Message-ID: <202604022252.8PnlnFSW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6-2026-04
head:   1a029ed73e0c73261faa5c9cfc848e08ce285151
commit: d21d65620152112514a6c0f868d04acc91deaa32 [1/1] ANDROID: signal: Add vendor hook for memory reap
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260402/202604022252.8PnlnFSW-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260402/202604022252.8PnlnFSW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604022252.8PnlnFSW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/oom_kill.c:756: warning: Function parameter or member 'tsk' not described in '__mark_oom_victim'
>> mm/oom_kill.c:756: warning: expecting prototype for tsk(). Prototype was for __mark_oom_victim() instead


vim +756 mm/oom_kill.c

   750	
   751	/**
   752	 * tsk->mm has to be non NULL and caller has to guarantee it is stable (either
   753	 * under task_lock or operate on the current).
   754	 */
   755	static void __mark_oom_victim(struct task_struct *tsk)
 > 756	{
   757		struct mm_struct *mm = tsk->mm;
   758	
   759		if (!cmpxchg(&tsk->signal->oom_mm, NULL, mm)) {
   760			mmgrab(tsk->signal->oom_mm);
   761		}
   762	}
   763	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
