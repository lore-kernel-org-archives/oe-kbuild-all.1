Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CC672637
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Jul 2025 09:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751362299; cv=none; b=CWGi5Wwzcrwi34z+FbC5g+VTf1yXZXCo4e+Ao725QliTygqSTfkHLMDJjZk42Gz1sAIlkFmlcKxOZTMpLL7CqJv86q8xSGlMTV44IDUkuGX3IS4wzOwAhLkLSwl2zUVeBpmc15psodfQwYoBP/GlPOeHOB3WHxJCySX3A6WuBJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751362299; c=relaxed/simple;
	bh=7EGg2sDIun+1DGDD4CmSigpV4zLKBXCdT1zkBiqGfK4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F+VrnSr5l7xRXQ0BAKyjRfGgtmjUNfZY8RFXatOpANkf1mOQnl80n3HlbOPHyh0yWFHkZhsmQfShzn7MccVFRqqgyUvJmjAoq9bNwlsDqV7W1jOMxxS++msu2cmZ3Rxqkr73Vcw4hDERsziwG/DE+OyFLRk95GJjMKNrub7ymoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mI/3l0Em; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mI/3l0Em"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751362296; x=1782898296;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7EGg2sDIun+1DGDD4CmSigpV4zLKBXCdT1zkBiqGfK4=;
  b=mI/3l0EmvsMWWGQTs2R7HX3BHzTqJ7iMXkm+ZZEUZ7eHm6i8bHDOn5ar
   7A/wCS30ICbPKd+iKj/+AWeVbP5jl7h90GZeZjQoS+ItNowgkt+b0O91u
   sSWKlRpY2FLPBq/oTpqwA4o1txZvh8iQRUb6CIRaEohiHDSP+j9Vef4aQ
   C++XA8WOvbN0qMvFqZZPHPS/n/aGN2w5/1QIjxonUObX0jpumGYcIi+8Q
   9OQOolmFbfW01jgllyufjcsiBr9YXSkn08Vxzoc/tpuBvcRMjWgew3Cko
   HnIGIBZAVjP41ScyDpYrqiU5anKB6RfYaWdCYvAA2KFCAGlRA49ReCnpT
   w==;
X-CSE-ConnectionGUID: KlI2FA+oQROfLtXYEeTeJw==
X-CSE-MsgGUID: 10O0MuVISF24cj0sP88Zsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="64969875"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="64969875"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 02:31:35 -0700
X-CSE-ConnectionGUID: MiaeJAbIRemhuykc1nI7dQ==
X-CSE-MsgGUID: jOTk7a1MSwKFtSJe6ygePQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="153120234"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 01 Jul 2025 02:31:34 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWXKt-000Zx0-2v;
	Tue, 01 Jul 2025 09:31:31 +0000
Date: Tue, 1 Jul 2025 17:30:32 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 10/10]
 arch/x86/kernel/csv_command.c:433:5: warning: no previous prototype for
 'csv3_issue_request_rtmr'
Message-ID: <202507011754.OGepAsri-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   18341c6c5a0f59b0b6173b07bd070a1fece13cad
commit: 02cab5edebee4012cfe8caac6066af26add0699b [10/10] anolis: x86/csv: Introduce RTMR interfaces
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250701/202507011754.OGepAsri-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250701/202507011754.OGepAsri-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507011754.OGepAsri-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/csv_command.c:15:
   arch/x86/kernel/csv_command_common.c:34:13: warning: no previous prototype for 'csv_scan_secure_call_pages' [-Wmissing-prototypes]
      34 | void __init csv_scan_secure_call_pages(struct boot_params *boot_params)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/csv_command_common.c:81:13: warning: no previous prototype for 'csv_early_secure_call' [-Wmissing-prototypes]
      81 | void __init csv_early_secure_call(u64 base_address, u64 num_pages,
         |             ^~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/csv_command.c:387:5: warning: no previous prototype for 'csv3_issue_request_report' [-Wmissing-prototypes]
     387 | int csv3_issue_request_report(phys_addr_t paddr, size_t size)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/kernel/csv_command.c:433:5: warning: no previous prototype for 'csv3_issue_request_rtmr' [-Wmissing-prototypes]
     433 | int csv3_issue_request_rtmr(void *req_buffer, size_t buffer_size)
         |     ^~~~~~~~~~~~~~~~~~~~~~~


vim +/csv3_issue_request_rtmr +433 arch/x86/kernel/csv_command.c

   432	
 > 433	int csv3_issue_request_rtmr(void *req_buffer, size_t buffer_size)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
