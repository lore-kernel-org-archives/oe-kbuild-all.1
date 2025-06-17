Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BF815D1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jun 2025 04:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750133865; cv=none; b=kg1VOrfPg+D01e7VecurXXpva8/th3b9us2X4etJkIEYyulTgvds6VVbpDOZsflbNHwHuQX7TcY5kY5J5kvav161ZwMiEdWDdDrS+5d/Hb0Mtox/oygQklOCqbkZ7/P7rV4x9RWeGAQg7UByvXFp9hKlp7QFZGAZPirRS5AnKT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750133865; c=relaxed/simple;
	bh=4HdQDhx+bhI46QYdaeXDcaDe7EhypdQP0W9rDifnF7A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gy7n4uXlMPl1cU2ah/frp/U76QJ93V92j+nn1WedmmZF1mCMT5B0Vt/E0JPeRs2BBjjKRwcdIyLaaYq045mrGkTDPwNQ5B2QMHGHdEwQ3yQosR1EanXVOlvt+dZn+y/7pnFliLi5wzUIky8c027tvTyFKz+G5NIHd0ZY2bow5m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FU5rGwED; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FU5rGwED"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750133863; x=1781669863;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4HdQDhx+bhI46QYdaeXDcaDe7EhypdQP0W9rDifnF7A=;
  b=FU5rGwED5tiQ/ENSr/z+9wyc/Rnwzdt2k+2NjZHlHsSeUVBdn32a5FWW
   DJvAkYxTwfyyrZuJlY0zAPz+IrhD1acjQJNklrk2Yr7MLy1x8jz3sq6gr
   dez20820aLgAoIAh+AqhXmjs/Lr8sS7ryFr2CqROTdkZsLb+f/lUuZDJw
   /sTQNv8FZS1aFxnnPSzkTe8UfRkp3m/Fu/QVm7vK5K5R5vXvKs1SihkUo
   GW2xrE5jLtFQwE9fjx1MBz9JSBik9c0+SFniCIvhV0FvkLG0AI/wJLpih
   KK08/+3ccskjWbaEv0QZCHDksWkH5bpGv++NkBvymNFI/CkRCghnKvcD9
   Q==;
X-CSE-ConnectionGUID: fNn9Ec0ERtuBSAZ9PIXFCg==
X-CSE-MsgGUID: SARFRuOcRWWtDvhej6S3dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="77691237"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="77691237"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 21:17:42 -0700
X-CSE-ConnectionGUID: ZdO+9K7eSpeZkNbftvHmUw==
X-CSE-MsgGUID: GjmT5HzfThe5bI4ZF3j8qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="148495150"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Jun 2025 21:17:41 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRNlT-000FZM-1m;
	Tue, 17 Jun 2025 04:17:39 +0000
Date: Tue, 17 Jun 2025 12:17:28 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.16-rc1 17/83]
 drivers/platform/arm64/mpam/mpam_devices.c:183:9: error: implicit
 declaration of function '__acpi_get_mem_attribute'; did you mean
 'get_pcc_area_mem_attribute'?
Message-ID: <202506171250.rFY7j5cn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.16-rc1
head:   8872f14d9fa3dabda25ac1679ab2bf2a7520a07c
commit: 5f09d9e382ec0f941fbeee694fe5866445dc5dce [17/83] arm_mpam: Add probe/remove for mpam msc driver and kbuild boiler plate
config: arm64-randconfig-r121-20250617 (https://download.01.org/0day-ci/archive/20250617/202506171250.rFY7j5cn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250617/202506171250.rFY7j5cn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506171250.rFY7j5cn-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/platform/arm64/mpam/mpam_devices.c: In function 'get_pcc_area_mem_attribute':
>> drivers/platform/arm64/mpam/mpam_devices.c:183:9: error: implicit declaration of function '__acpi_get_mem_attribute'; did you mean 'get_pcc_area_mem_attribute'? [-Werror=implicit-function-declaration]
     return __acpi_get_mem_attribute(addr);
            ^~~~~~~~~~~~~~~~~~~~~~~~
            get_pcc_area_mem_attribute
>> drivers/platform/arm64/mpam/mpam_devices.c:183:9: error: incompatible types when returning type 'int' but 'pgprot_t' {aka 'struct <anonymous>'} was expected
     return __acpi_get_mem_attribute(addr);
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +183 drivers/platform/arm64/mpam/mpam_devices.c

   177	
   178	static pgprot_t get_pcc_area_mem_attribute(phys_addr_t addr)
   179	{
   180		if (acpi_disabled)
   181			return __pgprot(PROT_DEVICE_nGnRnE);
   182	
 > 183		return __acpi_get_mem_attribute(addr);
   184	}
   185	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
