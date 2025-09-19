Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75BA2FB092
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Sep 2025 10:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758278263; cv=none; b=VhYYVE8dgzFhO12ybPaSa+WNS3mqkRHikCxDJ8vVdFCNPRrRlq7Lygkdv3U2SonsqoSzrIeh5fOCjuR9HiJkSg03b7kpteqIK9EQ494NPh+P8h8EuFY1JerR/YbhLRIuD4ShVYunhMEbq5K7Oejoavpu7Vv3sdohCynoewrltrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758278263; c=relaxed/simple;
	bh=DSUZPOE22Ruda9WCMl3YibwbkDStasCjfsVM4rKQYLA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q2j2BusftAm+LM1ngdhmvsROLomK1ZBWhIyqgmv4hQfNrB8cRhlHRFN1/d4aap37okBnNq10JJG2dg5W/LK4/mMb21IVX9iuIzihMWpLN+OHRiq+z1Q9XYD/QLRDSNoCP9aE3gBoONPJ2zXL+n51Btj9SSBt/MMIEsGiLIxwvWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EMxkCYbJ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EMxkCYbJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758278258; x=1789814258;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DSUZPOE22Ruda9WCMl3YibwbkDStasCjfsVM4rKQYLA=;
  b=EMxkCYbJ4yP5dPpzwJVu6FjBGERbhp180C8HqAl0SnZmHebDY2YrnivX
   U2KG3wjLy3jripRDIKFA2QxE/hTQ61K0AOn8f+ArxMGOv6c6UOuWAGqLw
   DD4RBFMpKFf/U5YsTXS4QEC4Q4MqxTqjTqssX3PqYmdtRKu2t6tL02AkF
   4jrPzPbJjYWUxAxd+9JJUmHUHYpUNG1QaQtGMljy33WkJTlS9iEprY1fl
   yw0Bd5NPyQNnkKkXkt5kulYnN6HH6g1hVFjz0Ap+HGk2Z6x6sl2W9KKAr
   /rAq7ja27X4Avi2vS62IPUnKfCuNgRgXV/nDVQ16xf2blNekXTYhoKl+X
   g==;
X-CSE-ConnectionGUID: uHqJbweLTtau8uNrNbzwtQ==
X-CSE-MsgGUID: JJrUIVkMSzyI2mZ9aLQbmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="59663597"
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; 
   d="scan'208";a="59663597"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 03:37:37 -0700
X-CSE-ConnectionGUID: 2s6P6KvgQnCtKdtSUjAIkA==
X-CSE-MsgGUID: GFtTUOFzRuOLgUnqTNS0TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; 
   d="scan'208";a="175622497"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa007.jf.intel.com with ESMTP; 19 Sep 2025 03:37:36 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1uzYUf-000000003Jp-21EB;
	Fri, 19 Sep 2025 10:37:33 +0000
Date: Fri, 19 Sep 2025 12:37:16 +0200
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:6.6-velinux 0/5959] htmldocs:
 Documentation/arch/x86/resctrl.rst:577: WARNING: Title underline too short.
Message-ID: <202509191259.afo8GBm2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 6.6-velinux
head:   267e33ff5e034d9f9222c229e6967b6ceb65e27a
commit: 63fc9fa5dc9d1d911a9a330706c0316a1dd9f002 [0/5959] Documentation/x86: Document that resctrl bandwidth control units are MiB
reproduce: (https://download.01.org/0day-ci/archive/20250919/202509191259.afo8GBm2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509191259.afo8GBm2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/admin-guide/media/ipu3.rst:598: WARNING: Footnote [#] is not referenced. [ref.footnote]
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/pstore_zone.h' failed with return code 2
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/pstore_blk.h' failed with return code 2
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/rio_drv.h' failed with return code 2
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/rio.h' failed with return code 2
>> Documentation/arch/x86/resctrl.rst:577: WARNING: Title underline too short.
--
   Memory bandwidth Allocation specified in MiBps
   --------------------------------------------- [docutils]
>> Documentation/arch/x86/resctrl.rst:577: WARNING: Title underline too short.


vim +577 Documentation/arch/x86/resctrl.rst

a9cad3d4f046bb Documentation/x86/intel_rdt_ui.txt Vikas Shivappa 2017-04-07  573  
a9cad3d4f046bb Documentation/x86/intel_rdt_ui.txt Vikas Shivappa 2017-04-07  574  	MB:<cache_id0>=bandwidth0;<cache_id1>=bandwidth1;...
a9cad3d4f046bb Documentation/x86/intel_rdt_ui.txt Vikas Shivappa 2017-04-07  575  
63fc9fa5dc9d1d Documentation/arch/x86/resctrl.rst Tony Luck      2024-03-22  576  Memory bandwidth Allocation specified in MiBps
d6c64a4f49fdea Documentation/x86/intel_rdt_ui.txt Vikas Shivappa 2018-04-20 @577  ---------------------------------------------
d6c64a4f49fdea Documentation/x86/intel_rdt_ui.txt Vikas Shivappa 2018-04-20  578  

:::::: The code at line 577 was first introduced by commit
:::::: d6c64a4f49fdea0ae79addc3282ae8eb8581bdfc x86/intel_rdt/mba_sc: Documentation for MBA software controller(mba_sc)

:::::: TO: Vikas Shivappa <vikas.shivappa@linux.intel.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
