Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C90DDC5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Dec 2024 12:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735042918; cv=none; b=jqoowyxozZbTEPSJPotwRTrKWzOHPdb/A9AvwXVgc20YcCSTU1WqIWaNCFNn4CDIhCt4BwYbhmzT3l1RAQZDd9PrpTknOjjmSwQpQf7GSMJnTEhFrv0ozRa+FzuHlaAPkVeewtXaZXrYdqSuK7HF0Fdg5HodfjCS73mPjROV214=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735042918; c=relaxed/simple;
	bh=OYbBRIcciS5YATogYhM2SQvBIHAX8OXJa02c40IDEeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lzdb/xg0Usakfki+B6UVcQgsK744Ku1w0HfWHIEGYh4LJAco6kHNXocznTWnf0HEWbFyEaPkZD/hhH1XraofIi8HnFd/2BaaCwYy0pibJ82iqBiiw4D1JclZBBaKsLhV3XDEinr6T8O/I23cmW40dRbViP0h0J+rDEN5ZuuPBMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e0KcPa6G; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e0KcPa6G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735042916; x=1766578916;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OYbBRIcciS5YATogYhM2SQvBIHAX8OXJa02c40IDEeQ=;
  b=e0KcPa6GATLtJ/D2vWvndkIi6B8p9Af4VU5aJSw0kIDS67JUgiFdqbOh
   xBozynrOlqlvd4h4Vkvfy/oTetKPXkp3mneWYyDsiZa1xEOwHs+PAXnRo
   NVfLroOGEnp+Sf33aFq+TyM4CBJlJOZ+Io3EsDsHU+lnWwNyDkda58Fj3
   MpjOsyppO9xeXelqqRolKdk9aEGWHTHk7/nwdNB2egZzi0wzTWRmZ5swL
   TwOqbiKC9tdvKXae7jRlj5U3BqDD8beZ8nNKq2b5RvTF9XpxK+7LK6hFu
   XMfFbVr10YsN/HUz0VIY59v3B9w/Eu1tGY+Z7/1a242AiYM7LMN50/QYj
   w==;
X-CSE-ConnectionGUID: 1JakoUmNTPqdNtHYd+QyHg==
X-CSE-MsgGUID: s2gr+9npRSajt8SUddBByQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="35406094"
X-IronPort-AV: E=Sophos;i="6.12,260,1728975600"; 
   d="scan'208";a="35406094"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 04:21:56 -0800
X-CSE-ConnectionGUID: pGEzb4ZlTZecP0XvC2ba7Q==
X-CSE-MsgGUID: imhpPH+ER2Gf95TPTghopg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,260,1728975600"; 
   d="scan'208";a="104444959"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 24 Dec 2024 04:21:55 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQ3v6-00016d-2X;
	Tue, 24 Dec 2024 12:21:52 +0000
Date: Tue, 24 Dec 2024 20:21:00 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.12 0/20] drivers/hid/hid-multitouch.c:1904:17:
 error: implicit declaration of function 'hid_haptic_resume'; did you mean
 'hid_haptic_init'?
Message-ID: <202412242031.R8QN4RMW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.12
head:   811e48e07be5a00b2472cecba280dd56c8c200ef
commit: d70999e0ccd4410cd8730ddf49b0a3bd2fdaaa15 [0/20] BACKPORT: FROMLIST: HID: multitouch: add haptic multitouch support
config: x86_64-buildonly-randconfig-002-20241224 (https://download.01.org/0day-ci/archive/20241224/202412242031.R8QN4RMW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241224/202412242031.R8QN4RMW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412242031.R8QN4RMW-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/hid/hid-multitouch.c: In function 'mt_suspend':
>> drivers/hid/hid-multitouch.c:1904:17: error: implicit declaration of function 'hid_haptic_resume'; did you mean 'hid_haptic_init'? [-Werror=implicit-function-declaration]
    1904 |                 hid_haptic_resume(hdev, haptic);
         |                 ^~~~~~~~~~~~~~~~~
         |                 hid_haptic_init
   drivers/hid/hid-multitouch.c: In function 'mt_resume':
>> drivers/hid/hid-multitouch.c:1937:17: error: implicit declaration of function 'hid_haptic_suspend'; did you mean 'hid_driver_suspend'? [-Werror=implicit-function-declaration]
    1937 |                 hid_haptic_suspend(hdev, haptic);
         |                 ^~~~~~~~~~~~~~~~~~
         |                 hid_driver_suspend
   cc1: some warnings being treated as errors


vim +1904 drivers/hid/hid-multitouch.c

  1890	
  1891	static int mt_suspend(struct hid_device *hdev, pm_message_t state)
  1892	{
  1893		struct mt_device *td = hid_get_drvdata(hdev);
  1894		struct hid_haptic_device *haptic = td->haptic;
  1895	
  1896		/* High latency is desirable for power savings during S3/S0ix */
  1897		if ((td->mtclass.quirks & MT_QUIRK_DISABLE_WAKEUP) ||
  1898		    !hid_hw_may_wakeup(hdev))
  1899			mt_set_modes(hdev, HID_LATENCY_HIGH, false, false);
  1900		else
  1901			mt_set_modes(hdev, HID_LATENCY_HIGH, true, true);
  1902	
  1903		if (td->is_haptic_touchpad)
> 1904			hid_haptic_resume(hdev, haptic);
  1905	
  1906		return 0;
  1907	}
  1908	
  1909	static int mt_reset_resume(struct hid_device *hdev)
  1910	{
  1911		struct mt_device *td = hid_get_drvdata(hdev);
  1912		struct hid_haptic_device *haptic = td->haptic;
  1913	
  1914		mt_release_contacts(hdev);
  1915		mt_set_modes(hdev, HID_LATENCY_NORMAL, true, true);
  1916	
  1917		if (td->is_haptic_touchpad)
  1918			hid_haptic_resume(hdev, haptic);
  1919	
  1920		return 0;
  1921	}
  1922	
  1923	static int mt_resume(struct hid_device *hdev)
  1924	{
  1925		struct mt_device *td = hid_get_drvdata(hdev);
  1926		struct hid_haptic_device *haptic = td->haptic;
  1927	
  1928		/* Some Elan legacy devices require SET_IDLE to be set on resume.
  1929		 * It should be safe to send it to other devices too.
  1930		 * Tested on 3M, Stantum, Cypress, Zytronic, eGalax, and Elan panels. */
  1931	
  1932		hid_hw_idle(hdev, 0, 0, HID_REQ_SET_IDLE);
  1933	
  1934		mt_set_modes(hdev, HID_LATENCY_NORMAL, true, true);
  1935	
  1936		if (td->is_haptic_touchpad)
> 1937			hid_haptic_suspend(hdev, haptic);
  1938	
  1939		return 0;
  1940	}
  1941	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
