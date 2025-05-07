Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D17721D3E7
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 07:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746602498; cv=none; b=aIBm51+PdJeOJgwxSl/Gi8u5DUgNCksPJaA7VzqjYCHWfV4DntNW6XJptM0viXyHoOA+DFSU52Z+pdA67rc1pdKXyOz3/cltkW7dy0wxsEYN3miRGB5w1YZFHc192RT3MXOuT6u1wJRcDOUFSuOGvef1IWnHIMOJatVDIFnT/F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746602498; c=relaxed/simple;
	bh=oDnyowGa27/0Y3SCbgtei7cEE2Gw5zbpO4jLN2yi8SQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AOoLEpRu0bSL3wXkW/EcZTo31vSEPD0Bb7zERD/lHgN3khjfEkUdwK4bQYkXEMyiBKNkghT0/g6knvAd6Nt9aLasxyFEFU/q2ax07GJCCO68yvPCygB/6Ylhum5AxnO85/qp8zEttaBrjukAzVuY9GnbtjiluqgvmOYcqP2Ra5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZqecXalo; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZqecXalo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746602497; x=1778138497;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oDnyowGa27/0Y3SCbgtei7cEE2Gw5zbpO4jLN2yi8SQ=;
  b=ZqecXaloNEtTSsHuZ7yCiGjb+xm/U0U5LJDh+mZWon4XLCH7LFTkn5Bc
   gxge4p+zYubjxuT9DgTv7ph0TswiSBe6u5wxiZLhkD86cM9cKxkH1iN/c
   vlLKo1RtYmw2tpKd/O2CT8FMr7npBKOrq4/T3qxJrc65j1/TJum1uwfpW
   x8SbQUGXjsC996c7kUC2xhibF+nNPNNaaxOb+AB7f3tzTx9Ok9W9VN+GS
   rh2DmLYS8MoyJVs/ucAdTS+ZSX2k2E/rj9AWu9n847DVqT/2XHlJ9CjT4
   scKy0DQCvNnNbln2v77Y6+/0vrY7dLhMzcrYV5f5ZtqcuKoAvzT4sBEEj
   w==;
X-CSE-ConnectionGUID: 7mmhkvqKSNSoqhhXKpVokQ==
X-CSE-MsgGUID: G6VDGPIIRW+yLQymJi7IAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="65722337"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="65722337"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 00:21:36 -0700
X-CSE-ConnectionGUID: OTZqbnpLRg6T4KZwNE8tmA==
X-CSE-MsgGUID: ZJgikMSDS4eEFUI8Bll2Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="136877266"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 May 2025 00:21:35 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCZ5x-0007I7-0j;
	Wed, 07 May 2025 07:21:33 +0000
Date: Wed, 7 May 2025 15:20:32 +0800
From: kernel test robot <lkp@intel.com>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, Takashi Iwai <tiwai@suse.de>
Subject: [linux-next:master 6664/8679] ERROR: modpost: "crc8"
 [sound/soc/codecs/snd-soc-tas2781-fmwlib.ko] undefined!
Message-ID: <202505071523.SbzEA5tM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0a00723f4c2d0b273edd0737f236f103164a08eb
commit: 9fa6a693ad8dc0cd34833632883767083b8fc1f5 [6664/8679] ALSA: hda/tas2781: Remove tas2781_spi_fwlib.c and leverage SND_SOC_TAS2781_FMWLIB
config: arm-randconfig-004-20250501 (https://download.01.org/0day-ci/archive/20250507/202505071523.SbzEA5tM-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071523.SbzEA5tM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071523.SbzEA5tM-lkp@intel.com/

Note: the linux-next/master HEAD 0a00723f4c2d0b273edd0737f236f103164a08eb builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "crc8" [sound/soc/codecs/snd-soc-tas2781-fmwlib.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
