Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A23AD272
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Apr 2024 03:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712978134; cv=none; b=oxWI2hJd6xT8YLz6Gew5gWBsIRCTdr1oX6Klan78LxqIEkI/bur/RKW9oE1ksazFX9V12X2qLC0ysaIxJr2y7YJi1NLf98EMokkQRnFS7b0Qp9yTPzpBUQgfuST+PS+svlqA2IVEl53WAYlX3DVt9pHBLG7LAVJ4tgukv60Eqb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712978134; c=relaxed/simple;
	bh=MQGpPvLW1Fr00Bwmg3Av74ecnU5ewxsH6RJrsN3om7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AAkVmgGSCFO0m8U2v+Lmo5XHs1U8hzMulK7gdlMNGNoQPWcm2oyYq7h7v1mFy9mlnXy3k7HWn7bCnOW/wjNNPKqaS1Ntae1Tb/xhMX67cxMM/Vu+14lmiyBEl4K2x6Ir+/uDod9yqP7yrAswQU7SWf8xZ1Jfwec1xtCZ1WGtwfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KpK9qBJV; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KpK9qBJV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712978133; x=1744514133;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MQGpPvLW1Fr00Bwmg3Av74ecnU5ewxsH6RJrsN3om7c=;
  b=KpK9qBJVAihyc1z9LlPCdScovEvnE8qeBGfFHqfvOYjWyEHCW9uZ8GhP
   WRKYbGERAeGCMrkhYcztxprHti36CSggKxRp7mVvGBDBAImileTvAjBat
   oRAQn7bhaIDEfJTtdHW2xs0KvbtPQc0jWEgcIEGVFApkk+bGU0Fy8zYZm
   M4WtiB35DWtBU2M39/A3EAwIJ7XQe99ElvG+LeAAzlTLcFp/NATKdSKw/
   hzKhz4bstOraPwe0bX/XXrmcjDtLLdKVyaRT2DsYYmwCwMgxQ1KmMTaVL
   WEnXKYkmaiElovgZSf72qhT/QPwvxHN8tuzgoWtpgYqmbUbMjOgyobikl
   g==;
X-CSE-ConnectionGUID: XbIg9as6QKapzTokw5qhJA==
X-CSE-MsgGUID: mxab5cN+ScSDTHT2l3LwvQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="30925774"
X-IronPort-AV: E=Sophos;i="6.07,198,1708416000"; 
   d="scan'208";a="30925774"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 20:15:33 -0700
X-CSE-ConnectionGUID: fafggfzrQPeKvdmuT493Gw==
X-CSE-MsgGUID: NDREd8G7RiSEfohDqHPCug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,198,1708416000"; 
   d="scan'208";a="21977631"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 12 Apr 2024 20:15:32 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvTrV-0001Jm-2O;
	Sat, 13 Apr 2024 03:15:29 +0000
Date: Sat, 13 Apr 2024 11:14:55 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 5/6] PCI/TSM: Authenticate devices via platform TSM
Message-ID: <202404131011.bdHljQoV-lkp@intel.com>
References: <171291193308.3532867.129739584130889725.stgit@dwillia2-xfh.jf.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <171291193308.3532867.129739584130889725.stgit@dwillia2-xfh.jf.intel.com>

Hi Dan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 4cece764965020c22cff7665b18a012006359095]

url:    https://github.com/intel-lab-lkp/linux/commits/Dan-Williams/configfs-tsm-Namespace-TSM-report-symbols/20240412-171254
base:   4cece764965020c22cff7665b18a012006359095
patch link:    https://lore.kernel.org/r/171291193308.3532867.129739584130889725.stgit%40dwillia2-xfh.jf.intel.com
patch subject: [RFC PATCH v2 5/6] PCI/TSM: Authenticate devices via platform TSM
reproduce: (https://download.01.org/0day-ci/archive/20240413/202404131011.bdHljQoV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404131011.bdHljQoV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/ABI/testing/sysfs-bus-pci references a file that doesn't exist: Documentation/ABI/testing/sysfs-devices-spdm
   Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/sound/fsl-asoc-card.txt references a file that doesn't exist: Documentation/devicetree/bindings/sound/fsl,asrc.txt
   Warning: Documentation/gpu/amdgpu/display/display-contributing.rst references a file that doesn't exist: Documentation/GPU/amdgpu/display/mpo-overview.rst
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
