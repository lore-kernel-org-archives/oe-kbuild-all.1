Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC6C228C9D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 01:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766367615; cv=none; b=vBIbok7jPaS+0c5XcltEt0GAlMZNejwT9TMGN0kvCqBnpv+Lm9PNNgtbz+g/gacKw03OPMpghb3NOV0umiXkRdJfcD6jGSovjCOBfFVF8m/Fuxg0KPdvDXy88iaYiTWLy5wNdJg18XJ0YPMLIF2eTDESGPL8fyTYqexRczhEIag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766367615; c=relaxed/simple;
	bh=2q6INEmyrOoSbPu7j2eQCDHhOBRUry9i6FZ++OK4gZE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WSGMg+QLWpPsDe07tevpzCoO0TiuWyH4sFLntGi831InNqepS4US5mkUtMvu2Qluyd1pCtfTW3khWdp/iLrTPynbNn8+JO6HxyZBlJOHwn4mz8OOT1faMR+FjjKO8iW1dAivoKrJmcemlaBF52BApIZ1h8nFIXdTATZpo86jXHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MsFYvrEu; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MsFYvrEu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766367613; x=1797903613;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2q6INEmyrOoSbPu7j2eQCDHhOBRUry9i6FZ++OK4gZE=;
  b=MsFYvrEudbZ+9oqB1k6JATh5CYn6yMBjKHCH5XCy9cJfR8B4biSjbscK
   VkdTcosTuHFsujpQPFCP+2Xei1gifw+Z8hsZSwC8DbywvjiO4fS8TM6Oh
   z3RrygYJOYtp9jUbIhw9HNvURdOHeKJT3/083qnOxGxC/QfTytyY2Dnz9
   c/pflzYCApOGOTqEpOuYlqkYW1n5D8amGFQh4zVrEdg0LrdJYWq28T3c3
   +IfvkieAANL9bgvivho/j5s0EFXOfOqkBh8wOVCop93DSJ16KFB4fOcOO
   QorzPggsXOFM3CagwoedY2dtdRnaklgnYpfbpX74J2+4ic9MVUyFw5VQa
   Q==;
X-CSE-ConnectionGUID: Etg5qAF/TCy+Og1zEQzwGQ==
X-CSE-MsgGUID: 3ZLmDaD7SKOYeyGfvHXwZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="72085412"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="72085412"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 17:40:12 -0800
X-CSE-ConnectionGUID: DMa9O9r7SR67aSs7ZI3D/g==
X-CSE-MsgGUID: +wCeriODQ0uyo9Osz/uH0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="198554747"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 21 Dec 2025 17:40:12 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXUu9-000000005JM-0ktG;
	Mon, 22 Dec 2025 01:40:09 +0000
Date: Mon, 22 Dec 2025 02:40:04 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 12/12] kismet: WARNING: unmet
 direct dependencies detected for DRM_PRIVACY_SCREEN when selected by
 GKI_HIDDEN_DRM_CONFIGS
Message-ID: <202512220248.RwtHkPeI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   2141da9e498139ac37a520b62dfdc77db8003146
commit: 37d3c7ab72bddb663d31da64d4b888d56ef11440 [12/12] ANDROID: GKI: x86: Enable DRM privacy screen
config: x86_64-kismet-CONFIG_DRM_PRIVACY_SCREEN-CONFIG_GKI_HIDDEN_DRM_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20251222/202512220248.RwtHkPeI-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251222/202512220248.RwtHkPeI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512220248.RwtHkPeI-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_PRIVACY_SCREEN when selected by GKI_HIDDEN_DRM_CONFIGS
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
     Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for DRM_PRIVACY_SCREEN
     Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=y] && X86 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
