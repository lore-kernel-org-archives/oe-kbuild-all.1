Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F32A939
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 17:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725902021; cv=none; b=txY+LXB16TWWiRUOsV0a6Int1VfjfY28yk/ITyWxvLgO/iRLQuZChrrJMt1dBmhjfw1k3YfZNHntGVGHOTQPrH8xWVmqvSeVB/ptOl5oq7b7BC7G2bQeLwMtuAXhFl5sSRPHr4tXX/uaMpd0gSjPOKQ1582kOcPK3dkpL0cFTI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725902021; c=relaxed/simple;
	bh=gLTi+KMaIpRoTe3W7093RqkB1wnlsTx8e8WnFrTBFqo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SoqcW7a80RisnDBnKE5VvWw97qw/YoUKU1tRgLDW7pSnUQEYEZb28kS5wl5PytPsGTFjuuhGQY9Ifo0AYbD6J9wBmxWCjIlzPynWQ8op2OUB21hrlV5cPb+jDtQnAaAlNlz54TwkJ1HCZlSo+8UPG6iVUwzadPx1pQHySAkTkzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fBMy8G0u; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fBMy8G0u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725902019; x=1757438019;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gLTi+KMaIpRoTe3W7093RqkB1wnlsTx8e8WnFrTBFqo=;
  b=fBMy8G0uw2zh4lyKc7qmfMKtiiH4MMUgjECZacTGkKNZFJIRCWJRiyN0
   33O6wkJVz68tQTnAlZPeC+uHDq1kd7bAgHX8Xb6HRMwCxfAVmXm7Wkh7Y
   1LiC3kQA5jw4buLu0M7YR/RXnNvd4AxRkDAdbtPXRFqlx3LWJWPYPzvTD
   v5v9/J0O06g/gi0TU3ITmje/9vXq91mrOVS8LAbGWNjkIr6Xv3qi+nqhK
   iPYgFsfmRKJELPNLBrfLvcaMs1fdkUOFCtIPCguuDBa3dZkD/SSDpy3iB
   KGN8cBTviUBTIR0t/hgEGBg8VTROmj8JONRWNB9IxQXW9XuZijkZ/KqD0
   Q==;
X-CSE-ConnectionGUID: vJnnyg1fQGeVn4bUsl/KeA==
X-CSE-MsgGUID: 8svifpHrR4i5hxqSCCP0dQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24724157"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="24724157"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 10:13:39 -0700
X-CSE-ConnectionGUID: HZfEsa4TT3WA6Xey6Bq8uQ==
X-CSE-MsgGUID: D5SR0apSR/+oNNeOV1zhNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="66794032"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Sep 2024 10:13:38 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snhxI-000F1K-0M;
	Mon, 09 Sep 2024 17:13:36 +0000
Date: Tue, 10 Sep 2024 01:13:34 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-garbage 248/258] main.c:undefined
 reference to `execmem_free'
Message-ID: <202409100123.1tHF218G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-garbage
head:   c88c2220b6b527cec382f06a0ba3feab2a593b37
commit: 7a091cbeb2d972e3dc4d44f00ab2828b7abbbcce [248/258] mm: jit/text allocator
config: csky-defconfig (https://download.01.org/0day-ci/archive/20240910/202409100123.1tHF218G-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409100123.1tHF218G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409100123.1tHF218G-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: init/main.o: in function `start_kernel':
   main.c:(.init.text+0x762): undefined reference to `kvfree_rcu_pending_init'
   csky-linux-ld: main.c:(.init.text+0x918): undefined reference to `kvfree_rcu_pending_init'
   csky-linux-ld: kernel/module/main.o: in function `do_free_init':
>> main.c:(.text+0x11c): undefined reference to `execmem_free'
>> csky-linux-ld: main.c:(.text+0x122): undefined reference to `execmem_free'
   csky-linux-ld: main.c:(.text+0x128): undefined reference to `execmem_free'
   csky-linux-ld: kernel/module/main.o: in function `__module_get':
   main.c:(.text+0x17c): undefined reference to `execmem_free'
   csky-linux-ld: kernel/module/main.o: in function `move_module':
>> main.c:(.text+0x2a0): undefined reference to `execmem_alloc'
>> csky-linux-ld: main.c:(.text+0x2ec): undefined reference to `execmem_alloc'
   csky-linux-ld: main.c:(.text+0x38e): undefined reference to `execmem_free'
   csky-linux-ld: main.c:(.text+0x3ac): undefined reference to `execmem_alloc'
   csky-linux-ld: main.c:(.text+0x3b8): undefined reference to `execmem_free'
   csky-linux-ld: kernel/module/main.o: in function `free_module':
   main.c:(.text+0x14f2): undefined reference to `execmem_free'
   csky-linux-ld: main.c:(.text+0x1500): undefined reference to `execmem_free'
   csky-linux-ld: main.c:(.text+0x1544): undefined reference to `execmem_free'
   csky-linux-ld: kernel/module/main.o: in function `load_module':
   main.c:(.text+0x1e2e): undefined reference to `execmem_free'
   csky-linux-ld: kernel/module/main.o:main.c:(.text+0x1e3e): more undefined references to `execmem_free' follow
   csky-linux-ld: mm/mm_init.o: in function `mm_core_init':
>> mm_init.c:(.init.text+0x1656): undefined reference to `execmem_init'
>> csky-linux-ld: mm_init.c:(.init.text+0x16a8): undefined reference to `execmem_init'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
