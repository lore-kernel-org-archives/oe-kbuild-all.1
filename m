Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5604236A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Aug 2023 00:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693096744; x=1724632744;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=maLv8T71t6az0MXeBHNv3vZujgwO6W/8hNucNN8Ujg0=;
  b=gAMOrnM8WlqOf2UD+R+z/dsyPE6B1vj/YYg5GCL2g678zt6UPETzgW3M
   XHeFDImAnj3k+JXUo1le6r0TaoWgOoJ0bN+UVskrwzrAxB2+fc9sPSVep
   Vag5osXk5mv7n32TfK4ZSIjOWXSUWAuPc6CgyAIqdNMHsCKlaZeTxPHfM
   usINrkRhpKLVy5DNRzd2XHzDTd9tJR2sRwtDTRWTV9CAUhXMV6XHRMxM9
   NMrNgxh3iwTXrVNIoPHPE4SCCvzECbDUmZS3lASb/BAXl/Guo7L9etMdk
   yPEM9RwodVKtqRxKTPY+mIRWe4ULv1SbMkw3nNUnUdm6+pJw/Iy2v5vNG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="374877057"
X-IronPort-AV: E=Sophos;i="6.02,204,1688454000"; 
   d="scan'208";a="374877057"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2023 17:39:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="984494335"
X-IronPort-AV: E=Sophos;i="6.02,204,1688454000"; 
   d="scan'208";a="984494335"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 26 Aug 2023 17:39:02 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qa3nx-0005Dh-13;
	Sun, 27 Aug 2023 00:39:01 +0000
Date: Sun, 27 Aug 2023 08:38:39 +0800
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>, linux-wireless@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/2] wifi: ath9k_htc: use module_usb_driver
Message-ID: <202308270817.fkin6iCi-lkp@intel.com>
References: <20230826200929.9756-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230826200929.9756-1-rosenp@gmail.com>

Hi Rosen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kvalo-ath/ath-next]
[also build test WARNING on wireless-next/main wireless/main linus/master v6.5-rc7 next-20230825]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/wifi-purelifi-use-module_usb_driver/20230827-041155
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
patch link:    https://lore.kernel.org/r/20230826200929.9756-1-rosenp%40gmail.com
patch subject: [PATCH 1/2] wifi: ath9k_htc: use module_usb_driver
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230827/202308270817.fkin6iCi-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230827/202308270817.fkin6iCi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308270817.fkin6iCi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/ath/ath9k/hif_usb.c:1525:26: warning: 'ath9k_hif_usb_driver' defined but not used [-Wunused-variable]
    1525 | static struct usb_driver ath9k_hif_usb_driver = {
         |                          ^~~~~~~~~~~~~~~~~~~~


vim +/ath9k_hif_usb_driver +1525 drivers/net/wireless/ath/ath9k/hif_usb.c

fb9987d0f748c9 Sujith 2010-03-17  1524  
fb9987d0f748c9 Sujith 2010-03-17 @1525  static struct usb_driver ath9k_hif_usb_driver = {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
