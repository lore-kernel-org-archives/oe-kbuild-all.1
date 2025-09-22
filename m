Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7409F308F01
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Sep 2025 12:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758545480; cv=none; b=H0uFPjSyJINPdRA7Md37mO1VbFph+0Py6ACQ+vcEoiRCPp/kDcRbpLyL/RVYRWWDFDUsYLV6v5roevgv8EBUJmH2l5fuZuYTlY3kTcj8SR7uaL0WIgGx1LJEHBwok/flbdbu9BeTMu5Y2ZfvdpH8bzpTjCahWUL0DwGzt5JYUSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758545480; c=relaxed/simple;
	bh=/a6ew1DjeZdVLbLMgsncdw0QJuTddn4F6I2tFmIpKBw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WUQkU0+4FC3Hecf0sfuW7Per4sOPJzAv1mfUUBbknVPSs0/q6yEF9jIohgLhshs3PPvcKjVUHKfh5gFfaC2BN+l60x+d4wz7dL5FEhN2MySOZEI1q92dCNSxEPvF0l0x0yPV0yLa8TPWjwz6ijmrVz7Cg/MekoU/JWWElqJbW2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IbZ3IM8r; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IbZ3IM8r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758545478; x=1790081478;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/a6ew1DjeZdVLbLMgsncdw0QJuTddn4F6I2tFmIpKBw=;
  b=IbZ3IM8rBayf7UTTYWt5UY12b3qK+jX3ADmSTOZgQAPJ9N6HgU1utin+
   4KGB6Ar0u9w0cbFmkfrMsuDyqxN3v/PSmi533robeXpOMOBirYmxF0yhR
   CMuvJoQVfDRZBggCsDliAs5a2qpZT5mZyuEOcwByNVxX1YLF7hBO9eF+X
   yT4HND66ndkIWBIodB1AuC3O/VXxZwAqgrZBfu9M09t9FE9tnUJcbyIN3
   d40OlLyCW9pTNXoiRox71jC8cg273z3/A0C+k3xfV70vG0qm13wf7Xvfd
   emF4esNYtGYsZHoKTMIAmw0URQMTrHgbBYOW1MilAn2SM0/hkA3MxJXI1
   Q==;
X-CSE-ConnectionGUID: Qky1l/ucQSGaKA5NAg3cPg==
X-CSE-MsgGUID: tU2BaK4FQ4mKdLLjubIJCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="64627560"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="64627560"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 05:51:18 -0700
X-CSE-ConnectionGUID: 5EMI+e5OQGqp9HBG5MVsSw==
X-CSE-MsgGUID: HAksNS48RNyGTB4HZF4dAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="177252593"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 22 Sep 2025 05:51:17 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0g0g-0001gL-2R;
	Mon, 22 Sep 2025 12:51:14 +0000
Date: Mon, 22 Sep 2025 20:50:38 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 0/146] mm/oom_kill.c:318:14: warning: no
 previous prototype for function 'bpf_oom_evaluate_task'
Message-ID: <202509222003.mgTDb3Ck-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Chuyi,

FYI, the error/warning still remains.

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   c73db7ebb024f59416db0cf136dc2d4b9dbc3695
commit: 9cffac2e6f2df386d7cf4c2cf90d5fe2c1d6b793 [0/146] bytedance: mm, oom: Introduce bpf_oom_evaluate_task
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250922/202509222003.mgTDb3Ck-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project cafc064fc7a96b3979a023ddae1da2b499d6c954)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250922/202509222003.mgTDb3Ck-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509222003.mgTDb3Ck-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/oom_kill.c:318:14: warning: no previous prototype for function 'bpf_oom_evaluate_task' [-Wmissing-prototypes]
     318 | noinline int bpf_oom_evaluate_task(struct task_struct *task, struct oom_control *oc)
         |              ^
   mm/oom_kill.c:318:10: note: declare 'static' if the function is not intended to be used outside of this translation unit
     318 | noinline int bpf_oom_evaluate_task(struct task_struct *task, struct oom_control *oc)
         |          ^
         |          static 
   1 warning generated.


vim +/bpf_oom_evaluate_task +318 mm/oom_kill.c

   317	
 > 318	noinline int bpf_oom_evaluate_task(struct task_struct *task, struct oom_control *oc)
   319	{
   320		return NO_BPF_POLICY;
   321	}
   322	ALLOW_ERROR_INJECTION(bpf_oom_evaluate_task, ERRNO);
   323	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
