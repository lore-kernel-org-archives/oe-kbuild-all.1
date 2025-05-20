Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5350B26A1A0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 May 2025 10:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747736003; cv=none; b=n9keKj8DOWBWFtb6WU/c6wSU0BySxRykfX4HHZZcy3zVapxuEA+oIQYDoNNt0BK5k1RXMz50NZBPgONiM8ego34h2dQJx2yt4qGo3YYqrTwEmK5J1iGPJl9Fmx8/4sp081Yl3nTT4g7eUjPvoV4JeGUjBt0d/TzURmVJUNRlMK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747736003; c=relaxed/simple;
	bh=xedbwFYNs/SBNVB/LTfUxiDLu0V5LEWyXtUlj5WSX88=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NxMqJ1cRzWWG36VTWKPUrIWafzdnSk5PADP/8ynQD/NNXcBwA4YSzU3MH0i9ZP9tq7wrFxfB3EnnFsrazvh5cvAYcsVH7vWdieDhMQ+sZywcsN/gYP6tJoYd8pYBH43uHL7F3leuWIm9rTVLTTYMPa1+7dOs1oaXz78wZ6J+YZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X0DhJZhh; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X0DhJZhh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747736002; x=1779272002;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xedbwFYNs/SBNVB/LTfUxiDLu0V5LEWyXtUlj5WSX88=;
  b=X0DhJZhhH8fhD69tDqxIeD7A+PFazUFc3Vvm6Fa2VI+WD/I9usouI39V
   0L7lVZM2dhrsRDXISrKZS1Xzw72bd/DQnMla38b+IJxG4P4hw+NKfTWaO
   vM85y4aC47SwE4/CDm4B1U0PMc1Su+js57yonIfEQBRBzK09pYCc1cVXB
   q7zf9iHLBRdNTLZIZUCapwEJePAC91I5m2rTU0/lWNVAnvaWYzilLacT1
   abbNxXCe1bNyntFYP3E7hlibAL+Qwrr+14uvVHy9Cl7nWYtYehno1pfDz
   Tv7nQ2svsOweBfC7AKC5kaG4zgqnT2qV6jUVUEKPvjxBuGVPrF0/BMKf8
   A==;
X-CSE-ConnectionGUID: 8QotNXkTSxSVuxbIb0CHZw==
X-CSE-MsgGUID: o78g+2L1Sym8XZhFI5WQVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="72174021"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="72174021"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 03:13:21 -0700
X-CSE-ConnectionGUID: nxYK+sFaQnmm2Q3LnXym7w==
X-CSE-MsgGUID: LO2GgDkOTv+qExKH2b1Xtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="139680314"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 20 May 2025 03:13:20 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHJyH-000MQu-3C;
	Tue, 20 May 2025 10:13:17 +0000
Date: Tue, 20 May 2025 18:12:42 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: kismet: WARNING: unmet direct dependencies detected for
 DRM_BRIDGE_CONNECTOR when selected by DRM_IMX_PARALLEL_DISPLAY
Message-ID: <202505201837.S8wp6yuH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a5806cd506af5a7c19bcd596e4708b5c464bfd21
commit: f673055a46784ccea04465b9213e999f7bc5187e drm/imx: Add missing DRM_BRIDGE_CONNECTOR dependency
date:   8 months ago
config: m68k-kismet-CONFIG_DRM_BRIDGE_CONNECTOR-CONFIG_DRM_IMX_PARALLEL_DISPLAY-0-0 (https://download.01.org/0day-ci/archive/20250520/202505201837.S8wp6yuH-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250520/202505201837.S8wp6yuH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505201837.S8wp6yuH-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_BRIDGE_CONNECTOR when selected by DRM_IMX_PARALLEL_DISPLAY
   WARNING: unmet direct dependencies detected for DRM_BRIDGE_CONNECTOR
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_DISPLAY_HELPER [=n]
     Selected by [y]:
     - DRM_IMX_PARALLEL_DISPLAY [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_IMX [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
