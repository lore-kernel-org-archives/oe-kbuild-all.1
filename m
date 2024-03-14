Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E2F5D47F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Mar 2024 08:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710403947; cv=none; b=A+HoMmmTgVkHQfCsQTZVTIq4KdEylWY8SaBHj6MN1qQ4I0gdSdukRniO9A00Irbv/FkWGKln/++ELJrFodKc8r7FYlHOQzNaCN799+x9APHby+LdBCPRYZPYwiIqsOC1xbykgr/f+RggvfoZhw5KynufVWujk21odlIIVOCmg7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710403947; c=relaxed/simple;
	bh=OkfeXLnSKNZtPbv8iO4OGX+dt89BByVggPKZlKrkFW8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F14dRHMYbaqzpknzNsbTZ03ExXnuec/Nt1C2w353r2serycPqQmXOANfYTmLW2tP48y1WjwIX/4HKkRXZo2mjdEGu19OF/+J31B9WqH+Q79stOz2FCKmYoaiWQLPCNvcuu5lksIsskeI5pC+7Ed3dnBlv+MLFj6/zOEkizicNYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PyHWjGj5; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PyHWjGj5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710403946; x=1741939946;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OkfeXLnSKNZtPbv8iO4OGX+dt89BByVggPKZlKrkFW8=;
  b=PyHWjGj5pWO0dGQliZWldBXt+Y13xIfODKWsKLae2/hz7SuCNEd/udzb
   9T40RE2kYd4oHwSjtMNUXg5PQjToBkHvB4oJ4Z07jjvzmwLlJzGTccWPI
   tQOITrmmpwlyWX8iUI9P0Rxs2+t3hANUkwiYbGm5DyZcs0yBk9Ey1Sda0
   QkkODCWhM9V2gGryeE3PCy1rx4S+qaeuAGC0lqQiAUKe1pMsuT5AYE/q7
   WQO5FON0nfTRtsHM+PYHr+n+r+Mn0BXbQeTTnKZwStefLowqB5j16mO5n
   2Z2vfs3aTMmDBRBCEO+Vh8kHKT9aLHbsffKzhqZKBB9mI2TCC9sBXyrZL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5402871"
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="5402871"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 01:12:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="16805202"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Mar 2024 01:12:21 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkgCJ-000DEP-0Z;
	Thu, 14 Mar 2024 08:12:19 +0000
Date: Thu, 14 Mar 2024 16:11:39 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 14902/30000] vmscan.c:undefined reference to
 `kernel_swap_enabled'
Message-ID: <202403141618.ndy1WEyB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   9e82708a746dc5d4ec8995a3e6edace2cf23c6fd
commit: 79c68ab3280fab8ace1b10bf8eadce508ee89c3c [14902/30000] etmem: add original kernel swap enabled options
config: x86_64-buildonly-randconfig-004-20240314 (https://download.01.org/0day-ci/archive/20240314/202403141618.ndy1WEyB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240314/202403141618.ndy1WEyB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403141618.ndy1WEyB-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   ld: mm/vmscan.o: in function `balance_pgdat':
>> vmscan.c:(.text+0xc5bf): undefined reference to `kernel_swap_enabled'
   ld: mm/vmscan.o: in function `try_to_free_pages':
>> (.text+0xda7f): undefined reference to `kernel_swap_enabled'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
