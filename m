Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DE11B86D5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 23:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736639349; cv=none; b=uPQurHQ/35LOqU3GE+czG0v7jADxJLMj0k8XUrSR41vNWaHG80ZdiHpTvYvM/FHqYSd3uOdQ7G014/V+QI2gW0OyZVrDUMW0rLYBDniP3pyfK3ICaJEeks2tD/rykOLHgHhKurDpQy86UtGzJXf5D8N/GaFf7kOM7pAO7rfzyfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736639349; c=relaxed/simple;
	bh=KurNEhAo9SdSgeonVluSwhNzrMlgqiZYa02erI+yv/w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=foiUbqyA2oTOU6MrGE1Abb1jV+/65ny7FnAfaoHvEIX0F1Qp58jmEzbTHOBRhNJhlAMiCGm9trbOTG3P+hSQIvPaTsjXymFLfdnTH3yTvFzubjcVH+oldlLn0e0fjqdSyVsvJl9ozyQ7NSSbaM4fDpM4KJ6mPcYYJjSqJW9RlXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S2FoO3Wd; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S2FoO3Wd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736639348; x=1768175348;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KurNEhAo9SdSgeonVluSwhNzrMlgqiZYa02erI+yv/w=;
  b=S2FoO3WdVN0JRPzCvCRjIa4faiD0+HcB7qbN3D2miMMoOnUrQNSN3VZT
   B4H609+ASINQTTJDMNj+dtYMr/asF5XqRCucSpTdYoMsaIFEYaBv2r5Kf
   1RDoTkcYyvQN7JId8hQkmDkZYUcuSvPam/c31Wmz3b9T9HJQS047kYnEM
   XaXsu4dPB+Wq+ZUC9AaywotkxDnuu1XCUevwZYw/KzYBBChR/jUhn9/CY
   m6yA3clAlwXU3C8fwMbkkSkoW5JTv3hhr17KpZZS8MwoJWxcQ/5ajSMTg
   BdiP3hapTaxHB2HZmG9cgWCf6dWiTSYS9L/2MuZqVR1/f56KDMCB3HmUr
   w==;
X-CSE-ConnectionGUID: E+9mt0e1TtKV6rjyJ2oPew==
X-CSE-MsgGUID: H+AId+hHSEm3je0/I9fH5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="24508018"
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="24508018"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 15:49:05 -0800
X-CSE-ConnectionGUID: ooxEfrJ3TyyK9SBupBe/pA==
X-CSE-MsgGUID: DoxKhMgQTPi/JfBW4hBWHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104584195"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Jan 2025 15:49:03 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWlDx-000LKl-0v;
	Sat, 11 Jan 2025 23:49:01 +0000
Date: Sun, 12 Jan 2025 07:48:52 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Keith Busch <kbusch@kernel.org>,
	Sagi Grimberg <sagi@grimberg.me>
Subject: [axboe-block:for-next 152/160] auth.c:undefined reference to
 `nvme_tls_psk_refresh'
Message-ID: <202501120730.Nix2qru3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
head:   f28201922a357663d4a2a258e024481e19269c2c
commit: b68527338ba3882e43bae078c1bd4de0f55c6ce3 [152/160] nvme-tcp: request secure channel concatenation
config: csky-randconfig-001-20250112 (https://download.01.org/0day-ci/archive/20250112/202501120730.Nix2qru3-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250112/202501120730.Nix2qru3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501120730.Nix2qru3-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: drivers/nvme/host/auth.o: in function `nvme_auth_secure_concat':
>> auth.c:(.text+0x986): undefined reference to `nvme_tls_psk_refresh'
>> csky-linux-ld: auth.c:(.text+0xa00): undefined reference to `nvme_tls_psk_refresh'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
