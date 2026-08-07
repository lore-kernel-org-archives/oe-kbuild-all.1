Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AA24756C4
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Aug 2026 15:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786117527; cv=none; b=JLFmVDXek9OwPkbLtPxD30/XIf+b7OPPlwYayTtpK1YwxMjkydhu0XksS7TRQ8mnF9cR18eiQwq7UgLAwHAuqp6bmWbQ7z7/WJgQKNZRdthyrsrVA1i6z54ocg6ezlgzVUuJNdcmgqv6DxWUfRIQySPt/Ed4AVO++rNbeQbZins=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786117527; c=relaxed/simple;
	bh=lE9kSlw3pZD7EPRIjvMc9fxwLZzEmZOC5aOOiwnYGF8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nlZ1Odo5LBphdT3ofzfGOpx3yo4q5Pjqy568vHhsSVa3fIrjQOGiUQQ9NWmv1zzWvSsH4XCxUHEUartjvSGoqeuO+/xuXlPbdOe/Yc0mSwG5rLHTw0PhtpS1tbe85WkeyY/zHhdNOIUG59W0diOBtBfFdvPT8nd5q7hTQbvqC/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GxEu/dim; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GxEu/dim"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786117526; x=1817653526;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lE9kSlw3pZD7EPRIjvMc9fxwLZzEmZOC5aOOiwnYGF8=;
  b=GxEu/dimcsJAT20JEDOD44qfIqdh8kmceyoxOmhBqqgiKU3jyzUtjmrV
   tOSHHiHwzJqi5IcZH7XEXrn+aLa+caDcrwYtvBNCjBV5hDBzixfYwysfa
   Ec0pnmMdsxo4eK17CaVaFH0qv/dZJ/gPpY6aTTE53C9j/hTE44jaJa9q0
   biKcBXvt+Os7WWGnwuIa9vVeZmZerW/7EFd0QNEaCcVySa6odvYqmmrod
   5RC1+Nt2FM8k6Y2DK9R03I0CKAfcqsgrh/lEZ0OBtZQ/9tQD6yc3MtgK3
   Pn978C6amBi0B2Vi7JqC/d+BmxhP/tpf9scVfkYpP04sre20EwuKJ1EKd
   g==;
X-CSE-ConnectionGUID: 1Y/sQVaFRL29Hayj4+zpgg==
X-CSE-MsgGUID: PLA1y7s1RQGyRy7iUg2G3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86753891"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="86753891"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 08:45:25 -0700
X-CSE-ConnectionGUID: h7O41VoaSfe3S0Ehakq7XQ==
X-CSE-MsgGUID: 6iHr4yH+QdWcQW1L3BlT+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="266672714"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 07 Aug 2026 08:45:25 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsMl8-000000004qU-0pfI;
	Fri, 07 Aug 2026 15:45:22 +0000
Date: Fri, 07 Aug 2026 17:44:49 +0200
From: kernel test robot <lkp@intel.com>
To: Renzo Davoli <renzo@cs.unibo.it>
Cc: oe-kbuild-all@lists.linux.dev
Subject: 
 =?us-ascii?Q?[linux-review:Renzo-Davoli/ptrace-add-PTRACE=5FSET=5FSYSCA?=
 =?us-ascii?Q?LL=5FINFO-syscall-skipping-support/20260807-141318?= 2/2]
 checkpatch: ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at
 the same indent
Message-ID: <202608071746.kXtbl7pt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/intel-lab-lkp/linux/commits/Renzo-Davoli/ptrace-add-PTRACE_SET_SYSCALL_INFO-syscall-skipping-support/20260807-141318
head:   1d64482cbd6580c86ea2cfe5064cc264f6868778
commit: 1d64482cbd6580c86ea2cfe5064cc264f6868778 [2/2] selftests/ptrace: add a test case for PTRACE_SET_SYSCALL_INFO syscall skipping
reproduce: (https://download.01.org/0day-ci/archive/20260807/202608071746.kXtbl7pt-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#210: FILE: tools/testing/selftests/ptrace/set_syscall_info.c:665:
+		switch (ptrace_stop) {
+			case 0:
+			case 3:
[...]
+			case 1:
[...]
+			case 2:

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
