Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB65EEA8
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Jan 2026 15:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767714776; cv=none; b=PgYwUrVyl+G8qD+3RFADpMq+5gg1KjGk7pRfEfl9iqRwHRWx3IQTi5rGPiKTSJd9R+c33jHAtFph6HMuKXn/FWGISQzbtyOLnI34TcDn4sd8Ifl7y3NWT7XMPPddXxHQeCqfUAu2NfWdjS5QXfeJXIt/dn2DY8xpyx1vYrdbeqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767714776; c=relaxed/simple;
	bh=FsWDkextg+s4K/LAsZZx114K4unANqAGAbpmuNHBxKc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=D9jlu7RoBZW1yQlUD220guFF4Nwvq8ArUeCkCrutqzNZKHvvewlmMze+RAt32k6BNaS9uJVrQlG11/MIYb00gdl9KeIlb370Q+7I3GGpY8btMkUwilhZRmMIIpVfSqe8i9dfBu5Q3VVcCQiEb3d7/0CMRAfICRvPCSzcWvkunbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nDtkVaKO; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nDtkVaKO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767714774; x=1799250774;
  h=date:from:to:cc:subject:message-id;
  bh=FsWDkextg+s4K/LAsZZx114K4unANqAGAbpmuNHBxKc=;
  b=nDtkVaKOwWH1VCP9EgCSl7ig/f6iDDpCYlLEkrLYKlyFvbY2t45iJbsl
   AkMVHeLiydL2ETsvcxhxZviLQv9zVuzMUuvcu6i4tcDxJ8A00XQ7rVgd8
   Myd1/zs8KmiWYP0fc39naIci1DJUXvQLWfuy3ltg7ABNs41qWny+d4tCt
   dAiDs/77kg2b+tgtUWg6Bu63hOzaZ3Ex+cEgW/4m1s6pGQ46O++g1jzVZ
   YnzBtGakZs/fYZ8jrA4XuO56A4EX94JqDc+Cz1m0ikvSuYCDAShSvdh0A
   ZxfTB4pd+0/t3udwIk8swav6kgOE0IwgMFbcFVgFa5S6K9GYa8sw3qWYw
   w==;
X-CSE-ConnectionGUID: QfUy210RT4W84VlVvIP6NA==
X-CSE-MsgGUID: HR9UKzgjStqRod0IgMqGxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="94548374"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="94548374"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 07:52:53 -0800
X-CSE-ConnectionGUID: 3t9/P79hRO6lIO1TRL8uMw==
X-CSE-MsgGUID: U5So3CQLS2Cgmglt9T23Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="207555033"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 06 Jan 2026 07:52:46 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vd9MR-000000001Jl-3jFN;
	Tue, 06 Jan 2026 15:52:43 +0000
Date: Tue, 06 Jan 2026 16:52:06 +0100
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 linux-doc@vger.kernel.org
Subject: [akpm-mm:mm-nonmm-unstable 102/107] htmldocs: Warning:
 kernel/liveupdate/luo_core.c references a file that doesn't exist:
 Documentation/core-api/kho/concepts.rst
Message-ID: <202601061635.i4VQmlUw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   bf64790fd7f2a71c84dada79a573d37cb08adbe6
commit: eee99407da66f5f657ba0599b4d6157b59be3721 [102/107] kho: docs: combine concepts and FDT documentation
reproduce: (https://download.01.org/0day-ci/archive/20260106/202601061635.i4VQmlUw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601061635.i4VQmlUw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
   Warning: arch/riscv/kernel/kexec_image.c references a file that doesn't exist: Documentation/riscv/boot-image-header.rst
   Warning: drivers/clocksource/timer-armada-370-xp.c references a file that doesn't exist: Documentation/devicetree/bindings/timer/marvell,armada-370-xp-timer.txt
   Warning: include/rv/da_monitor.h references a file that doesn't exist: Documentation/trace/rv/da_monitor_synthesis.rst
>> Warning: kernel/liveupdate/luo_core.c references a file that doesn't exist: Documentation/core-api/kho/concepts.rst
   Warning: rust/kernel/sync/atomic/ordering.rs references a file that doesn't exist: srctree/tools/memory-model/Documentation/explanation.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/virtual/lguest/lguest.c
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,\b(\S*)(Documentation/[A-Za-z0-9
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/devicetree/dt-object-internal.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,^Documentation/scheduler/sched-pelt
--
   ERROR: Cannot find file ./include/linux/mutex.h
   ERROR: Cannot find file ./include/linux/mutex.h
   WARNING: No kernel-doc for file ./include/linux/mutex.h
   ERROR: Cannot find file ./include/linux/fwctl.h
   WARNING: No kernel-doc for file ./include/linux/fwctl.h
>> Documentation/admin-guide/mm/kho.rst:10: WARNING: undefined label: 'kho-concepts' [ref.ref]
>> Documentation/admin-guide/mm/kho.rst:31: WARNING: undefined label: 'kho-finalization-phase' [ref.ref]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
