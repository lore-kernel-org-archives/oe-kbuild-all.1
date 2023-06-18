Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB47EBB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jun 2023 03:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687058583; x=1718594583;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xw6MGg9hm3aP3vCdUUPLoDZu5umWvdhmV7Z/bCJRxRI=;
  b=U8/fnkoF/S5Gi/NEGbxvG3cPqLUIUrqPeekWgUH0BJ4oPW7O3S9l5qdC
   a7W7xlMdrtiByN4nTJSUswAen1TBcUP6DZdBlnLdbCQBfj0J1Hsc2Rjn+
   lI62Rlhx8vg7ODFR6oHRDFUlazbRWK2lVYuFfM8dG5+NW0c5WHG6cFkgj
   OfjxEg05l07Av6cVXgoUlZNT449bNwsKZZUDHaLyiODMpIRtxVLvpLxTV
   2oLsXbm2PbsYsd9toEj0s092KG4hn2PZTMe+KK2D9vA66YaZjrCB/IrSq
   EpZgpHkpNGi2F9s07VElWOW7C4tQuSjUxc+NL3LMAo8avtg+r8eXOtFI9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="358314834"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="358314834"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2023 20:23:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="837458640"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="837458640"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 17 Jun 2023 20:23:01 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAj0G-0003LI-1W;
	Sun, 18 Jun 2023 03:23:00 +0000
Date: Sun, 18 Jun 2023 11:22:33 +0800
From: kernel test robot <lkp@intel.com>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [staging:staging-testing 36/38] ERROR: modpost:
 "ieee80211_freq_khz_to_channel" [drivers/staging/rtl8192e/rtllib.ko]
 undefined!
Message-ID: <202306181110.O3j7R17W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git staging-testing
head:   f99bbb4412ceffba7e85b9a9227de44c214c68ca
commit: 4e9e2c8026ff200e818928f818dde17a311fed86 [36/38] staging: rtl8192e: Use standard api to calculate frequency to channel
config: csky-randconfig-r024-20230617 (https://download.01.org/0day-ci/archive/20230618/202306181110.O3j7R17W-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230618/202306181110.O3j7R17W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306181110.O3j7R17W-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "ieee80211_freq_khz_to_channel" [drivers/staging/rtl8192e/rtllib.ko] undefined!
ERROR: modpost: "rfc1042_header" [drivers/staging/rtl8192e/rtllib.ko] undefined!
ERROR: modpost: "bridge_tunnel_header" [drivers/staging/rtl8192e/rtllib.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
