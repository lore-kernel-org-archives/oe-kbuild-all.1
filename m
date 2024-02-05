Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70CF3236
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Feb 2024 08:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707121821; cv=none; b=GQS+RDeSK39MAS596jdtlCFMZvAZ4SGpTmXRnpKgSKDkFnA4L+mG6sMhcAqkhjLblneIDkEAgPPOo+nqVUlqgAFD1M8uoMKdMI8J/QzhuDMWukIAw2qoxexluuc1r+za7xnhZ9fL42LgGcXHHFlhcVWR09TDZWXfbfEOF1v/pzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707121821; c=relaxed/simple;
	bh=MgJWE6KJiWBl8M/WzcHk3Y75OVXdxTts1V2O6Em+PpE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h6V2jNBuYi0IF73GenAQOT4b3xDGkIcmgrYisxXmKvSy4KELZE6etGlmMscunbH1nWPUWwEMrkD8Kdn7jBP8ZzjIgoYX16fALzTVgX1CYQevL2PmSpYxAodDtV1CsxCo10aG7J2gl69PO23vOOKLpGcsexQks9OW2flrBqweGvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F3xfhTlr; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F3xfhTlr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707121820; x=1738657820;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MgJWE6KJiWBl8M/WzcHk3Y75OVXdxTts1V2O6Em+PpE=;
  b=F3xfhTlrxV/r8bHEBotTl8LGmQytaIXOhlsNwpptFLa2hWSDxGuPmVzS
   g/0fqAWFRUDIW3DXOkMYWnYTJOrfijB/fig8Grwzcnw89wO8w4M6sEecp
   O9RO2G0Fv95bwm8urhuFEKV9ZHi5l45Midb/Q4nrnLemfidHFvmHbNxhO
   bK5bzJdmkqbTA7mNFYAQELFhtkavvIq5OdKyPK0TxPoJ/TTF9ytIdfzUw
   hZCe+F4ZzefH67ZlCRqLFtnmSxpQrfB8hsyIH61AEyWBEhRiQaG0BoRXK
   uN8nBLBzYTqau5/+Ia890/PhthPqHe/0ewn3m4ydmSR94pmrS+F+yy3sC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="11567929"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="11567929"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 00:30:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="984347"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 Feb 2024 00:30:18 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWuMp-0000HG-20;
	Mon, 05 Feb 2024 08:30:15 +0000
Date: Mon, 5 Feb 2024 16:30:06 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yanhaitao <yanhaitao2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2375/2961] cgroup.c:undefined reference to
 `psi_stat_show'
Message-ID: <202402051603.9uV4sWaG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   413aaa5179daf233ab0cf4c22869ac607c838236
commit: 4a69b56540f40550585b9f93c35e415ac90bdecc [2375/2961] sched/psi: Introduce pressure.stat in psi
config: arm64-randconfig-002-20240205 (https://download.01.org/0day-ci/archive/20240205/202402051603.9uV4sWaG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240205/202402051603.9uV4sWaG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402051603.9uV4sWaG-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: arch/arm64/kernel/binfmt_elf32.o: in function `load_elf_interp':
   binfmt_elf32.c:(.text+0x1900): undefined reference to `arch_elf_adjust_prot'
   aarch64-linux-ld: arch/arm64/kernel/binfmt_elf32.o: in function `load_elf_binary':
   binfmt_elf32.c:(.text+0x3718): undefined reference to `arch_elf_adjust_prot'
   aarch64-linux-ld: kernel/cgroup/cgroup.o: in function `cgroup_psi_stat_show':
>> cgroup.c:(.text+0x42b8): undefined reference to `psi_stat_show'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
