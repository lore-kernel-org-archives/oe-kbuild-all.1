Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A7A23A0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Apr 2024 23:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714262342; cv=none; b=H9ww54EkC7dTEQ3LVIsGoeGbCmmcwZe/uMoRBP+qmthCIeuwovsAWtxzAji3l8rjdRAR17LCLB2SdZvlkMcNfHhBycUNFLirW6dvKD0GK4VTqWfwCIYbMm6B599duFFkKyusN1w2qa6JT4QnJ7tO8bcbolh/DZFxG1FBfldIUDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714262342; c=relaxed/simple;
	bh=GC51ee0nGPlznUOu+L5X7Skwg0wXrpeIz+YS8Sy1jZg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nuK2k0S3ueyUYnFfjRjlIWjZnLpaLgg33TA7P5IjgvgiBhJzWZspjGS//FUr6o4YPIWrJQcb/lJXGwYqItPXUuSCdQ4VpJneFqNTYcneNz6RVUMcbZhANzit2Xx2J2jHG2Oxnkoqxu6DpOtm1xH/5/R2l/PcLjZiahjDitMtW8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V3rWBKvy; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V3rWBKvy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714262340; x=1745798340;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GC51ee0nGPlznUOu+L5X7Skwg0wXrpeIz+YS8Sy1jZg=;
  b=V3rWBKvyOjBCNXLL0bEB0eQN7YnQy3cKcU7l3n6rTSdwVAmgjKmKbhV7
   ND+065z7XPOaXVUD+Xqt2WAEHNXmcmFu+pjSrhIaBPUFtgNoCahWAwBll
   Cxs2uxxVCrffN6CE5+W+cbJZoao2Vjli4WCtRmbSuVrY1NMdU1g9dQ5Wm
   R2DtFGJOrD/StkoGhDS3BocfCyL1mrAJYhEaGMVgBK3OJ3qGCFb4fJ8vO
   6xa0uiEuWFPn+mrwHf5i9RLBrO3K6HYd3mHz6Go6O9byEDFCICA1VGBzQ
   GSLtmKbVonk5ReKbt4JLgu9cWRnluZvTJEg0yclCc+Ht5pUB9mLPIdlZO
   g==;
X-CSE-ConnectionGUID: L7VAmdrZS7SciNoyyl1fdw==
X-CSE-MsgGUID: 6rb/r6t/TTuS4LMN2aZZaw==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="27481563"
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="27481563"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2024 16:58:59 -0700
X-CSE-ConnectionGUID: X3TAn1jpQ3Gk+x2BTSKntA==
X-CSE-MsgGUID: NpeAFn7mSMiYtec059RAWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="26387086"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 27 Apr 2024 16:58:59 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0rwW-0005di-0D;
	Sat, 27 Apr 2024 23:58:56 +0000
Date: Sun, 28 Apr 2024 07:58:44 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 3860/11728]
 sound/soc/fsl/fsl-asoc-card.c:171:40: warning: 'audio_map_esai' defined but
 not used
Message-ID: <202404280713.TU0aoUcL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   37770f55ac9c4f6cd958eb5544939207eed8478f
commit: 0eeef8490e3bdaa062e9b42b802e102f6d3463da [3860/11728] LF-2511-3: ASoC: fsl-asoc-card: Merge some features to this common driver
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240428/202404280713.TU0aoUcL-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240428/202404280713.TU0aoUcL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404280713.TU0aoUcL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/fsl/fsl-asoc-card.c:171:40: warning: 'audio_map_esai' defined but not used [-Wunused-const-variable=]
     171 | static const struct snd_soc_dapm_route audio_map_esai[] = {
         |                                        ^~~~~~~~~~~~~~


vim +/audio_map_esai +171 sound/soc/fsl/fsl-asoc-card.c

   170	
 > 171	static const struct snd_soc_dapm_route audio_map_esai[] = {
   172		{"Playback",  NULL, "CPU-Playback"},/* dai route for be and fe */
   173		{"CPU-Capture",  NULL, "Capture"},
   174		{"CPU-Playback",  NULL, "CLIENT0-Playback"},
   175		{"CLIENT0-Capture",  NULL, "CPU-Capture"},
   176		{"CPU-Playback",  NULL, "CLIENT1-Playback"},
   177		{"CLIENT1-Capture",  NULL, "CPU-Capture"},
   178	};
   179	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
