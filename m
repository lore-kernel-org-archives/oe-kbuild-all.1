Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068892D193F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Jan 2026 19:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768160002; cv=none; b=NTXc3voP4O7JV3+BfCVaZX+zk2eaaA5/ChYzVdJmBYsUlxl0qSqS1HRFBsseNvqlagrox2heOsjfPbemb7Cr9YVbHIaaniy3l6usoXmUhWxGL4RbmmJQOjR32vdCUFpFyMTuwcwcIAroPA5IAw41UqjjjtXD/rbSP3OY95jr+rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768160002; c=relaxed/simple;
	bh=DEoFQkk4BUhhQb3vynccCS7dNiHYPg8fqxfqzv7gAV8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=m8CmfVANiHE4hT5SATfdUQRYidse5Z5snMDcfzeoCyMay8uUCBG+wpvAz5H01q7eHAMIiPhotGlznlIOzF1JZsDwpnoPrPSvdEiQSoKmLWBSh7RBKCwdHNrP/GdODODWz4jdh4xtt6dkdHHuyUuPaXAlhZyiwQgBoc1hbo1SNQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mx6vkPOa; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mx6vkPOa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768160000; x=1799696000;
  h=date:from:to:cc:subject:message-id;
  bh=DEoFQkk4BUhhQb3vynccCS7dNiHYPg8fqxfqzv7gAV8=;
  b=Mx6vkPOaEPVL4siB5zLHY2Td6nPu/DXNvjZ6S1NuI3UwsT3/S1jIejK9
   vkQTQ8S0CpovJOehx1kzbua8LU9s2RSJD7xCjV38Dgqxb6VZHMAT2kAdn
   0Xr/ouvcqa6Rn+fnyalFwHPWCLSd+YuZbHlCtRJX2vvOVmoum2AcH4SjC
   /w8BFJ81yCh5tSfhxMFGtyTIoah2GOGV7oD1d8DPcYWD72jATBqc/hoKZ
   bd/S62OJtabIYHHG/zjZhsLa8GSV+tcHiDCCkHJyzQ5+iTwb+ha6HBShS
   aPn8yV3Duut+kQ43tLiGt8r8IkAMtoZBLsTcN6ssQnh/HpCDsIGjAyduB
   A==;
X-CSE-ConnectionGUID: 9Ovu3xXpRyCe/VcFbe8Ukg==
X-CSE-MsgGUID: jibEs3j4TBGXAQ56/UBJsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="94924008"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="94924008"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 11:33:20 -0800
X-CSE-ConnectionGUID: JuMHsrBnSMCntyJp2zkU9w==
X-CSE-MsgGUID: 6uD9HjyqTgGtJm6Rd8s8sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="227211307"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 11 Jan 2026 11:33:17 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vf1Bb-000000000Sz-37YP;
	Sun, 11 Jan 2026 19:33:15 +0000
Date: Sun, 11 Jan 2026 20:33:10 +0100
From: kernel test robot <lkp@intel.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <lumag@kernel.org>
Subject: kismet: WARNING: unmet direct dependencies detected for
 DRM_BRIDGE_CONNECTOR when selected by DRM_IMX_LDB
Message-ID: <202601112043.YYJSgtAs-lkp@intel.com>
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
config: hexagon-kismet-CONFIG_DRM_BRIDGE_CONNECTOR-CONFIG_DRM_IMX_LDB-0-0 (https://download.01.org/0day-ci/archive/20260111/202601112043.YYJSgtAs-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260111/202601112043.YYJSgtAs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601112043.YYJSgtAs-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_BRIDGE_CONNECTOR when selected by DRM_IMX_LDB
   WARNING: unmet direct dependencies detected for DRM_BRIDGE_CONNECTOR
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_DISPLAY_HELPER [=n]
     Selected by [y]:
     - DRM_IMX_LDB [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_IMX [=y] && COMMON_CLK [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
