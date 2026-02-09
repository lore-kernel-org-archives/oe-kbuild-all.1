Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77009315760
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Feb 2026 22:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770677104; cv=none; b=u9tQmh8hinYyveeTAaiLZpNeWfpkHldmWNBCAABky1CN2B9I3vUABOT8kDFMODmn0hWPIfBl0HpRK/8Vb0rhpgchI1TWF3IvcZRJl/TQzSrgcWkE9s+nV1LXpx9MjAMZER/0dyWmW37KP7XyWYjlZYsVYGDdavPoW7h8yzAODE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770677104; c=relaxed/simple;
	bh=euBo8F0XbbLZNLcZjfDuxjnpEoTLZgyULftyAIjrx2I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QJCpZoCkqvNUGqIUbRMA4Rn8n6bDkbIFnhlDDtF/S5ZYta0CD+fOGPw16JEg3ru+rfwnkTqtPjtiRrTcnrT5zSF/Kf6t5oa5CbtREE6x1BnZMHAaC957VXQT3YwwHsdrJpeYXXidO7aG+aj/pMWa488nZ7npOmV30tY5y/czEJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WVu7hAwN; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WVu7hAwN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770677103; x=1802213103;
  h=date:from:to:cc:subject:message-id;
  bh=euBo8F0XbbLZNLcZjfDuxjnpEoTLZgyULftyAIjrx2I=;
  b=WVu7hAwNcUK5nR3pK76FR5zwwzdKuW64NqUz7q6+NMM/gbcKu2DlWUJn
   8CmXxILIcsxMQnSrB3dYecsuKr4vPsB3VYbxU9q5FhSNvpDhAxHHDp+jr
   v5nNxY0IBA299S6oF520lE4v7BVlbfgXf889msUg+F4pMlhwjsg4vmJ6n
   rzow0EYwb13SitFlI39swL7lfdIsSGJ8oNYQvYmNaUNgF03PQoECDAI3c
   cS2wqQ6yxwDK3yQqDThZuK6b9XtxgwLmVuh0HoODzwEyv4gh739lM7Ncg
   fgrbrwsFYBWmeZ1n9OfkLFqSn+ZAaKN1bfgANyj3x0p4c8M9bAW2UbHln
   A==;
X-CSE-ConnectionGUID: 7VB46GWNSqalcjmiqvyaVw==
X-CSE-MsgGUID: DJJLIdkMSeyLd/mJgtIyvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71693735"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71693735"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 14:45:03 -0800
X-CSE-ConnectionGUID: XfaCSUcITcOkwDDsIWZt6g==
X-CSE-MsgGUID: wlYuagwtSJCnLfOoi6SeOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="210846321"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Feb 2026 14:45:01 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpa03-00000000oNm-1MO8;
	Mon, 09 Feb 2026 22:44:59 +0000
Date: Tue, 10 Feb 2026 06:44:17 +0800
From: kernel test robot <lkp@intel.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Petr Machata <petrm@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 12/12]
 drivers/char/tpm/tpm2-cmd.c:24:18: sparse: sparse: symbol 'tpm2_hash_map' was
 not declared. Should it be static?
Message-ID: <202602100605.SHizNkIQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   85a63ffdaadcfb03afc73809d40b06e697cd1873
commit: 85a63ffdaadcfb03afc73809d40b06e697cd1873 [12/12] TMP: Revert "module: Add compile-time check for embedded NUL characters"
config: microblaze-randconfig-r111-20260210 (https://download.01.org/0day-ci/archive/20260210/202602100605.SHizNkIQ-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602100605.SHizNkIQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602100605.SHizNkIQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/char/tpm/tpm2-cmd.c:24:18: sparse: sparse: symbol 'tpm2_hash_map' was not declared. Should it be static?

vim +/tpm2_hash_map +24 drivers/char/tpm/tpm2-cmd.c

27184f8905ba68 Jarkko Sakkinen 2024-11-13  23  
127fa2ae9e2b1f Jarkko Sakkinen 2025-10-18 @24  struct tpm2_hash tpm2_hash_map[] = {
aa042475938f58 Roberto Sassu   2019-02-06  25  	{HASH_ALGO_SHA1, TPM_ALG_SHA1},
aa042475938f58 Roberto Sassu   2019-02-06  26  	{HASH_ALGO_SHA256, TPM_ALG_SHA256},
aa042475938f58 Roberto Sassu   2019-02-06  27  	{HASH_ALGO_SHA384, TPM_ALG_SHA384},
aa042475938f58 Roberto Sassu   2019-02-06  28  	{HASH_ALGO_SHA512, TPM_ALG_SHA512},
aa042475938f58 Roberto Sassu   2019-02-06  29  	{HASH_ALGO_SM3_256, TPM_ALG_SM3_256},
5ca4c20cfd37ba Jarkko Sakkinen 2015-11-05  30  };
5ca4c20cfd37ba Jarkko Sakkinen 2015-11-05  31  

:::::: The code at line 24 was first introduced by commit
:::::: 127fa2ae9e2b1f9b9d876dfaa39fe3640cec5764 KEYS: trusted: Replace a redundant instance of tpm2_hash_map

:::::: TO: Jarkko Sakkinen <jarkko@kernel.org>
:::::: CC: Jarkko Sakkinen <jarkko@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
