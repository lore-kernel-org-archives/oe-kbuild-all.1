Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A42D204090
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Jul 2025 19:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751743112; cv=none; b=nRCzzsa6ipBejSB32T83FY6gMmviMdFmOn4fg+MLJdJKTsoSLYfBJPEeud80898Jx0ueWKBt8J8b2Orkz0OGsj77iCfnsuypfKYQGrrE30bLsgDYpnMWw5AXLOhxJUh2WWlfdTNLv2JLTsvRvzZSN3j/2xyWzu9DQw3DTJ39IkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751743112; c=relaxed/simple;
	bh=9HHlBcRCYB2tJw9Cb8pACdTr+j+KC1IscDBIFzKrhBA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dqTAoeHyqvb9yAf81A3q5z2o8ZsA0UShPN9q5APPovVSnBKaAYbpHJ6lpqghK0LPapQQUo+WSW2QljPdbjULOXDOUL18tCleA+sdPl1w88auwMWPgR35a+iOuOJt5Dk0ERZTU/WEY6L8mcEnE9oTXK7uE99u9946g/ioAvOcPQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CCWLbZb3; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CCWLbZb3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751743110; x=1783279110;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9HHlBcRCYB2tJw9Cb8pACdTr+j+KC1IscDBIFzKrhBA=;
  b=CCWLbZb3FXkifwg7CBWanYePeP50fvLqvP671KLPRJltfc1joLMkqddv
   or2+KHe8XfYGWEizVwr0sJicootrocLmJSb/xGFUcLHRDI+y5advVNsLc
   Lo8vuxU1o3GAp/u1rC/UelGOaCq5tH7WZsvTsn04qU5ZUgbaKILsfRrV5
   pL3+VN8qFOEXnTq967ovuzr95UMnBMYUYl5I4JCQ6LtAjE9cBKaumGHWV
   1/iFEXOvodYB0zs6KqAH6OVNS1wh1dGoQ47/HMrOHsM5ApfMWCEHfI2kY
   +puMfHver/IdjIbsEnUmRzNHtgUMkKIYaDILhRxYPOg5GtbvJLlbBA97n
   A==;
X-CSE-ConnectionGUID: 9oOsR+orQam2Ji46SvOXRg==
X-CSE-MsgGUID: s9NHDS7lSuu4YxTfwW6Ncg==
X-IronPort-AV: E=McAfee;i="6800,10657,11485"; a="71455094"
X-IronPort-AV: E=Sophos;i="6.16,290,1744095600"; 
   d="scan'208";a="71455094"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2025 12:18:30 -0700
X-CSE-ConnectionGUID: qgdy1OraQ3yJb62h0fMqHA==
X-CSE-MsgGUID: gFpXIohtT3mr0NhasOAZQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,290,1744095600"; 
   d="scan'208";a="159214669"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 Jul 2025 12:18:29 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uY8P5-0004gF-03;
	Sat, 05 Jul 2025 19:18:27 +0000
Date: Sun, 6 Jul 2025 03:17:32 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 1/1] kismet: WARNING: unmet direct
 dependencies detected for PHY_DW_DPHY when selected by
 VERISILICON_DW_MIPI_DSI
Message-ID: <202507060305.lDGTVDoq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   d969457e60e9ea507680a1751a06b04ed0e952fa
commit: 500e70f6113ba8e3d77cbe6c36fb5a5d546e0557 [1/1] anolis: riscv: gpu/drm: add T-HEAD Light support
config: x86_64-kismet-CONFIG_PHY_DW_DPHY-CONFIG_VERISILICON_DW_MIPI_DSI-0-0 (https://download.01.org/0day-ci/archive/20250706/202507060305.lDGTVDoq-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250706/202507060305.lDGTVDoq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507060305.lDGTVDoq-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PHY_DW_DPHY when selected by VERISILICON_DW_MIPI_DSI
   WARNING: unmet direct dependencies detected for PHY_DW_DPHY
     Depends on [n]: HAS_IOMEM [=y] && OF [=n]
     Selected by [y]:
     - VERISILICON_DW_MIPI_DSI [=y] && HAS_IOMEM [=y] && DRM_VERISILICON [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
