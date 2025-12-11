Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84AA1F03EF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 18:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765477013; cv=none; b=bIc+TxHIIEnPRLGm7Ap1oLEM4+MOLu87uqQnbfv844/niiCyJ8dQctwPSlv+BbgnPFEbb66c6w4JffZRwxRzZQ+2B5wsuDCqoXwPOMn+G0JsmFatWYP85dMBOJW2Tl5aUtaqIxkRPftSpK0+GStgskz78c67ar5agwbw76JZYPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765477013; c=relaxed/simple;
	bh=gDr9JMCsuH+Ifvniu1efcK6UQybod99PxHC5gdsj59A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hi7qaFRLW0+K3enxB7JxDvIrzYUUs6EfeAhRYtDARYiCyzA6Ll6w+vncXIk/wWcEFghfwxrhTzdJyJ8y1Eb2aC2w/wsILYAvtu2tmZcj1XLU6xAhPOIBr9H3Z0bWWBknZ6mO6Nz/9Ga3Xq+XfZ3NgC4zsuQVBSdhQH/ZhI26+GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iB3xcGHr; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iB3xcGHr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765477012; x=1797013012;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gDr9JMCsuH+Ifvniu1efcK6UQybod99PxHC5gdsj59A=;
  b=iB3xcGHrg5zNgecAkhxlmIA7XwAluP9wPfui6jffhcurvsIvAEfWd+Gw
   12BmmC7E0HjeEiUc9avmaRpbwMoRtVSVvJy3TiVUKZTcIJJIb9sfGEMcj
   PAQyqjppt+dXYcOjwH8/TJLjNNzVasq0AKORwG2VXbNXGlS2QWY8VCyaT
   tUmQQ3LI7DqzMGQl5U3n2TXohdOIQ5abggNNIpGmx6c3Zc3XefrsOZ2Yv
   ephpKCd5pH1DxL96d0CVMVNCUZuwV7FTyj7AM7ZzTSDaaqruooKijtMBh
   8HNF1oCyxUQdVN0Pyfsz4GSbS/q8hzvqzoAkJNIQPT+WlBp37t33RRSs4
   w==;
X-CSE-ConnectionGUID: zh3cjJwTSa+/2RZD2G0Ifw==
X-CSE-MsgGUID: ytBPtLZUROy4oIAcKyo0CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="71333503"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="71333503"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 10:16:52 -0800
X-CSE-ConnectionGUID: SwuK8YPVRQaaRFWjaCzEZA==
X-CSE-MsgGUID: x34eFPSJQJGpaR1bzdqBhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="227508558"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 11 Dec 2025 10:16:51 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTlDc-000000001AK-0ojA;
	Thu, 11 Dec 2025 18:16:48 +0000
Date: Thu, 11 Dec 2025 19:16:30 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zeng Heng <zengheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3508/3508] drivers/acpi/pptt.c:411: warning:
 Function parameter or member 'acpi_cpu_id' not described in
 'acpi_pptt_get_cpus_from_container'
Message-ID: <202512111902.thfID0yT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   5930fa3740c518a9f6ba688fd0c1873d6f3adbce
commit: 45f065231c8fbabe4e1b4449425a0574287e2bbb [3508/3508] ACPI / PPTT: Add a helper to fill a cpumask from a processor container
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251211/202512111902.thfID0yT-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4125e73cdc6188cca4c1c72b72e2b2d85c157483)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111902.thfID0yT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111902.thfID0yT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/acpi/pptt.c:342: warning: Function parameter or member 'callback' not described in 'acpi_pptt_for_each_container'
   drivers/acpi/pptt.c:342: warning: Function parameter or member 'arg' not described in 'acpi_pptt_for_each_container'
>> drivers/acpi/pptt.c:411: warning: Function parameter or member 'acpi_cpu_id' not described in 'acpi_pptt_get_cpus_from_container'
>> drivers/acpi/pptt.c:411: warning: Function parameter or member 'cpus' not described in 'acpi_pptt_get_cpus_from_container'


vim +411 drivers/acpi/pptt.c

   400	
   401	/**
   402	 * acpi_pptt_get_cpus_from_container() - Populate a cpumask with all CPUs in a
   403	 * 					 processor containers
   404	 *
   405	 * Find the specified Processor Container, and fill cpus with all the cpus
   406	 * below it.
   407	 *
   408	 * Return: 0 for a complete walk, or an error if the mask is incomplete.
   409	 */
   410	int acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id, cpumask_t *cpus)
 > 411	{
   412		struct __cpus_from_container_arg params;
   413	
   414		params.acpi_cpu_id = acpi_cpu_id;
   415		params.cpus = cpus;
   416	
   417		cpumask_clear(cpus);
   418		return acpi_pptt_for_each_container(&__cpus_from_container, &params);
   419	}
   420	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
