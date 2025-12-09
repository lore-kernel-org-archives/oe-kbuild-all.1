Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B06432A3E1
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 17:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765301532; cv=none; b=KX9ooqCi39KJXCZ5Gh/+DR1Uukbncc9/Vau4MijYtuWlzfZLxdArVO50Qv5T4U+GFQRdpGygRwaiHpQug1MOaiB4LPhXeXA1wOLD0weeZYcZw6dpfzXCCh4FiKeWMYAc/DSTaf0HAYdgwyuGNbSU+F/3TfDSVJP13dYgQeSTOUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765301532; c=relaxed/simple;
	bh=3vwMFo3TZD75AvSlT+fkYMjh/TA0mnQZJXZ4s44+wFI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IMbtkrylGqcVLNgZC/GLxi4vIkUEpE2g8kslG/rbFMbCCwGk8WUAt23a1U8I4keG18W//C0K7/cHvKKDaJoMPqmmjJJfhFRIB7i4HMNhTDMvCju3TD9QO6nOl0tjuqm1Ox4dtN4lqLDBt6bB5ui3O5JrkNGIJQ1aiSAaQV1F+9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y6uzNe8s; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y6uzNe8s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765301532; x=1796837532;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3vwMFo3TZD75AvSlT+fkYMjh/TA0mnQZJXZ4s44+wFI=;
  b=Y6uzNe8s1DJaHCow5BrAO7aXz3CMzbA9UooPXgnOCCX91dcR1ULr9SdU
   dKldst/sk050uN3KdQWbg5ShMR4PgodiX47XSCPMZ/aYt8VD8VNQAWplZ
   2PeSLEbiIVFbwxq/FLz9cYepP/hpPTATjcyWlpRd3isRPNlzxeUWhw+eN
   ALWoQqgQoa6CUdgM31mSvUauFgJHa3cJRXep5GoAXkoPkDMVg0LyFAVC0
   G8Oz8d9NnKockGeltn7Yo4h1blNOHzvuvy7Odl35yPSqzG1fhs5iUtFqk
   wQiwFXljqs1QdeA/ZalCuRfry9Um9dYSXgtoogP06cSjr4adn0LW/iqiI
   g==;
X-CSE-ConnectionGUID: FHtsaWgZTxehMt5zGnud+Q==
X-CSE-MsgGUID: q1i0WsZsTz+HFoTVvKclaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67222770"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="67222770"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 09:32:11 -0800
X-CSE-ConnectionGUID: VrSvw44yQmS9P4tUmo5OEQ==
X-CSE-MsgGUID: cysN5Td7RMCrQl+FhyBgMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="200712013"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 09 Dec 2025 09:32:09 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vT1ZH-000000000KD-0epy;
	Tue, 09 Dec 2025 17:32:07 +0000
Date: Tue, 9 Dec 2025 18:31:34 +0100
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: kismet: WARNING: unmet direct dependencies detected for
 DRM_DISPLAY_DSC_HELPER when selected by DRM_PANEL_SAMSUNG_S6E3HA8
Message-ID: <202512091804.4HJDPGPk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cb015814f8b6eebcbb8e46e111d108892c5e6821
commit: fd3b2c5f40a1e028bc813284260d430257444334 drm/panel: s6e3ha8: select CONFIG_DRM_DISPLAY_DSC_HELPER
date:   1 year, 2 months ago
config: um-kismet-CONFIG_DRM_DISPLAY_DSC_HELPER-CONFIG_DRM_PANEL_SAMSUNG_S6E3HA8-0-0 (https://download.01.org/0day-ci/archive/20251209/202512091804.4HJDPGPk-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251209/202512091804.4HJDPGPk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512091804.4HJDPGPk-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_DISPLAY_DSC_HELPER when selected by DRM_PANEL_SAMSUNG_S6E3HA8
   WARNING: unmet direct dependencies detected for DRM_DISPLAY_DSC_HELPER
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_DISPLAY_HELPER [=n]
     Selected by [y]:
     - DRM_PANEL_SAMSUNG_S6E3HA8 [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_PANEL [=y] && OF [=y] && DRM_MIPI_DSI [=y] && BACKLIGHT_CLASS_DEVICE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
