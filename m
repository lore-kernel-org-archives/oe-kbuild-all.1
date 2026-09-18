Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF133466B00
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Sep 2026 05:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789710915; cv=none; b=ClPds9lmtJDD2aRZS8atremOQgC7H3Co0WN6C9AZ6bitNizrBlxjYDR2o9auC93EvfYt25DFi11xFHFLTihan05TSz/moAxINloCWbUkCjFBSSjve7OxwiOUnvs5U92kKy6ENTKCe/EFtmoJr1bd7RO38GIug3kDaDOljRTXbPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789710915; c=relaxed/simple;
	bh=pClc7Scd3firrWgk6zeieE3BhN2eutA0ZTY+fFkWNr4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=T4Ru3wNmcrQMFawBUh+ZZeZ4h7fVIEcsicwLtbgSoPOUCJlkKAayZaFwKSsDiu5KOYRsdUKZpxnNo15gGIdo7olFAkyOGe2dsNgVCzfcUnVAVOid0eUJRTIQQLMzas32XG+aBgU0Rg2DeEswdRY/6xAV2JmhpBtoSoiH9TnoirQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n5AxGImj; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n5AxGImj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789710914; x=1821246914;
  h=date:from:to:cc:subject:message-id;
  bh=pClc7Scd3firrWgk6zeieE3BhN2eutA0ZTY+fFkWNr4=;
  b=n5AxGImj9YgHViFJob3yxxAXxScL3nbGt7xM9tZFb3RyHVJ1l8GzD/bd
   AOf9+5yjbRTaMuVAqCmZyAJdDyguLPLKqyTaXbXnsTcH96+k14nfsC27A
   SUVj+2ANrLRxabGGFKiK/boGLuIl8gCGtJ5dKe0LbxxUw+CmHXU768gxs
   YReRswTxYtsRsyq4orNblEHG7UgEXa5KNz+f1GXnN5WNzyW4T/XvtNb/y
   7Fg3wEHW+Tvyw2Vmt6GxR7s/kKwbDm9tUzA0O2dwt25H3o5WrYcAOpJ9M
   BwCgh2T01T6Sri0NEZ8RwQ6Wf15tw4dPStiNndIfmAFGTREcjZBd8C+eZ
   g==;
X-CSE-ConnectionGUID: hZmHf8QISCyV5I2H0abeEg==
X-CSE-MsgGUID: Fae2qQoGQ5WeGKYa+qBVsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="115726597"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="115726597"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 22:55:13 -0700
X-CSE-ConnectionGUID: gHyeQZ7pT46nUT4R1Ia++g==
X-CSE-MsgGUID: Ppin04xSSM2phGFm0OsVCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="299323546"
Received: from igk-lkp-server01.igk.intel.com (HELO fe5626a770c0) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 17 Sep 2026 22:55:11 -0700
Received: from kbuild by fe5626a770c0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7RYu-000000000zo-39Jl;
	Fri, 18 Sep 2026 05:55:04 +0000
Date: Fri, 18 Sep 2026 07:54:28 +0200
From: kernel test robot <lkp@intel.com>
To: Damien Le Moal <dlemoal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 "Martin K. Petersen (Oracle)" <mkp@kernel.org>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Hannes Reinecke <hare@kernel.org>
Subject: [linux-next:master 6723/8072]
 include/scsi/scsi_sense.h:34:9: warning: 'ASC' redefined
Message-ID: <202609180743.kyprDg18-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e657a464aba873f5eaf3ca821b6e4016674492d6
commit: 72c54bd0cbb2e0c35f4acd056e91c596469edc5f [6723/8072] scsi: core: Define all additional sense codes and their qualifiers
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20260918/202609180743.kyprDg18-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260918/202609180743.kyprDg18-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609180743.kyprDg18-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/scsi/scsi_proto.h:15,
                    from include/scsi/scsi_common.h:11,
                    from include/linux/cdrom.h:17,
                    from drivers/block/floppy.c:252:
>> include/scsi/scsi_sense.h:34:9: warning: 'ASC' redefined
      34 | #define ASC(name, code)                                 \
         |         ^~~
   In file included from arch/sparc/include/asm/floppy_64.h:284,
                    from arch/sparc/include/asm/floppy.h:5,
                    from drivers/block/floppy.c:246:
   arch/sparc/include/asm/ns87303.h:23:9: note: this is the location of the previous definition
      23 | #define ASC     0x09
         |         ^~~


vim +/ASC +34 include/scsi/scsi_sense.h

    32	
    33	#define ASC_DEF(name)	ASC_##name
  > 34	#define ASC(name, code)					\
    35		ASC_DEF(name)	= (code),			\
    36		name		= ((code) << 8) | 0x00
    37	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
