Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3892C029D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 20:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766434407; cv=none; b=VTAA8iWa1xH++ZSg2Z3ExG4jW9EGZY0vEqM8bWw7T6yk3LvWHHndxhQpy/XtvrTTagkSYf8E/83BEwNn0OhqBGP0k4T667no5rabnNrTMopurdQMWrwn6qnfTkHTeExiqp7v/SjBWvSH+QWOq3IxJDCG9wuFr8AhwddtaTL9Kcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766434407; c=relaxed/simple;
	bh=8fg7sLC9eNxbCXXEIFAAXiguPbLY9RRP6xatyGW7RqE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MdOaFMnVZ/7JlDRR3CDQx2GlS5smvOmeGSo3IhwBAnGmZ6/sEan98VjqPA8DbHRf1ZnkTEsQYAUiRp+KaloTmilWRakPla9uDcxEMG0UpjR3AEr3DvnUYblqgpzdC/grl9v6DeDsIJBGcVfnZ2UszPSOehtnAsNAKHB3DHofYTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hNC9ynv9; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hNC9ynv9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766434406; x=1797970406;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8fg7sLC9eNxbCXXEIFAAXiguPbLY9RRP6xatyGW7RqE=;
  b=hNC9ynv9PGGZXa51HIrLco4BRqUYZr/D90WSyIqYN5Hoob4ZwrGdT38J
   GlqaYefDabNjORps2sa4ZUy/Qem+RdArerLwQaeI6TlRt+6PNMVqPCvRD
   NbUwsXppXGxz0ZnXVHEji1fMPS2mv4Z7ctpCAieuD83LYKbG1EEsOlyMi
   bUonV6k0ohm3qxWz/dXKXExepxS5gvenIBQn3V/ZOZ+jNCtmuww77dh+W
   D4ngQkD8my1CPIa6wizOKev9Bm8RLYNdf5eK3z4BFAooWSyxYLCt3wcwC
   78ejEgiUAyqffZsyiasixSu3JM52bishAgw+011hMpNs7N5rryld2xvl1
   A==;
X-CSE-ConnectionGUID: 9gP8CVuoSieoLPPH5toMng==
X-CSE-MsgGUID: tpPVcmGnTv67hmE1utMn5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="67285239"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="67285239"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 12:13:25 -0800
X-CSE-ConnectionGUID: 0eBTuRJBQ62FKL4bHF6Law==
X-CSE-MsgGUID: kWWVOU4AT426T3G6jZN+nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="198843108"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 22 Dec 2025 12:13:25 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXmHS-000000005bY-1V5U;
	Mon, 22 Dec 2025 20:13:22 +0000
Date: Mon, 22 Dec 2025 21:12:36 +0100
From: kernel test robot <lkp@intel.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [glemco:staging_rv_hybrid_automata 10/21] htmldocs: Warning:
 include/rv/ha_monitor.h references a file that doesn't exist:
 Documentation/trace/rv/ha_monitor_synthesis.rst
Message-ID: <202512222122.395YTGIB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gmonaco/linux.git staging_rv_hybrid_automata
head:   39e6c3953ce5322303612164d93a437210837cc3
commit: f07fbba90cd11058d063fb2916d0efdb90e65c30 [10/21] rv: Add Hybrid Automata monitor type
reproduce: (https://download.01.org/0day-ci/archive/20251222/202512222122.395YTGIB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512222122.395YTGIB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
   Warning: arch/riscv/kernel/kexec_image.c references a file that doesn't exist: Documentation/riscv/boot-image-header.rst
   Warning: drivers/clocksource/timer-armada-370-xp.c references a file that doesn't exist: Documentation/devicetree/bindings/timer/marvell,armada-370-xp-timer.txt
   Warning: include/rv/da_monitor.h references a file that doesn't exist: Documentation/trace/rv/da_monitor_synthesis.rst
>> Warning: include/rv/ha_monitor.h references a file that doesn't exist: Documentation/trace/rv/ha_monitor_synthesis.rst
   Warning: rust/kernel/sync/atomic/ordering.rs references a file that doesn't exist: srctree/tools/memory-model/Documentation/explanation.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/virtual/lguest/lguest.c
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,\b(\S*)(Documentation/[A-Za-z0-9
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/devicetree/dt-object-internal.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,^Documentation/scheduler/sched-pelt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
