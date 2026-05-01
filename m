Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A6734D3A5
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 May 2026 06:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777615831; cv=none; b=ocqSqN1Co/4IyyZ1fGLW9/Pv/HABLwZlkJUw5QjroxgJsLaqDMoySbkHpS3khhPUbzl1q8nghTIPLSdZF8siPucYyadOGYmNA2uhOda0LTqKw2ZQXLleFPIhFMk4yspSxt7VD6HElek+m+FgJ7vtiUt0uJI5DaoK7/aE7lPAEiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777615831; c=relaxed/simple;
	bh=wG6YV/Ykqt6ewlp9eqF7ZwF0hmYAWV2KijMVqRZ1SnQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=d+QwRviqAFsnxXVZAYODKde3enTrxujVLFjM4r6n20PwU78xl0OpFE5vgnUKXy4aZXTlL85NqMFQRFX2eZhviiImWjv1mSXEPL35vztLaHmNuL1uWNUjWCB102aYXBZq4to+fYGPl3aGH1yNvI8MxtDiW0sGmabbVW4IQ8vhDrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JollPxf1; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JollPxf1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777615829; x=1809151829;
  h=date:from:to:cc:subject:message-id;
  bh=wG6YV/Ykqt6ewlp9eqF7ZwF0hmYAWV2KijMVqRZ1SnQ=;
  b=JollPxf1fDLOnydI1DwP4+PUCLKnSd7HEmcLcOCHAZxQ5h84hKXUhLU8
   4GCJ7rBGyhPtN6rSrzdp+upgaaAreFMfzxMRaClEM45KeJxRaakw/Ckvy
   azyebs5k9RJt9My0uigRrDtQOb49oxmFNcNR/vE8KcFsplVRxRq7RRIc6
   KvyZvufQeM68af37skw7Ggc9eQScoKfrC960XtAWLsDNkpGZYjvLt/71L
   PK5Q/mAaAp0/rCc1guN6x4pIK6+iY5O1EBlexXeI+pjIqDyDLAc7g83Zp
   NInoBtiZSigxaT7iAPaiPTx7/7fRHnwD6nLUIMlZ3lTiPKdbx4Rydmk9y
   A==;
X-CSE-ConnectionGUID: slMq0bVdQ96pPk7jtGZqjg==
X-CSE-MsgGUID: 4JFOTI/WTjSWTlBQ9FCsww==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="89173039"
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="89173039"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 23:10:29 -0700
X-CSE-ConnectionGUID: JFs0w0tBTbOUb/HSJMTTeg==
X-CSE-MsgGUID: rtNC8fHQTuWwSAapOUxx1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="230196113"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 30 Apr 2026 23:10:27 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIh4z-000000000FL-3BhK;
	Fri, 01 May 2026 06:10:25 +0000
Date: Fri, 01 May 2026 14:10:18 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lunn:v7.0.0-net-next-driver-removal-v1 14/18]
 /kbuild/src/scripts/Makefile.clean:12:
 /kbuild/src/drivers/net/ethernet/xircom/Makefile: No such file or directory
Message-ID: <202605011442.5wk8pXcV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Andrew,

First bad commit (maybe != root cause):

tree:   https://github.com/lunn/linux.git v7.0.0-net-next-driver-removal-v1
head:   75e17109856eb8e407a19759d3ad750fe3854b63
commit: ec673537eb22468be20a6ef3b1a30f7f45ca1e35 [14/18] drivers: net: xircom: xirc2ps: Remove this driver
config: sh-allnoconfig (https://download.01.org/0day-ci/archive/20260501/202605011442.5wk8pXcV-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260501/202605011442.5wk8pXcV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605011442.5wk8pXcV-lkp@intel.com/

All errors (new ones prefixed by >>):

   /kbuild/src/scripts/Makefile.clean:12: /kbuild/src/drivers/net/ethernet/fujitsu/Makefile: No such file or directory
   make[7]: *** No rule to make target '/kbuild/src/drivers/net/ethernet/fujitsu/Makefile'.
   /kbuild/src/scripts/Makefile.clean:12: Failed to remake makefile '/kbuild/src/drivers/net/ethernet/fujitsu/Makefile'.
   make[6]: *** [/kbuild/src/scripts/Makefile.clean:61: drivers/net/ethernet/fujitsu] Error 2
>> /kbuild/src/scripts/Makefile.clean:12: /kbuild/src/drivers/net/ethernet/xircom/Makefile: No such file or directory
>> make[7]: *** No rule to make target '/kbuild/src/drivers/net/ethernet/xircom/Makefile'.
   /kbuild/src/scripts/Makefile.clean:12: Failed to remake makefile '/kbuild/src/drivers/net/ethernet/xircom/Makefile'.
   make[6]: *** [/kbuild/src/scripts/Makefile.clean:61: drivers/net/ethernet/xircom] Error 2
   make[6]: Target '__clean' not remade because of errors.
   make[5]: *** [/kbuild/src/scripts/Makefile.clean:61: drivers/net/ethernet] Error 2
   make[5]: Target '__clean' not remade because of errors.
   make[4]: *** [/kbuild/src/scripts/Makefile.clean:61: drivers/net] Error 2
   make[4]: Target '__clean' not remade because of errors.
   make[3]: *** [/kbuild/src/scripts/Makefile.clean:61: drivers] Error 2
   make[3]: Target '__clean' not remade because of errors.
   make[2]: *** [/kbuild/src/Makefile:2144: _clean_.] Error 2
   make[2]: Target 'mrproper' not remade because of errors.
   make[1]: *** [/kbuild/src/Makefile:248: __sub-make] Error 2
   make[1]: Target 'mrproper' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'mrproper' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
