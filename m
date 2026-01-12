Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFDE31A57B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jan 2026 19:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768246192; cv=none; b=rawXD4JlE+ag2K3eol+Rd/MVLfqR0tk76g8zQfolDbaTE0FC46RHpkWO4xlBkC82fTZq0hS9E7O2d67ymGiVOllYfh5vkawcUwIhvENHMvb84Zhy2ZtbKaKRvewWSBwXQnAO9NiiUC0vcdxskTb/f5roqQC0t4m5/zWO51VFpUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768246192; c=relaxed/simple;
	bh=j2Qb5mn0zqgEQK14Jy91Y7XMlePLg5lxOE1ehGfoBLk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=t7XlpxpNDoo9a4L6a/5mbmc2OkaCbcyVv/vhybqY1KNtrckuE137TBZvJWpo0LhrERQFs/gUeAQ+gNuZ6YV0/oxh77Dh9i8WGh8RJUST1KoVwsMyooLnF1hkJFVqJmlF4fZBckJsf8oLebmfQrxTqyeHR1LY+sIPfNukPSYGT4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZyPRA/3A; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZyPRA/3A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768246192; x=1799782192;
  h=date:from:to:cc:subject:message-id;
  bh=j2Qb5mn0zqgEQK14Jy91Y7XMlePLg5lxOE1ehGfoBLk=;
  b=ZyPRA/3AW15Q4SKlcjBZqY0NkzbK3pP1014OolL5pCJYAkXyNylNTaiJ
   +RuIuadPvL8IPp0GYzISLOvKvFib0EC4QqEQw2ipX78o4wUF6Pmf0IMg6
   DqN+W19OJg4cOqo1Hb4s28uH8OU3GOyxFtE4u87Vlv/qfnHow3IynC/Ug
   C/eUvkxvANVmCsKbNjdIlis8jRn1XG4IMIP/MI/jp0iVMKgOaR4t9LL+/
   gSWlalf2S+JB6WEbw2BIxf2MSCpD/67b9m1NcbFNipgXRTxT5NBXS6pfS
   4cBBuRtI3yiadXHiqLkqFfYbBGG7F3l+r7swmbGanVdEDSSk5XYUhO0zF
   Q==;
X-CSE-ConnectionGUID: CyrYzzVZQBqbQDxcsbDjOQ==
X-CSE-MsgGUID: YWK/wRARSACpZCkUoZd0Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="86943053"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="86943053"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 11:29:52 -0800
X-CSE-ConnectionGUID: nFW1oYhPSdCflE0WWt+srA==
X-CSE-MsgGUID: F0zLxBpNTdqwPdhHtnAeNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="204084396"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Jan 2026 11:29:49 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfNbn-00000000DnG-1toP;
	Mon, 12 Jan 2026 19:29:47 +0000
Date: Tue, 13 Jan 2026 03:29:44 +0800
From: kernel test robot <lkp@intel.com>
To: Hou Wenlong <houwenlong.hwl@antgroup.com>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:x86/urgent 2/2] arch/x86/mm/extable.c:414:21:
 error: implicit declaration of function 'handle_bug'; did you mean
 'find_bug'?
Message-ID: <202601130350.sGFeMWCN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/urgent
head:   695d896472d6543523de43110b0016b8b4469643
commit: 695d896472d6543523de43110b0016b8b4469643 [2/2] x86_64/bug: Handle __WARN_printf() trap in early_fixup_exception()
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260113/202601130350.sGFeMWCN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601130350.sGFeMWCN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601130350.sGFeMWCN-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/mm/extable.c: In function 'early_fixup_exception':
>> arch/x86/mm/extable.c:414:21: error: implicit declaration of function 'handle_bug'; did you mean 'find_bug'? [-Wimplicit-function-declaration]
     414 |                 if (handle_bug(regs))
         |                     ^~~~~~~~~~
         |                     find_bug


vim +414 arch/x86/mm/extable.c

   376	
   377	/* Restricted version used during very early boot */
   378	void __init early_fixup_exception(struct pt_regs *regs, int trapnr)
   379	{
   380		/* Ignore early NMIs. */
   381		if (trapnr == X86_TRAP_NMI)
   382			return;
   383	
   384		if (early_recursion_flag > 2)
   385			goto halt_loop;
   386	
   387		/*
   388		 * Old CPUs leave the high bits of CS on the stack
   389		 * undefined.  I'm not sure which CPUs do this, but at least
   390		 * the 486 DX works this way.
   391		 * Xen pv domains are not using the default __KERNEL_CS.
   392		 */
   393		if (!xen_pv_domain() && regs->cs != __KERNEL_CS)
   394			goto fail;
   395	
   396		/*
   397		 * The full exception fixup machinery is available as soon as
   398		 * the early IDT is loaded.  This means that it is the
   399		 * responsibility of extable users to either function correctly
   400		 * when handlers are invoked early or to simply avoid causing
   401		 * exceptions before they're ready to handle them.
   402		 *
   403		 * This is better than filtering which handlers can be used,
   404		 * because refusing to call a handler here is guaranteed to
   405		 * result in a hard-to-debug panic.
   406		 *
   407		 * Keep in mind that not all vectors actually get here.  Early
   408		 * page faults, for example, are special.
   409		 */
   410		if (fixup_exception(regs, trapnr, regs->orig_ax, 0))
   411			return;
   412	
   413		if (trapnr == X86_TRAP_UD) {
 > 414			if (handle_bug(regs))

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
