Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA82184C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 15:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NNC20/rg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699024347; x=1730560347;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hMUBeI8pCDsGwP2kXTvn/iLqFuNG0RWQ3wvmG49AmUc=;
  b=NNC20/rgPKedIYMDVeMrSbwdNlxhZ2tAWbsdc/EMRVIsdbfcFGRPZiHg
   62I0JK+64/k4Q0vw4znUL2n25xPrJuBjau0ehWT6JFYVs2u3SytIYoITl
   FBmn7MJIPEuNwjhodJgM7AVknn3svxBVyF86Q704VZki54lRRckZT383P
   9dgeS7/JAI5wFvau47mDF0g4y9xMg1PulDByIu94GoCnoePU23F16f9Rg
   G10vt2THBllwD/BaI/5j610wbXKceDg3a86810OkFafoQ2Np7ScgF5A1t
   OTCZAkhHJcngeEg9vO8I0Gz8AsdUYMWhOKA+KefnzMJuEyRStjJnBy14O
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="373998302"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="373998302"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 08:12:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="827511001"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="827511001"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 03 Nov 2023 08:12:25 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyvqR-0002cG-07;
	Fri, 03 Nov 2023 15:12:23 +0000
Date: Fri, 3 Nov 2023 23:11:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 49/79]
 drivers/hid/hid-multitouch.c:2110:12: warning: 'mt_reset' defined but not
 used
Message-ID: <202311032338.L18yaDDM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Angela,

FYI, the error/warning still remains.

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   3350a3f5b75b51f3beeeb492319057acc736dc38
commit: ac473a0e04d2171f9b25f4c9ed02abeda23fd18f [49/79] CHROMIUM: HID: haptic: implement HID haptic reset callback
config: nios2-randconfig-002-20231101 (https://download.01.org/0day-ci/archive/20231103/202311032338.L18yaDDM-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311032338.L18yaDDM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311032338.L18yaDDM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hid/hid-multitouch.c:2110:12: warning: 'mt_reset' defined but not used [-Wunused-function]
    2110 | static int mt_reset(struct hid_device *hdev)
         |            ^~~~~~~~


vim +/mt_reset +2110 drivers/hid/hid-multitouch.c

  2109	
> 2110	static int mt_reset(struct hid_device *hdev)
  2111	{
  2112		struct mt_device *td = hid_get_drvdata(hdev);
  2113		struct hid_haptic_device *haptic = td->haptic;
  2114	
  2115		mt_release_contacts(hdev);
  2116		mt_set_modes(hdev, HID_LATENCY_NORMAL, true, true);
  2117	
  2118		if (td->is_haptic_touchpad)
  2119			hid_haptic_reset(hdev, haptic);
  2120	
  2121		return 0;
  2122	}
  2123	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
