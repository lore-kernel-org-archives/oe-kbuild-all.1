Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E30146013
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 10:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727519414; cv=none; b=QezRE2zcOzR3JejFSxvs7/WiJc7urSyGTQO12j0thINzht/ZXceCcbs1glmrOQiSFR3aHbvxuA3zJlDArLx17UGYtk2izmfVP3j0LNmvOpa3ZrKCD0LqfjH45HE3T3Irwk5QTUwf3MRzcSbqt3KuLWNtack2LzjIfDESibibEmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727519414; c=relaxed/simple;
	bh=EoHMLhI5oNUFNLnCSptfOl42SgVwGwgfYJAZGMBD9WE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ftow0obJgYotRuKUpNnCeSYpEXDli1SiAr8nXR9j2v/ToQwKtku7OhF2O7MoDYH2G/mMgCwRrbeq75Yjy+O3yMu9qs6SpAHvyIA4A4z8XdFEoVruei0NjMbWYMXamUyFXJmZkjYFGF1yksufpaUiVNH84QWjABNBZNFEbNKv0RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mPIz6Euy; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mPIz6Euy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727519413; x=1759055413;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EoHMLhI5oNUFNLnCSptfOl42SgVwGwgfYJAZGMBD9WE=;
  b=mPIz6EuyhbSqwXCkbMpQb0T4RB3A2OHTu8Jg6BMxQhb6Oq5gI8IDE8r3
   oWFL6VkcauS5PszR5RhDr6f4GQSO3qyhUt8htEof+uy7+rJiF3/EjqzWo
   vJO4wIqQJqIFXcnvreRFCLfpfagMCLPBiJkG7demqykM3UJRuTuPwetrX
   7WLY/Ho93MQv/1FEfMUrMddnRZRNVP2P7gjjyTdAPBzUwUMuw1iPTFDvZ
   QPUd3Zbo9jLQ1KwkjpwVhTWW9zt2pqkXYEbpfdyyZ7eV9Fi1hfbaB439h
   8zzJAoxHO1ej95FYYc49SKz2MTLa3FgLD7iWi/FlV2hwjD631S7JUvYqu
   Q==;
X-CSE-ConnectionGUID: zhcnd3N5RieE+oNbgn3vlQ==
X-CSE-MsgGUID: rMk61OuYT+2CSR2oIVCqdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="44127406"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="44127406"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 03:30:13 -0700
X-CSE-ConnectionGUID: b7nhxpNaTtSr71TUETVcRQ==
X-CSE-MsgGUID: E2Du9Oa1RAqS9KIdA8625g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="77312104"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Sep 2024 03:30:13 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suUiH-000NAD-0L;
	Sat, 28 Sep 2024 10:30:09 +0000
Date: Sat, 28 Sep 2024 18:29:48 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 104/16788]
 drivers/soc/imx/secvio/imx-secvio-audit.c:11:5: warning: no previous
 prototype for function 'report_to_audit_notify'
Message-ID: <202409281807.aGCLfH4G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: 81a1a8eade1c5d83dbf1fc9bad8f385ea60f3f26 [104/16788] SSI-87: soc: imx: secvio: Report to audit FW all security violations
config: arm-randconfig-004-20240928 (https://download.01.org/0day-ci/archive/20240928/202409281807.aGCLfH4G-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409281807.aGCLfH4G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409281807.aGCLfH4G-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/soc/imx/secvio/imx-secvio-audit.c:7:
   In file included from include/linux/audit.h:13:
   In file included from include/linux/ptrace.h:10:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:2168:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/soc/imx/secvio/imx-secvio-audit.c:11:5: warning: no previous prototype for function 'report_to_audit_notify' [-Wmissing-prototypes]
      11 | int report_to_audit_notify(struct notifier_block *nb, unsigned long status,
         |     ^
   drivers/soc/imx/secvio/imx-secvio-audit.c:11:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      11 | int report_to_audit_notify(struct notifier_block *nb, unsigned long status,
         | ^
         | static 
   2 warnings generated.


vim +/report_to_audit_notify +11 drivers/soc/imx/secvio/imx-secvio-audit.c

    10	
  > 11	int report_to_audit_notify(struct notifier_block *nb, unsigned long status,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
