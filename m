Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7262C1A2385
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jan 2025 20:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737144393; cv=none; b=TOPR//SFfSWBSwVnjNii90iffWdS2m3hczsure+5PyNiTsg9EiSZft8ZkkgjKbiHtzFjxwU99uh/KBpix3NK/je3xJ1PaRGdJXvXkly6jFRCgfQIYePOqFCTfvpC28U7MnWifenlWZlxkENLI77aE1Snz6rhyEyhsxafBAlbsCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737144393; c=relaxed/simple;
	bh=KUft84/cZQzd8XyRgMVacUb7a3f0RwQRqRAffA28oTU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HtgeTqk40ztSywVLpcVEJQBoqkRsB7B8iOjViXGUg/+LH7KfHB21qadjHrOA1YPpKLKDpRvxAN0lem3tPvNXGLzsJploYMsslsAlY4t/2H/J+3YxKkAdzcrOfY7185ZPxXwvhqiavSg6KD8ywHW8DTlSQK9PLZtojkqE8VXlgvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nzeRH8qt; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nzeRH8qt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737144390; x=1768680390;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KUft84/cZQzd8XyRgMVacUb7a3f0RwQRqRAffA28oTU=;
  b=nzeRH8qtP1qyf9KK9aeqrCy3mYXKnFaXhOWAhFw4YkgV2kdZsWCAUnZm
   N4rkPjuIVHqvzC1YMsAn41+sHRNOepdhkLmvBXuJ26jYn5AkjLp2smx7m
   9Vm2TOV8zyIveuC0UKbz2MjdYzlSFDrPTtngBuFIQmY1yODh85hcUopyh
   +HrjbK71bOvB/ZC8FW2Ng/eVblqdHW2whRDTHegcOIE03X/Ff0Sk4EQM7
   mlPel7vhtlfkyiXDem/hyEW4ECJuzDC6GOqOnAGMaN4aJW1dTrKB6KlW0
   1f1MlxtXkDxj4gwyl7h4ga0SVEK2Ff82DjMElmdmh2eLsQqN4FZRsMgO3
   w==;
X-CSE-ConnectionGUID: 2nUoSv3nQvmvFUkC3b6r+g==
X-CSE-MsgGUID: uIkd9+mPT7CC3TpOwTl5zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="62961898"
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; 
   d="scan'208";a="62961898"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 12:06:30 -0800
X-CSE-ConnectionGUID: yFDI8Oi9Sgu9a+Dda4P0lQ==
X-CSE-MsgGUID: BGsmBrelRRq/0B5f1hI9Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; 
   d="scan'208";a="105861073"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Jan 2025 12:06:29 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYsbq-000Tff-2n;
	Fri, 17 Jan 2025 20:06:26 +0000
Date: Sat, 18 Jan 2025 04:06:07 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [morse:mpam/snapshot/v6.12-rc1 48/132] htmldocs: Warning:
 fs/resctrl/Kconfig references a file that doesn't exist:
 file:Documentation/fs/resctrl.rst
Message-ID: <202501180406.wFi4qVcj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.12-rc1
head:   4d17b37b670795954fd7a70c8ec83fb705a5e2ad
commit: a2273d13b7e6bd18935bcb8c1f67d67b92cb44c6 [48/132] x86,fs/resctrl: Move resctrl.rst to live under Documentation/filesystems
reproduce: (https://download.01.org/0day-ci/archive/20250118/202501180406.wFi4qVcj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501180406.wFi4qVcj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/fs/resctrl*
>> Warning: arch/x86/kernel/cpu/resctrl/monitor.c references a file that doesn't exist: Documentation/arch/x86/resctrl.rst
>> Warning: fs/resctrl/Kconfig references a file that doesn't exist: file:Documentation/fs/resctrl.rst
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
