Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA367197
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jun 2024 00:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718151076; cv=none; b=T/SJQMtVxMU6H6RhCnh0YfiwylFoBbIFvV90tnkRoF31kHg0e91WOvW62Eshs4cre+RU/zd16WRxJDpo4EA8srYLdB23RDVDrLyiZufwreERnhm9ef56AISKOCAHHgcYEGPgbjDiB2fn0gedXjdKucdX7EO4wJugevCRgTeNrEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718151076; c=relaxed/simple;
	bh=R3YJNjuz885MqaYmjaeQB5co2PpKqsrJ46/dGh0FwbM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WqfgFlKeElfiOI+JNxG379bNxXDbjGkCrX3XKLSXe6hV4O4/aZZMdRpnlz1iMtmvmehfJVhqWFf5WtCiQG2UvLhxi143E6rIXNz25uKus8xFzcpBJA1H5ZT1tiPYy5nnfrK4pTCU0iF3SjjSewd6LfS04omm1Hcj1ASk4GeaCU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CMEyUnR+; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CMEyUnR+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718151074; x=1749687074;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R3YJNjuz885MqaYmjaeQB5co2PpKqsrJ46/dGh0FwbM=;
  b=CMEyUnR+qGorh7jBogvxkg/7cQzbMuDi9sYmygAb8O0dlhbzEts0xYFR
   4j5uB+FqGcp/Hb5vD4a0fyaJ5O+TvQstkVQtCzEnyqOfv3E2El/xFb1jj
   MkEbhSxlejGu0pdOYhRglEZ/ML7s4e+9/HZVq2Nvou8yc05F3ciT3JZb8
   1i2lCtOXSmcq3umlAVQthqt8iDxJsFuPMB8pOe3hk4k9bqtFMvCDpa8iO
   AsSB1LuEcNNA2i2SagNOfXr8E3oOQKVrmY+DU602nxK+uYNN2zLEXclm9
   sFrEjeCwF3+RzQZaEdx+5wnqiNPBVaVIx6TIXBszr5nUXlVNAlKpM48mX
   g==;
X-CSE-ConnectionGUID: kMSAuhuoRo6WYOKJjWKeEQ==
X-CSE-MsgGUID: czW4FecmRvm4ntIvQMBL/Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="14767249"
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; 
   d="scan'208";a="14767249"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 17:11:14 -0700
X-CSE-ConnectionGUID: L88tY9CmT/mByVxSrQhPfg==
X-CSE-MsgGUID: rC3mFDsUSY2dBwax2hdFnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; 
   d="scan'208";a="44032668"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Jun 2024 17:11:13 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHBa3-000116-0B;
	Wed, 12 Jun 2024 00:11:11 +0000
Date: Wed, 12 Jun 2024 08:11:10 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:pcie-fix-series 2/10] include/uapi/linux/const.h:20:19:
 warning: large integer implicitly truncated to unsigned type
Message-ID: <202406120856.AcCSUBI4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pcie-fix-series
head:   91793dfd9508b4d9d7b2922cf1d76012848a7f58
commit: 3ec01400bd0a58b64fcbf0bc190ea114dff2364f [2/10] PCI: microchip: Fix inbound address translation tables
config: i386-randconfig-016-20240612 (https://download.01.org/0day-ci/archive/20240612/202406120856.AcCSUBI4-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240612/202406120856.AcCSUBI4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406120856.AcCSUBI4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/vdso/const.h:5:0,
                    from include/linux/const.h:4,
                    from include/linux/align.h:5,
                    from include/linux/kernel.h:15,
                    from include/linux/clk.h:13,
                    from drivers/pci/controller/pcie-microchip-host.c:11:
   drivers/pci/controller/pcie-microchip-host.c: In function 'mc_pcie_setup_inbound_ranges':
>> include/uapi/linux/const.h:20:19: warning: large integer implicitly truncated to unsigned type [-Woverflow]
    #define __AC(X,Y) (X##Y)
                      ^
   include/uapi/linux/const.h:21:18: note: in expansion of macro '__AC'
    #define _AC(X,Y) __AC(X,Y)
                     ^~~~
   include/linux/sizes.h:46:18: note: in expansion of macro '_AC'
    #define SZ_4G    _AC(0x100000000, ULL)
                     ^~~
   drivers/pci/controller/pcie-microchip-host.c:1003:39: note: in expansion of macro 'SZ_4G'
       mc_pcie_setup_inbound_atr(0, 0, 0, SZ_4G);
                                          ^~~~~


vim +20 include/uapi/linux/const.h

9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02   6  
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02   7  /* Some constant macros are used in both assembler and
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02   8   * C code.  Therefore we cannot annotate them always with
6df95fd7ad9a84 include/linux/const.h      Randy Dunlap        2007-05-08   9   * 'UL' and other type specifiers unilaterally.  We
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  10   * use the following macros to deal with this.
74ef649fe847fd include/linux/const.h      Jeremy Fitzhardinge 2008-01-30  11   *
74ef649fe847fd include/linux/const.h      Jeremy Fitzhardinge 2008-01-30  12   * Similarly, _AT() will cast an expression with a type in C, but
74ef649fe847fd include/linux/const.h      Jeremy Fitzhardinge 2008-01-30  13   * leave it unchanged in asm.
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  14   */
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  15  
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  16  #ifdef __ASSEMBLY__
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  17  #define _AC(X,Y)	X
74ef649fe847fd include/linux/const.h      Jeremy Fitzhardinge 2008-01-30  18  #define _AT(T,X)	X
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  19  #else
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02 @20  #define __AC(X,Y)	(X##Y)
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  21  #define _AC(X,Y)	__AC(X,Y)
74ef649fe847fd include/linux/const.h      Jeremy Fitzhardinge 2008-01-30  22  #define _AT(T,X)	((T)(X))
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  23  #endif
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  24  

:::::: The code at line 20 was first introduced by commit
:::::: 9d291e787b2b71d1b57e5fbb24ba9c70e748ed84 [PATCH] x86-64: Assembly safe page.h and pgtable.h

:::::: TO: Vivek Goyal <vgoyal@in.ibm.com>
:::::: CC: Andi Kleen <andi@basil.nowhere.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
