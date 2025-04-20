Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790AB153836
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Apr 2025 05:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745126286; cv=none; b=d0lNKzEMLJNKI6JKNtNa6YDJ9r0FQPSipU4BYUKJqcSQt3yjIQFNyN8+KfMK2mkLJLTs20JHdxzvye9FAh7WJsj+FxJiL8J2swuMiDud6Dly/lfTGbCFAV+j0XGoalE2I8M/33U3h4XXVFlhQhvb2DhHLRhawCUdfCQAAzQRpVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745126286; c=relaxed/simple;
	bh=DRbbp+ACEwmLC17K65EcfcjpWOUWGcVzmMPYIh/bd38=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HubKScK/B0OSYncdvyQcAP5CBivOM9hFHamz+lijDygjuxTYy1rKKKGfvCaKba6u/tNmT0RaApSieaMbCWK4u73/oy9kO4bahnaflJei2mn63OFx9wCV6mrLG8lwOZcmdQGAlLkZuEy6EpuTmqH1JIVmFFnxiH2dENgrbogKHXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cLCKaopi; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cLCKaopi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745126285; x=1776662285;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DRbbp+ACEwmLC17K65EcfcjpWOUWGcVzmMPYIh/bd38=;
  b=cLCKaopiygo1Pc7ccsFLclyywhMHwNbRDMZbIn7/6SZuEEA/j6MOL6JD
   K/bTU/raCmQmygCoaM8HNeCoh3VCb1XUkso6V3EFO+prowK94KAfPK1HB
   LKl8JEqGz7BPTrke/jU+VIoWzNBw0cd8k91H1wK84n3QBN+oH31FBkVSE
   cQ9qft3cLOMydTPwsJVXMWwGb4hS9Lackh7lJ1w1CApHmM9bPPeEodfRM
   El1TYIvJ2xPVYBj3Gfiw4O212QRyuCRGy2d4kj3KUby2f+qkfTmytwONL
   iGkZ8C1ybL0PAWOzijnXx7UKJPBCJvFIckpk1CqyN3vcMu2QWzFaeCn5f
   g==;
X-CSE-ConnectionGUID: t9B76Z5ZSJmLvUqwI5cAOg==
X-CSE-MsgGUID: GC+LOsvfTbGCwVR1eavbzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11408"; a="46402435"
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="46402435"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 22:18:04 -0700
X-CSE-ConnectionGUID: EhiXlxw4Tf2Icgw4YMkFYQ==
X-CSE-MsgGUID: DWNl7nSCS1G8PaSd4H9bCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="131380616"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 19 Apr 2025 22:18:03 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6N44-0004RZ-0u;
	Sun, 20 Apr 2025 05:18:00 +0000
Date: Sun, 20 Apr 2025 13:17:28 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:intel-lkp 28/33]
 arch/x86/include/asm/mshyperv.h:307:16: error: implicit declaration of
 function 'native_rdmsrq_no_trace'
Message-ID: <202504201330.SI7KLORo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Xin,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/xinli-intel/linux-fred-public.git intel-lkp
head:   7847889af95a1a39c6e3e0ef6479df8b9505a17d
commit: 58bf67d4ea90dad258ed448cd35ac9c28890719b [28/33] x86/msr: Rename native_rdmsrq() to native_rdmsrq_no_trace()
config: x86_64-buildonly-randconfig-004-20250420 (https://download.01.org/0day-ci/archive/20250420/202504201330.SI7KLORo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250420/202504201330.SI7KLORo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504201330.SI7KLORo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/hyperv/ivm.c:18:
   arch/x86/include/asm/mshyperv.h: In function 'hv_raw_get_msr':
>> arch/x86/include/asm/mshyperv.h:307:16: error: implicit declaration of function 'native_rdmsrq_no_trace' [-Werror=implicit-function-declaration]
     307 |         return native_rdmsrq_no_trace(reg);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from arch/x86/hyperv/hv_apic.c:29:
   arch/x86/include/asm/mshyperv.h: In function 'hv_raw_get_msr':
>> arch/x86/include/asm/mshyperv.h:307:16: error: implicit declaration of function 'native_rdmsrq_no_trace' [-Werror=implicit-function-declaration]
     307 |         return native_rdmsrq_no_trace(reg);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/include/asm/fsgsbase.h:9,
                    from arch/x86/include/asm/elf.h:14,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from include/linux/static_call.h:135,
                    from arch/x86/include/asm/apic.h:6,
                    from arch/x86/hyperv/hv_apic.c:30:
   arch/x86/include/asm/msr.h: At top level:
>> arch/x86/include/asm/msr.h:251:28: error: conflicting types for 'native_rdmsrq_no_trace'; have 'u64(u32)' {aka 'long long unsigned int(unsigned int)'}
     251 | static __always_inline u64 native_rdmsrq_no_trace(u32 msr)
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/mshyperv.h:307:16: note: previous implicit declaration of 'native_rdmsrq_no_trace' with type 'int()'
     307 |         return native_rdmsrq_no_trace(reg);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/native_rdmsrq_no_trace +307 arch/x86/include/asm/mshyperv.h

   304	
   305	static __always_inline u64 hv_raw_get_msr(unsigned int reg)
   306	{
 > 307		return native_rdmsrq_no_trace(reg);
   308	}
   309	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
