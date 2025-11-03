Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0930C2D2490
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Nov 2025 21:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762204869; cv=none; b=kDyd8n5i+KbdDLUutTxXB6U0ETnXdBidtQ9DBLo2s9FQw06AaViI7XF9PxC69VzdBB6f/83YLx1CROUFNCGS2jIb0HJZm1hRJCGYSLJnM31Cu/joa5MzhAy17ScMDhy4AOJCSJQLx1+WoH7yRQHnSlYiqJaDB9bA5+N/fRarURs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762204869; c=relaxed/simple;
	bh=wYS/U2s04tAeEwKT4qIjrpp+3dPnjmQpcIYnQdLGWBk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ijNWmMTfiHk7IKuqX7z0qpDCZRgt1X0Y1O3b+JRfzQWDy+Yjmx//wigOGmZurdlAB1jp2stkcjTAJCzm7sz0QaD9/LNTpvM72XT0YthaMnuLm6KnlELBscJ7TXa1RXNyIHbCYIabq9Sy4QtfD1O6/6cLAUwfK66hlgZCvI5/QWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VnoofTZ4; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VnoofTZ4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762204868; x=1793740868;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wYS/U2s04tAeEwKT4qIjrpp+3dPnjmQpcIYnQdLGWBk=;
  b=VnoofTZ4XbX42CZQAqUDcUSYl52dd1fHzCwzc6Qd6PmJ2I5d3Du6n3NY
   qrNwe3l4z8CjUBzaYIGP+ayQlNi6/27aWUsoaUGxudyS9dv9fTyuE4Dt7
   +km71ip0hMWZUZ79XZlhMx4mGrVRqbxbW52iqiK0IX+jOiveSRZiE3l2J
   vkQBXCxFS1wUr77VD3PeVb6OxRgaRs4iAE1QOcFJ77wkfyejnJlOwUcCP
   AuedQsUTs7DpktStZ1kSvNgS99ZCSVu0S+oxPJXCC2Ad7DJD9+3aOPpvV
   4S+xw4F9ezB9P5cm0PcdVGMpjdBmkR/pEdafkpgFU16VhluowOisSOUHE
   g==;
X-CSE-ConnectionGUID: 9Vd+YUbbTEuDpXFk65yO8g==
X-CSE-MsgGUID: AqunghbaSgS/KcXhmzKLkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="89753600"
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="89753600"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 13:21:05 -0800
X-CSE-ConnectionGUID: mXkrYBm3R6OCQ3y0+0qNDw==
X-CSE-MsgGUID: KmQ7ec68SzuGfBTz8w8Hww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="187123143"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 03 Nov 2025 13:21:05 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vG1z4-000QYm-17;
	Mon, 03 Nov 2025 21:21:02 +0000
Date: Tue, 4 Nov 2025 05:20:54 +0800
From: kernel test robot <lkp@intel.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linkinjeon-ntfs:ntfs-next 11/11] ERROR: modpost: "__divdi3"
 [fs/ntfsplus/ntfsplus.ko] undefined!
Message-ID: <202511040542.f27EKjbo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git ntfs-next
head:   823d97fda02f76457c2e14196ebe718b9601f40c
commit: 823d97fda02f76457c2e14196ebe718b9601f40c [11/11] ntfsplus: add Kconfig and Makefile
config: riscv-randconfig-002-20251103 (https://download.01.org/0day-ci/archive/20251104/202511040542.f27EKjbo-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511040542.f27EKjbo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511040542.f27EKjbo-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__divdi3" [fs/ntfsplus/ntfsplus.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
