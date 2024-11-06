Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD69620822A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Nov 2024 18:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730918135; cv=none; b=C1oZHKg5vi29+Uge9tBKQaODecl71MG55EI2CkkHVGF6Ig8fZlsu7UdTO0pIEElYCprso6WEJjvoYevaAxdVIMOuqAqL7v4lxw57oTQqBODTl4WWscKgKD3YUWPMlWL97iUTciUhDTo6XqzSd3aFoIP6wwTu85JXwydoRcVQAsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730918135; c=relaxed/simple;
	bh=z3sgG4avAGwKtJiVjApORQ0TVVeXqWgh9/AzJo6C7g4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nPoIv6tdr9YGfdBWyz1Bc1Sfqp8fp4y0oBmZnk54+hHGtND7n6ILjurL8zDt4oAOy8yaARBjlWK5z2VC3K3CBfmzj3eEqpgsOwZBDw9SR1Ba2JatlVklSWNDkyar3WYZ2xtuuT/6UNvppTjLeb5Iy9bsDAGzGwJsKNbv151yORw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MfBTtTSx; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MfBTtTSx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730918134; x=1762454134;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z3sgG4avAGwKtJiVjApORQ0TVVeXqWgh9/AzJo6C7g4=;
  b=MfBTtTSx71zPWpWtBeBnlzye76OsuRagsJdqCm/qCyNahTBkrDs+CYCY
   pJFNf6/FDcp+Waephji0/VUYNszQc0T37A0rtcEj4fyU45gudIUz0JDWe
   nFcGIRUdNK8Wg5v0C8+fZbqvzcR1ncLLCyncy+0R3CCPZ0nYLThCBDpO9
   JTKmEN67R4eCk/JnFOA5hJNCLMFZDz6kD0NqaLZVHjxtEtaoJnqXU9mTm
   YothagPQwAMNY6WisjgfHQc/2HbhiLmhyAslEloWqjuQbREHU0e1fjhBx
   te+iPtuJtIWeFbEqmVfHN5Z8IJX4CSZsTBC4suD5+yJw79KdprPm73o/9
   A==;
X-CSE-ConnectionGUID: YQU9f4eEQQaaw1LJsyG3Tw==
X-CSE-MsgGUID: HhGtcC6wTcGSFa59fz2OyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="30957231"
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; 
   d="scan'208";a="30957231"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 10:35:31 -0800
X-CSE-ConnectionGUID: E3A8VAodTg2Oo8//s3hFUQ==
X-CSE-MsgGUID: Up7DaX3ISZ6bITYnAV1xxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; 
   d="scan'208";a="89231676"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Nov 2024 10:35:29 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8ksK-000pHW-0y;
	Wed, 06 Nov 2024 18:35:28 +0000
Date: Thu, 7 Nov 2024 02:35:06 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Pu Wen <puwen@hygon.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1225/1225] drivers/hwmon/k10temp.o:
 warning: objtool: read_tempreg_nb_zen()+0x11b: unreachable instruction
Message-ID: <202411070216.fFHEZGdK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   e33ed48bc600febcdca9e71e43cf224934dadc4f
commit: c230f66f19ad44afbef0bbf2a49c0168a5211f37 [1225/1225] hwmon: (k10temp) Create common functions and macros for Zen CPU families
config: x86_64-buildonly-randconfig-002-20241028 (https://download.01.org/0day-ci/archive/20241107/202411070216.fFHEZGdK-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241107/202411070216.fFHEZGdK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411070216.fFHEZGdK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwmon/k10temp.o: warning: objtool: read_tempreg_nb_zen()+0x11b: unreachable instruction
   drivers/hwmon/k10temp.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
