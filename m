Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AAF19C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 18:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695236167; x=1726772167;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iV9aDgdNuQfHwR5GjbBzmT29zVlReP1/TsxuPkjBpaw=;
  b=JiS/eDMv+Wim49adXbkSUygZx3xnu5g8p9ZoI6Zjr/vktLaMx9jrOeTE
   G7r7JGOoAD74p+lxF72V8cPDRAz5GVQcNdv/gw+Lq6u+dgsG5qheRc9+Z
   E0mb3/il+WdjHIZhjTQRnSqeAdCN4eevwOxi7LNvjuQeU208sEkjq3Llf
   I1SGpwci59V8qJfI8pAJH9OT3XZlk8CSRmgj4tn76kP/N5UT1uxhujwcs
   ta3sDUp1VyOvNjXttHk501Im870FMEUCJMjmBqsDl5o8JBzM86q6+CBku
   lJpWrdws2/Ac/na1SkUnnEc9P89qwD9PNrEbItNTwvMU7vWNB5fSTVBfr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="444408019"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="444408019"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 11:56:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="696437285"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="696437285"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 20 Sep 2023 11:56:05 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qj2Mk-00092m-3D;
	Wed, 20 Sep 2023 18:56:03 +0000
Date: Thu, 21 Sep 2023 02:55:43 +0800
From: kernel test robot <lkp@intel.com>
To: Dhaval Shah <dhaval.r.shah@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 748/1365] ERROR: modpost:
 "af_alg_register_type" [crypto/algif_aead.ko] undefined!
Message-ID: <202309210249.U5aReP69-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dhaval,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   008e6788f5aa09862307822bfc396c926dc0dbac
commit: 31fd98d28e97477718d4cc332f4a86014f4b11d9 [748/1365] crypto: xilinx: select AES GCM fallback and userspace kernel config
config: x86_64-buildonly-randconfig-006-20230920 (https://download.01.org/0day-ci/archive/20230921/202309210249.U5aReP69-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230921/202309210249.U5aReP69-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309210249.U5aReP69-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "af_alg_register_type" [crypto/algif_aead.ko] undefined!
>> ERROR: modpost: "af_alg_sendmsg" [crypto/algif_aead.ko] undefined!
>> ERROR: modpost: "af_alg_pull_tsgl" [crypto/algif_aead.ko] undefined!
>> ERROR: modpost: "sock_kzfree_s" [crypto/algif_aead.ko] undefined!
>> ERROR: modpost: "sock_kfree_s" [crypto/algif_aead.ko] undefined!
>> ERROR: modpost: "af_alg_release_parent" [crypto/algif_aead.ko] undefined!
>> ERROR: modpost: "sock_kmalloc" [crypto/algif_aead.ko] undefined!
>> ERROR: modpost: "af_alg_unregister_type" [crypto/algif_aead.ko] undefined!
>> ERROR: modpost: "af_alg_alloc_areq" [crypto/algif_aead.ko] undefined!
>> ERROR: modpost: "af_alg_wait_for_data" [crypto/algif_aead.ko] undefined!
WARNING: modpost: suppressed 20 unresolved symbol warnings because there were too many)

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CRYPTO_USER_API_AEAD
   Depends on [n]: CRYPTO [=y] && NET [=n]
   Selected by [m]:
   - CRYPTO_DEV_ZYNQMP_AES [=m] && CRYPTO [=y] && CRYPTO_HW [=y] && (ZYNQMP_FIRMWARE [=n] || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
