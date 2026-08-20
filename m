Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668862248AF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Aug 2026 00:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787186426; cv=none; b=lSI7sP0jGDV4eEzrGIIoWPaH8KShHljW3sGCmYpKdBaB10aFhIvP9B6fwQ4ecrHYgreUncoL3Nxv7VIMaB5m7Vpmu1mybDL2tgqfufAe+7cZ5Ln36h8+NA3G8Z8ia3J0raeWYN8YSO+H/YIzTFGzEaXKXScyOwGpvUoBwTmzxJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787186426; c=relaxed/simple;
	bh=r5d/G1JBokVaF5tRChsa9iqOMulI/pogtWiUD0nf/Qw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ucP6Q792XMB9pgT2PUsXBDbskftI0CvDqsMexsHNvDxlcjMD+HbD39CjjXhohwz12REOeaEv6TtI4nXFpqw2XkVWxToiygU3FeMJ1o1BfjXZawTp9aPqgrtVwV2tzFsQV+sE30Ep2op17/DQ4HOntnr5l8e9vUor2KrYzM12g5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BMg6Skfr; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BMg6Skfr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787186423; x=1818722423;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r5d/G1JBokVaF5tRChsa9iqOMulI/pogtWiUD0nf/Qw=;
  b=BMg6Skfrc/zkkACzAIRdC++w3+gs76/A+quzNakdlQdLXb0luSokaCMR
   wnikaRyOJy/CccjabPruGEpmDEcEmoPBxYgZ5TxpyyReg5LKbBpej3A4Q
   85EbUd6QpDzkxuJReMq/8gvuoE3Y0hQeTPvU/32y80PdVytb96K5ck6kf
   wDj5QImn7BSnSQ0A817C9DAIW7ayxGMYP/601t0z77CXscTe3RPbBy786
   ZikPcCacQwANe1z8sYg9cY74iPa9t/f2h8iHqHavddi+HN6w04AnSjsDm
   pBLSbpiFLeuVby+wwCP4qpIoMCyZCQBReKbWQ9MjKSl07+9XVYjvl7a3B
   Q==;
X-CSE-ConnectionGUID: ZXUXJqGzS6ub0Blh1YgvEg==
X-CSE-MsgGUID: wj2N7EEUQRiqfp3fXgfQpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="105097057"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="105097057"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 17:40:16 -0700
X-CSE-ConnectionGUID: 7/p1QJ6LR3qPvz0/5/x1CA==
X-CSE-MsgGUID: KY3RnF2kQmOK/53L1MtTPQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 19 Aug 2026 17:40:14 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwqpI-000000007SD-24rD;
	Thu, 20 Aug 2026 00:40:12 +0000
Date: Thu, 20 Aug 2026 02:39:27 +0200
From: kernel test robot <lkp@intel.com>
To: Renzo Davoli <renzo@cs.unibo.it>
Cc: oe-kbuild-all@lists.linux.dev
Subject: 
 =?us-ascii?Q?[linux-review:Renzo-Davoli/ptrace-add-PTRACE=5FSYSCALL=5FI?=
 =?us-ascii?Q?NFO=5FSECCOMP=5FSKIP/20260807-184127?= 2/5] checkpatch:
 ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same
 indent
Message-ID: <202608200213.OutJeyiQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/intel-lab-lkp/linux/commits/Renzo-Davoli/ptrace-add-PTRACE_SYSCALL_INFO_SECCOMP_SKIP/20260807-184127
head:   0896a35f00ecd1fd1324cd01d11239d6e2f7d5bd
commit: df013b0cc1f8a09cdfc64626f09bc966eacd86e4 [2/5] selftests/ptrace: add a test case for PTRACE_SYSCALL_INFO_SECCOMP_SKIP
reproduce: (https://download.01.org/0day-ci/archive/20260820/202608200213.OutJeyiQ-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#195: FILE: tools/testing/selftests/ptrace/set_syscall_info.c:651:
+			switch (ptrace_stop) {
[...]
+				default:

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
