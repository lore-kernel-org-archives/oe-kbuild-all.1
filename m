Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B5F1CF9B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Apr 2024 22:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713823965; cv=none; b=XRnlUAcd3U5Dbyc5O8BFk5QfaYebVNYTcyCvl3SfE0MHlYb1HWc64bHK6jEXWr+NMw8wtx8sAcQknbm9JhlRdJFzT02C5rGzRFfEIsulXQWmFkCwSxWVBYNbhhqqmeFMiZVLN/W91HkvCCFGyot8pRT32kLvyVjBV7NST8ZZzwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713823965; c=relaxed/simple;
	bh=YaSXlAJzB7d9p1o8GCaIwBHP+CcbyZKsJDcFxAX9nH0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IXj8RH78SWJ/kVdbJYRW4bkq5cWfqY+DiJSO84OOP0c5S4L1yFbUjy571JZhwEQcjdYjp2SCsZQ7rF/wbv/F8NbmbsujdxcKT6ZTIRhDURZlKz3MrnQ1LxicxcSF2bjHu0u1tggEOspBrYNzvAw1VgV4pcs4Xskk7GN8+m0D0Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TC8J9pfR; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TC8J9pfR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713823964; x=1745359964;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YaSXlAJzB7d9p1o8GCaIwBHP+CcbyZKsJDcFxAX9nH0=;
  b=TC8J9pfR1lLMjFZDS7zcHg0m6cTKboy54Ar4q6jCKP3fZmetw53GqM+z
   bwlcV13MBua/P2JzbQGGligUfA8qGl2LK9iXJd7eYm4nl2pGadiJGPyG4
   5HX1wctWM3ugruIwRfwT/F88jaE7t/2QQSxSFtFnM0573x65FHlmrkI8v
   SAgLhFx9/mumb75oxo5nMt0vJojwhgDmXSZ9O7DVPzWRuxgXaOGuTYZgQ
   Kb3nXwhMBSs3w91TES0JEnj1wDfZCMI0DWKX3xzgdLYYAy1kqlqsZx68F
   gvZK1bptMWl0KVxIxR6DKums7Rp2k4NYxlQTVctympbns87zey6j+lXdC
   A==;
X-CSE-ConnectionGUID: IZp4dUV3QRqZNdNkyIVkWg==
X-CSE-MsgGUID: 98li/LyrQYeOLoMvyc5Xdw==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9603762"
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; 
   d="scan'208";a="9603762"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 15:12:43 -0700
X-CSE-ConnectionGUID: RYTodjInQfSO97QvQBRXdw==
X-CSE-MsgGUID: hZ2WXpbrRWmezCPZDPVUOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; 
   d="scan'208";a="24208094"
Received: from lkp-server01.sh.intel.com (HELO 01437695816f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 22 Apr 2024 15:12:42 -0700
Received: from kbuild by 01437695816f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rz1tw-0000HP-1A;
	Mon, 22 Apr 2024 22:12:40 +0000
Date: Tue, 23 Apr 2024 06:12:17 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wupeng Ma <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 28936/30000] fs/proc/base.c:1454:6: warning: no
 previous prototype for 'pbha_bit0_hide_file'
Message-ID: <202404230626.ETmTJeuy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   b05f2de3edcf4fc1b98ced476a06a62b961d3cce
commit: bea38841945a52bd03004240eb0da6a5115bae21 [28936/30000] arm64: mm: Hide pbha_bit0 in procfs if pbha is not enabled
config: arm64-randconfig-002-20240423 (https://download.01.org/0day-ci/archive/20240423/202404230626.ETmTJeuy-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240423/202404230626.ETmTJeuy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404230626.ETmTJeuy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/proc/base.c:1454:6: warning: no previous prototype for 'pbha_bit0_hide_file' [-Wmissing-prototypes]
    1454 | bool pbha_bit0_hide_file(const char *name)
         |      ^~~~~~~~~~~~~~~~~~~


vim +/pbha_bit0_hide_file +1454 fs/proc/base.c

  1453	
> 1454	bool pbha_bit0_hide_file(const char *name)
  1455	{
  1456		if (!system_support_pbha_bit0() && !strncmp("pbha_bit0", name, 9))
  1457			return true;
  1458	
  1459		return false;
  1460	}
  1461	#else
  1462	static bool pbha_bit0_hide_file(const char *name) { return false; }
  1463	#endif
  1464	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
