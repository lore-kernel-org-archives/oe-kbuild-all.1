Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B281256C87
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 08:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754556672; cv=none; b=NSAtxS5nPxzxcvNXofTuVrvLakicL44Ms4elRjLWlnhp3EX1Axh4oH1QdWDyRl9CU2XGbGza+VI92fQao7DDvawLLmLFyD65Fs0jU2fzvm+NDp1XrKBIRuhJGnFa2VHITEjBv9SBm44Js1ySm1KCkBcjCSgYH6Cx/kwv+/KvUdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754556672; c=relaxed/simple;
	bh=kaAu64q0Yw4Qkd8YiQoiaw2dfUiefX2UttX2elRNrXE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uIsCvQG3Z5WiVoz3lXrLvpBbsaVBAhch4qKhygokV/utT8+MTRVMRstszD+dtNjEpSWy3Ou8DB4qsLbobKSPO/QYhZFmqZkYgrQWpyNVG41A+4SgFh4UkUid6fM9t8yLpju22+IbmqbaTq5GqV7HeMrh/JzJg9ulzttWebhimo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GH0oxS5f; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GH0oxS5f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754556671; x=1786092671;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kaAu64q0Yw4Qkd8YiQoiaw2dfUiefX2UttX2elRNrXE=;
  b=GH0oxS5f2C+QSejyPzxdGbyAavzIY3htKKVZ0k1Ew1v3RhpUpKh1ehJI
   B7hSYtBUqSK5DSvi2Bt0E0kQtXY92NVzdlbio6kG0iZcfLzEmAjqTPMPz
   yR+///wiseDToXva66LVtOZdM+MzVHMnNcOKC3kHmxX/oPiBBy2VrwuqA
   pkiAJ8ONt6jcDXaNy+qclIpQB6kwg9dyfKS6/ZX0i1Y0I95lQ0XaYNjfr
   hi943ytSsLFvJvlbR8nyZTb7FYpHkV0LGGvoUuXVLSUTrgl3mAtiHZjmZ
   CXHmRWhf9Ox1v7PT6hxvz9KsPfKmotFLYiZL+nHCJdvY5bzhYdBlv58Ah
   A==;
X-CSE-ConnectionGUID: +Wdp/XVPRAulRz0E89WY9g==
X-CSE-MsgGUID: 6IttVAuTSnucsnYqW7ozug==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56783851"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="56783851"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 01:51:11 -0700
X-CSE-ConnectionGUID: o1tvbOaXT+6ERJ7GLaUr7A==
X-CSE-MsgGUID: QIqZ+yU6QeKm/TnQtvJOMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="169469127"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa004.jf.intel.com with ESMTP; 07 Aug 2025 01:51:10 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujwL4-0002P1-2w;
	Thu, 07 Aug 2025 08:51:06 +0000
Date: Thu, 7 Aug 2025 10:50:54 +0200
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [robh:dt-convert 8/801] htmldocs: Warning: MAINTAINERS references a
 file that doesn't exist: Documentation/devicetree/bindings/arc/axs10*
Message-ID: <202508071037.E9hvVm0s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   6752ef54777b7f91fb5cae7cfac46af194c15d1b
commit: 632c0f9807e246d0e203d25b60335ffab87ae192 [8/801] dt-bindings: arc: Convert snps,arc-sdp to DT schema
reproduce: (https://download.01.org/0day-ci/archive/20250807/202508071037.E9hvVm0s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508071037.E9hvVm0s-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/filesystems/sysfs.txt references a file that doesn't exist: Documentation/filesystems/fuse.rst
   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/translations/zh_TW/filesystems/sysfs.txt references a file that doesn't exist: Documentation/filesystems/fuse.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/arc/axs10*
   Warning: arch/riscv/kernel/kexec_image.c references a file that doesn't exist: Documentation/riscv/boot-image-header.rst
   Warning: drivers/clocksource/timer-armada-370-xp.c references a file that doesn't exist: Documentation/devicetree/bindings/timer/marvell,armada-370-xp-timer.txt
   Warning: fs/fuse/Kconfig references a file that doesn't exist: file:Documentation/filesystems/fuse.rst
   Warning: fs/fuse/dev.c references a file that doesn't exist: Documentation/filesystems/fuse.rst
   Warning: include/rv/da_monitor.h references a file that doesn't exist: Documentation/trace/rv/da_monitor_synthesis.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
