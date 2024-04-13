Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D604A1C6A0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Apr 2024 05:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712985568; cv=none; b=mW0QpXmWzKpFpWPr3v+ggR4WEk/p/8kFoGiME3yw3RX7j9Ku6usbwI5tAGjtj724dPaPNUOEdl1Y1B6FdY82kTYOMUMGkCi2YNP9nGwQ3ciAh1kt9e6jDCLkV7EmO7mQVom7ziyVZyleNkthn16NYYqeRef6ERfzp2nVDUwCoxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712985568; c=relaxed/simple;
	bh=ddkiC3Og9qjLT6HCQ7y0ILr4DgCj/74yhd+Gy/JeuYA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LkjVBoBe30n7VrbV0j2e1TmtVLBn+RXQOuiVPYwMZjg92iKHQlNilCft7e8Bwt85TuMBtEjJTI03i4EIu3j13N2FS7RnWaHSjJDto9Y1wy6DA/WvfrNY7pGYKGAGtwORFuT6Oe+MWZWSb5NyYAEXU+C7ussJaeGhrJg2PgnnCS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CQ5M1SDT; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CQ5M1SDT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712985567; x=1744521567;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ddkiC3Og9qjLT6HCQ7y0ILr4DgCj/74yhd+Gy/JeuYA=;
  b=CQ5M1SDTOHwbEeH8WKiwXGf4itxHbU7rfcwW3PntpxAmjbgO6tIAUaNa
   YQaGC1xNaPSTwTa+kgnLiqxcQ1Igrt3H6FQp3AedbCADjey756lV1I0Ch
   ixAUv0rDmPEI+TIKW10gs4pWVISqzu/C600zg4dXOkkiFwO5JQ0rq4ZGP
   kxALXFREOsXr1/0f8UXjzQ84ogP2cDXwUuiIKLy5S248yZcnm/KRgcK0x
   jtGrTRYJiA8uBlMMM5itA161UwrjrMttW1in6dK8sPuLjwmaCkewR1U2/
   xUFKCIm2opomLkMRDsz2XNM8M7mXlo9+XIiktrEsuBkAxf01ecGOLoyeH
   g==;
X-CSE-ConnectionGUID: 7gXyom4/Q52XHbr1BD7qkQ==
X-CSE-MsgGUID: MYqcS/eBTu6PptnGGfZbMg==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="8575052"
X-IronPort-AV: E=Sophos;i="6.07,198,1708416000"; 
   d="scan'208";a="8575052"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 22:19:26 -0700
X-CSE-ConnectionGUID: YCl6xqPER5qmivdkOJ7+KA==
X-CSE-MsgGUID: xQGJLmBvREmNccz5QCZ0kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,198,1708416000"; 
   d="scan'208";a="58844276"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 12 Apr 2024 22:19:24 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvVnO-0001pF-0y;
	Sat, 13 Apr 2024 05:19:22 +0000
Date: Sat, 13 Apr 2024 13:19:17 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-doc@vger.kernel.org
Subject: [linux-next:master 1372/6010] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/devicetree/bindings/display/exynos/
Message-ID: <202404131322.iJYhpWoV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9ed46da14b9b9b2ad4edb3b0c545b6dbe5c00d39
commit: ad6d17e10306a66fb40985da77889bc28c2a5c1b [1372/6010] dt-bindings: display: samsung,exynos5-dp: convert to DT Schema
reproduce: (https://download.01.org/0day-ci/archive/20240413/202404131322.iJYhpWoV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404131322.iJYhpWoV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/sound/fsl-asoc-card.txt references a file that doesn't exist: Documentation/devicetree/bindings/sound/fsl,asrc.txt
   Warning: Documentation/gpu/amdgpu/display/display-contributing.rst references a file that doesn't exist: Documentation/GPU/amdgpu/display/mpo-overview.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/exynos/
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
