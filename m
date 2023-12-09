Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37CE15AB
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Dec 2023 08:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TVY3N0HZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702110046; x=1733646046;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5UVbFlnGGlrj2JxfBTKFh9kLDthQwHCRo3+HvkXWkRQ=;
  b=TVY3N0HZJjh9Vi7tLxE3pWCq2NmMibYlUX/WEsnvXKoZB6cml8xxqKPk
   9fZ87wW+mzf8vXzvk0LiKXYLxGTU2XRyhf94gB95NkMhWfE4EPbnNFSwY
   I/2JbxgIeDTdJi1d7xfq0os7NFXamf8VE64ofP9pBriH62oPtQjbY3Pr6
   jb61gAJF8EBCQhX/kR3WWPSxte5CSb2DoFToNhVPFdUd7YKPE7nB7EIFk
   dDh2lF7HOSxwcRpxYxFjhI4AHX97IRbdsk7cUXI7UWrNJ72+q9/2blAb4
   x7lDSmP4w7vD6Pqym/VmFzNW+NPd1r72RAWbsDHHyYTCqkrn4iaaAXCIk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="7826708"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="7826708"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2023 00:20:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="890423456"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="890423456"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 09 Dec 2023 00:20:44 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBsZm-000F4L-14;
	Sat, 09 Dec 2023 08:20:42 +0000
Date: Sat, 9 Dec 2023 16:19:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-arcvm 19/42] htmldocs:
 Documentation/virt/kvm/arm/uclamp.rst:4: WARNING: Title underline too short.
Message-ID: <202312091645.N9UQmu6d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15-arcvm
head:   b26894471e7a8f8d1dc4c3c233e3e606540bbdd3
commit: dbdee8ee2eb516fa48418bc952200d3999fb7651 [19/42] CHROMIUM: KVM: arm64: Add support for the KVM uclamp service
reproduce: (https://download.01.org/0day-ci/archive/20231209/202312091645.N9UQmu6d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312091645.N9UQmu6d-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/virt/kvm/arm/uclamp.rst:4: WARNING: Title underline too short.
>> Documentation/virt/kvm/arm/uclamp.rst:22: WARNING: Malformed table.

vim +4 Documentation/virt/kvm/arm/uclamp.rst

     2	
     3	Uclamp_sync support for arm64
   > 4	============================
     5	
     6	Uclamp_sync is used for utilization uclamp value sync between host and
     7	guests. This transfers the uclamp_min and uclamp_max values of the
     8	tasks running in the guest to the host vCPU using a KVM-specific
     9	hypercall.
    10	
    11	* ARM_SMCCC_HYP_KVM_UCLAMP_FUNC_ID: 0x86000040
    12	
    13	This hypercall using the SMC32/HVC32 calling convention:
    14	
    15	ARM_SMCCC_HYP_KVM_UCLAMP_FUNC_ID
    16	    ==============    =========   ============================
    17	    Function ID:      (uint32)    0x86000040
    18	    Arguments:        (uint32)    uclamp min value(0-1024)
    19	                      (uint32)    uclamp max value(0-1024)
    20	    Return values:    (int32)     NOT_SUPPORTED(-1) on error.
    21	    Endianness:                   Must be the same endianness
  > 22	                                  to the host.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
