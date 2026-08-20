Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F50C233944
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Aug 2026 00:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787186421; cv=none; b=jLHIAkV8AMHkw+5QHsh3++CbshAFUSFDzt9QliVy0+5TvAB0ZN+1jYlTFKGK6Vk2PozUYgXLAt5lZvgvOy9S5c1oDmpyIvXKyOQpY3IRFbnJoejA4ktXe5KOLipiIohZT/ao+tz2T0iMWzDv9AvsD4pnd48+nQffVQoGb4X6xeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787186421; c=relaxed/simple;
	bh=3CGdKUoQC7sJEMocnaq4RyqmWNI06A+OvXyQsccfeps=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kaXrl+GFL8c5NQhk2Q+BKqKvce2y2sB9THTHGBbJBV8qzd4DrjogoCQCsuWhvFnAGEj5r5HSH5WxksvPmj69Q/kBQDkPofDYzU1zlFWcJf4IIANkmrj0ew5hWOE2kJJ+kvvIzg3ZRGQflumPuC9ONIQp3vw2acPIcYHlTSxdKNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WETYBVGo; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WETYBVGo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787186418; x=1818722418;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3CGdKUoQC7sJEMocnaq4RyqmWNI06A+OvXyQsccfeps=;
  b=WETYBVGoSKO4WyjY7R0ggGGnCImL9vlYaTYEdam7uW7TQ8iyBR0lbB9H
   Oy6mzNpbYJdPTtzTbkYPJ9z1d8wqt6IQ+MNqnkMJ4OV0pKOy8wRRlq0/m
   ygqkB4978QBOVMbHeS+Yno+zL1RUE8KOm110o2XTAAq4lnDeA/zi1JT0L
   r54MNDUJoPCRJTuox3zkzR+PM3fBe407+rhja7adybkoqLVh/l6kuxiLp
   7rIC1mb2O5GXymPtiKGtz1PT/OOVZaU69x5wjr9PR2Z2w29qgP+PsK8tu
   cQfRvrHUlWOE+2iub3okxLFBpxEtjQza5NgFfylfw+bNINjNi1wirH7w4
   A==;
X-CSE-ConnectionGUID: 7fkhOQxvRdmNWSfxpXAtog==
X-CSE-MsgGUID: o3AvBYzVTOe5x855wMUAGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="105097055"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="105097055"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 17:40:16 -0700
X-CSE-ConnectionGUID: /eJbr8+cSu+CP8yDSXMdRQ==
X-CSE-MsgGUID: BuTCBKOTQ5eCbI8SLqWkjg==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 19 Aug 2026 17:40:14 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwqpI-000000007SF-2Inv;
	Thu, 20 Aug 2026 00:40:12 +0000
Date: Thu, 20 Aug 2026 02:39:28 +0200
From: kernel test robot <lkp@intel.com>
To: Renzo Davoli <renzo@cs.unibo.it>
Cc: oe-kbuild-all@lists.linux.dev
Subject: 
 =?us-ascii?Q?[linux-review:Renzo-Davoli/ptrace-add-PTRACE=5FSYSCALL=5FI?=
 =?us-ascii?Q?NFO=5FSECCOMP=5FSKIP/20260807-184127?= 5/5] checkpatch:
 ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same
 indent
Message-ID: <202608200245.qniVtemw-lkp@intel.com>
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
commit: 0896a35f00ecd1fd1324cd01d11239d6e2f7d5bd [5/5] selftests/ptrace: add a test case for PTRACE_SYSCALL_INFO_FLAG_SET_IP
reproduce: (https://download.01.org/0day-ci/archive/20260820/202608200245.qniVtemw-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#137: FILE: tools/testing/selftests/ptrace/set_syscall_info.c:798:
+			switch (ptrace_stop) {
[...]
+				case 1:
[...]
+				default:

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
