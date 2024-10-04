Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B85613B783
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Oct 2024 07:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728028211; cv=none; b=qOXcEPNzzyliabv1PQ9DschUp1HQX+V37ez1viRESM6Vqvbmyf3KY+yWGrnXrGMCKZDrs90D+JGQKQZW4r+VSx9AMR+PKZ6vWw+jLJ/WTnifXpYZygX3ASlaqBlaAIk42MsQlkmWepHFfhUjPBNdmow1GjaFx+4SfdtWxKbbOBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728028211; c=relaxed/simple;
	bh=1M1kHBo8CNJKQ64WWKpuDd4iaWHjUss8ZwZ9tAGwCw8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nzEs/kIOKD4jtQDO1KgWjCJwOYbQrL2IW8Ki4XI16SWqNlJggNGZeQePTwnh4ndrHBgsyp81eV8j6/3q457iPJRTAABWagE60KlkUORisgSOTJN3ooJ4DYHfltXGoq/AXYxgkQ5FTl0tbAgv5Vy+/7hHcUAE+9pnw08vTQxpR60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N6ie785n; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N6ie785n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728028211; x=1759564211;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1M1kHBo8CNJKQ64WWKpuDd4iaWHjUss8ZwZ9tAGwCw8=;
  b=N6ie785nr1ryPFHz8ne8QdVJoGX9irV8Sd+WdWNGOCnGTQ4wPpXb1eOu
   xOi6H3FRuvlJccVtimeQPtF47p8SiET2ehmOyhrpZR5Dh0tTFfKKoRgWQ
   329KyJI0gSWDQ2zYkjCKhWZ8EKDFXWla2jx84bstEaAKKqbA3jKORPOsq
   S4YH/YkP/bHV57sYp/PLfhWotu5olYAG4lF7Hex6QBwH2vrPzinQYyT/n
   lx4XjDbEraeP0zWbPRSym1gSKG6TbuP85UlnUIhvha4eLtLo3nVgD+fAB
   i4yM6nFr9V2MfRN7C87++LZraSDnweJtaF536/RWBu5smMl4mfaasLAb4
   g==;
X-CSE-ConnectionGUID: 1/7KGQE+S4uDEw+OBQDLPg==
X-CSE-MsgGUID: I48giZ7FTXuMcDFV9BG2bQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27373121"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="27373121"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 00:50:10 -0700
X-CSE-ConnectionGUID: kX+GL9mhQhSZt/f27amE5g==
X-CSE-MsgGUID: tnfQ3gSdTqCw2WkcBabbBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="79594306"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 Oct 2024 00:50:09 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swd4g-0001LU-1e;
	Fri, 04 Oct 2024 07:50:06 +0000
Date: Fri, 4 Oct 2024 15:49:46 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-doc@vger.kernel.org
Subject: [linux-next:master 2422/2483] htmldocs: Warning:
 drivers/gpu/drm/xe/xe_pci.c references a file that doesn't exist:
 Documentation/fault-injection/fault-injection.rst
Message-ID: <202410041549.r1yXqVA1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   58ca61c1a866bfdaa5e19fb19a2416764f847d75
commit: df2218ecdf52896e9cd70687613d016f23bf4919 [2422/2483] Merge branch 'drm-xe-next' of https://gitlab.freedesktop.org/drm/xe/kernel
reproduce: (https://download.01.org/0day-ci/archive/20241004/202410041549.r1yXqVA1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410041549.r1yXqVA1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
>> Warning: drivers/gpu/drm/xe/xe_pci.c references a file that doesn't exist: Documentation/fault-injection/fault-injection.rst
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
