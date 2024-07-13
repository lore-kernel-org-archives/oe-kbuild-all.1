Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E5A2F23
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jul 2024 03:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720842605; cv=none; b=f/HVnoJeDX06/EcBSLCWjlrmKy4jRefGfpjgkXkfGUnBUJhCWdZTolWJs9gIDO+9rhvM+g7aZFzKiPxSMmFSsjj7wO81R9fIrizd5X6f3sexOaHrwEO70kMdEmXf15+dlAiVHmypg75a0k9IF5fFs7PtizEEW3sB0H+IXKDEeJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720842605; c=relaxed/simple;
	bh=7OfV/VYeWxnpvi4x3K5WVNlsJsDZ5zwf3NU7qVypd0A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TgE1rtl+jYaR/NLGj0CiTTFeStIlClhOTO0b5J4mnGQ9YRIcssf7W0WR2M02vX4EgyVD6srPZn97pF06648dyRCyP6+OhQy73P+PtMldoanRAzdQY2E717wgauEQ2KYWWfhlM9BJw2m83YVh1f+/HXLHIsJfd4DA1y2mKZ/IJK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U2vUd3Vf; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U2vUd3Vf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720842603; x=1752378603;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7OfV/VYeWxnpvi4x3K5WVNlsJsDZ5zwf3NU7qVypd0A=;
  b=U2vUd3VfEJ02MJWnLU1xN80hhZWFM/c4I8yI+mhcqh7jqtZm7bI0TK1p
   UCsajI4xip3g+eWxFv4nDc1OmiZAt9oflli2bKB98Xd9iokXVKTbKoLVH
   1vKp9hYdtx5EHnBp57vmyaYRni83kbngy+sybA2odvEKwEPL431gMjdtE
   s/sZ/wx4une6ouSC84gVoDK6WbbjAMynB+Xvvbqh6InkQeFExQu5Ie/bv
   HMrpF9Z5du9iKvfDFlrkg3hFPTxOpcDN6lr8ePehEUoITu1087WAiavNQ
   U1TcXRy+KUjO3BlWEHPrWhpu/cOXEIV9Lin4ei+NY0m+CFrhZ73kxiiYM
   A==;
X-CSE-ConnectionGUID: fftRx3E4Q86gtL7cASGJ0g==
X-CSE-MsgGUID: OC2u/lM/Q8GfA5JclBu46Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="18495978"
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; 
   d="scan'208";a="18495978"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 20:50:02 -0700
X-CSE-ConnectionGUID: 4kFsVFq+TGSMxchWE2QkNA==
X-CSE-MsgGUID: zAUAeF3TSXuj4gRGXuscqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; 
   d="scan'208";a="80189169"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Jul 2024 20:50:02 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSTln-000bdy-0J;
	Sat, 13 Jul 2024 03:49:59 +0000
Date: Sat, 13 Jul 2024 11:49:26 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Snitzer <snitzer@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [snitzer:nfs-localio-for-next-test 33/51]
 fs/nfs_common/nfslocalio.c:13:1: sparse: sparse: symbol 'nfs_uuid_mutex' was
 not declared. Should it be static?
Message-ID: <202407131146.L9WHFYP8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mike,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git nfs-localio-for-next-test
head:   84abb53e3a3b011456fdf7aa2a57fa9378867f0e
commit: 747a2094e81841be8af68d5b2c1c2278e56244a0 [33/51] nfs/nfsd: switch nfsd_open_local_fh() to using nfsd_file_acquire_local()
config: s390-randconfig-r133-20240713 (https://download.01.org/0day-ci/archive/20240713/202407131146.L9WHFYP8-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce: (https://download.01.org/0day-ci/archive/20240713/202407131146.L9WHFYP8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407131146.L9WHFYP8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/nfs_common/nfslocalio.c:13:1: sparse: sparse: symbol 'nfs_uuid_mutex' was not declared. Should it be static?
   fs/nfs_common/nfslocalio.c: note: in included file (through include/linux/module.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +/nfs_uuid_mutex +13 fs/nfs_common/nfslocalio.c

cb542e791eda11 Mike Snitzer 2024-05-06  12  
2346c8be2e8154 Mike Snitzer 2024-07-11 @13  DEFINE_MUTEX(nfs_uuid_mutex);
2346c8be2e8154 Mike Snitzer 2024-07-11  14  

:::::: The code at line 13 was first introduced by commit
:::::: 2346c8be2e8154c640a3d6fe489c22ac60bd7a80 nfs/nfsd: adjust localio protocol to improve security

:::::: TO: Mike Snitzer <snitzer@kernel.org>
:::::: CC: Mike Snitzer <snitzer@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
