Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7249623C8C4
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 09:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739008660; cv=none; b=p9TUIQHtF6XcpOx98R5CIynSliCfMph/RxGW+0m15pTEEeEtXF+X5v1aXLHGDbjN3QYjegQ1czOaq4S9oUWjoJLMu3z6WFymto4sCUu9taypWH5xrNeErljsLBVaVt0nmG8M49ZJpLyjJylAWOwZZqcJRE8CKdQojvCC+6tgcWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739008660; c=relaxed/simple;
	bh=QwLCAPjA6s3lTH/Qfw97XhHUIiks0QUtMiNSZoMJDVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rQHURTWd05KcR8LTPdeYFCNZ+uMLdaw3g86VSMIsedQM+mCbDvwyGHpssBltWgYUuv2SgnKOizjxWzwnFs8rPR4WpVbhRzM1bKPdhWtcABzNYN2G2s4/yZJtQIWfZ/3CcpbLOV//2QpZwlnU3r2+GDM/9jZrBkmKpzivGdIYA4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jtoIgXbi; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jtoIgXbi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739008657; x=1770544657;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QwLCAPjA6s3lTH/Qfw97XhHUIiks0QUtMiNSZoMJDVQ=;
  b=jtoIgXbi8rdOH72HR1+jCirnC9lIlknm3cCuBpqO4IFEwSV7BIkq2XKs
   h3PFtT15Y/j06zgD7+bOEAB+plqOnUcV22mF5GjtAMs+gMaYMaAE01eQV
   AkSmdlLZorCCvLhWwfvbJ+hL/ub0EJLChzmt5hgqHZyaLPRVwxEPVQ/HE
   eSb+9QxuoUd4DuacFZuTCnnqo7iVY5nbXtGXEDHi3yp9NAmPngVkgQnip
   n2ZkIjDaDzsdl6QaXBaQibBUTLF6s4gSj0U/wXDJc6ietu3R0cPLivUaL
   AvyDeQz5GqTmfKkkk73zBgY5+0UIVHYibqMIgYlL4+WsRUGTFrQOD2Fjj
   A==;
X-CSE-ConnectionGUID: /L2TOz7eSX6GJeLznLmPbA==
X-CSE-MsgGUID: /xS7boiUSQ66su6ZLB5e7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="57184522"
X-IronPort-AV: E=Sophos;i="6.13,269,1732608000"; 
   d="scan'208";a="57184522"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 01:57:36 -0800
X-CSE-ConnectionGUID: upi0tEE7QGKwi/9pMCuyfg==
X-CSE-MsgGUID: D09bg+cUQ16zLMD1IADKVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,269,1732608000"; 
   d="scan'208";a="142612650"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 Feb 2025 01:57:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tghae-000zpT-2N;
	Sat, 08 Feb 2025 09:57:32 +0000
Date: Sat, 8 Feb 2025 17:57:17 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_sbi_sse_v3 29/57]
 drivers/irqchip/irq-riscv-rpmi-sysmsi.c:295:36: warning:
 'acpi_rpmi_sysmsi_match' defined but not used
Message-ID: <202502081729.87q3NgmZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_sbi_sse_v3
head:   89fd1a54d40f5fbd0a1c7fb10f51829f13385a9a
commit: c2fda1370f05b732e7717a9f9181498303a58b7d [29/57] irqchip/riscv-rpmi-sysmsi: Add ACPI support
config: riscv-randconfig-001-20250207 (https://download.01.org/0day-ci/archive/20250208/202502081729.87q3NgmZ-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502081729.87q3NgmZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502081729.87q3NgmZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-riscv-rpmi-sysmsi.c:295:36: warning: 'acpi_rpmi_sysmsi_match' defined but not used [-Wunused-const-variable=]
     295 | static const struct acpi_device_id acpi_rpmi_sysmsi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~~~~


vim +/acpi_rpmi_sysmsi_match +295 drivers/irqchip/irq-riscv-rpmi-sysmsi.c

   294	
 > 295	static const struct acpi_device_id acpi_rpmi_sysmsi_match[] = {
   296		{ "RSCV0006" },
   297		{}
   298	};
   299	MODULE_DEVICE_TABLE(acpi, acpi_rpmi_sysmsi_match);
   300	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
