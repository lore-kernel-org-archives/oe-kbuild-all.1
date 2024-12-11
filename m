Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920391C2324
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Dec 2024 05:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733896436; cv=none; b=gQOdpPONTkpXdgflvpO7HYNlYzsAnAfRRVPrepTj/UspzOkWCQ6T7J1zZi7XRbbcIB9TCOESUiR20Q5M1tl6qNVDRJwcNXe0inxbA9yH18KV3y9ROPLaexlhRxHxvpUFp1Od3lg75Pqz/VBfFUpZjPTbJzQObBllcHe+D0+/71M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733896436; c=relaxed/simple;
	bh=UyUR/hhSMtyR67W8LRtQT4KaI2ALs/YSrByzrqrg3uE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Knsz2RdN30HssqfCQ6usHZzozUGSSrS6hW/fsdb0wTPGj82uzdlOekR39WqxGZNW7mLFoCEd19FXfnob6smkfMNiJHcnqlw5SSURr/NqBeIVFpL66MNK30X9iqAkbQUhHVcJnxaKWjpN7dyJ4C+dHPVy5ytnbUl2+gXBxuVYu2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bc8y/021; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bc8y/021"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733896434; x=1765432434;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UyUR/hhSMtyR67W8LRtQT4KaI2ALs/YSrByzrqrg3uE=;
  b=Bc8y/021KuXhtf9gIMdFxcmMN8eAfo+IJmlP5jU4wxe5pPS7EugM3z92
   WMnLqh4KkgymAYfM8UQon3rve7/k+AYlagbbL5MV+/uK04i6cCXnr2IYA
   4y6c4QoynpWQHeQJuuAQCC/v9fUQ9CVVpPVTYjN29nB5zyB2aJEMBMj+I
   g3zIT4irm5OQJCKH8dEWy9gt13IkYs8J9g0ddilZUy7VYikQtp8UWr+6w
   T49C7toxEQAQhmil1LopVo4MIeDoDysbKlDtE6m3V+lKlGfETzzmesPyO
   I6V/rODmKj1bBDiqJXbwnuDdWcKtVqwvZ78yiLllOvRH/GhL7lS3RG6nC
   w==;
X-CSE-ConnectionGUID: 74yQ5BRwT+C5FJFFYqanYw==
X-CSE-MsgGUID: juX3PAnwR6ygdJ5SRHA2UQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="59655240"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="59655240"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 21:53:54 -0800
X-CSE-ConnectionGUID: zgwf7/s3TnWMhuvuhaGHpQ==
X-CSE-MsgGUID: w2R5o+kHQU+iR87eivOrjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100624359"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Dec 2024 21:53:53 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLFfS-0006Kv-2n;
	Wed, 11 Dec 2024 05:53:50 +0000
Date: Wed, 11 Dec 2024 13:53:39 +0800
From: kernel test robot <lkp@intel.com>
To: Bharat Bhushan <bbhushan2@marvell.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 2103/3192] aarch64-linux-ld:
 drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.o:(__jump_table+0x8):
 undefined reference to `cn10k_ipsec_sa_enabled'
Message-ID: <202412111306.wTt38o4e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   91e71d606356e50f238d7a87aacdee4abc427f07
commit: 6a77a158848a8c68930df27b8840660db8531222 [2103/3192] cn10k-ipsec: Process outbound ipsec crypto offload
config: arm64-randconfig-003-20241211 (https://download.01.org/0day-ci/archive/20241211/202412111306.wTt38o4e-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241211/202412111306.wTt38o4e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412111306.wTt38o4e-lkp@intel.com/

All errors (new ones prefixed by >>):

>> aarch64-linux-ld: drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.o:(__jump_table+0x8): undefined reference to `cn10k_ipsec_sa_enabled'
   aarch64-linux-ld: drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.o:(__jump_table+0x18): undefined reference to `cn10k_ipsec_sa_enabled'
   aarch64-linux-ld: drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.o:(__jump_table+0x28): undefined reference to `cn10k_ipsec_sa_enabled'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
