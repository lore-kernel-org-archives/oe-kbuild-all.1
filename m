Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8B81487D9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Apr 2024 16:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713369651; cv=none; b=S8Px3Q9lxOoe6ohK0sUNIX9MF3s+pIlQPvXxnjPNxU5b22noqmWrf1iBQvOFJ6MpYsBk1OB5Vh/v5wuxCp4ruBW2pO4DeQQazasAJVWfgy8Uo6vCKxxpBqpk5Dj3VcWpd0RfAWqIyHf/VdxtmCu7ZG/03AdYV6v1PmKYC7ezXF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713369651; c=relaxed/simple;
	bh=AY0Rf5NedsnHpAuQ/0qEIf1TPuBCL9DjEEXkDhqlAlk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=moCldvsmXlAv/1Xoh4YjDIQWMBef1v63gpj1jFav2FJpzRlKPXKwnasbuoxC2tcBnp5HHt5svAKc/3kYI9nnrrteyWuL0rbgdPDdu9hFioE7rzJqggLJfKcEHYHu/GjmsuHZxxSWEeBbKTpM7lyJc0O+PEdTYYAOd8YYeC6/6iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W73CyMZk; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W73CyMZk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713369649; x=1744905649;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AY0Rf5NedsnHpAuQ/0qEIf1TPuBCL9DjEEXkDhqlAlk=;
  b=W73CyMZkASpHiPcjDdsMh7DaBO0vUJ+P4bgoEd/8TP5i3LXgLOe+65vf
   A8Z7Z6MnW9ZLcLG2Sy8VkeXK38aJGHx3NViFagcZYrqw9JoHw8/yrOrUJ
   X8hGaKEsjlXclVjfrObnQRscN9t+7KSbKeVfhj9xKAjp2Ta5C/5SDeo/L
   /pjyttF4NKd2MbZPVLic+vMS+SuFvfBu0Uo7a2FicSXVtq8OaUZPKm6sF
   +cxTKTHbSTRvKAHiPuIOEJHtRYkZ9w+Rmo7wnRagGTVresYONEcyFXk/u
   UVpzcdusGEiycawR7p2DXq8rZ2opFjRLCE6a2s/+ixZvsPIzUwDoerjTx
   g==;
X-CSE-ConnectionGUID: PiB/jLgEQceHic9gUFaTKQ==
X-CSE-MsgGUID: Q16BAjXtRJmRZpimiKHZcw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="19475163"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="19475163"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 09:00:48 -0700
X-CSE-ConnectionGUID: ZtVik2d5ScGsk9MEdlM/Yw==
X-CSE-MsgGUID: CQDulScqR3up/G2JAicxGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="22678964"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 17 Apr 2024 09:00:47 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rx7iG-0006ki-2K;
	Wed, 17 Apr 2024 16:00:44 +0000
Date: Thu, 18 Apr 2024 00:00:37 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 1165/18115] htmldocs: Warning:
 Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt references a
 file that doesn't exist:
 Documentation/devicetree/bindings/clock/imx8qxp-clock.txt
Message-ID: <202404172305.rUeJXCmK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.2.x-imx
head:   de69f223c019fed2a465c014575b3b3d22b4c3fd
commit: d911e8afd451766851d6dd41dc184efdffacde9a [1165/18115] LF-1189-4 dt-bindings: display: fsl-imx-drm: Add LCDIF mux display doc
reproduce: (https://download.01.org/0day-ci/archive/20240417/202404172305.rUeJXCmK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404172305.rUeJXCmK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt references a file that doesn't exist: Documentation/devicetree/bindings/clock/imx8qxp-lpcg.txt
   Warning: Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt references a file that doesn't exist: Documentation/devicetree/bindings/clock/imx8qxp-lpcg.txt
   Warning: Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt references a file that doesn't exist: Documentation/devicetree/bindings/clock/imx8qxp-lpcg.txt
>> Warning: Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt references a file that doesn't exist: Documentation/devicetree/bindings/clock/imx8qxp-clock.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/trace/coresight/coresight.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/mfd/da90*.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
   Warning: mm/hugetlb_vmemmap.h references a file that doesn't exist: Documentation/vm/vmemmap_dedup.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
