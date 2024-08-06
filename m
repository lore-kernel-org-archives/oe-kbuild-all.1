Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDC516A95C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Aug 2024 10:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722941720; cv=none; b=dCC3RX9nXc17pSWPx0eVnLZNcs/oI6yKWK/xH5T1ARZdEAQd/p8w24nlpYPjtntewS0xNo6rQ4wpVHEF3AwKDvS1vTJ8x7UWujQdVfE+v7uW5XKZvxdnOXr1GabD6LFSLI8si1RSOVYqMCv4hDyAPXGNN0hnVcph3ngdgIuWhMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722941720; c=relaxed/simple;
	bh=6CrIh8Zty9ct2V9N429KT4xZqpWmEhtFzOQg8aarNgo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pN8tw/pO37A+gr5LCfR5tz0uOrVl8aC+RRtU3j0XpdIzr9+RXHcTEQ0fuZuq2UEmASWVZzgGzqIEpYaWaopeDw7OaLaITjhPYKLHON4ega4nCdqDz8dNdm6pPofViQrYVJD3FmIacLe601LBktMBBurKyYwcpvS/r6ZX0cavKCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I0iEeQLW; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I0iEeQLW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722941719; x=1754477719;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6CrIh8Zty9ct2V9N429KT4xZqpWmEhtFzOQg8aarNgo=;
  b=I0iEeQLW9/hyAg0EHIaxiF5m1LGYkmPl7QGgrJEBIqv3eOlLZZmiDzxo
   IwO2NaYJOaO143kIKUTkgv2ElO1NrG04fWvT2MKbhiQjhmC1xQVzhOmIQ
   UwX+kuhs/U7aaUfnzHWDwK3J1psv0RxggjSZTWO5dwgoBH1AWFdKPZi6P
   V4VF+Z4+MNeHgQP0LQj7+nwDdiaU27qiyD7+R9SCvuWTfIBurvH/hHnxP
   Q5vMUjY1Dq5LUCLsQ/ogQcM+2Kzjh1H8c3h7QAU9YTwWtt0ZtmgaULZxD
   sZOP1rm5/9L7cvJxv7+nQsujlhwyq/mPKit6rflNfFG6oSEbTux6mwLnT
   A==;
X-CSE-ConnectionGUID: nW/CCgyYR4SjrkWkpFODoA==
X-CSE-MsgGUID: xYxfJb9OQx+i2x7Jx42K+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="21098552"
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; 
   d="scan'208";a="21098552"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 03:55:16 -0700
X-CSE-ConnectionGUID: ylueYIqIT3idRZ0ZES0E9w==
X-CSE-MsgGUID: spoqEwdlQzuD5dpeiKzIEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; 
   d="scan'208";a="87411303"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 06 Aug 2024 03:55:12 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbHqI-0004Q8-0q;
	Tue, 06 Aug 2024 10:55:04 +0000
Date: Tue, 6 Aug 2024 18:53:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [robh:cpufreq-compile-test 6/6] kismet: WARNING: unmet direct
 dependencies detected for ARMADA_AP_CPU_CLK when selected by
 ARM_ARMADA_8K_CPUFREQ
Message-ID: <202408061851.m9EtebUF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git cpufreq-compile-test
head:   51646201e21cdf40aad3925f7742a8d2ac727f43
commit: 51646201e21cdf40aad3925f7742a8d2ac727f43 [6/6] cpufreq: Drop CONFIG_ARM and CONFIG_ARM64 dependency on Arm drivers
config: sh-kismet-CONFIG_ARMADA_AP_CPU_CLK-CONFIG_ARM_ARMADA_8K_CPUFREQ-0-0 (https://download.01.org/0day-ci/archive/20240806/202408061851.m9EtebUF-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240806/202408061851.m9EtebUF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408061851.m9EtebUF-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ARMADA_AP_CPU_CLK when selected by ARM_ARMADA_8K_CPUFREQ
   WARNING: unmet direct dependencies detected for ARMADA_AP_CPU_CLK
     Depends on [n]: COMMON_CLK [=n]
     Selected by [y]:
     - ARM_ARMADA_8K_CPUFREQ [=y] && CPU_FREQ [=y] && (ARCH_MVEBU || COMPILE_TEST [=y]) && CPUFREQ_DT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
