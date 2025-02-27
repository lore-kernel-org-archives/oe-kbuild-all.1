Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C999C1DE2A8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Feb 2025 17:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740677212; cv=none; b=dqEh9D5IuZuU432v4WM7I+Nf9HeJ+fLJ0H1SrNlH5fI+V1+tEHf+JCLBRhl22q0f0jehF25vlqFDknx5UaTkdNGAcCpZ/rPIcU6cZh6LSJbU9gFWC4nHh8M/EVe5HV6hQAyQ2Gzxu7JsmjM7Dk+DjVnhskhp3cAXSSwYm86PvYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740677212; c=relaxed/simple;
	bh=+g6f8G/eIm8TVV4HztdR5LarPb3/sC+REZIb3QBprvY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mbszDNDqKm4YmkyNi21WImMr6zyOZ/kq4lP6TDzHBGVijk6G5PI2qCVDwPJwyHx8YlqJPsMX2e7YdLZ6y5CywP0tPFRqOLNv1SsUOPjqtqxY/urxkaiPwc5n+/QQwIUmmYemFJT46GKeJnauqQqHnQZB2NLCPWV5oy/9+r46s7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LgSgPkXJ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LgSgPkXJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740677211; x=1772213211;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+g6f8G/eIm8TVV4HztdR5LarPb3/sC+REZIb3QBprvY=;
  b=LgSgPkXJVH5oQY6PAv7CHV04Czo5EBUxDEK4zKZew1qXtxxEmMk7qknp
   msPMlFBM6lE+4H2PH1umeUKKRoNU5VlovDpIH7D5q4RzBt9C5TToOYviq
   GncpHVtuYMT8tmCgRxh/iLBl3MoMRJ93LqTFOWaEwEQPFgUGOjdSPjfWk
   /FyqFnp8OaTY8ZSLPT5PL+7S3r+noldrmwwHp2PamiTB1sMcQ90tiZFM5
   RTndUc2MbSwvNeIyYXleI6SOtoF0APc3Dkc2VrAGVbdw1YfBzN+XuxE6N
   eUaUXYnwaa0w0nK0xWpPpN5a2QJiGTS4SSYhVTmQlQnnYt99cy6BdG1fl
   A==;
X-CSE-ConnectionGUID: 9b27QNqXQ+qxRTapoSuzhQ==
X-CSE-MsgGUID: w+ofyhl6SDeCiqkF59OJng==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="52992719"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="52992719"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 09:26:48 -0800
X-CSE-ConnectionGUID: pCyyHseLRCaLYeblhUr6zA==
X-CSE-MsgGUID: Q/7Xivl4TEWJCeNuwkJadw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="116850154"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 27 Feb 2025 09:26:46 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnhel-000Dlu-2U;
	Thu, 27 Feb 2025 17:26:43 +0000
Date: Fri, 28 Feb 2025 01:25:57 +0800
From: kernel test robot <lkp@intel.com>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, Sudeep Holla <sudeep.holla@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linux-next:master 6486/6931]
 arch/arm64/boot/dts/arm/morello-sdp.dtb: /pmu: failed to match any schema
 with compatible: ['arm,rainier-pmu']
Message-ID: <202502280141.zjKqcKEd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   be5c7bbb3a64baf884481a1ba0c2f8fb2f93f7c3
commit: c5e22e99383a9a26cdf42355f68ff3a0ff639a6a [6486/6931] arm64: dts: morello: Add support for soc dts
config: arm64-randconfig-051-20250227 (https://download.01.org/0day-ci/archive/20250228/202502280141.zjKqcKEd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502280141.zjKqcKEd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502280141.zjKqcKEd-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/arm/morello.dtsi:227.38-272.5: Warning (simple_bus_reg): /soc/interrupt-controller@2c010000: simple-bus unit address format error, expected "30000000"
   arch/arm64/boot/dts/arm/morello.dtsi:296.23-313.5: Warning (simple_bus_reg): /soc/sram@45200000: simple-bus unit address format error, expected "6000000"
>> arch/arm64/boot/dts/arm/morello-sdp.dtb: /pmu: failed to match any schema with compatible: ['arm,rainier-pmu']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
