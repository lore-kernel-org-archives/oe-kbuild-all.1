Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D090330328
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Sep 2026 07:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788937274; cv=none; b=FXMkki9F6qMSbYxvS8Ps6xMp9BvKqL5oioG5gIlH9Vd0BqFHoJYalQgXzOTFOSuAaW7E7RQC6XzBClkl2wdkw21uT5QQk4DdRa1GsL/j4d/pcf3TfP6Jkc8VqXFnd60t+TVxYxTIayYlw4CzweGSr/fHHh7XwuCbhA86pkWGqCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788937274; c=relaxed/simple;
	bh=c88k5uoZQRCn5NkrkLjkBqq3cwnNfmaQQRyqUjVhOGM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kbR2djCJSL1o4n0Q6YmJ78eJwSe9cQRlq6h+WXhw+tyb/ttOfEu063uKzzPqMaqZjypnkHU/8l1cFs5ZC8qiiuJLVmXvxZkmZn/pnFL1qmmp8+Yrir3Sk1n3i9fc5z209fZNiVCFmMmpTKjwkcuM1myUdax2AAwx7glxwV1xilg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ig4Yk1Uw; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ig4Yk1Uw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788937273; x=1820473273;
  h=date:from:to:cc:subject:message-id;
  bh=c88k5uoZQRCn5NkrkLjkBqq3cwnNfmaQQRyqUjVhOGM=;
  b=Ig4Yk1UwemhLp2vq5GJZAKVL71wTOUaO9PVv4+gbfaHrM9YJqfog2dkp
   LtdCqIinTovtBr8wVWksACxJST2YGSubGlgQ9K8ARGkUDiudSexV0ofMx
   GMWiPy1UJEXMuLxOwUbaY6Y2NfOf9iBiiuVfetONfQFijgJFbSJoHB0Rw
   9+BvtxemMX9mKTZL+nh+c+8GPTkfi28wvHZyuToBaLiz298aKAce6O0Sb
   2uYkw3OFNMmgqNHMSOQI6+51b6dZuy6BZ28h546EJ6Kag9ARq7S9b1Pnw
   JQLsgFS2AIyBvH296IghdcWQuGeXMI7PV8qIvZUx+Su+d7fBrPXOk+ccC
   A==;
X-CSE-ConnectionGUID: LDTBPP6/QTaBV8JUDpfqkA==
X-CSE-MsgGUID: thtCObJFQEWP585avBKHXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89392323"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="89392323"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 00:01:12 -0700
X-CSE-ConnectionGUID: eVyFvKVLRyucJrCKbWnGsg==
X-CSE-MsgGUID: bSsgAGgvQ3avizmn5iyMPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="296169152"
Received: from igk-lkp-server01.igk.intel.com (HELO cc074f2a4298) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 09 Sep 2026 00:01:04 -0700
Received: from kbuild by cc074f2a4298 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4CIn-000000001uX-47Nv;
	Wed, 09 Sep 2026 07:01:01 +0000
Date: Wed, 09 Sep 2026 09:00:07 +0200
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/firmware/efi/libstub/vsprintf.c:511:5: warning: no
 previous prototype for function 'efi_snprintf'
Message-ID: <202609090804.938npPl7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Ard-Biesheuvel/x86-boot-Drop-pointless-re-implementation-of-panic/20260906-150819
head:   c551ec0edb0b057c415d5530905c288523a9bde8
commit: c551ec0edb0b057c415d5530905c288523a9bde8 efi/libstub: Add efi_snprintf() to construct wide strings
date:   3 days ago
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20260909/202609090804.938npPl7-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260909/202609090804.938npPl7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609090804.938npPl7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/efi/libstub/vsprintf.c:274:5: warning: no previous prototype for function 'efi_vsnprintf' [-Wmissing-prototypes]
     274 | int efi_vsnprintf(efi_char16_t *buf, size_t size, const char *fmt, va_list ap,
         |     ^
   drivers/firmware/efi/libstub/vsprintf.c:274:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     274 | int efi_vsnprintf(efi_char16_t *buf, size_t size, const char *fmt, va_list ap,
         | ^
         | static 
>> drivers/firmware/efi/libstub/vsprintf.c:511:5: warning: no previous prototype for function 'efi_snprintf' [-Wmissing-prototypes]
     511 | int efi_snprintf(efi_char16_t *buf, size_t size, const char *fmt, ...)
         |     ^
   drivers/firmware/efi/libstub/vsprintf.c:511:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     511 | int efi_snprintf(efi_char16_t *buf, size_t size, const char *fmt, ...)
         | ^
         | static 
   2 warnings generated.


vim +/efi_snprintf +511 drivers/firmware/efi/libstub/vsprintf.c

   510	
 > 511	int efi_snprintf(efi_char16_t *buf, size_t size, const char *fmt, ...)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
