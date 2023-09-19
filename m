Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8527E163
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Sep 2023 01:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695087454; x=1726623454;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BuwYG3YU/WJXhBCEMaExP7KFWQ+GIfwokTprX+W1+oY=;
  b=BfFd2/Pi0sIdpqdvWmKOwZQ2StMyvv2FzV1PQWFYpXFTE0/TgolL5wpJ
   jCXafq70YG/dIEzEOCajrYjNpKRzsrfcQnYaYtEcOKFdLf+qwLP/Gx9rZ
   +7IH/ebKDSH8hw3Hc3RgSo6ZRGnksVsfRMaNmkx5PkUMMKzfbAwaOukfp
   UvW2YlLF3pYcM5wcFohd356DPe/mxJKvXnldQHrVTKqDxDzAtpaiEscKV
   cS4ayqVhK/Bv/mA6bK5jJqT9BazXwHcGqDhoQSPwCAxahDTl030m4hk2l
   EXhNN/X/utxkXumTKwEBicXtG0aGSiN5OsTyFoF9CWchrd5v7Dk8QzgZ5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="364875110"
X-IronPort-AV: E=Sophos;i="6.02,158,1688454000"; 
   d="scan'208";a="364875110"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 18:37:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="816272210"
X-IronPort-AV: E=Sophos;i="6.02,158,1688454000"; 
   d="scan'208";a="816272210"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 18 Sep 2023 18:37:23 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qiPg1-0006kH-3D;
	Tue, 19 Sep 2023 01:37:22 +0000
Date: Tue, 19 Sep 2023 09:37:13 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/topo-full 78/92] debugfs.c:undefined reference to
 `domain_names'
Message-ID: <202309190934.NDfYqJyT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/topo-full
head:   91418b13c03f8f6c26f4bfca7a82d9b94c4dccde
commit: 55da763e661747c0ff50586275d11ef4f78db8cd [78/92] x86/topology: Add a mechanism to track topology via APIC IDs
config: i386-buildonly-randconfig-005-20230919 (https://download.01.org/0day-ci/archive/20230919/202309190934.NDfYqJyT-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230919/202309190934.NDfYqJyT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309190934.NDfYqJyT-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/kernel/cpu/debugfs.o: in function `dom_debug_show':
>> debugfs.c:(.text+0x22f): undefined reference to `domain_names'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
