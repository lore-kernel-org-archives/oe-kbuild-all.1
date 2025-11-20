Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38982DBF78
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Nov 2025 22:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763677650; cv=none; b=tRB1mWE1B+OS82wm62Im/RG/00Zjvxg5Ga8LMaCf63JvIjIRe9WpvUq+c0OP56WJtsBV4CI4qUn19mOtyuImaC6SZKUAB+j5tDWkCGXHIWAl5Q3NKA4iILxcjqbWFW3gg1KPTyXywm83v7iaJBB3jwL0qXrh2aRhNveAUMOPXlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763677650; c=relaxed/simple;
	bh=hLy18h4Rfw5OBEGv1xDIQWUziO2KUNk9dbt2l4mnPQE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MA3E0KfhoSjT6us2tm6qfni+SsqrNytnObUPz8k3WX261T66uv/NOAGvm2eUvaetY2Z9IVVTKITcfVaWXBYVgGaVMFv8xaxKgHAdr75EuX7sANUNspqbsvZAbWI4oJ4/YQX0U1wH5DObxjmIqrNe9qhXlFC1bd8WGWJO4Sg0ZfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ltlxuKm0; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ltlxuKm0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763677649; x=1795213649;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hLy18h4Rfw5OBEGv1xDIQWUziO2KUNk9dbt2l4mnPQE=;
  b=ltlxuKm01T6vyIedbZf9j1p04zFl0u0RtPIsE2kQgMmW7sldwt4KOetN
   ABUcpC/uQXpzMMHCSD753nlSnS8AbLli8wAOrONaf9afBbqPXC8yPJRgK
   L41ya2guPYdCabE/PxGS3fiTQuWRuxPKu1Ol33CLwgh20Mebdd4BOvUN5
   TSur4cj3585KX1CkusxCKPXFjGOz9Nx+oT/r+OAFHIj442GSuDMbqTZH5
   lwrU1fnkYzpZ9Ql3CCfrJH0YeNiuKh9IMUOvQtmbXX/kRJM3CkfcA2brd
   wC7ALMuNwg8eiPpJk148o1g2nRytxFAcRirH202hxfwUH0PI3zXuFjitK
   g==;
X-CSE-ConnectionGUID: PVL42tqkTIe/8+55+4q+hQ==
X-CSE-MsgGUID: Gp+nlU/vS1+koHqMA3Fa0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65713079"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="65713079"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 14:27:29 -0800
X-CSE-ConnectionGUID: xZ2VR6ixSkmf9gS77ZlmyQ==
X-CSE-MsgGUID: ZOdkjgiPTc+D0MJKZmi8CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="191313785"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Nov 2025 14:27:27 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMD7d-0004e8-0E;
	Thu, 20 Nov 2025 22:27:25 +0000
Date: Fri, 21 Nov 2025 06:27:02 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Baokun Li <libaokun1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3296/3296] io_uring/io_uring.o: warning:
 objtool: io_kiocb_start_write()+0xdb: unreachable instruction
Message-ID: <202511210630.FXaljEIH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   879312ab2886aacda164b2417bbcd9782e18773d
commit: 1aecd25937426bf0aeb9f5bcabdae370eed2dae6 [3296/3296] io_uring/rw: fix missing NOWAIT check for O_DIRECT start write
config: x86_64-buildonly-randconfig-006-20251121 (https://download.01.org/0day-ci/archive/20251121/202511210630.FXaljEIH-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511210630.FXaljEIH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511210630.FXaljEIH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> io_uring/io_uring.o: warning: objtool: io_kiocb_start_write()+0xdb: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
