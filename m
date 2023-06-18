Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6DC1386
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jun 2023 09:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687078874; x=1718614874;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MTPD/ChIiXtYzHROYJX+Y1OBxNWdMyA+ZAR/Co+duM4=;
  b=KMtMx8xh5scq1XYmj0gLWLwCAQ0P3xuhEVQ+Ykdj93F8MvN2KX/lPX9a
   t974ilsF3Y9guZ6bMuJfHqFvy1kM6QmxM9djQxmxpeRXG9lv8j35NDqrO
   BohZhiCNyMyGFfqS/wXgkLPcd5DYePOxY+7Az1vGamxDe6ODILRqeD8LG
   IKdCfQ8p1ApjLB53vv3NliRXqAMU6P4yUcObXTErNBsROoU8QRr+vq/8+
   f3GKNmJCuIBtQbxtBToKlu+AH6zXE9Tzcagyo3U5Dvt3ykHSSGqr728z/
   xCMHV0byfp5BdcXiGNAGAyYRxDXHcexjyl92QlxBiMTf814BNYN5xKmKc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="339797384"
X-IronPort-AV: E=Sophos;i="6.00,252,1681196400"; 
   d="scan'208";a="339797384"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2023 02:01:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="783402582"
X-IronPort-AV: E=Sophos;i="6.00,252,1681196400"; 
   d="scan'208";a="783402582"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 18 Jun 2023 02:01:12 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAoHX-0003bg-1z;
	Sun, 18 Jun 2023 09:01:11 +0000
Date: Sun, 18 Jun 2023 17:00:43 +0800
From: kernel test robot <lkp@intel.com>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [staging:staging-testing 37/38] ERROR: modpost:
 "ieee80211_channel_to_freq_khz" [drivers/staging/rtl8192e/rtllib.ko]
 undefined!
Message-ID: <202306181636.4xw5PmFm-lkp@intel.com>
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
commit: 01da3efafe060ba685fcd08f8db665e5a9f1f9fc [37/38] staging: rtl8192e: Use standard api to calculate channel to frequency
config: csky-randconfig-r024-20230617 (https://download.01.org/0day-ci/archive/20230618/202306181636.4xw5PmFm-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230618/202306181636.4xw5PmFm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306181636.4xw5PmFm-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "ieee80211_freq_khz_to_channel" [drivers/staging/rtl8192e/rtllib.ko] undefined!
ERROR: modpost: "rfc1042_header" [drivers/staging/rtl8192e/rtllib.ko] undefined!
>> ERROR: modpost: "ieee80211_channel_to_freq_khz" [drivers/staging/rtl8192e/rtllib.ko] undefined!
ERROR: modpost: "bridge_tunnel_header" [drivers/staging/rtl8192e/rtllib.ko] undefined!
>> ERROR: modpost: "ieee80211_channel_to_freq_khz" [drivers/staging/rtl8192e/rtl8192e/r8192e_pci.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
