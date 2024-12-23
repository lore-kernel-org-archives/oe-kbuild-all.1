Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30E01B21B5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Dec 2024 16:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734970315; cv=none; b=oAEjPVh7y1Xnm4nJR7wb8/WFK5E225g+nrRB8tCwbMk2lF5FUWXgYSQptJfHYZPCgSWML/Mg/0tBTg+5+zUEoIbz5cyZQ6o503YQ3YnO0m4AHj1rEc75yRwUmMYApPftrtd3vAF+dKgB6bFj8YRxtqn12lMYTdJ9AA5DeD9whzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734970315; c=relaxed/simple;
	bh=cAH8/0mMu2DzjLCTqbEBgMimwE/JgZv2gWG0NtOZHxw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WkdLriHzo4CI/52XN82Iy+DPEpKMBP6egLxo5g1tGpo6gwXvK1TUIqIPB8UzyoZOQLedZ8nYZJP/CYKqynolKN0gfLmv3SwxMxmDIHE1rIAOqoqj+0shS9x7UENzamJpxJb4UyM1wxaaBmFYvHuRcBh5uIjJzkQThfQffgPCebQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GSZJ9Ct/; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GSZJ9Ct/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734970314; x=1766506314;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cAH8/0mMu2DzjLCTqbEBgMimwE/JgZv2gWG0NtOZHxw=;
  b=GSZJ9Ct/XgsXQr//fLh2lUVsaaqtIezVOvTWx4FuO0bEoL3Yz79dHqay
   yX3fPCfm5OYSD1cNA5VGY3OtHD5Y8nyw5FteVyx7XDDk1ewrQj+KttIfc
   5Kr41b/owG6cihPJl5YGmnnE53TbOqe//jmayHDAMskwAqDWupd29iEJH
   Yh7kpjOdZvda5EUWfKVRJ3etPvu+PqJP/jfUNFmr9Cv3rtb7H6OBigSyD
   EmsuKjRqqoOGuXJMlX8y2cW6jj9QLyACVNqNhht3Zdqhi2iRZMzU4gz87
   +Q3vl2/DAJ6DQr6c0WG0FlXcuvv6QxJ/iWjidz6R11zmto8aGyV95s+Rv
   g==;
X-CSE-ConnectionGUID: frqyhN81QOuv2UDjdKq0gQ==
X-CSE-MsgGUID: 2b8klK5CTESKsIq9EU1E3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="46129020"
X-IronPort-AV: E=Sophos;i="6.12,257,1728975600"; 
   d="scan'208";a="46129020"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 08:11:53 -0800
X-CSE-ConnectionGUID: BauvpBfTR+ahV4kjbv5oAw==
X-CSE-MsgGUID: zIWTCVU2RVy/t5aBfIosaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,257,1728975600"; 
   d="scan'208";a="99104651"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 23 Dec 2024 08:11:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPl25-0000G5-2W;
	Mon, 23 Dec 2024 16:11:49 +0000
Date: Tue, 24 Dec 2024 00:11:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.12 0/19] drivers/hid/hid-multitouch.c:1904:3:
 error: call to undeclared function 'hid_haptic_resume'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202412240025.EgIBCSFQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.12
head:   8decd833dcf6e8e368c99562c3437b9113fcffad
commit: d70999e0ccd4410cd8730ddf49b0a3bd2fdaaa15 [0/19] BACKPORT: FROMLIST: HID: multitouch: add haptic multitouch support
config: i386-buildonly-randconfig-005-20241223 (https://download.01.org/0day-ci/archive/20241224/202412240025.EgIBCSFQ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241224/202412240025.EgIBCSFQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412240025.EgIBCSFQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/hid/hid-multitouch.c:35:
   In file included from include/linux/hid.h:29:
   In file included from include/linux/hid_bpf.h:6:
   In file included from include/linux/bpf.h:21:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2214:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/hid/hid-multitouch.c:1904:3: error: call to undeclared function 'hid_haptic_resume'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1904 |                 hid_haptic_resume(hdev, haptic);
         |                 ^
   drivers/hid/hid-multitouch.c:1918:3: error: call to undeclared function 'hid_haptic_resume'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1918 |                 hid_haptic_resume(hdev, haptic);
         |                 ^
>> drivers/hid/hid-multitouch.c:1937:3: error: call to undeclared function 'hid_haptic_suspend'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1937 |                 hid_haptic_suspend(hdev, haptic);
         |                 ^
   drivers/hid/hid-multitouch.c:1937:3: note: did you mean 'hid_driver_suspend'?
   include/linux/hid.h:1023:19: note: 'hid_driver_suspend' declared here
    1023 | static inline int hid_driver_suspend(struct hid_device *hdev, pm_message_t state) { return 0; }
         |                   ^
   1 warning and 3 errors generated.


vim +/hid_haptic_resume +1904 drivers/hid/hid-multitouch.c

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
