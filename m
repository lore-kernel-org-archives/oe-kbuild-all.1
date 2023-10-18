Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AB9ECC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 01:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JfmQPo7y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697591579; x=1729127579;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yAO202BBUM4nkoCjxRfPNVliPcmocU47LVv3VtsFc3o=;
  b=JfmQPo7y4QvJkH6wkSIzJx+pt62XHgio1Bu8wMC4gzrh4+Pw7D6WyyFx
   NRWht0h+jcgOcQjn857O7JsZrLj3cxbVPvgAkqkZXmcp/dMGLp7guKHkT
   n0V/RYSDCH7LJsd4zpPP1JXCC9PhD6S8GiLq9RURTsYWnoOGeDJXYTN+h
   fr7SBYQzPmNsjKV1//If+gmi9R5jPyGjYLithHfeq17gZEgDy4Qz4sgZV
   o6NPWsEoN3f9PmI92fWG5Whg1j+xnt5GsujSJsCk7Msvw2VbvoibdS2AO
   oHZN8Y2PrfQJmwXKFWI9Ow+hRWI2SkH0sfsgtJ5KHYcvLBrdN84fM1zlT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="370975853"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; 
   d="scan'208";a="370975853"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 18:12:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="749883816"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; 
   d="scan'208";a="749883816"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 17 Oct 2023 18:12:58 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsv7H-000AJe-1v;
	Wed, 18 Oct 2023 01:12:55 +0000
Date: Wed, 18 Oct 2023 09:12:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 49/51]
 drivers/hid/hid-multitouch.c:2110:12: warning: 'mt_reset' defined but not
 used
Message-ID: <202310180934.5q9pEauk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   6185f26ca6b6efb24a63d8f244c0c9398c7fa99a
commit: ac473a0e04d2171f9b25f4c9ed02abeda23fd18f [49/51] CHROMIUM: HID: haptic: implement HID haptic reset callback
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231018/202310180934.5q9pEauk-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231018/202310180934.5q9pEauk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310180934.5q9pEauk-lkp@intel.com/

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
