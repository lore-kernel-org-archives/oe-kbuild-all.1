Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DAF3CEBB7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Sep 2026 08:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790496917; cv=none; b=t46H8cTty9OOLU8XdzwxZNR2ORPeJbuMr67aVPUnMIRDTx9jdbCR0mxZqWpFE5Pzu2Y0+bf+mgzZuDjmHwcV4TsJKq1YLB0yLGKtTwjnpcZXnvgYxY8mKmmLhhkKUPCxTVkdO9YoYUZZvk1qDioFhAbiDakMzOhulEUwz9z25Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790496917; c=relaxed/simple;
	bh=fmx85AI8ppFNfLdcxj/oAiBq4vlslglQFmvEA6UIQHc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VroSfT+gsp0aYL9n4KuKdVm/pvpbZAIeg4rpClkcHxpZ3/OmwhJ0GM/hcB8Y2qjr+qdcVKPCn99jz2+BVIZoZuwAI6C046bABo+YXKPOFzQqOicgoT0pVPJsZhHBsGuQ4ZzgGPELMaQmWaNdXrMF956pxhyAbvGGstGdt+99IVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jagcR923; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jagcR923"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790496915; x=1822032915;
  h=date:from:to:cc:subject:message-id;
  bh=fmx85AI8ppFNfLdcxj/oAiBq4vlslglQFmvEA6UIQHc=;
  b=jagcR923vCfQGN8QeyzsftnJONawEYyt6QYOd6IAdjCyKOtnogNL2GQ1
   6e2fy4P/zhk7QUPyHWbKXpKVQtPQU8X/8Ne4ZyCD3WAKO1jIs0vApzCdH
   ZSIQLI04cOjJl3whFuTf+gFPkIccRUzQoxgGzy7Si2xlteDsv8sfzmOS/
   WQq6CGkLgQwCdZTV4uBB7AjLNNyszSNiEc2AEK021riA9fUe4KRc84slb
   bWocVgYefJIUO9Iy/+YRrxmnbEDM9gqu80O8MTzLOvlbBfYe2A/mVJima
   gDzWWZ2vwclK4gf7WhjS+xYbJvq46dzGbzUmEJuRpivNbOcZuCWyaZaJi
   w==;
X-CSE-ConnectionGUID: 7Uj065qoR2GzmGjVnwfbmw==
X-CSE-MsgGUID: 6HZelj9lSum4bErV4VoPaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="107602780"
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="107602780"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 01:15:14 -0700
X-CSE-ConnectionGUID: OWB2VCRfR6St6I/nG8VDNg==
X-CSE-MsgGUID: ajkS1BxyQtqPd71/HUtmSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="282831555"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 27 Sep 2026 01:15:12 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAk2P-000000000Vf-2BCI;
	Sun, 27 Sep 2026 08:15:09 +0000
Date: Sun, 27 Sep 2026 10:14:42 +0200
From: kernel test robot <lkp@intel.com>
To: Hajime Tazaki <thehajime@gmail.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, Johannes Berg <johannes.berg@intel.com>,
 Ricardo Koller <ricarkol@google.com>
Subject: [linux-next:master 9572/10910] kismet: WARNING: unmet direct
 dependencies detected for DRM_TTM when selected by DRM_AMDGPU
Message-ID: <202609271007.Ff8nGTsu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f5f84daefcd92d7a630066635ecea1433ed5eac7
commit: 626ff2b34dbb7679b798f7a4962a8b3def695045 [9572/10910] um: allow deselecting CONFIG_MMU
config: um-kismet-CONFIG_DRM_TTM-CONFIG_DRM_AMDGPU-0-0 (https://download.01.org/0day-ci/archive/20260927/202609271007.Ff8nGTsu-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260927/202609271007.Ff8nGTsu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609271007.Ff8nGTsu-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_TTM when selected by DRM_AMDGPU
   WARNING: unmet direct dependencies detected for PCI
     Depends on [n]: HAVE_PCI [=y] && MMU [=n]
     Selected by [y]:
     - FORCE_PCI [=y]
   
   WARNING: unmet direct dependencies detected for DRM_TTM
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
     Selected by [y]:
     - DRM_TTM_HELPER [=y] && HAS_IOMEM [=y] && DRM [=y]
     - DRM_AMDGPU [=y] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y]
     - DRM_NOUVEAU [=y] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y]
     - DRM_RADEON [=y] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && (AGP [=n] || !AGP [=n])

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
