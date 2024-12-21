Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2928A149C55
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Dec 2024 16:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734798482; cv=none; b=eQKTqTt+QRc61wZ4fjd9AHtDoTMo7tjKOu3fe0CsMdl1n+oFJtDbrhOZ0lzB4H+KiSd6w3L7kgMRVy8Gkh+R/9wfvD14/fmYkAWJosfyjDOex7UOrayDoxLeatqCd+X+HaAwv1mWIE8KgAC4U7rF85sKJrP27weQ+faK9CkG6c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734798482; c=relaxed/simple;
	bh=6XG9PnawgwErG6gann9e7sAC9rwFiBHplVlLe98Bn28=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V3JRMZ/EIf4dqVp0+o2PI5V9dD4YXgQ5xsEkyvI4tKMwBu+dFoPY9lGkkveN2QR3Nh3035QKKfX7JST8UXQGTj43lNZFXEWsjgo0QzRSoteOLhUis2NJNLNW79idEkeOB3Yc2+hvFq5Rhpp/7tFT3FmCagxroPUgXGCEzhqT7c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BVIsJeX0; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BVIsJeX0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734798480; x=1766334480;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6XG9PnawgwErG6gann9e7sAC9rwFiBHplVlLe98Bn28=;
  b=BVIsJeX0UfpSdWluN8yuVUpKzHuuiS5h6I19fT75GUH0Zdc/iZMBUAx5
   qqxd6vwpb9iZuO24p8rlRKBoUOlXG8NXfLlEUZUNsIbMYkFUcTC17HBGQ
   7Q1wx/DQEwZxQ+lAKW9FO5DmZ4yZDRvy/3O8i+HyU+a2zsq6b4AU0+OAV
   zuex0OIxkC3wLKaMcbyKV/19BrGSlagPkvXgKgSwZ6MApQr+wI/+rFGAf
   TUULSOtWnklQBjmEa5c6/BV9Tz3+uue0og2zUJ1B1wIIF3tQlkKzuGp00
   5m90sPy7qkvuZQhmkGhi69/jN4C/4wtra2pzhSIx+QDq7EBxX8ypyCfiM
   w==;
X-CSE-ConnectionGUID: NA1mAIiUS36WWoPWGH0mbw==
X-CSE-MsgGUID: g/r5zXkCSCS6Evm2WbPdZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="60708431"
X-IronPort-AV: E=Sophos;i="6.12,253,1728975600"; 
   d="scan'208";a="60708431"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 08:28:00 -0800
X-CSE-ConnectionGUID: u8dMIDY/RNCnTK6LUE1z3Q==
X-CSE-MsgGUID: H0cS3uu9Q/KhvhRWmuiw2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,253,1728975600"; 
   d="scan'208";a="99009262"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 Dec 2024 08:27:58 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tP2Ka-0002He-1X;
	Sat, 21 Dec 2024 16:27:56 +0000
Date: Sun, 22 Dec 2024 00:27:45 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.13-mt7988upstream 51/53]
 drivers/net/ethernet/mediatek/mtk_eth_soc.c:32:10: fatal error:
 mtk_eth_dbg.h: No such file or directory
Message-ID: <202412220025.4b0QYkOQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.13-mt7988upstream
head:   7ddebaebf72c883cdbf2abc58186db4d6fe48ae4
commit: 995893b54b03fb8fe9eda9182116572d6e105190 [51/53] debugfs-patch from mtk sdk
config: sh-randconfig-001-20241221 (https://download.01.org/0day-ci/archive/20241222/202412220025.4b0QYkOQ-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412220025.4b0QYkOQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412220025.4b0QYkOQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:32:10: fatal error: mtk_eth_dbg.h: No such file or directory
      32 | #include "mtk_eth_dbg.h"
         |          ^~~~~~~~~~~~~~~
   compilation terminated.


vim +32 drivers/net/ethernet/mediatek/mtk_eth_soc.c

    30	
    31	#include "mtk_eth_soc.h"
  > 32	#include "mtk_eth_dbg.h"
    33	#include "mtk_wed.h"
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
