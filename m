Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15FA14286
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Oct 2025 06:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760078826; cv=none; b=EM/P8lT16WoQkJmT8LGzjv5k4W5+VgfUN1vbRL/BkKZX8vCkYsd8rOQtB3y3iFZ291obX2DO50BLY35YORVhlAC1sQmW8Sz243LwLhIu5qDlo3ROdHlyjcWjC8rfYmmhlVZWB+qetOOunic4fNZYTeayatIUKvS9e4MHLwGmxTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760078826; c=relaxed/simple;
	bh=Ir4c1WomDR+DqQpYDsLfUxCUDvVPV3MQSuselxES2Y4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EFzc2DjbEeiZjemGcqeAOmDGyND7y7MBh+WiRlde60KcA9v4jGL0MJA5Dm2GMIlNUoNgW9Cg3J9U5GUfo6g1QgR6nLkI3rNxSVCRKS5R7LRKQqtBVuIy3Sp/V3WhkfiHMG9MAHNJkj4oEQvut6Gz0eRt5UtsnPI2wuNvPXHbsF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TgXqvveC; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TgXqvveC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760078824; x=1791614824;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ir4c1WomDR+DqQpYDsLfUxCUDvVPV3MQSuselxES2Y4=;
  b=TgXqvveClqOVXlKOz/EWjtT+4XrzHfjRiUr+pViuLs8lJqlb5tgiJ8yI
   SSrowBwrlLge9twP0cibkl2wG7/aE1jlqX/JM9g7QWQkvS72h2ngAW0R7
   AIlrEFU5ctI8loKiOVbrslIzyjf/zIUVbBXst/LsjoFLqh1LYsuk0rkGG
   Imu5caNQ5xtxnCQwijjhDRifSyj+IOjXjuDb7ve+3AUKuqRdSvErEYd3e
   ibG1iJnW0vy3d0UEOhq0dBSo5yHkb0sokJ1ATQQJtqRg2VC80cBiTm+g/
   uv620Z6VmIsRRrjRAaMaQ/RixnKI9YVVVCR+wqKAWG6jZh40XbxtDc+dp
   Q==;
X-CSE-ConnectionGUID: z4SDkCPxTOaA2K3WUc/+vg==
X-CSE-MsgGUID: BAo7rsI6RhyWUqN5pMH9Ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62215722"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62215722"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 23:46:59 -0700
X-CSE-ConnectionGUID: +WJB3QmzTdq0zTx+6KZlIg==
X-CSE-MsgGUID: 3pUtPABjTrCUb4RsDfQrqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="180156137"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Oct 2025 23:46:58 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v76tz-0002MJ-1W;
	Fri, 10 Oct 2025 06:46:55 +0000
Date: Fri, 10 Oct 2025 14:46:07 +0800
From: kernel test robot <lkp@intel.com>
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [esmil:visionfive 31/31] firmware/brcm/brcmfmac43430-sdio.bin:
 warning: ignored by one of the .gitignore files
Message-ID: <202510101435.PbTxYpEC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux visionfive
head:   e0d906c0ce2d81cc429b4807a71c98f3e6f0253c
commit: e0d906c0ce2d81cc429b4807a71c98f3e6f0253c [31/31] [NOT-FOR-UPSTREAM] Add build instructions
config: s390-randconfig-001-20251010 (https://download.01.org/0day-ci/archive/20251010/202510101435.PbTxYpEC-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510101435.PbTxYpEC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510101435.PbTxYpEC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> firmware/brcm/brcmfmac43430-sdio.bin: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
