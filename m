Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6EE1E3788
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Oct 2024 10:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728987828; cv=none; b=qLvSu1i96pr7TvAKK2gga+orj8CVPLoYIUwKRotu7ozm5uK1VLt1EzPIEmhKm0zI21rhwaczStbq40m2IhAJjaAzKgjqBL8qF5I6iZBBwNKH/ZRxafbd8RZ6pTNEThs9Yy+ek7ZKWgTWtxw6OgPkA066Ao6o/80TasADH4OJv7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728987828; c=relaxed/simple;
	bh=WzxWkDXu6iiiABxXW62VvPWNSJDf9wpTO4gP9ILfz58=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sPQjGy59SoQg0c0AnVRdnMVNhpDtmMUZ5pzwBvmkCho9cERwUpSa8Uy4fkfi322C2ILNamNiQAU9xlO2+4t//Gnq0j5ObIq21GaTCFn8VJT1LDZn3dySQ9tOqJSnp6NY/9PZFqHVXhqdniZj5QM/Z5kNTQPOn1K8VChrjWwHa5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RzpJEfwz; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RzpJEfwz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728987827; x=1760523827;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WzxWkDXu6iiiABxXW62VvPWNSJDf9wpTO4gP9ILfz58=;
  b=RzpJEfwzHY6+fM2zIzGbLNyI/X/qt0SwIbpxBeoquS0SZ9ts6MRsgtg3
   QhgfcGkz79thiWMieD7pNfq3hWtBOLu0R1QXvpC6BBQyEHKfOU/1xjQD+
   oDT22/LiOm3YrmqeVv6slLkndGlWOqhmho1YZztRWQ+CNBTUVXr/M6KkE
   Ia0drRrPf3oivfcW4FgU16F3bBhxwmzCgZghEDZXu1FHyhsP9sXdJpw0V
   21njdNxofYt//mMCudaLbcXcs/kJNYI8WVq9yHu/urBuVd0EUWTzjn0TX
   7chNNdKufaGOWbZY/yb9yULwmS37YdHVqaUUSwKgNRoDTQeaPHJG1muwY
   w==;
X-CSE-ConnectionGUID: hPl7WYZERSmAw845MUlsjw==
X-CSE-MsgGUID: OsC8XmvpQRqLVEg91vSuLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32065191"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="32065191"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 03:23:46 -0700
X-CSE-ConnectionGUID: fzRVejrVRFiAuyZ8mz3v3Q==
X-CSE-MsgGUID: ILWMBf19RYWNhB/XX1jQgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="82638546"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 Oct 2024 03:23:46 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0eiN-000Hxr-10;
	Tue, 15 Oct 2024 10:23:43 +0000
Date: Tue, 15 Oct 2024 18:23:36 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:execmem/x86-rox/v6 8/8] arch/x86/mm/init.c:1056:6: warning: no
 previous prototype for 'execmem_fill_trapping_insns'
Message-ID: <202410151820.O7EszQ0n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git execmem/x86-rox/v6
head:   2b978e9386bfb02955ece81058a14103d1bb7504
commit: 2b978e9386bfb02955ece81058a14103d1bb7504 [8/8] x86/module: enable ROX caches for module text
config: i386-buildonly-randconfig-002-20241015 (https://download.01.org/0day-ci/archive/20241015/202410151820.O7EszQ0n-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241015/202410151820.O7EszQ0n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410151820.O7EszQ0n-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/mm/init.c:1056:6: warning: no previous prototype for 'execmem_fill_trapping_insns' [-Wmissing-prototypes]
    1056 | void execmem_fill_trapping_insns(void *ptr, size_t size, bool writeable)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=n] || GCC_PLUGINS [=y]) && MODULES [=y]


vim +/execmem_fill_trapping_insns +1056 arch/x86/mm/init.c

  1055	
> 1056	void execmem_fill_trapping_insns(void *ptr, size_t size, bool writeable)
  1057	{
  1058		/* fill memory with INT3 instructions */
  1059		if (writeable)
  1060			memset(ptr, INT3_INSN_OPCODE, size);
  1061		else
  1062			text_poke_set(ptr, INT3_INSN_OPCODE, size);
  1063	}
  1064	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
