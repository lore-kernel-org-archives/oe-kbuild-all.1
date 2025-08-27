Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3423570C5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Aug 2025 22:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756332589; cv=none; b=ZgrV81Rllw7RFTQ5ewOsBKQbqiIG1F5xZGJapZfGbPc/QGHRa2jSM+Xn8KFNdHTXAvkWozHD5r1RkdlzQywHQvEXjta1SS7JGfWO1/NiAnuTVwdNTqNpK+p+Tq0t0Nkbe2OGeJbdcPBw0ejeBAAcpiuKfwzffbstyG2Rp2h9yDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756332589; c=relaxed/simple;
	bh=iZ5nk1p7uKNNjUX2ez6YSjvosZIjzVJR3tLjeKOxTxA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kj6qM2lj48Xs3rcwcvUyKEf73tjm4mUjeVwVKQPjRZSZFVEC75TELrUNZjdQ6wsahdNlg6gyXR8p2xKuOPgP0Qsk/oVBdhULT5zaSgKRRvivbc2E1hh031ZEqSPPaT9mngH/5+3OgsbBeemPW6IbEgd0JKm44Ce4UiCRSTr+dHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hw3uMf4e; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hw3uMf4e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756332587; x=1787868587;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iZ5nk1p7uKNNjUX2ez6YSjvosZIjzVJR3tLjeKOxTxA=;
  b=hw3uMf4eD2DWa29Q7TUgH8ndEbcPcbUQX+F+OKhEr79HFz6GDx2H1RS+
   AvuCl9Nt2SlHRy0JoVxrtSbSt031e2ZEcuOpAv8e/JnDYg7LrozqjU8t5
   WPrJU66gRa4zBUv1M89cVg0wsKC7Dt/cqGYxtIA885y9uksggl/QnvJEi
   mVqkgpWsQeTMDHS2BEm7GFezJr+NuuAF4idCRacKcPGGyCGDy1Wok8Yqo
   rA+56zWdeW5T23pCe8B/xojTf8mzuD2/+gJL5k0ij/gB1obw9CIslOvcM
   Y+iSeaW7Li4FvqNhrK8Z8xrZFuaniyj+2RX112v3tqWHdHjgedeA/c85Q
   A==;
X-CSE-ConnectionGUID: RXi67GlMRHOPfD3VWMTnyw==
X-CSE-MsgGUID: gjjVSrJzSsyb9nP4ZISyGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="58743786"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="58743786"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 15:09:47 -0700
X-CSE-ConnectionGUID: qDVbY9RhT/qJ94onOuuyug==
X-CSE-MsgGUID: 9OjceL03TWy8tow8B6/yKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="200844762"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 27 Aug 2025 15:09:45 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urOKq-000TFb-0e;
	Wed, 27 Aug 2025 22:09:42 +0000
Date: Thu, 28 Aug 2025 06:09:22 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: [trace:unwind/perf-test 1/15] vmlinux.o: warning: objtool:
 do_syscall_64+0x280: call to __kcsan_check_access() leaves .noinstr.text
 section
Message-ID: <202508280606.YFCyE44j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace unwind/perf-test
head:   40a604f11b56c3e57f09148ebaff21b5013ae806
commit: d156a225efe2f34a0d3d671a1d563f9397d8453e [1/15] unwind_user/x86: Enable frame pointer unwinding on x86
config: x86_64-randconfig-074-20250828 (https://download.01.org/0day-ci/archive/20250828/202508280606.YFCyE44j-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250828/202508280606.YFCyE44j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508280606.YFCyE44j-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: do_syscall_64+0x280: call to __kcsan_check_access() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: __do_fast_syscall_32+0x1fe: call to __kcsan_check_access() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: do_int80_emulation+0x297: call to __kcsan_check_access() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_exit_to_user_mode+0x104: call to __kcsan_check_access() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
