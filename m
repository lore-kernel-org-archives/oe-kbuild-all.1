Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD22283FCE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Sep 2026 03:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789530657; cv=none; b=cZdNMKuehH2aygV03g7RPsrw5V7zI+HTcA5Nw5jjm9GbqeHJXsVatmj3nT1+yJn1FgQQJhvX3K40yus3CaDEMjaAjqbsYZaBwuNcE2SKFmAR+yXJZ56KAAE21l7Ms8hF7SEz7EmJo+0gfG7dh949OdkyLVxxtfByTyglMGjxvoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789530657; c=relaxed/simple;
	bh=UzUqODc03DmGzUXSI/B50i7Ueg9na1aIawPyCO/aAHg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OXSphvWX18Q5gJNj6z3r1OY1cffRFsrNp2fp0MMcJBBGcRlrqfbH/5/JRAy22EeVEZpkU7RKnJ0gX0s9fauF2DI6vMMSPRXXXmngv/H384GIgqp7MqMvwhsnggDysC5Cq7bu+OuWhWK1wTTqHXNntrdJ46pg6fxUSjhfs0da43Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QONYQsAv; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QONYQsAv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789530654; x=1821066654;
  h=date:from:to:cc:subject:message-id;
  bh=UzUqODc03DmGzUXSI/B50i7Ueg9na1aIawPyCO/aAHg=;
  b=QONYQsAvNV2YMrQczf4rZr6vVREsyxenPPjPi+vpccLPDDCI9G8K40Z4
   vBUJcxdAgIuJgxFnWgOFW9GtyK2fkFr114Nk7avshVse8SfeyuZiv9j1I
   pXIpS/xb3Bflu+GsEw9ne/Sz+z9Sa/xHAwLRws2x/VdS45NB2ZqXrNnzS
   uFLxhfpcyH5sC+Qp08dI6IiVX9kUySsB5h0tctghoLB+Y6oYeTcEkMP0a
   skj/VqMVM/DJm8ON5MnJfDWO7DqHak4sZcVIEQrSBfdZP25Xgg7FkkdoZ
   wZZGhXw0PYx0awNhV1rPPOjPyUzAauTWfH6GjAla2P/azfgKU5RdjEET1
   A==;
X-CSE-ConnectionGUID: CU87S+m5Qy+zuZauWI9zZA==
X-CSE-MsgGUID: am/iBoE9Si253WAXOiZ3tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89925965"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89925965"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 20:50:54 -0700
X-CSE-ConnectionGUID: b4OigsEZSrqR6oKto7vZ5g==
X-CSE-MsgGUID: FAHpfk6VTeagY0MDpwqUQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="273755147"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 15 Sep 2026 20:50:52 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6gfa-000000005Tl-1vVi;
	Wed, 16 Sep 2026 03:50:50 +0000
Date: Wed, 16 Sep 2026 11:50:06 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-tdx-efistub 2/3]
 drivers/firmware/efi/libstub/x86-stub.c:1106:20: error: implicit declaration
 of function 'early_is_sevsnp_guest'; did you mean 'early_is_tdx_guest'?
Message-ID: <202609161102.oczLY1b6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-tdx-efistub
head:   dbd995955d7cd3afb151e05449c3571295cdef92
commit: f9d03e512d573e1b021b2b8c38d2490b87eaf9e1 [2/3] x86/boot: Move unaccepted memory handling out of the decompressor
config: x86_64-buildonly-randconfig-005-20260916 (https://download.01.org/0day-ci/archive/20260916/202609161102.oczLY1b6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260916/202609161102.oczLY1b6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609161102.oczLY1b6-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/firmware/efi/libstub/x86-stub.c: In function 'arch_accept_memory':
>> drivers/firmware/efi/libstub/x86-stub.c:1106:20: error: implicit declaration of function 'early_is_sevsnp_guest'; did you mean 'early_is_tdx_guest'? [-Wimplicit-function-declaration]
    1106 |         } else if (early_is_sevsnp_guest()) {
         |                    ^~~~~~~~~~~~~~~~~~~~~
         |                    early_is_tdx_guest


vim +1106 drivers/firmware/efi/libstub/x86-stub.c

  1100	
  1101	void arch_accept_memory(phys_addr_t start, phys_addr_t end)
  1102	{
  1103		if (early_is_tdx_guest()) {
  1104			if (!tdx_accept_memory(start, end))
  1105				tdx_panic("Failed to accept memory");
> 1106		} else if (early_is_sevsnp_guest()) {

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
