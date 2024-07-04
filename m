Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A436194C9B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jul 2024 09:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720084781; cv=none; b=I+tHElOl4IaoCb90BhHwjn5O62/giK2lZbXwMNcQHAQL+Hzp/c+WVuFMx4CWZuASyY44Q00vUfsUcR6OdMo0Tl77E8kuZD6jVQdiEytkv1IMurcSz0sYlPZgICv/9KDQ+TkSCsNrjOJVIK/PgrpHLmPqtOwg7y/KYjwJ3IBstRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720084781; c=relaxed/simple;
	bh=ViPqzG5t2WrIZh66xXZPiuuhNE2xregO+rhRqqaKZbY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=idyl/20kysjRlV/dUa1Fh7hV3YCml4iIjYx5vHZx17ZuBPlPHptZqU4Plj3XZVZDStZnpmf9olZgWHdveBV2E/Gpr6Ka3LU2M1y7Hhkp1LhfEXC32fi+KzWcL0oN2Ews0SzlU2D6bPJ6xIXridLt2fzAACs4d527YGtVZf2hjw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RomRwBHl; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RomRwBHl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720084780; x=1751620780;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ViPqzG5t2WrIZh66xXZPiuuhNE2xregO+rhRqqaKZbY=;
  b=RomRwBHlwUWvqy7PO/i87TscL2iTEZ5UGhtgz6s8wn8iKy7DLq+4giwh
   PV1YFNsXjf8y6+gcMY//B/5CdFmewgwBiHbKujAhtisp1d6opELVhO0Yy
   zo7A1Xqx58kL/fl7xjNuX2NKJ0Kv/kA7KkZY9nwTCGs6SdA4/HrpylRVR
   BipYd4AYRcSVTCDwmPTAeMqFq3rAQKxDRENF5HkaiA9RdlH1vkXWf8vAi
   aFr7dFJCxcQaPGXWAA/c4h6JBD+bmiuAWUt6WsO085l9hv88vi7Vur/nd
   7gLLfnQIVR9lZJ6Gy6bkuHtGcMeEab2d25C2yvE/+CZVc0l4DBmN6EwGp
   w==;
X-CSE-ConnectionGUID: uL2DIGFaTSW+P1ackAxEVA==
X-CSE-MsgGUID: T+Ij8zDwQz+RPlDz4PKu0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="17493975"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="17493975"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 02:19:40 -0700
X-CSE-ConnectionGUID: l11bZ6sbQuag2O7exPy0Tw==
X-CSE-MsgGUID: PaafoWc3TpC29UYvMK7Rog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="51716672"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 Jul 2024 02:19:38 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPIcp-000Qny-2d;
	Thu, 04 Jul 2024 09:19:35 +0000
Date: Thu, 4 Jul 2024 17:18:57 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Snitzer <snitzer@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, NeilBrown <neil@brown.name>
Subject: [snitzer:nfs-localio-for-6.11.v11 21/22] fs/nfs/localio.c:172:26:
 sparse: sparse: symbol 'nfslocalio_version1' was not declared. Should it be
 static?
Message-ID: <202407041742.lEQps4zV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git nfs-localio-for-6.11.v11
head:   9f9cc9ee2e9824da9be4973d7111019b07a04613
commit: 1a48ef6d4bb31130cf6af9708f6d0d76d8a09f69 [21/22] nfs: implement client support for NFS_LOCALIO_PROGRAM
config: um-randconfig-r122-20240703 (https://download.01.org/0day-ci/archive/20240704/202407041742.lEQps4zV-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240704/202407041742.lEQps4zV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407041742.lEQps4zV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/nfs/localio.c:172:26: sparse: sparse: symbol 'nfslocalio_version1' was not declared. Should it be static?
   fs/nfs/localio.c:508:1: sparse: sparse: context imbalance in 'nfs_copy_boot_verifier' - different lock contexts for basic block

vim +/nfslocalio_version1 +172 fs/nfs/localio.c

   170	
   171	static unsigned int nfs_localio_counts[ARRAY_SIZE(nfs_localio_procedures)];
 > 172	const struct rpc_version nfslocalio_version1 = {
   173		.number			= 1,
   174		.nrprocs		= ARRAY_SIZE(nfs_localio_procedures),
   175		.procs			= nfs_localio_procedures,
   176		.counts			= nfs_localio_counts,
   177	};
   178	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
