Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003B639FCE
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 14:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736172306; cv=none; b=FFSb+VwZGj79F8f3lo4AjQleUWP6S1EncJk9lTVJQ6ZZnUQK08DPcy6PZWFMLklzi59UtjJLkBLrTl3ZKgZCevJf1kOE5C6s1bfmrEXRN/nzNqsrWw+02clehDBXCqjhBf22ACNBbeK73mbg9jmzAZotzgOe0EWlDG9xOFGseY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736172306; c=relaxed/simple;
	bh=APfcYwSdBR5AkASkpxgCLitK7fSEQA4VqFvu3bfBIpg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EKyLd5OnR88AWlnf/i8kFKefkYUM9T4HliOrjYjxjT5CiGfVexcAnnEXj+FKbCC/vSvfN1Y5v3BJjonlSvBEsTw23ENLKLK3ktQLhP7Oc1bcaur9IwOGuY86utG5tpPExXE8D25tbIjehISQ43TotOY5ITVXP/juXTmplHaUzO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mANFTX6e; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mANFTX6e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736172305; x=1767708305;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=APfcYwSdBR5AkASkpxgCLitK7fSEQA4VqFvu3bfBIpg=;
  b=mANFTX6etNtLWlVqdzs4FWXLy5VRoN2SuxjJg0EZhQth/Qz947h2ApTZ
   VErDxXAG2TP3b29ao/iGJ1ayjzjgMeTgp46wBr8qy4gsNlcOU1ObHcHqT
   7Z71phCLojEZEEpTLXEf4VVsaKdm1+ExhwgzU5Vt43WAMBOaSJwYNcYNU
   +93H9zEns+y1fVYU09bXTyRmYaYOiyc171ZOmVHV2tSoHpxmnC36CZL6T
   lrDRg+3Qth4680EON2k+wMfYzyQyH/8MEpMf4LldouWmXnrux2z9SddSd
   hhu9KRKkThtrGbnCd67P9DlcXkFbsf4HwqlklthPlJstJKDFzXHpmvpYL
   A==;
X-CSE-ConnectionGUID: zm90zcRdR9mVCDtwfw69jg==
X-CSE-MsgGUID: i6WFjpZySweja/LoQUd4fA==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="61694186"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="61694186"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 06:05:03 -0800
X-CSE-ConnectionGUID: 3aGbbQKfSo+Vg9OAkOgyCw==
X-CSE-MsgGUID: tXnSqncIRSq5JY9ypLB9Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="102340825"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 Jan 2025 06:05:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUnj1-000CgH-1J;
	Mon, 06 Jan 2025 14:04:59 +0000
Date: Mon, 6 Jan 2025 22:04:00 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 17987/25291]
 arch/arm64/kernel/stacktrace.c:161:13: warning: no previous prototype for
 'walk_stackframe_reliable'
Message-ID: <202501062140.ChT4rl5x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   272d9bd3d7e15bb1ad1efac12d9921350f961339
commit: f6c94c34964ebf155b3188788a086805d33bcbf3 [17987/25291] bytedance: arm64: introduce reliable stacktraces
config: arm64-randconfig-003-20250106 (https://download.01.org/0day-ci/archive/20250106/202501062140.ChT4rl5x-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250106/202501062140.ChT4rl5x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501062140.ChT4rl5x-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/stacktrace.c:161:13: warning: no previous prototype for 'walk_stackframe_reliable' [-Wmissing-prototypes]
     161 | int notrace walk_stackframe_reliable(struct task_struct *tsk, struct stackframe *frame,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/walk_stackframe_reliable +161 arch/arm64/kernel/stacktrace.c

   160	
 > 161	int notrace walk_stackframe_reliable(struct task_struct *tsk, struct stackframe *frame,
   162				bool (*fn)(void *, unsigned long), void *data)
   163	{
   164		int ret = 0;
   165	
   166		if (!tsk)
   167			tsk = current;
   168	
   169		do {
   170			/* Final frame for kthread; nothing to unwind */
   171			if ((frame->fp == (unsigned long)task_pt_regs(tsk)->stackframe)
   172				&& ptrauth_strip_insn_pac(frame->pc) == (unsigned long)&kthread_return_to_user)
   173				return 0;
   174	
   175			if (!unwind_state_is_reliable(frame))
   176				return -EINVAL;
   177	
   178			ret = fn(data, ptrauth_strip_insn_pac(frame->pc));
   179			if (!ret)
   180				return ret;
   181	
   182			ret = unwind_frame(tsk, frame);
   183			if (ret < 0)
   184				break;
   185		} while (1);
   186	
   187		if (ret == -ENOENT)
   188			ret = 0;
   189	
   190		return ret;
   191	}
   192	NOKPROBE_SYMBOL(walk_stackframe_reliable);
   193	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
