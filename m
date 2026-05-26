Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480462853F8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 May 2026 20:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779826298; cv=none; b=ZjPFoAFwhlG/NHEzMPwEH0OjALPztgAgBi1XtN2wV+s4y9UlOGKI32hs4jKe4aTvHvHq3DJ4KjTbvQzjsJyV0UDcPS2KZqtVIxeiAda0ZKP77O8rnecA3mrkW9zwtQEyx6IrwAq0I/MfW/6yRa1NNY51ovMmqa6nFs2UZmod1Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779826298; c=relaxed/simple;
	bh=JT77e8B3gBAPg3LWYopPGL9a00gG8giYACvbIq/lol4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nwl06tiy7M6NRqBrV4xBjANWKrETjbUxld6vNTz7hMhWkkRaM7Tj9K86QjScx8aAAHyPjmq1hNUNGWU4YMQJtVQZ3q3sBwUUm7T4XXqSlUTCC88arEJuoShuVX8q7wj5Fy7F9SCGmChFVLA8PIiVi4bNu0w5G4d+J3LXEZAEaX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TX1nebsF; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TX1nebsF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779826297; x=1811362297;
  h=date:from:to:cc:subject:message-id;
  bh=JT77e8B3gBAPg3LWYopPGL9a00gG8giYACvbIq/lol4=;
  b=TX1nebsFq+U8Brha6avXf+8uCYYO+vuiCpNFWQBbtAtJoNZP8kNpW94b
   I9H6tUMabJYT36lMQEXHA658YqcTA8dkqHT5kywX4TwXlG2v3Q66b8ZcH
   2vGT/tWFF9Y7u6ZIOx6yi3Z5sT1SwOPyRa6os3XOMRxd/RBbf5WhOolTK
   X2dNGVoA6AAJKZLRXL2fjsJmpK9nlrpFLHP/UUW1sUbhhRMcoQR5X70MC
   ZYMxIXuLEP1E6wfB67MWgetl9DpATgIn+s9hTEUIrx760SaT3ONDVtRUN
   kEcBWkSc6k4VWjutZeq5IQz0EeoDrkhg84WrG0osaQ9jJYFeoTaBzQWAW
   A==;
X-CSE-ConnectionGUID: 5uUKYnj6Qs+/4cDIXUoNZw==
X-CSE-MsgGUID: 0clEhvAhSXC6NcGP+kTDWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80683261"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="80683261"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 13:11:36 -0700
X-CSE-ConnectionGUID: TLMd2CfER3aUdjSr6uo19g==
X-CSE-MsgGUID: WCzQMxGnTPua3/qFTpn1fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="237853628"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 26 May 2026 13:11:35 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRy7h-00000000CTZ-2Z4A;
	Tue, 26 May 2026 20:11:33 +0000
Date: Tue, 26 May 2026 22:10:45 +0200
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:rootns 17/23] <stdin>:1639:2: warning:
 #warning syscall rootns_enter not implemented
Message-ID: <202605262200.VkSpNsKG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git rootns
head:   e5a6a778f0cd5584723651f07f5e46f765b4b2f5
commit: 6116b89ac8a1d72dcad63ee3a2516ad73eea30c0 [17/23] rootns: Implement rootns_enter()
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260526/202605262200.VkSpNsKG-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260526/202605262200.VkSpNsKG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605262200.VkSpNsKG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   <stdin>:1630:2: warning: #warning syscall rootns_create not implemented [-Wcpp]
   <stdin>:1633:2: warning: #warning syscall rootns_wait not implemented [-Wcpp]
   <stdin>:1636:2: warning: #warning syscall rootns_kill not implemented [-Wcpp]
>> <stdin>:1639:2: warning: #warning syscall rootns_enter not implemented [-Wcpp]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
