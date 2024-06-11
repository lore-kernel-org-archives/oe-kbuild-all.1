Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1557494
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jun 2024 00:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718064712; cv=none; b=BLCfpGyQVA+Ueb2Do8mzZggRK6RbEmcOIkE8t/jKEtPseIz0YomrS3fDyKX8IN1sJpdDIib5uo55qDeSiBYX67j2u87m0Nho4t+mxY5tGlbQnusHeCG7SdaL40jyPvPwOQAneqK7LvThZXwiS9YmS24P5HE0023IAlU8OVQdcI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718064712; c=relaxed/simple;
	bh=1XfecBZExk3kN0sG3SQ3nRFrYfugNRbTV6OqjO5RCug=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fn9KaR9AwSloicm2zgGUto8pi4yTYYaP867XRvS2iV8jaShFo3tr2nOrHPAzs/O+I6/XDacoTO6u7xi8wjRYPfmPey2P9a823537VsrwEBQDWKi7ohwO27oe5yd9spgE/rAIhJuotfuY0ZSsJNtQzal2FtibWfArLj1Ximzvaf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kip1/Uct; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kip1/Uct"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718064711; x=1749600711;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1XfecBZExk3kN0sG3SQ3nRFrYfugNRbTV6OqjO5RCug=;
  b=Kip1/UctJBnb+34hMFIVw4PZVlV8RqU3ZVcONoK7m3yETeuClNRGf7ug
   v5t9voZ9sHb5iQSlrKimbH66ut9+iT0d5RiBG6RQnarU8EV3UXQ4AaOWT
   TFqQdMMx2u3MHS6Y2V1o4/5b3wfyZ2TepTLdPZ91PzFLhSadn8NZ7DuFO
   YqBiLFgpkOuzzOj5XF470/5GO/+yr/PO3PdZCUK5rnBNvsAr59HjUKq1D
   pDj9PkvJ5O2YlaNpHgS9s7l09TvflNUvRhSXlvAnFMD7oqyG3Z/arlgAs
   8Rt/KYZANkKrEG1nccW3O3cT3ETCLb3WYzCAvQOt/DBcAytGdlasrplpp
   g==;
X-CSE-ConnectionGUID: ShAprQP0TbW5rr7RxDU6rQ==
X-CSE-MsgGUID: Xu+0L1jBSiGbtK7gyjkKYw==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="26167475"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="26167475"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 17:11:50 -0700
X-CSE-ConnectionGUID: HrQXx5DiS4Cuyn3zS8aZBQ==
X-CSE-MsgGUID: YuVjyGVdROmz13RRWgzzpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="62400021"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Jun 2024 17:11:49 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGp74-0002cW-1W;
	Tue, 11 Jun 2024 00:11:46 +0000
Date: Tue, 11 Jun 2024 08:11:07 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Shivamurthy Shastri <shivamurthy.shastri@linutronix.de>
Subject: [tglx-devel:devmsi-arm 12/25]
 drivers/irqchip/irq-gic-v3-its-msi-parent.c:124:12: error: redefinition of
 'iort_pmsi_get_dev_id'
Message-ID: <202406110746.v1dhIaPQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git devmsi-arm
head:   c0f9480169244284eb4f7bc656ab52d03a5badd4
commit: fb5724e6533806eab0f9cc24f1c9be8b1ade2d02 [12/25] irqchip/gic-v3-its: Switch platform MSI to MSI parent
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240611/202406110746.v1dhIaPQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240611/202406110746.v1dhIaPQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406110746.v1dhIaPQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/irqchip/irq-gic-v3-its-msi-parent.c:7:
   include/linux/acpi_iort.h:53:19: error: static declaration of 'iort_pmsi_get_dev_id' follows non-static declaration
      53 | static inline int iort_pmsi_get_dev_id(struct device *dev, u32 *dev_id)
         |                   ^~~~~~~~~~~~~~~~~~~~
   include/linux/acpi_iort.h:30:5: note: previous declaration of 'iort_pmsi_get_dev_id' with type 'int(struct device *, u32 *)' {aka 'int(struct device *, unsigned int *)'}
      30 | int iort_pmsi_get_dev_id(struct device *dev, u32 *dev_id);
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/irqchip/irq-gic-v3-its-msi-parent.c:124:12: error: redefinition of 'iort_pmsi_get_dev_id'
     124 | int __weak iort_pmsi_get_dev_id(struct device *dev, u32 *dev_id)
         |            ^~~~~~~~~~~~~~~~~~~~
   include/linux/acpi_iort.h:53:19: note: previous definition of 'iort_pmsi_get_dev_id' with type 'int(struct device *, u32 *)' {aka 'int(struct device *, unsigned int *)'}
      53 | static inline int iort_pmsi_get_dev_id(struct device *dev, u32 *dev_id)
         |                   ^~~~~~~~~~~~~~~~~~~~


vim +/iort_pmsi_get_dev_id +124 drivers/irqchip/irq-gic-v3-its-msi-parent.c

   123	
 > 124	int __weak iort_pmsi_get_dev_id(struct device *dev, u32 *dev_id)
   125	{
   126		return -1;
   127	}
   128	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
