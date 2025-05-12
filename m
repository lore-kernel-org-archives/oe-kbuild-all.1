Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5C31E32D5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 May 2025 14:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747060371; cv=none; b=pgC8dAKNRCYbwtGHoZz52ODJ+/HaBx3SXnR51IBKxsJMvLXuO8TKMyD1bXSzpVfevip/qqD87VK+IeY5bnvlLrCfAgS8V7EWtVcgWpeFc41hoKhUmT8C/mS9T0+MivFltY5869FxqJiWB5KcOXmylxAeDtxEUOtkEFnRQceR6pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747060371; c=relaxed/simple;
	bh=My4MOxd7J67T+HF20EtXujinBFhqirVY6qjh/lEwc2A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nqP8IwJT+2JI1xElmVMBgds3zsJg2uTKUkPEV/M998QKPwMzTXMg3KKcdLU75Yk6bJyVUS8lAKytxNPih263qoAi5Bz3kmzthpzX+SLcZ629mITU7WP1pTtOu0ZR4E6xYngXTEQrwS2pjhXHvEiEMAlqBgDFQGKUh1V7kvcfLTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iNxHPnPS; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iNxHPnPS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747060369; x=1778596369;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=My4MOxd7J67T+HF20EtXujinBFhqirVY6qjh/lEwc2A=;
  b=iNxHPnPSKhlI27xS5dFHPGYEKVaNc40aIfCIE/gzDX+dkDIDBXp1cSol
   w/kLP5mkgCg67oL3106s6kxhIL7gDkE69ivrHMMQ+ESzpeBtKQHIyP6sQ
   WzJ4KgcA42gYhZgvnqiJj6/5aYav5PSlMPEh1JVfGWkjj1IjYcb+pshsK
   pZwJtzZHooFh7goFDDH46I1FOGXEY45pmRJ/ZmanckHXbF6CyMexe8SID
   ENYIULvdvOWvuAOD1CCDacs/ufPsR0X1h0OAnuRAmnuznXRUCV2yPzZ11
   OnmTtz5ir2rK8Cgru08DMVFaItsqPJae+gfWl6WD+pn+fHhnHjuk0kv9b
   Q==;
X-CSE-ConnectionGUID: 55YzpC4iTwyr2BIkIyDmMg==
X-CSE-MsgGUID: xlPh1w+5TlmLRnnFmdqhvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="59861635"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; 
   d="scan'208";a="59861635"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 07:32:49 -0700
X-CSE-ConnectionGUID: 6dZSJKcWSOaAy5BbNBoL/A==
X-CSE-MsgGUID: kFZSCgXwSm64FBMFIQz46g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; 
   d="scan'208";a="142496378"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 May 2025 07:32:48 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEUCz-000EVL-1A;
	Mon, 12 May 2025 14:32:45 +0000
Date: Mon, 12 May 2025 22:32:29 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Peter <sven@svenpeter.dev>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:smc-v6 15/21]
 macsmc.c:(.text.apple_smc_cmd_locked+0x2ac): undefined reference to
 `apple_rtkit_send_message'
Message-ID: <202505122243.XBc9fXsd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux smc-v6
head:   0f1fd213b9a2dd3a57b0f75556b6bc90e9be0ed4
commit: 248373f1a3ed3c62db91ea3fa83636d843e3d67d [15/21] mfd: Add Apple Silicon System Management Controller
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20250512/202505122243.XBc9fXsd-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250512/202505122243.XBc9fXsd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505122243.XBc9fXsd-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/mfd/macsmc.o: in function `apple_smc_cmd_locked':
>> macsmc.c:(.text.apple_smc_cmd_locked+0x2ac): undefined reference to `apple_rtkit_send_message'
   arm-linux-gnueabi-ld: drivers/mfd/macsmc.o: in function `apple_smc_write_atomic':
>> macsmc.c:(.text.apple_smc_write_atomic+0x270): undefined reference to `apple_rtkit_send_message'
>> arm-linux-gnueabi-ld: macsmc.c:(.text.apple_smc_write_atomic+0x320): undefined reference to `apple_rtkit_poll'
   arm-linux-gnueabi-ld: drivers/mfd/macsmc.o: in function `apple_smc_remove':
>> macsmc.c:(.text.apple_smc_remove+0x15c): undefined reference to `apple_rtkit_is_running'
>> arm-linux-gnueabi-ld: macsmc.c:(.text.apple_smc_remove+0x1b0): undefined reference to `apple_rtkit_quiesce'
   arm-linux-gnueabi-ld: drivers/mfd/macsmc.o: in function `apple_smc_probe':
>> macsmc.c:(.text.apple_smc_probe+0x154): undefined reference to `devm_apple_rtkit_init'
>> arm-linux-gnueabi-ld: macsmc.c:(.text.apple_smc_probe+0x21c): undefined reference to `apple_rtkit_wake'
>> arm-linux-gnueabi-ld: macsmc.c:(.text.apple_smc_probe+0x294): undefined reference to `apple_rtkit_start_ep'
>> arm-linux-gnueabi-ld: macsmc.c:(.text.apple_smc_probe+0x3c8): undefined reference to `apple_rtkit_send_message'
>> arm-linux-gnueabi-ld: macsmc.c:(.text.apple_smc_probe+0x770): undefined reference to `apple_rtkit_is_running'
>> arm-linux-gnueabi-ld: macsmc.c:(.text.apple_smc_probe+0x7c8): undefined reference to `apple_rtkit_quiesce'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
