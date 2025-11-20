Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8FB33A6F8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Nov 2025 13:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763644015; cv=none; b=bQaHpRGsW6flLWMDQ3REt0PbkE5GlFqAhmosE/YWf3X+OtsdpySOsLFbYm6W6gfmQs3mPnw00dGURMEuMyPHz1dSgAEHaaIdGX6xL1XVlsbbA4WLsBXjtqM3l8l6dDD8uIXGZeAG1lPhwOMyrw3JftrLieO1zmxDSarIhpT/KBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763644015; c=relaxed/simple;
	bh=uZGbNBiPSmdLI5gvJLGK5yLp8JMRuGV6mVsPMxWdj4o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HJHUUpCBf1vzFl4huK4dkT2hUdRJJhSArEtY2BIIX2NmhJ91wG8LKXCdhEHyj0GdbL2IIGQCDCb+AEanvKq4iQFG1tR9U5yE04XBo2CS4nd/Raow7O2QUboUUABI7xYDI4Ma0PUFyw67rrTntKE621bnDVClhTDPRJ4VqPqB3hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KuLtB5Q5; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KuLtB5Q5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763644014; x=1795180014;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uZGbNBiPSmdLI5gvJLGK5yLp8JMRuGV6mVsPMxWdj4o=;
  b=KuLtB5Q5kYV+tZz+NrJ1B9RRnXCXg4NGsuiCPTUtiIm0pOGaAk7YQBWu
   CLh7j2iNl1VItyLE3BFwYKVoPS/VHs+say/iJ1ozeFGYLP3S3XU8QYZ+G
   xUlLPcLEU/NLAcTi3ovdTh8h8iTaAW1bEh4nvn1NfLedRLwQF98KouEUb
   eYdtSrlWJiNP750czI4OjQUTJNXeLl7MGbcS6EJVYFYzODG+1hhMzdUOR
   76cC/cBSXaG8K8Ywb/5HknDVBlag7m3zO69RUb61E0wBn+AxPSrRWoQTy
   2PI1O880tm0DLeO/S2FhQdpjTic6OXX/LeI5sE3385bKIS3GHasiX0x2u
   A==;
X-CSE-ConnectionGUID: pf/qxufuQ6OwxDkQbChf9g==
X-CSE-MsgGUID: +WaFlYZHSIKDx8XyvIgwVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="69579604"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="69579604"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 05:06:53 -0800
X-CSE-ConnectionGUID: jRzl3juBRyeAlu0Qem7v8w==
X-CSE-MsgGUID: ybSU94udQ/G27Nm+Z/0oWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="222009170"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 20 Nov 2025 05:06:52 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vM4N6-000000001Rb-3R1N;
	Thu, 20 Nov 2025 13:06:48 +0000
Date: Thu, 20 Nov 2025 14:06:33 +0100
From: kernel test robot <lkp@intel.com>
To: Drew Fustini <fustini@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Adrien Ricciardi <aricciardi@baylibre.com>
Subject: [fustini:b4/ssqosid-cbqri 20/24] include/linux/riscv_qos.h:10:10:
 fatal error: asm/qos.h: No such file or directory
Message-ID: <202511201420.rkyispSJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git b4/ssqosid-cbqri
head:   f8bf739ad96594b69b3bf724e65ddf8c25a7d570
commit: 6ef95cee3c96622eb715a3f707edc237f0bbdf89 [20/24] DO_NOT_MERGE soc: build Foobar SoC drivers
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20251120/202511201420.rkyispSJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511201420.rkyispSJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511201420.rkyispSJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/soc/foobar/foobar_cbqri_cache.c:10:
>> include/linux/riscv_qos.h:10:10: fatal error: asm/qos.h: No such file or directory
      10 | #include <asm/qos.h>
         |          ^~~~~~~~~~~
   compilation terminated.


vim +10 include/linux/riscv_qos.h

323bf1bd959da7 Drew Fustini 2023-04-19   9  
323bf1bd959da7 Drew Fustini 2023-04-19 @10  #include <asm/qos.h>
323bf1bd959da7 Drew Fustini 2023-04-19  11  

:::::: The code at line 10 was first introduced by commit
:::::: 323bf1bd959da71b544db59810cec3a50afffe5b RISC-V: QoS: define properties of CBQRI controllers

:::::: TO: Drew Fustini <fustini@kernel.org>
:::::: CC: Drew Fustini <fustini@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
