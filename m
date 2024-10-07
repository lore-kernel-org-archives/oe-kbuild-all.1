Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DC71D3560
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Oct 2024 13:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728308455; cv=none; b=bPUK7wSZ/KQOUzsJSug7OpwUy45+AxYEWFbcc8vVHd2isNLqzORvJ61lIxfsDdSPPx77SYXgRM8CzrPX3S7jdWzwJAdqp6Rwki/gs5ZeFQixMGHRWLXoknMirjTe+zB/5AMVjz4ZFH8v244mv551ZFrtNsWTEp/Eq4VBjqI+tLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728308455; c=relaxed/simple;
	bh=+YHkgUhGkk5Lzj3dAfjhj4xV7MgAc3X0nBxpXWoeRSY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rj/TFzywmXGoXK/TlcdMR0AMokom3uhnTuGLDJR7chCRjOtDqdRsYpD0z7viVd7DAPMqy4Y64s+ltt6nV4A5x4PiQfk9lqxBhP3e2x7TAW4uQy0DdpLnVYuGkoZEJUhG9/Mssb4rh4/DUrezXlwyp0czjKT3r4DP+0AfkeNYP5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hjSyFgU3; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hjSyFgU3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728308454; x=1759844454;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+YHkgUhGkk5Lzj3dAfjhj4xV7MgAc3X0nBxpXWoeRSY=;
  b=hjSyFgU3DgILqrxigDhKB5j6F8OpDv7DP0Hs4dWe87B3M7rMUvL5/rIO
   0HT/+MYCrBgj7TYMF6MLtfi1MKqdC5Txf3GRH5yevgfDqbuoT+JdG4LKK
   bWdLv34OPdEwjE3vfcxXj7WKXe1ACjG8dK0UP9zFl++fRE+nScdyjHlVQ
   axwXw8Ey6P4vFaRyhR2XmDhvD1H1m5tb97fJgg9n98Np2t9ouNT1d/vi0
   EuCEROCh+rj4zg8ydrFwmdZvT/pOISwvbizzVB0aatwOmi0M9LGbiBoY/
   +ygu5JbhblWgsWG0yBKZDqmKWN9Ad937izGQAmGc0N0OiaeK+6zEU79Tr
   w==;
X-CSE-ConnectionGUID: kPf5o61US8a+MFYVNA2K8w==
X-CSE-MsgGUID: pKKzp09ZTSK5Pn6vIaimPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="38823170"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="38823170"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 06:40:54 -0700
X-CSE-ConnectionGUID: NfqiKMRXSLKIcEaIao08cA==
X-CSE-MsgGUID: pYiGdS77SiKBlYIWliKCAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="79881731"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 Oct 2024 06:40:52 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxnyk-00052i-2W;
	Mon, 07 Oct 2024 13:40:50 +0000
Date: Mon, 7 Oct 2024 21:40:49 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.12-rc1 67/132] drivers/acpi/pptt.c:737:51:
 error: 'acpi_debugfs_dir' undeclared; did you mean 'acpi_debugfs_init'?
Message-ID: <202410072127.vTAOrEFL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.12-rc1
head:   4d17b37b670795954fd7a70c8ec83fb705a5e2ad
commit: ce15acc1bba57df6278c89af80812a5fd34c1e38 [67/132] ACPI / PPTT: Add debugfs entry for the PPTT cahce-id repainting
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20241007/202410072127.vTAOrEFL-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241007/202410072127.vTAOrEFL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410072127.vTAOrEFL-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/acpi/pptt.c: In function 'cache_setup_acpi_repaint_cache_ids_debugfs':
>> drivers/acpi/pptt.c:737:51: error: 'acpi_debugfs_dir' undeclared (first use in this function); did you mean 'acpi_debugfs_init'?
     737 |         pptt_debugfs = debugfs_create_dir("pptt", acpi_debugfs_dir);
         |                                                   ^~~~~~~~~~~~~~~~
         |                                                   acpi_debugfs_init
   drivers/acpi/pptt.c:737:51: note: each undeclared identifier is reported only once for each function it appears in


vim +737 drivers/acpi/pptt.c

   730	
   731	/* cache_setup_acpi_repaint_cache_ids() runs too early for debugfs */
   732	static int cache_setup_acpi_repaint_cache_ids_debugfs(void)
   733	{
   734		if (!repainted_cache_ids)
   735			return 0;
   736	
 > 737		pptt_debugfs = debugfs_create_dir("pptt", acpi_debugfs_dir);
   738		if (pptt_debugfs)
   739			debugfs_create_file("cache_ids", 0440, pptt_debugfs, NULL,
   740					    &pptt_repainted_fops);
   741	
   742		return 0;
   743	}
   744	subsys_initcall(cache_setup_acpi_repaint_cache_ids_debugfs);
   745	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
