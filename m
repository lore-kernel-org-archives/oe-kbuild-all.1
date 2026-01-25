Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDDE7081A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jan 2026 22:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769379203; cv=none; b=tmO596JQs9+MYy0bDr9G6Rji9hO5oKMDK1CYaffsMJzOcXtlXYA5a6IaytFfrM/iYs+ldemZuwjUpMztP5PXLVMODuWyE6u8NnPLsOCcq9jHNs0ham8vIX+n/QsJVv+ia5hT5CRojQO+fKLM9sMeus0WlgdA+LxjU/HZXEN+n4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769379203; c=relaxed/simple;
	bh=qD1FTAFA4/aOsj6ko5p5I+ECQE6hXHy7eqQDP9x87PA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a5w7KqonlsDHDajN/jJGF30oTOxMTkj6lYEJfsdWe2GT4jC5+ii4tGIdZfa7V/Krj43ypfAOLTdfp6wmdQr+jI9utfGofj0uDFtj22npBAUxMGsDLwLxHtoubSbeO2M/LTwe17MYdbhvZOeMsTNflDGHKODR/FN04r00+6ABnZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bgEyTZ+x; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bgEyTZ+x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769379201; x=1800915201;
  h=date:from:to:cc:subject:message-id;
  bh=qD1FTAFA4/aOsj6ko5p5I+ECQE6hXHy7eqQDP9x87PA=;
  b=bgEyTZ+xg8SKzSwKGYYlyQV4Q4GvpIe5w1Vc1liZ1HdVRef7bN6NqL2Y
   y9Pefsu6WWFacoojv0lo9Y54GqRrlmsJu/LEOE8xvED2HDSohXHQ9Gn9C
   2oZDIiDgOEV7U9uGVkW+UYwCqo6TDs+6IAEqNWCqeBRl3OspDmTwHXkYC
   zihZRKtmyvGAY0PAcH1U9csR/v0l5/fbEkog89XYizJ+PMua3HiguiSn3
   yr78ZjR0N5mGtnWhlau6+C5QH0ip83bh+TPp212ZJcZMcQMsovR6kP9AT
   qWqpm5026YS0PLZYSyXm0H0zfyq+SdP7FQvC4bRZXuPsIlACmuzIo+tSd
   g==;
X-CSE-ConnectionGUID: T+cjYZaFQgqjYtNcNdumuQ==
X-CSE-MsgGUID: eu3OdSClRE+6BbKEjsRDyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="70277995"
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="70277995"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 14:13:15 -0800
X-CSE-ConnectionGUID: A94q0PhySI6eOG40IYlQpg==
X-CSE-MsgGUID: oKIQHgMqSkOp9tbfiN8v3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="211633083"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 25 Jan 2026 14:13:13 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vk8M3-000000001Mz-1cgl;
	Sun, 25 Jan 2026 22:13:11 +0000
Date: Sun, 25 Jan 2026 23:12:20 +0100
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:queue 12/16] Warning:
 security/keys/trusted-keys/trusted_tpm2.c:356 function parameter
 'parent_name_size' not described in 'tpm2_load_cmd'
Message-ID: <202601252353.l5AP3cpN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git queue
head:   fbd9af022416579062d59e206c7f71890d27fc31
commit: ff288cb862cd2574f7d71b4ef4e4b468283c1a46 [12/16] KEYS: trusted: Re-orchestrate tpm2_read_public() calls
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260125/202601252353.l5AP3cpN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260125/202601252353.l5AP3cpN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601252353.l5AP3cpN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: security/keys/trusted-keys/trusted_tpm2.c:356 function parameter 'parent_name_size' not described in 'tpm2_load_cmd'
>> Warning: security/keys/trusted-keys/trusted_tpm2.c:455 function parameter 'parent_name_size' not described in 'tpm2_unseal_cmd'
>> Warning: security/keys/trusted-keys/trusted_tpm2.c:356 function parameter 'parent_name_size' not described in 'tpm2_load_cmd'
>> Warning: security/keys/trusted-keys/trusted_tpm2.c:455 function parameter 'parent_name_size' not described in 'tpm2_unseal_cmd'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
