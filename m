Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC17B29A5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jan 2024 04:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706157327; cv=none; b=cGJiuC0Fqjijfq7OXRPnMemVVT5OQQ8uYUbhB5JANb27R+ffmsDMkFqRVK6mO+s2sNu/nt7RBhVxIjvsWSqzZ/SLZ2DjXAvFzUV8W7u7V016+grwNudGN5U2sZm7oyD1eINJiHiElcDy3lYHSke9zXg/IOHj3vz6LfwSD/BIlyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706157327; c=relaxed/simple;
	bh=k7JkMjuzXUlc3ai3oBQl+cgGQfTNIuiyAC5++JvZpR0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d8tnM31oTxvDf3mHczB3yg8H4F54Pkj3VMNzoC0s/giJI+0pKPTrgWNmDMon34A+StJFyOZjOIng6G3DgCByIsN46a8+48RHd9FFIHhA4V9LtGKAyrDEafUB/j9GDp0URlR7guDGWN4NEed5cHZU4v4fObWQmHAT/O/o7xUQXYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PHL1eXyN; arc=none smtp.client-ip=192.55.52.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PHL1eXyN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706157325; x=1737693325;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k7JkMjuzXUlc3ai3oBQl+cgGQfTNIuiyAC5++JvZpR0=;
  b=PHL1eXyNB22mq+mqxcNepgDlRGrzysRhkpc8b6/gZ3X85JcFqozl/iid
   skHfJxiQ6qsI5pFEeFTgPg/elHmKlgVC/T0NA+8Gdu003KLeROeteq3bt
   Zn4+9BpYWOIosLIPgQHNewBg5QS5DIOe9B0Dx03c6e3EdBUU+UReinXem
   AIM0ive+6rLpAXNTjiUb+ThO0wVgteCs+smONqIqXLGcqPs/l8ze6P407
   MPDdnzV8vjcfiQdBGLniGF3qoDczvPVzk+54gbdpcThjo8iduzbJTh7ir
   ZZHGpxAGYiDo07VOkKTZoiJ/tFGQVyKzrKgoEqIFwJUqp9bLlmvixoH/Q
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="399215358"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="399215358"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 20:35:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2104178"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 24 Jan 2024 20:35:24 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSrST-0008fF-0j;
	Thu, 25 Jan 2024 04:35:21 +0000
Date: Thu, 25 Jan 2024 12:34:32 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:for-kernelci 4/4] arch/x86/events/intel/core.o: warning:
 objtool: intel_pmu_enable_event+0x3a: can't find switch jump table
Message-ID: <202401251217.jxhVS0IJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git for-kernelci
head:   1e140a96e8ce220d86926c91c3985f13ac88d816
commit: 1e140a96e8ce220d86926c91c3985f13ac88d816 [4/4] x86: Build the core kernel with position independent codegen
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240125/202401251217.jxhVS0IJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240125/202401251217.jxhVS0IJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401251217.jxhVS0IJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/events/intel/core.o: warning: objtool: intel_pmu_enable_event+0x3a: can't find switch jump table
--
>> arch/x86/events/intel/ds.o: warning: objtool: intel_ds_init+0xb7: can't find switch jump table
--
>> arch/x86/events/intel/lbr.o: warning: objtool: intel_pmu_lbr_init+0x24: can't find switch jump table
--
>> arch/x86/mm/pat/memtype.o: warning: objtool: init_cache_modes+0x63: can't find switch jump table
--
>> arch/x86/mm/pat/memtype_interval.o: warning: objtool: memtype_check_insert+0xc9: can't find switch jump table
--
>> drivers/tty/vt/keyboard.o: warning: objtool: k_pad.part.0+0x40: can't find switch jump table
--
>> drivers/tty/vt/vt.o: warning: objtool: csi_m.constprop.0+0x28: can't find switch jump table
--
>> drivers/firmware/dmi_scan.o: warning: objtool: dmi_decode+0x23: can't find switch jump table
--
>> kernel/sched/build_utility.o: warning: objtool: __x64_sys_membarrier+0x3c: can't find switch jump table
--
>> kernel/printk/printk.o: warning: objtool: do_syslog+0x82: stack state mismatch: cfa1=4+56 cfa2=4+184
--
>> kernel/time/ntp.o: warning: objtool: second_overflow+0x1d: can't find switch jump table
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
