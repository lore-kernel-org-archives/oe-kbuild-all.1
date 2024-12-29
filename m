Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B3F3FB1B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Dec 2024 08:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735460903; cv=none; b=duASrrVH2TUzwNJCCpFp1Ti6mXtzNFnu6ksc07zK/BWnofvsJq+B37COAJh8saDLp1PxKo1i9/BIVvZVgUfNfpgX+g51vIe4prDVXYBLhuGIT9EkJ863O5OngDr2CzAqhT9yt/sTE5/6b6KahQooIzaGL2vbusj0z9V3/DYSJOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735460903; c=relaxed/simple;
	bh=K6vNGaKEFRGtMATkeNS1qVESp43iqXymi7CVSoDEYp8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZdMuc08Ec5mwt1wNPxjktoqbN/9ALWfD5nvqhU9L2jm08cpMq/kLV3SWd1AmHmmM8aSP9pUzKulnGb4oQC0UInj/UZUYNGuVpubuuNTKHRzQFrFpPVMByedzt9cQ68JzsD+RB8+dON5wMzc4votak4PkIBgMBDebPolUfqng5Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AKIBkEAM; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AKIBkEAM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735460901; x=1766996901;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K6vNGaKEFRGtMATkeNS1qVESp43iqXymi7CVSoDEYp8=;
  b=AKIBkEAM2kSmau7K7HX4/MGEiyi+JERf7Z1gYwEgzqYxsM8nQkWyOX7C
   KleOy0rALQt4aMlfaMQFEeEehDz57vVjxPvtjDLWYUZ+fh8AlaXtUnjVM
   FzS/QRt/6ZftldBgoMg8/Z4B/1dwGXxIglkG1qzkWm9VMmZEiPb17exdE
   IgELay908uJ73P1KZhemgOyZ8XkOcB29uLcz04aCYfiMoWuwZSXULPi1R
   Mg7wowkQ+irpuIoupIFCAH4HLAVIMbRTDi4ifvw6dd/RCCnBqnNXY8iHy
   So02UFqq9XTJOyZC3RtFPsv5HTiQTAGz0IBiCeox0ck6KyR30bxv2+b1r
   A==;
X-CSE-ConnectionGUID: oKpVkgZFSFmq9bZK+A0Knw==
X-CSE-MsgGUID: 8DVZP5BGQYmSsISdVMZ7BQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="47147488"
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="47147488"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2024 00:28:21 -0800
X-CSE-ConnectionGUID: I1c+TmqlRgylUvzbAKlxCQ==
X-CSE-MsgGUID: IQ2Akd/nS9efH4MV+vh7Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="131353074"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 29 Dec 2024 00:28:19 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRoen-0004ZU-1m;
	Sun, 29 Dec 2024 08:28:17 +0000
Date: Sun, 29 Dec 2024 16:28:02 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2589/2589] drivers/gpu/drm/drm_mipi_dsi.o:
 warning: objtool: mipi_dsi_detach()+0x7b: unreachable instruction
Message-ID: <202412291615.DMQ4kEKA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   4848f81edc2027721953fee5ded81f909a833e26
commit: 98a38084c13000416219d8b38fb60f874185f79c [2589/2589] drm/mipi-dsi: Fix detach call without attach
config: x86_64-buildonly-randconfig-002-20241218 (https://download.01.org/0day-ci/archive/20241229/202412291615.DMQ4kEKA-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241229/202412291615.DMQ4kEKA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412291615.DMQ4kEKA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_mipi_dsi.o: warning: objtool: mipi_dsi_detach()+0x7b: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
