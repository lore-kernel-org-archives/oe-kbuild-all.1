Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D96015FA72
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 May 2024 21:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714684923; cv=none; b=PJCaWC/FXR0zI9v4EVZtWbMWbNMmWwzRKZJMD/JQ2rAHddnOwNzi+4dwuGG06+sm2+8n4f4diwyANlUjKnFxNY+s4kaPOuOaePSh5gk3l1zDeL3dZY+In63BQxTfLJnbq0X0yYlOQQ2mXJ5xcYQxKODcE60MFtUB2bWgj/0VkKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714684923; c=relaxed/simple;
	bh=GZZ+TkPIWNBAczGqcyZB6HOggCaqCrXGhdrbsXEByXA=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JWezVaLrMmLrTQX/NwJo4q/v699j1Ejwika2sc7TzGW/0613FksRAZjj51avS2VsN4dnxPnQBWG3htQAu0Q7nPvihSqQo9dhh3icqcCotAenqTH2dmGUuk2zX7VFBhzHrdCHC5DlRVDAXAqh4YM8dYRXgf3i6d5OGdw6lT+NEK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GB61G05J; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GB61G05J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714684921; x=1746220921;
  h=date:from:cc:subject:message-id:mime-version;
  bh=GZZ+TkPIWNBAczGqcyZB6HOggCaqCrXGhdrbsXEByXA=;
  b=GB61G05JIy9AXbExuRqwQQzzdYtf3mxQc5WjRfzvwpu2Gydv3wY6PCk4
   ZISn96qHZRKbTQHkVEhAIXFfdVIo2Ei8fRBwGc+VnZU0+StAID9c62iJN
   qq7smbqsCifrz1FBuEOLmc4oFKqLV2vd3noo/lPX/zp/5RDQjtkjB/oIH
   ou92I9+B3MXwvBwpeUhjKiYIaXfCjO82CvO8YrK8dAnjaHC7RpeVR5CtQ
   AgIIXAiGEeZpDDF1ARsAPtsA7vWex/6/ie88yMMxaHGPvtCudynMSVc6Y
   2tPCk4qARgVhXJYs8wJ0bhnQiKTzeaTNze65EtPyrzYtyMETY4rjvFbPu
   g==;
X-CSE-ConnectionGUID: SCmq3WQ0QMuZfF8tngsYSQ==
X-CSE-MsgGUID: sppSb8ufTG6ucvs4goiR+w==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="10611871"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="10611871"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 14:22:01 -0700
X-CSE-ConnectionGUID: WUPhl7SFQ4Kdm8SruMdetA==
X-CSE-MsgGUID: JmWTBV3fRqu139oummCHuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="27336905"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 02 May 2024 14:22:00 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2dsL-000B2S-3C
	for oe-kbuild-all@lists.linux.dev;
	Thu, 02 May 2024 21:21:57 +0000
Date: Fri, 3 May 2024 05:21:35 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:4.19/android_s 12199/30000] ERROR: "arch_setup_dma_ops"
 [sound/soc/snd-soc-core.ko] undefined!
Message-ID: <202405030520.tOQmntZW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   ce145f290ac98252639bf5ba66490f0caa65908d
commit: 645bb4d43978ab2bb3a8abd6721e45223c224eb0 [12199/30000] ANDROID: GKI: ASoC: pcm: Add support for hostless playback/capture
config: arc-randconfig-001-20240502 (https://download.01.org/0day-ci/archive/20240503/202405030520.tOQmntZW-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240503/202405030520.tOQmntZW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405030520.tOQmntZW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ERROR: "arch_setup_dma_ops" [sound/soc/snd-soc-core.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
