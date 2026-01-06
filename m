Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AEF302750
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Jan 2026 20:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767732658; cv=none; b=Qgxy04ZXHRugGorI4RSV/lS6AEMXSVGg84YL3K3g2Dyr9I2LA7vbom74wyu1iAGGL7eEPMYWALnnbDZWUDO8PoI3p5rKNqNB+s4BfQZHyuYQDWfvk0OzflgdvGZ4JRD4hyZZk6JBrsVte8LBk4FAG+rczbZSJeuLfH9mfx8jdDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767732658; c=relaxed/simple;
	bh=4aS/irjc/0UjcNZce21ngtGjOsRmQB79kwS9yXfL64M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pLyqgV1d6M6fyU1K22YUtVXePl73EWxEBrW9U7gqJb+JhF4+OTT7crJe+L71NZwl4v1UC7IRaWIq0rNiK2fIgVy09REPYKPu1pT69kliq59OstohCVymiaShljbrnopVkau18iRFj7pEYMskdIwhJF3HlyXj5T/m9OzzpIZupq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jx3ql06Y; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jx3ql06Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767732656; x=1799268656;
  h=date:from:to:cc:subject:message-id;
  bh=4aS/irjc/0UjcNZce21ngtGjOsRmQB79kwS9yXfL64M=;
  b=Jx3ql06Y/1CMDcdS1RQ6PkJOeJzjC4iqS3MW/jDcvrVoMerR6L0TW1Lu
   RP/qzw1yQzza1JJ/hy5O8xHCr+3WLjbv7panKa4EIojKJ2uvUnkkadGQX
   dvYsfba6C4UVwz6oPrA6sHd6rd2NZmAy4OT7ohiwG18gcc74TFx3DgMLN
   COFeUC8Ocnzyyfs6JwiuKNekRRyKRsNV/YLkxFNcMAz4Ryg7iJUqoGp5s
   bb7RQ0YOKLMkCYTx98vodV9qIObonhkOgO7yrkLKj50fm/Q6bHXB6kSra
   LOAKTU4td5n90mqXGtkkmvWflebEm6LZEu+Q604bJsQ7j4vFCMbFcnbvI
   g==;
X-CSE-ConnectionGUID: orDKU57QQ9GpA0WKXp/dag==
X-CSE-MsgGUID: 6ca54ij4RaihZOmmhXUwww==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="69177861"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="69177861"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 12:50:54 -0800
X-CSE-ConnectionGUID: nzMD/zzzQCWGdL5Gehr5hA==
X-CSE-MsgGUID: lSYvNpvaQhKsknnwtvw4yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="202510119"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 06 Jan 2026 12:50:53 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdE0s-000000001Mf-0gTP;
	Tue, 06 Jan 2026 20:50:46 +0000
Date: Tue, 06 Jan 2026 21:50:40 +0100
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 linux-doc@vger.kernel.org
Subject: [akpm-mm:mm-nonmm-unstable 105/107] htmldocs: Warning:
 MAINTAINERS references a file that doesn't exist:
 Documentation/core-api/kho/bindings/memblock/*
Message-ID: <202601062108.Zji1qYKz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   bf64790fd7f2a71c84dada79a573d37cb08adbe6
commit: eb740b17afda02cf4df31bf10dd9a1450e5ad158 [105/107] kho/abi: add memblock ABI header
reproduce: (https://download.01.org/0day-ci/archive/20260106/202601062108.Zji1qYKz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601062108.Zji1qYKz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-platform-ayaneo
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/input/touchscreen/himax,hx83112b.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/media/mediatek-mdp.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/core-api/kho/bindings/memblock/*
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
   Warning: arch/riscv/kernel/kexec_image.c references a file that doesn't exist: Documentation/riscv/boot-image-header.rst
   Warning: drivers/clocksource/timer-armada-370-xp.c references a file that doesn't exist: Documentation/devicetree/bindings/timer/marvell,armada-370-xp-timer.txt
   Warning: include/rv/da_monitor.h references a file that doesn't exist: Documentation/trace/rv/da_monitor_synthesis.rst
   Warning: kernel/liveupdate/luo_core.c references a file that doesn't exist: Documentation/core-api/kho/concepts.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
