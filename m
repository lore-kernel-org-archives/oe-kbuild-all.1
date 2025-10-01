Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B9C1B21BF
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Oct 2025 02:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759284908; cv=none; b=NElPoeU/KmXA0yaF/OHwdu7d+Ru/ANSHW0keBsQK8pTe2zVzrToTdiN3xE4OYbLs3HNNt3PfWMjR+2ONU63GLI3nj7+jhMIxxlueMkmoPIkj4K2xly7yHirDpU7Au+83/HL2Kk7NOY0KQtg0YjMEt/XBxCwVTrUWFogD0bFhljw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759284908; c=relaxed/simple;
	bh=vNM5M29Jiol86Vls02fb9LR/UP+alZFRDPckbczCXJg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MuCeU6BmeLIwuYQNDuIVQjW1rrpf09V3N+s/bKTl9T4K/8qjE68gROqWNW6UGYk1HP9lkSDy9UynsrYn1cBj1PBfnKz+znqUnCtM/eMhpENX8TLZdz3NDDIkAjsxd2GlDCgG2K2Ebe41Ipxnfpk8MwWEu4wyfCH9CnDKO0epkWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FejHV/lu; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FejHV/lu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759284907; x=1790820907;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vNM5M29Jiol86Vls02fb9LR/UP+alZFRDPckbczCXJg=;
  b=FejHV/luIoCU7p+lCs/VNGzE/eY9pXmHt5y1PZ7NRRhJO0IjaFtncM3p
   RMM0+Ea6SECgFzsBPUNpHzOoPeblP4VoLHIjdTWjoAbrx5vU64nCUOY8a
   H9Z/9KVWLXf776rZRvNFfzAo4dVmh6wQ0XHFZUk9WCQiXhqo0uOo0cj+9
   WOictpvTTSi/VenwD7xTiR+K2mktGEnf5u5We7DVPldLsekxxw1q5oKf5
   mfQ8+V29MFgUWru5XSlNyRkq3sn/3hLjoxTGJurA7av5H7urHfXP5v6U1
   dtB715bnRrqdMUp62f4pCn37Kv/8o34NDPQCbqQCvpTq2fWlFp3hFhDBD
   g==;
X-CSE-ConnectionGUID: BrzRdVUtTpSCkCec2xiWmQ==
X-CSE-MsgGUID: vdSOP7t2R5aKjCvPAUVbAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="65409348"
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; 
   d="scan'208";a="65409348"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2025 19:15:06 -0700
X-CSE-ConnectionGUID: OGS8O64mRsWHjkR4QWfZdQ==
X-CSE-MsgGUID: LvJDfeYtTd2p2cfQcPIP6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; 
   d="scan'208";a="178269846"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 30 Sep 2025 19:15:04 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v3mMw-0002db-0h;
	Wed, 01 Oct 2025 02:15:02 +0000
Date: Wed, 1 Oct 2025 10:14:42 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: [peterz-queue:unwind/cleanup 12/12] vmlinux.o: error: objtool:
 fred_int80_emulation+0x1ce: call to __kcsan_check_access() leaves
 .noinstr.text section
Message-ID: <202510011029.twPzyWxM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git unwind/cleanup
head:   324fd33218537bb2677ac1923229719abc51b966
commit: 324fd33218537bb2677ac1923229719abc51b966 [12/12] unwind_user/x86: Enable frame pointer unwinding on x86
config: x86_64-randconfig-121-20250930 (https://download.01.org/0day-ci/archive/20251001/202510011029.twPzyWxM-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251001/202510011029.twPzyWxM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510011029.twPzyWxM-lkp@intel.com/

All errors (new ones prefixed by >>):

   vmlinux.o: error: objtool: do_syscall_64+0x1e9: call to __kcsan_check_access() leaves .noinstr.text section
   vmlinux.o: error: objtool: __do_fast_syscall_32+0x193: call to __kcsan_check_access() leaves .noinstr.text section
   vmlinux.o: error: objtool: do_int80_emulation+0x1fc: call to __kcsan_check_access() leaves .noinstr.text section
>> vmlinux.o: error: objtool: fred_int80_emulation+0x1ce: call to __kcsan_check_access() leaves .noinstr.text section
   vmlinux.o: error: objtool: irqentry_exit_to_user_mode+0xdb: call to __kcsan_check_access() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
