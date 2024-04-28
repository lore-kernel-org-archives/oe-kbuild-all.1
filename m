Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D85818
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Apr 2024 01:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714266844; cv=none; b=AdaSHR4mk4GI73xXvi/6vQ/90ZgXHNkcURHLEOcjiXhNcK8A0YyJf3yiyoyQd7dz/9hZDzNbUplzki37WvZ75pdYHJdQ7zh11FYlEb8V2wGW/9J+U9IKZRolGbIasp1UwDcTTrCr5p5or+Wo4et+I8X+IuDaaCK3KqJOKfb/QHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714266844; c=relaxed/simple;
	bh=lgU83yottyBuU6b8nHTkHYSuVM+7zy7L9f7faTu6AsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NkwUQCpg2125ZM5VUqta578gElbNMsPT9IkeL5KBBbrPBiVEAMLpSG8uWEICHPYro2R2itmtA6+rdJbLjq3qV/6QqXARczBM2kwy4KW5aKoW++hNXxrqIYp40W5Ae2k4Z9OMhWG2GTH8FlvT1M0zaylIjzYnm00usrp8chzXumU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jYHrB5aq; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jYHrB5aq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714266842; x=1745802842;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lgU83yottyBuU6b8nHTkHYSuVM+7zy7L9f7faTu6AsQ=;
  b=jYHrB5aqQLrMCeQlFeaw5WS04+D3fwdlVMdUzhP/tbJhed+9cz/jDQm6
   Mpq7rUEbEJ3frmAwURrzkM3/JgHW535CVGbRG62/ggeGpahypgUipWv8V
   c89KTxcLOxI5bZAKxGs5vWqcJyT4+RLaY3xl/wp2kGwDkdbQDdSwhAHsW
   jNY9XFmgHMmDfoUSdfWjNfLRCssLTqzC7966U0NCqzOp1vVKptcKgctQX
   Y77I9clYev09fV6dYWOL8ot9aqwDjVFJ9Yn5j9JTLDwIs5xREYYt+fFEr
   E8WVIwleeVn/LTe3Itv78ZP1qlzvnQ1OJ0SGWNz/d7G2/1xmLqzOZDwdw
   A==;
X-CSE-ConnectionGUID: 4Aem+oODSYa1NLHYUXm5/g==
X-CSE-MsgGUID: GxWsD/qyTUqLVWKjRKarfg==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="20650532"
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="20650532"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2024 18:14:01 -0700
X-CSE-ConnectionGUID: /GVzDROQT5m50vBm+MAYFg==
X-CSE-MsgGUID: IXBnvJU4Q5ytIedEcNKjSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="26184468"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 27 Apr 2024 18:14:00 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0t78-0005hL-0I;
	Sun, 28 Apr 2024 01:13:58 +0000
Date: Sun, 28 Apr 2024 09:13:12 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 3860/11728]
 sound/soc/fsl/fsl-asoc-card.c:171:40: warning: unused variable
 'audio_map_esai'
Message-ID: <202404280912.woQqKK64-lkp@intel.com>
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
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240428/202404280912.woQqKK64-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240428/202404280912.woQqKK64-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404280912.woQqKK64-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/fsl/fsl-asoc-card.c:171:40: warning: unused variable 'audio_map_esai' [-Wunused-const-variable]
   static const struct snd_soc_dapm_route audio_map_esai[] = {
                                          ^
   1 warning generated.


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
