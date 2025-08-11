Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B492D9EC4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Aug 2025 21:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754947507; cv=none; b=RiR7gbDCY2uW1Z2bOR9pqD2DK/eyultLYp6ErAZ17AaKiaxP/4KcXWjdlc1lwKPV1+wYd58vEQ686e6RoR3wUY8tVj93vItPds8uIOWi4cNt+wvWcIVrORCndcMH9pX/4HV+GiPOnAVxKRn7hmWDcEPVShfYNH4TQnV+tafP9W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754947507; c=relaxed/simple;
	bh=L8ywitEHphNWDTvVSK4fDwmwjTyeEZ9qPLMApeGpk0g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oYvgsu7fnSv89OWshAYpOclp214Sts/kAraGKETYLgDXAScmdaOq+OKYhoRym81KMz7nLdKxo4QLBhVH+b967Mfjg1ebHrYhf7ZaEFeMnzWIK7WUvyqorrOaUYdKXptphXrZLaMUqWBnV5VipxAaN3C7dgkTX4cPo8XfRhI1g70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z0CYe3YC; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z0CYe3YC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754947506; x=1786483506;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L8ywitEHphNWDTvVSK4fDwmwjTyeEZ9qPLMApeGpk0g=;
  b=Z0CYe3YCSo8vpQOoJfRAluFOiL4WrQaA3Wq/J4Z+/HN4F+Zy9gOlwSNL
   WkYtonbnPek5xD6htHGyGTFRx4DYu5GMgGHPpg5vNLCBqAY05lvQNbA/7
   cBeDi7HSMCrpltlWbLWmYhivPgRgyV9k7StIiUPoGmPbDCrWK5xemY4J4
   1sgO+kazy1ovL68uF6cqFGRmuZZvFEEgvmJyx+l7PLuky9naTPgdlabSH
   xLHNA4IvXaq8kXwjNtgMBrAbunfBU4Hf+fM00NcIJNr4+DcomwSPThyF/
   /erg94LUjg++3QHB35lg4ybRS85krNx4K4aY1hncKipCFzXY51bTD13KH
   A==;
X-CSE-ConnectionGUID: SUozUpWyTwiiG/PfZXPktA==
X-CSE-MsgGUID: HlflFIF7TdmhrJElIKu0+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="56420356"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="56420356"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 14:25:05 -0700
X-CSE-ConnectionGUID: mz6G3XhzRq6QwtV4crm5qA==
X-CSE-MsgGUID: r45n7qBpQsygbs+Ffpxv/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="203198166"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 11 Aug 2025 14:25:04 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ula0d-0006Ea-0J;
	Mon, 11 Aug 2025 21:24:55 +0000
Date: Tue, 12 Aug 2025 05:23:55 +0800
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>,
	Jesse Taube <jesse@rivosinc.com>
Subject: [avpatel:riscv_acpi_apei_v1 35/55] kismet: WARNING: unmet direct
 dependencies detected for HAVE_MIXED_BREAKPOINTS_REGS when selected by RISCV
Message-ID: <202508120533.rLMGb1Fl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_acpi_apei_v1
head:   eaca137f211dcb260f7eb52d983ddad7f27277f3
commit: df85c5a81bf62ede57ad6bdfa14482907dee11cf [35/55] riscv: Introduce support for hardware break/watchpoints
config: riscv-kismet-CONFIG_HAVE_MIXED_BREAKPOINTS_REGS-CONFIG_RISCV-0-0 (https://download.01.org/0day-ci/archive/20250812/202508120533.rLMGb1Fl-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250812/202508120533.rLMGb1Fl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508120533.rLMGb1Fl-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for HAVE_MIXED_BREAKPOINTS_REGS when selected by RISCV
   WARNING: unmet direct dependencies detected for HAVE_MIXED_BREAKPOINTS_REGS
     Depends on [n]: HAVE_HW_BREAKPOINT [=n]
     Selected by [y]:
     - RISCV [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
