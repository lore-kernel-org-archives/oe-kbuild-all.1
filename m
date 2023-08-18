Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6C6375
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Aug 2023 01:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692321265; x=1723857265;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FTQL5xLgCMj82U+VOmBOb2eZDhjJZmJlGUHntC1AZME=;
  b=Om3BtWJy2XAuWKSn9I0oTCojFSq2wiVtiCEGnlqfQtFJ4upseutr7lFq
   Ap86W6D7JnU58nJg8yEMqo/II6kr+FSuyO5SaLrJaK50NaED4eMrYLikz
   sCVSju3/VN2utcH0/aozVRxkVAH5gL7fNruAp3uGrxj+x8WV2EgZq9Ixz
   ZLgETRfI8BZleicMOiMoNVGN3ObwCN7KrTxZ0F9IdgY5flg/2zCVSOM/E
   DWfIC6Fc9kM5x5z1WweSifq0XL6awlmsPYjK4VDUg+zti+Hgydds2LQT2
   g+PrBN+Una4MbjJmCuzCoYCyfbBB9DLbmFw6KG9INlIyfCHT8I4CxASwN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="403957822"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="403957822"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 18:13:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="981432364"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="981432364"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 17 Aug 2023 18:13:02 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWo2w-0001ad-0N;
	Fri, 18 Aug 2023 01:13:02 +0000
Date: Fri, 18 Aug 2023 09:12:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 16/22] mm/swapfile.c:102:26: warning:
 no previous declaration for 'swap_type_to_swap_info'
Message-ID: <202308180930.hnkotMPZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   28b82089b299db6fa9efaeac2cee2c5b4fa7d5f0
commit: 4506bcbba5ec78d8d694fbb43e964cfefe900887 [16/22] ANDROID: mm: export swap_type_to_swap_info
config: i386-defconfig (https://download.01.org/0day-ci/archive/20230818/202308180930.hnkotMPZ-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308180930.hnkotMPZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308180930.hnkotMPZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/swapfile.c:102:26: warning: no previous declaration for 'swap_type_to_swap_info' [-Wmissing-declarations]
    struct swap_info_struct *swap_type_to_swap_info(int type)
                             ^~~~~~~~~~~~~~~~~~~~~~


vim +/swap_type_to_swap_info +102 mm/swapfile.c

   101	
 > 102	struct swap_info_struct *swap_type_to_swap_info(int type)
   103	{
   104		if (type >= READ_ONCE(nr_swapfiles))
   105			return NULL;
   106	
   107		smp_rmb();	/* Pairs with smp_wmb in alloc_swap_info. */
   108		return READ_ONCE(swap_info[type]);
   109	}
   110	EXPORT_SYMBOL_GPL(swap_type_to_swap_info);
   111	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
