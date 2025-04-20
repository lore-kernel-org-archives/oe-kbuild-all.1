Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54E5CA4B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Apr 2025 04:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745123763; cv=none; b=Hfo7fE2tIKdPBpcBNzL9Qn4tjXzTSgnI2FKE1kRZSBynqzZCBu/o9hMe3UPIGwXUwq96Ll7HR05zcnii7vT6WPjagZkeSigzUWnXnI9998A7+Rz1zMvXH9EWAek07/nyqyUYqK4yOzeMvJ5mCkkxep3B/0sKPkFaPs5DkH+SPis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745123763; c=relaxed/simple;
	bh=MaYjd45/4xUgyvfDXhecZWMZb0U5R7LDDrgLMDUW5RY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YtchTTfYbBXwrMNMB12fQg1uCetKmHpjfdFjZY5MpNKLF3nRlKoma1SizvUbantC23RsIhyTABPUo6vkdLftpHG/STBIzHii5PGcMVFUBdPwsdkYUyGyfroBoETkkVDgtox9KN544S3zW7fxm5/nPuS8PYHHlQWzpxIkjbXpo0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ewoaYTzb; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ewoaYTzb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745123761; x=1776659761;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MaYjd45/4xUgyvfDXhecZWMZb0U5R7LDDrgLMDUW5RY=;
  b=ewoaYTzbB2LYPIEzgX66vd6tmBE4A2TxH3DJpQZWIcQ9x1phhRqJNNmt
   SnsApgfWeyx4Li0JBD65/it6wZqoLwqs4L5kQncsvn9n7Iui96dCoXTCQ
   ocCCdLWAjUJ/RWL1ZZDa7IzZGQFemfaZBVgdThX/5OoF/ousgW7b+lQev
   gr8G5+ynJ3/78oL1Pl01VEgx+j6qaOBgTLD5+Edf7eDpXUVvAnYC7kkyd
   DUjVV73S6xNUzLIdRQ/Pc5vTqcNoAmuYJAahD7uK+uhQ7XwxjOrAjqcEq
   6/skXYUPLFPLiVEhw0PUvFbQAg0oJw6hWHY8mrJaIapFwHi9sd2KMc25r
   Q==;
X-CSE-ConnectionGUID: V5Mb3qUwSAeTb8KMDonPgQ==
X-CSE-MsgGUID: qhlxqCpSSda6SqPIbcYXtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11408"; a="57683292"
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="57683292"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 21:36:00 -0700
X-CSE-ConnectionGUID: 3vH8NI0gTjG4C0HhU80s4w==
X-CSE-MsgGUID: nLRoKcyfSKuP5ZWFAGOzRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="131181378"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 19 Apr 2025 21:35:59 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6MPN-0004QT-02;
	Sun, 20 Apr 2025 04:35:57 +0000
Date: Sun, 20 Apr 2025 12:35:26 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:intel-lkp 10/33]
 arch/x86/hyperv/ivm.c:113:9: error: call to undeclared function
 'native_rdmsrq'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202504201203.qe2AV3Ac-lkp@intel.com>
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
commit: d6194f8ae4246888ed7cafd9e11414724eb20c04 [10/33] x86/msr: Convert __rdmsr() uses to native_rdmsrq() uses
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250420/202504201203.qe2AV3Ac-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250420/202504201203.qe2AV3Ac-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504201203.qe2AV3Ac-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/hyperv/ivm.c:18:
   arch/x86/include/asm/mshyperv.h:307:9: error: call to undeclared function 'native_rdmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     307 |         return native_rdmsrq(reg);
         |                ^
>> arch/x86/hyperv/ivm.c:113:9: error: call to undeclared function 'native_rdmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     113 |         return native_rdmsrq(MSR_AMD64_SEV_ES_GHCB);
         |                ^
   arch/x86/hyperv/ivm.c:118:2: error: call to undeclared function 'native_wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     118 |         native_wrmsrq(MSR_AMD64_SEV_ES_GHCB, val);
         |         ^
   arch/x86/hyperv/ivm.c:321:15: error: call to undeclared function 'native_read_msr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     321 |         vmsa->efer = native_read_msr(MSR_EFER);
         |                      ^
   4 errors generated.


vim +/native_rdmsrq +113 arch/x86/hyperv/ivm.c

   110	
   111	static inline u64 rd_ghcb_msr(void)
   112	{
 > 113		return native_rdmsrq(MSR_AMD64_SEV_ES_GHCB);
   114	}
   115	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
