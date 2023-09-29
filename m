Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE81510FA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Sep 2023 01:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695949403; x=1727485403;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a84Xm1t5S0eMHszTgMVVDclwJcWutj1US17Ub2SfTwA=;
  b=QqevpdY7tTNV6IMvnwEHZZ24TQXYwlxgKfh9tJIXx+uf6nh5LeOzYZZd
   98f65KMJNfl+VIsdIkWi9oG92WmS456kRD6yaguf3xp33+ZRFpnSfcXyB
   fCIAi2hpGI9VbJsE7PwwEblLTxq6yFLbeLooIhsftmOs02ZmudngpSCJa
   11b6YDa6WA+DF3EgEDZiMStgRnVQnZvhEvM9fbYQZYwbMPFA9BmS3BX5j
   BIbsDOkCMoKzxDyAtjOl8mCiOCOYE/GdDG3gCkb9Pu0Ev1h1uz9G6Yf9s
   ULThWCsnDOIiOyTfsaaMSLBR9GiizfJ8SA0uXWb8iulK6Dnyfdko99rOT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="361586801"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; 
   d="scan'208";a="361586801"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 18:03:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="779123515"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; 
   d="scan'208";a="779123515"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 28 Sep 2023 18:03:21 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qm1uI-0002ED-0u;
	Fri, 29 Sep 2023 01:03:19 +0000
Date: Fri, 29 Sep 2023 09:02:13 +0800
From: kernel test robot <lkp@intel.com>
To: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v8 2/5] media: platform: visconti: Add Toshiba Visconti
 Video Input Interface driver
Message-ID: <202309290802.A6PrKMoh-lkp@intel.com>
References: <20230925232806.950683-3-yuji2.ishikawa@toshiba.co.jp>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230925232806.950683-3-yuji2.ishikawa@toshiba.co.jp>

Hi Yuji,

kernel test robot noticed the following build errors:

[auto build test ERROR on media-tree/master]
[also build test ERROR on linus/master v6.6-rc3]
[cannot apply to next-20230928]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yuji-Ishikawa/dt-bindings-media-platform-visconti-Add-Toshiba-Visconti-Video-Input-Interface/20230926-073703
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230925232806.950683-3-yuji2.ishikawa%40toshiba.co.jp
patch subject: [PATCH v8 2/5] media: platform: visconti: Add Toshiba Visconti Video Input Interface driver
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230929/202309290802.A6PrKMoh-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230929/202309290802.A6PrKMoh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309290802.A6PrKMoh-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: drivers/media/platform/toshiba/visconti/viif_isp.o: in function `visconti_viif_isp_main_set_unit':
>> viif_isp.c:(.text+0x16e0): undefined reference to `__udivdi3'
   m68k-linux-ld: drivers/media/platform/toshiba/visconti/viif_isp.o: in function `visconti_viif_isp_sub_set_unit':
   viif_isp.c:(.text+0x17ce): undefined reference to `__udivdi3'
   m68k-linux-ld: drivers/media/platform/toshiba/visconti/viif_csi2rx.o: in function `viif_csi2rx_start':
>> viif_csi2rx.c:(.text+0x7f2): undefined reference to `__divdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
