Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714782AE77
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Apr 2025 10:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743590075; cv=none; b=fTGgdiUA8bCuOuwz8FFssYf0xWVjBwGGHH8TIFe2uzKmcQw/UBx0tK6q/dl96z+9f3GOgnLKg1S63lVF9qcCmOPOFBcDj7wYec5KbFwHuxD/sGn5vCMu+YCA6bYGeRNFqo4V34LElewuj7Sds476XMH0GfbPQwe02z+pXONx/A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743590075; c=relaxed/simple;
	bh=QJ9siAJ/hnljlKFyw0DVeYzXCSl9cK8xzcriqfPiVg0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CWq56BJnim3yNHzHekM0+z/jIZcRpEheqbfyKbvwjMCAvfecle5K9SfjkuDiftwn5ASRsPBflB+ykUme5CzuqYvk41rsWm2Akq0iiKocw41Rm+/wJQbUFfofhUSVVM4XjcdvYrz4dPOmCcNKWOUHlEfX4rTIroL/O5ZFt6ciRK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WElgKgMc; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WElgKgMc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743590072; x=1775126072;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QJ9siAJ/hnljlKFyw0DVeYzXCSl9cK8xzcriqfPiVg0=;
  b=WElgKgMcSha5zYJF187Qy6oC5m1whgqUSOqWTt+v7gPM14xFYI0yDq9a
   0YeQsIda6K+2+zhrcT8AoeoHmS/2QbRpvX4V94SbkKGaX/yy65aHfKdw5
   RLftiXLT4OU4U8Gnudbq9tJm2WQXHBdLmArD7jK/myFrz3VXN9scc/Wf2
   swQrgdnQm73G0cixJ1ByY5Eb6So8AxSsgJn+ypTCCLVm86Y7EqCuuMPIQ
   MIT6UrA5uTqgmgvRwtL1UC4ah5XbPTC0zzk5AdboGYHUTF/LMBPlZoQDk
   UroddNNKh+CcWPBC/NtyWDqZFsuvdC+rLCtKGQ8910Sfe5IG89qgu9gAe
   Q==;
X-CSE-ConnectionGUID: qYk46ij5Sfam9QCwF/1Y2A==
X-CSE-MsgGUID: BAtKE/0uSYi3I/EQaTsXVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44199725"
X-IronPort-AV: E=Sophos;i="6.14,182,1736841600"; 
   d="scan'208";a="44199725"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 03:34:32 -0700
X-CSE-ConnectionGUID: v2L2ePAvRxulFwaDCmdfSw==
X-CSE-MsgGUID: GGx/+ZBGQ7OdBe3UZ9CRIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,182,1736841600"; 
   d="scan'208";a="127492596"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 02 Apr 2025 03:34:30 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzvQS-000Ad8-1y;
	Wed, 02 Apr 2025 10:34:28 +0000
Date: Wed, 2 Apr 2025 18:34:11 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Yejian <zhengyejian1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2077/2077] kernel/module/strict_rwx.c:36:6:
 warning: no previous prototype for 'module_disable_ro'
Message-ID: <202504021840.VgjrPfcw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zheng,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   75db7d4fff188725f4adc2de1281daa5b8680603
commit: c8783f92771c891518257c9deb22cd91d4e1a212 [2077/2077] livepatch/core: Revert module_enable_ro and module_disable_ro
config: x86_64-randconfig-161-20250402 (https://download.01.org/0day-ci/archive/20250402/202504021840.VgjrPfcw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250402/202504021840.VgjrPfcw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504021840.VgjrPfcw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/module/strict_rwx.c:36:6: warning: no previous prototype for 'module_disable_ro' [-Wmissing-prototypes]
      36 | void module_disable_ro(const struct module *mod)
         |      ^~~~~~~~~~~~~~~~~


vim +/module_disable_ro +36 kernel/module/strict_rwx.c

    34	
    35	#ifdef CONFIG_LIVEPATCH_WO_FTRACE
  > 36	void module_disable_ro(const struct module *mod)
    37	{
    38		if (!IS_ENABLED(CONFIG_STRICT_MODULE_RWX))
    39			return;
    40	#ifdef CONFIG_STRICT_MODULE_RWX
    41		if (!rodata_enabled)
    42			return;
    43	#endif
    44	
    45		module_set_memory(mod, MOD_TEXT, set_memory_rw);
    46		module_set_memory(mod, MOD_INIT_TEXT, set_memory_rw);
    47		module_set_memory(mod, MOD_RODATA, set_memory_rw);
    48		module_set_memory(mod, MOD_INIT_RODATA, set_memory_rw);
    49	}
    50	#endif /* CONFIG_LIVEPATCH_WO_FTRACE */
    51	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
