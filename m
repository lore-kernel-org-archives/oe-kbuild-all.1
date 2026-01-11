Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5041F30A4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Jan 2026 20:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768164743; cv=none; b=B5uQoqgoHPf9YkVgyEqAWlqjfKi/18gRStenmLzpkfJdVUY8ywTAL2o1gFqMDdrJtEsPke+sc6VZNqmZc6hB53tXRxEdM4XkfQyWDypu2sMpguHcU5qlbHo1Ggz7JCTyJQw4MdZTOH3wlJB87FWK8A9gr/J1OhTSLXe7Q9AEwzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768164743; c=relaxed/simple;
	bh=EP8qV8tIhTmih/Q5d7S+Ii7d3lE+vYvoEU7cPWd/gp8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oey6oDpki2m1ntPnuIvg/BPPrVnKVywb++pxaUgd56Bl8Oti2XJmkw7CJyGdrtqg26HWDWxHcqB+a9Gyk+7JEuFXTGrs3j+69KYYi+fXHuE9dxAptPBE/VoFUQZPcr/qH/JmXHTTlcpsDlB4zKhMz7iE7nGQZZJcipxwtspxTYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Acld7s+P; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Acld7s+P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768164741; x=1799700741;
  h=date:from:to:cc:subject:message-id;
  bh=EP8qV8tIhTmih/Q5d7S+Ii7d3lE+vYvoEU7cPWd/gp8=;
  b=Acld7s+PpDxv+QaiZe5uu7jkW04OctJ04jQbbKiY0TwLaNo2NjaTN250
   FzXq0YMThRFFB6wz4hNA0hfjvACr+PTwcwSjBvVC2AZJEcL0VGogljlrb
   pw+GFIJd6X2oQ1ofO1RCwdayvMRNe8MdvThod2J/hGAWxyOx5Le0xnoLj
   rHcONl8XUsH0n7Qn9RakbxW0Si8CNP/iO7qBmZw2QKWIbgyNv9ZoTAmR4
   eDFoKNNdrd8Dlel3dPN/RkD+SWCAoSYARUfaBzpZbMgg04SKJ/qNTvLHY
   rTI1+mY1hefRVGpCfhNlzk7WS0zsZ5ey6etErjlmtYfEdhvrDk60+Tby3
   A==;
X-CSE-ConnectionGUID: WLQ6RJV9RPuuhTBCo0KAXw==
X-CSE-MsgGUID: 9Dflb5PqRYG0qiMJPHOgCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="68455866"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="68455866"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 12:52:21 -0800
X-CSE-ConnectionGUID: WD0Epa+iSASPlTYMFhz9wA==
X-CSE-MsgGUID: 7K00IS3lQiiOkIHf3j7WiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="203081447"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 11 Jan 2026 12:52:19 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vf2Q4-000000000U5-25vh;
	Sun, 11 Jan 2026 20:52:16 +0000
Date: Sun, 11 Jan 2026 21:52:14 +0100
From: kernel test robot <lkp@intel.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <lumag@kernel.org>
Subject: kismet: WARNING: unmet direct dependencies detected for
 DRM_BRIDGE_CONNECTOR when selected by DRM_IMX_PARALLEL_DISPLAY
Message-ID: <202601112125.JdH0Ofhr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9c7ef209cd0f7c1a92ed61eed3e835d6e4abc66c
commit: f673055a46784ccea04465b9213e999f7bc5187e drm/imx: Add missing DRM_BRIDGE_CONNECTOR dependency
date:   1 year, 4 months ago
config: hexagon-kismet-CONFIG_DRM_BRIDGE_CONNECTOR-CONFIG_DRM_IMX_PARALLEL_DISPLAY-0-0 (https://download.01.org/0day-ci/archive/20260111/202601112125.JdH0Ofhr-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260111/202601112125.JdH0Ofhr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601112125.JdH0Ofhr-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_BRIDGE_CONNECTOR when selected by DRM_IMX_PARALLEL_DISPLAY
   WARNING: unmet direct dependencies detected for DRM_BRIDGE_CONNECTOR
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_DISPLAY_HELPER [=n]
     Selected by [y]:
     - DRM_IMX_PARALLEL_DISPLAY [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_IMX [=y]
     - DRM_IMX_LDB [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_IMX [=y] && COMMON_CLK [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
