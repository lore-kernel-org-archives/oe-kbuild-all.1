Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2228A1CDFCC
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Jan 2025 22:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736115121; cv=none; b=NAW9x8NGWwTjw1RG6qHqYBYhAiUX9uhQMyU7Qua1v8dg6gFTaaTLQluFYPIl6Suv4MF8L7wzgmPWm2JuDYqLQNb8r1zLnYMMBthi6NN7JTSEmv2zGfK/BPZWpTk9jdkkHxmn2ePK5/hZ0Bp8L8XPPhVanOGPrlaHzPHMZ90UJHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736115121; c=relaxed/simple;
	bh=oNtHOSG98C+HlIAFaLlfE1igGDocIZZLDAm4+ix0T2c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EgV32ouM0L2r0NzIcwUeUhBVIM+lW0MbDqMlS1gRUOaaIVijN4FExXETjOXlhO6/n+LWvFO5GXqy1zxdngde88t/1cp/dfdo5JFR60xtyqAsIqLW/+iFOBNReZbSIpVcgpdWiCiox/C96nQPCeXnf9xuBtA8fiktTYDDVfR0Hlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a6qOWWF9; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a6qOWWF9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736115119; x=1767651119;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oNtHOSG98C+HlIAFaLlfE1igGDocIZZLDAm4+ix0T2c=;
  b=a6qOWWF9NDnxGPXhwkjavuiL3ghuxiHXjrXyph6wSMiuobdGVEF8XpKe
   tJd98bsV+VTjSmoHIyZdCqz2UtaMrx1ryTVrC7vnt3KInmosuW23tBGjr
   mHEmYLwujww4PGU7xVs+8h552sMhI6Ou7bbJ4oI4IkxXRqHIEV9PpF0yC
   3tpSDdvqgQqId7z4dMEVrFeVEu3PcPTXPLIsPsbh0O2p5md9McWIXmqld
   Qjb4OdSsjXOJ8nSud0se1FJtVo5eQd2t+b7OFt/8N2vBdv9WZgw4hSb8y
   4nQdUHgA7eIaYrE/mjzhU6ZI3InHaL+Z8owgeHAMu3IrUw5OtmUyA/wYN
   A==;
X-CSE-ConnectionGUID: NrjGAA5/Q1Sw6doIR6W0Cg==
X-CSE-MsgGUID: QVcBfjuDR0+EDTC6VBj1jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="46934319"
X-IronPort-AV: E=Sophos;i="6.12,291,1728975600"; 
   d="scan'208";a="46934319"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 14:11:58 -0800
X-CSE-ConnectionGUID: FCmN4Wg7ScyZlISitBdwTA==
X-CSE-MsgGUID: sgUrGY97TGudcyHMRvBSCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,291,1728975600"; 
   d="scan'208";a="102072945"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Jan 2025 14:11:56 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUYqg-000C11-1e;
	Sun, 05 Jan 2025 22:11:54 +0000
Date: Mon, 6 Jan 2025 06:11:06 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>
Subject: arch/parisc/kernel/pdt.c:65:6: warning: no previous prototype for
 'arch_report_meminfo'
Message-ID: <202501060625.LbITrgvx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9244696b34f2a626d7468864420ab6a47289bf10
commit: ef104443bffa004f631729dfc924f0b84abbd602 procfs: consolidate arch_report_meminfo declaration
date:   1 year, 8 months ago
config: parisc-randconfig-r016-20230411 (https://download.01.org/0day-ci/archive/20250106/202501060625.LbITrgvx-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250106/202501060625.LbITrgvx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501060625.LbITrgvx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/parisc/kernel/pdt.c:65:6: warning: no previous prototype for 'arch_report_meminfo' [-Wmissing-prototypes]
      65 | void arch_report_meminfo(struct seq_file *m)
         |      ^~~~~~~~~~~~~~~~~~~


vim +/arch_report_meminfo +65 arch/parisc/kernel/pdt.c

c9c2877d08d9aa Helge Deller 2017-05-11  63  
c9c2877d08d9aa Helge Deller 2017-05-11  64  /* report PDT entries via /proc/meminfo */
c9c2877d08d9aa Helge Deller 2017-05-11 @65  void arch_report_meminfo(struct seq_file *m)
c9c2877d08d9aa Helge Deller 2017-05-11  66  {
c9c2877d08d9aa Helge Deller 2017-05-11  67  	if (pdt_type == PDT_NONE)
c9c2877d08d9aa Helge Deller 2017-05-11  68  		return;
c9c2877d08d9aa Helge Deller 2017-05-11  69  
c9c2877d08d9aa Helge Deller 2017-05-11  70  	seq_printf(m, "PDT_max_entries: %7lu\n",
c9c2877d08d9aa Helge Deller 2017-05-11  71  			pdt_status.pdt_size);
c9c2877d08d9aa Helge Deller 2017-05-11  72  	seq_printf(m, "PDT_cur_entries: %7lu\n",
c9c2877d08d9aa Helge Deller 2017-05-11  73  			pdt_status.pdt_entries);
c9c2877d08d9aa Helge Deller 2017-05-11  74  }
c9c2877d08d9aa Helge Deller 2017-05-11  75  

:::::: The code at line 65 was first introduced by commit
:::::: c9c2877d08d9aa0ca0a5c227ac795fbb76269300 parisc: Add Page Deallocation Table (PDT) support

:::::: TO: Helge Deller <deller@gmx.de>
:::::: CC: Helge Deller <deller@gmx.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
