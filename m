Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0053C3009C1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 21:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766438548; cv=none; b=TVmOJhpMq5QMKL90MNzb3RVNX/YHBfnY/lx95JEznHR4LtMB7pmpeYlm9mC1Ok07WN1/7YvznpTjQdI3fB9rdNRIV6wEVCKCjjcHeiZQfrNA70V775lKmc0aj0agFFvPxsxqWOC2w+DCA5GPIKZbDOA1AY8IHgOLDxOTwQ6nKqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766438548; c=relaxed/simple;
	bh=WHC2LCbLzfTjf9EpAh4/w6qThobsuZGYJY438eTYmVg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QaDCJ2ePeyRElititjK5BTMq1JmWRCsgDeN9Gq+SDeHmydc1cRUMdGbOxyUbEzx97+oExjcEyiPGTwlY9fsrUSQKwVFoJurNpiybuh7nkmvc738uQvehBEBaOdq9NpIYxBmmXieGCuWF5ch5awjRkuZGkeo4USgPSU4JuApkrHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T6g63fDG; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T6g63fDG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766438547; x=1797974547;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WHC2LCbLzfTjf9EpAh4/w6qThobsuZGYJY438eTYmVg=;
  b=T6g63fDGYDWpbi1KNBLkmD962Jyee+ZevV3RNJF7H9hK/t7FFxlCu8mO
   fzUxSJzfmlN1w4b2ue+0hx80b+PdoH0g+mCBxXAuqidSilnoa98e/r7VE
   w0x/rU9hY4BAt//K4mJtx0KZo7hl3ju0reU547muY3eH+qN+uCA0kOKcA
   grU1evxFVyQL0mb9Vwe5K3mfIpuvhH/69Y1HecR+9R/a6FskOPYGemP6F
   l3vE37+MP7WPua7/qlKYi2hYJfj7OXtFrQlY88InPX2yakMlpulLLsM6E
   baaUh8gFSMZxM4IL4XpUY2MXTpEhdHYoOz59Y6En01oQbk5Qw2xptXhEj
   g==;
X-CSE-ConnectionGUID: 8edmWlakS4KtHKKw7EQ7+Q==
X-CSE-MsgGUID: xYQAhT2+T7KU9cvNgw//Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="67289163"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="67289163"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 13:22:26 -0800
X-CSE-ConnectionGUID: OmuNR9s+R32uQN5NHa3lJA==
X-CSE-MsgGUID: nVM+T/0RRHal263zpgRWcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="223095432"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 22 Dec 2025 13:22:25 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXnMF-000000005cO-18qc;
	Mon, 22 Dec 2025 21:22:23 +0000
Date: Mon, 22 Dec 2025 22:22:02 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 458/458]
 arch/x86/entry/entry_64.S:1732: Warning: no instruction mnemonic suffix
 given and no register operands; using default for `sysret'
Message-ID: <202512222229.4qMbNdJR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kees,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   8cc11e1aa30fd981a8d5bd390a4352c37dfe543e
commit: aca7e5b6a5008dcf551516490b0ba4510e073d08 [458/458] libsubcmd: Fix use-after-free for realloc(..., 0)
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251222/202512222229.4qMbNdJR-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512222229.4qMbNdJR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512222229.4qMbNdJR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/entry/entry_64.S: Assembler messages:
>> arch/x86/entry/entry_64.S:1732: Warning: no instruction mnemonic suffix given and no register operands; using default for `sysret'
--
>> arch/x86/entry/common.c:278:16: warning: no previous prototype for 'do_syscall_64' [-Wmissing-prototypes]
     278 | __visible void do_syscall_64(unsigned long nr, struct pt_regs *regs)
         |                ^~~~~~~~~~~~~
--
>> drivers/acpi/cppc_acpi.c:611:5: warning: no previous prototype for 'pcc_data_alloc' [-Wmissing-prototypes]
     611 | int pcc_data_alloc(int pcc_ss_id)
         |     ^~~~~~~~~~~~~~
--
>> drivers/mailbox/pcc.c:179: warning: Function parameter or member 'irq' not described in 'pcc_mbox_irq'
>> drivers/mailbox/pcc.c:179: warning: Function parameter or member 'p' not described in 'pcc_mbox_irq'


vim +1732 arch/x86/entry/entry_64.S

ddeb8f2149de28 arch/x86/kernel/entry_64.S Alexander van Heukelum 2008-11-24  1723  
dffb3f9db6b593 arch/x86/entry/entry_64.S  Andy Lutomirski        2019-07-01  1724  #ifndef CONFIG_IA32_EMULATION
dffb3f9db6b593 arch/x86/entry/entry_64.S  Andy Lutomirski        2019-07-01  1725  /*
dffb3f9db6b593 arch/x86/entry/entry_64.S  Andy Lutomirski        2019-07-01  1726   * This handles SYSCALL from 32-bit code.  There is no way to program
dffb3f9db6b593 arch/x86/entry/entry_64.S  Andy Lutomirski        2019-07-01  1727   * MSRs to fully disable 32-bit SYSCALL.
dffb3f9db6b593 arch/x86/entry/entry_64.S  Andy Lutomirski        2019-07-01  1728   */
ddeb8f2149de28 arch/x86/kernel/entry_64.S Alexander van Heukelum 2008-11-24  1729  ENTRY(ignore_sysret)
8c1f75587a18ca arch/x86/entry/entry_64.S  Josh Poimboeuf         2017-07-11  1730  	UNWIND_HINT_EMPTY
ddeb8f2149de28 arch/x86/kernel/entry_64.S Alexander van Heukelum 2008-11-24  1731  	mov	$-ENOSYS, %eax
ddeb8f2149de28 arch/x86/kernel/entry_64.S Alexander van Heukelum 2008-11-24 @1732  	sysret
ddeb8f2149de28 arch/x86/kernel/entry_64.S Alexander van Heukelum 2008-11-24  1733  END(ignore_sysret)
dffb3f9db6b593 arch/x86/entry/entry_64.S  Andy Lutomirski        2019-07-01  1734  #endif
2deb4be2807763 arch/x86/entry/entry_64.S  Andy Lutomirski        2016-07-14  1735  

:::::: The code at line 1732 was first introduced by commit
:::::: ddeb8f2149de280d54f0c8910cead42e6042b2cb x86_64: get rid of the use of KPROBE_ENTRY / KPROBE_END

:::::: TO: Alexander van Heukelum <heukelum@mailshack.com>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
