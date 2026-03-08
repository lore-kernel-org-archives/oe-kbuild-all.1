Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD1C15624B
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Mar 2026 18:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772993456; cv=none; b=S3J5CtwNs0BvHElIF44UoUlUaUgzFYt4u1K+goTebonwwTyxEj5vwu5x/j5Swmsve4X/U24M1bBPCuOuyE4IfjegU5Te7cktoZVGORMBeFWtPXRNwa3QRiABVr9astlCaQapXLbZreD7CV6WSsN1sTiN+Z6W5LCUr/tNsECz/Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772993456; c=relaxed/simple;
	bh=KomURECzgGHeVZTprtFq8xStg+G1KhmRxlnhCsJiQAs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=j13FWDBgwbm6088RsthHr8n/J9GRr26V/dH1fp3s20YJBZIjS3AQMv4Px6O86x4aOzfif1gqJZW2/MS6A8JrBv3hz6kkTlGXeMxjt9tfqbjaFo742Eg4OfA85R2H4e2OMZAfQjWlFPRmoU8tbriWFBCnYlZ1oncsmEs0zfRbEaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VK58rKjj; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VK58rKjj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772993454; x=1804529454;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KomURECzgGHeVZTprtFq8xStg+G1KhmRxlnhCsJiQAs=;
  b=VK58rKjjOwQgsh+P9EwC8M+mFvkkHt5eoj3NbJ9ewhxb8q81aauhXxfe
   ZR3eHYAOO/s+eMDh53fOHQYRRSx2SghjPpKcIQkyETfDFCmGnrjQRgrFZ
   rpTIRO7/aWjwDzabVO0EJodTgfE+dqctg69JeWRXcD1M6Ek6mbWsRnkFC
   0T2nxWf/HB6XGpHigKiYc3cYRAJ13+oEyfWABJv+raZf/+2hmuDRSSnIO
   57CmFZoTY7jMF8am3m23EMr1GW4iaasDhxJW3BHgw5Tq2Bok5xhJfZXw9
   TzkPRRObQ7XvQbvMpKVOhC9JJpgt/c9ulh6yGUeJPXFUPmSvcxhQexEjq
   w==;
X-CSE-ConnectionGUID: lV2m4XfiQta5cyW2IyCsYw==
X-CSE-MsgGUID: bSAvlAazTwiLpZPHfJ/hnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="73930614"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="73930614"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 11:10:53 -0700
X-CSE-ConnectionGUID: JYmI5xtMTAyKNJ76B/PhLA==
X-CSE-MsgGUID: ClAl/2jHQju8/IJWVofVEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="216536077"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Mar 2026 11:10:51 -0700
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzIaX-000000003JE-03l1;
	Sun, 08 Mar 2026 18:10:49 +0000
Date: Mon, 09 Mar 2026 02:10:16 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/uapi-ucontext 2/2]
 ./usr/include/asm/ucontext.h:58:9: error: unknown type name 'stack_t'
Message-ID: <202603090229.3kVBAjjd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/uapi-ucontext
head:   8cf410e00cbd455a58c0b306581463883bf7ab19
commit: 8587c5d9052001aac2c6506ea382fbd59e4ef184 [2/2] ucontext
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20260309/202603090229.3kVBAjjd-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260309/202603090229.3kVBAjjd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603090229.3kVBAjjd-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/asm/ucontext.h:58:9: error: unknown type name 'stack_t'
      58 |         stack_t                 uc_stack;
         |         ^~~~~~~
>> ./usr/include/asm/ucontext.h:59:33: error: field 'uc_mcontext' has incomplete type
      59 |         struct sigcontext       uc_mcontext;
         |                                 ^~~~~~~~~~~
>> ./usr/include/asm/ucontext.h:60:9: error: unknown type name 'sigset_t'
      60 |         sigset_t                uc_sigmask;
         |         ^~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
