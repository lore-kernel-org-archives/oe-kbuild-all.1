Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3CFA92F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Oct 2024 01:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728694918; cv=none; b=rAWIeFixybrpfgOLaGT1viYI3y74R6CUlCTi/OjXezF+PPDbXm//6Ouk7O5um/rywAdyqbYrVK6uXmtlTAyTuF+aZCKlgVQOGyfb2pikN1kz6+w7CYraFKyXUxJjY1s/TBhmRPFUdgyo+oPuIM3xIfjtJm9ry/lyONtuaoNaCQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728694918; c=relaxed/simple;
	bh=/TrYoZhrYZN8Ao+6U5/mxJyjHdl2k3Vxy4cnpDTUo44=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ceyc6HGqKoJW7K+FU7VfWC0JmCAx2N3x0Bt7EWmSIN/F/Xp6gtMqJffjrDtnMHH0WIOuQxWHCZEUqlKAJKppRQh8si7ZfWGJRjq6nHwq5dnO3DJBuVX7MK+BYgZ4T9BxAop2crTUXFbgbLDe11GAU6dr3WPylldGDjcpo7dpQPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JJyMHZtT; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JJyMHZtT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728694914; x=1760230914;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/TrYoZhrYZN8Ao+6U5/mxJyjHdl2k3Vxy4cnpDTUo44=;
  b=JJyMHZtTo+Cu/ZFKsySn3gNbgbU+4n407St6+bIxZkMH++EV+ySpWhaR
   jaBtHxrGqhJWPMQaFpDbEboIeRfa1xfMhOcr0s7sAeHL2hj7gyEcNWUXH
   VOPiw3lnRVSgEpWd7Wp1klUUznYcc2IiOGIEB8xJVwJDMudEBz7jRgmrG
   18fWoDvUjcUNYPGg1UURrtPWnht6icRbWsbKmuoPltZ+J5qltu5iSdEXR
   7oSYmchx2pxdOsK/fkh6p5rt845rRC6ODunU8N1N9p9YfeFlx2pmr32HF
   fnx1bj4mJEkb0uqe3DLMgOp/YEronJ3+It9Y2amt8K21NMkW9qRceek1k
   Q==;
X-CSE-ConnectionGUID: WIt7Jx0+TjSNsFOikINmig==
X-CSE-MsgGUID: 8mSJJcCGTKeexTVHhohK+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53527029"
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; 
   d="scan'208";a="53527029"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 18:01:51 -0700
X-CSE-ConnectionGUID: GRF9IDPVRKiV4Os3DXSQUA==
X-CSE-MsgGUID: dYjZuN69Qe6rVt6uyZdouw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; 
   d="scan'208";a="114523754"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Oct 2024 18:01:48 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szQVr-000CuR-0I;
	Sat, 12 Oct 2024 01:01:43 +0000
Date: Sat, 12 Oct 2024 09:01:33 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, leoliuoc <leoliu-oc@zhaoxin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 20575/23827]
 drivers/char/hw_random/zhaoxin-rng.o: warning: objtool: missing symbol for
 section .init.text
Message-ID: <202410121153.VMwUxyGS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi leoliuoc,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   9b2f1457c730cd7915663ac5d9ccb849f2657714
commit: 050ff2f361bf733d1dde505dea8b0f5ecb23507c [20575/23827] hwrng: Add Zhaoxin rng driver
config: x86_64-buildonly-randconfig-003-20241010 (https://download.01.org/0day-ci/archive/20241012/202410121153.VMwUxyGS-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241012/202410121153.VMwUxyGS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410121153.VMwUxyGS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/char/hw_random/zhaoxin-rng.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
