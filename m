Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2A62E3708
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Jul 2025 04:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753763076; cv=none; b=rSIBW9TU843eNKdJh1IpL0LYyU2UEeLGxExJ7QOOhk/rsNGKlD5t6YCQ6b4MkTMaVbhPbfBn+FMutJk106Yu6pFYrGnznvmSqr3pOKMJJn5/GuxP1Avy3SaUq6ugbCHEFC6FFhUgLUf5UYcoUwGEheAitJrpUacU0frI6ijSOcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753763076; c=relaxed/simple;
	bh=Xv3f0X3uJiRI90wmd6kTQ9jv82hrG2GYrW/Oq2fNqZs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l0OYlekc9YGnUj2KAzwQWRGKCn8mGTCZc15WtXxl0/2b9bY5QjXSLfIVbs/2hgopgUgo0irD1sJ7istQAFXLpRKPWvwDYkiyI5ofEHrNbeuTme1kQFmQT49haDLcJksxi2PeJSyQQ2ip3lFtu5n47u7QDFW1/wQont75IGK6BGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P/DJr5N4; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P/DJr5N4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753763074; x=1785299074;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xv3f0X3uJiRI90wmd6kTQ9jv82hrG2GYrW/Oq2fNqZs=;
  b=P/DJr5N4xz45cbsTraJylqyTKgKj+rzZdltS+n91IPLg9ETq7iEqapi7
   WVTQBEeiDsLq548p7gOYc8p717wTVgDaV1ztID2FwF7N8niHo1IPr7SMs
   4KfkW9o4jEJxKY3zMbLfqbQc85EN2TUIpH7VatbG3M2G+Gep5R87Lw73G
   o/zEb9cfDHuge8UMgj36HI9PTSz93hd6yYURtqrZDwR/r+W1VI9y7N95b
   OkJ9jSDnIzgOORyKKK3nMLJmY9/TQPq5uydURpCtdKYm7cWfUl/n+33iM
   cli7Pqbwr9V26xpVSwGR2eqP/Nsuxtbe1YXdC4TsxaJ5TeuIhht5ICJi/
   w==;
X-CSE-ConnectionGUID: urYxmNmkRqa+gZqlGciFFA==
X-CSE-MsgGUID: euHYktwaQ5mNjrcjgZatMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="55881746"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="55881746"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 21:24:34 -0700
X-CSE-ConnectionGUID: 5IPlptiESXyqD1qUDvrPNQ==
X-CSE-MsgGUID: bh9G1j1vSrCgq/o2Uefo4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="186242809"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Jul 2025 21:24:33 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugbt8-0000yn-1U;
	Tue, 29 Jul 2025 04:24:30 +0000
Date: Tue, 29 Jul 2025 12:24:00 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/large-buffers 32/48]
 drivers/net/ethernet/broadcom/bnxt/bnxt.c:898:42: warning: result of
 comparison of constant 65536 with expression of type 'u16' (aka 'unsigned
 short') is always true
Message-ID: <202507291244.GI8cerDW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/large-buffers
head:   f6d352a8eb9f0297196fdaf0eccc6d9e2a44a357
commit: e129c6bdfceadeaa4f4fe17524ea24f3c3471be7 [32/48] eth: bnxt: read the page size from the adapter struct
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20250729/202507291244.GI8cerDW-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1b4db78d2eaa070b3f364a2d2b2b826a5439b892)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250729/202507291244.GI8cerDW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507291244.GI8cerDW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/broadcom/bnxt/bnxt.c:898:42: warning: result of comparison of constant 65536 with expression of type 'u16' (aka 'unsigned short') is always true [-Wtautological-constant-out-of-range-compare]
     898 |         return rxr->need_head_pool || PAGE_SIZE > rxr->bnapi->bp->rx_page_size;
         |                                       ~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:908:16: warning: result of comparison of constant 65536 with expression of type 'u16' (aka 'unsigned short') is always true [-Wtautological-constant-out-of-range-compare]
     908 |         if (PAGE_SIZE > bp->rx_page_size) {
         |             ~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +898 drivers/net/ethernet/broadcom/bnxt/bnxt.c

   895	
   896	static bool bnxt_separate_head_pool(struct bnxt_rx_ring_info *rxr)
   897	{
 > 898		return rxr->need_head_pool || PAGE_SIZE > rxr->bnapi->bp->rx_page_size;
   899	}
   900	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
