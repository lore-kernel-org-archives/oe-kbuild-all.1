Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A4230E0D0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Nov 2025 12:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763121997; cv=none; b=QdWSrTt8+mTFK/Or41TGVYQze5MAFQLhtobfeESe305Gmz8a2pka1lzOZEUEP7/j24EEo9hYAXPEU1tLZHosz0Q3kPUi62+gSRo1B72AXhTjOdv4/V3MtJGC3Czn5/ummwbK0nQjBWV0avtoDTF88EZ2kC4yJ0u0bCBMZePLWv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763121997; c=relaxed/simple;
	bh=fy1HLdbf6ZgdHfSEFoZzY73yUUAPl3GAiifHR0cqIFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LhDZ0uqg7RBHHVxtaoxQz+XWTieoDK5Tz+omAekDSFDECiW64/uaTSXVpXhmusi1qmtP5MORnA0DcmMcd4Q7uczC5vDdwuvWIEXDUDJulzAaOiUUYq3mKUn9M5mJpP4UqOdgpn/EaBVQGxu8pHTIg8RkRhmOs76lLwBBpO4aZTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HvwzpV5Z; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HvwzpV5Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763121996; x=1794657996;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=fy1HLdbf6ZgdHfSEFoZzY73yUUAPl3GAiifHR0cqIFY=;
  b=HvwzpV5ZkZJL/qOKUqVJvvQDRqcC2AExHNANqf1FgGjOofGJMXsslNrr
   FTdsNBhh29dnAC8hMKSxO5Wnijti+knmgBo/dNErxTIf/O3K9QEhYXGYg
   r4c/cc5E7D05Q8f4IEfkPONgtlLWp28Sn1xklug6Ys6gsJKDosIh02kI7
   ESJRysboO25pVijyMnOGl5PO/QgmjcZwYaovFv36uV1rpFKA1zc5q4BqG
   uOKL8eNL9sQFrbF802vCMeu2286nrppIjpATCfXKIobmiNXwQkHQU2HZH
   4R9gRcJA5JVQq3YQ1o7SOg14JCs9H32wvnHxIZbXwU0wodzd7LJfKu9HU
   w==;
X-CSE-ConnectionGUID: 5spYmOrDSzarIHaxPtZO5A==
X-CSE-MsgGUID: 0fsqHZM6Ql6SKZagHIERSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="52781319"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="52781319"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 04:06:33 -0800
X-CSE-ConnectionGUID: fpMASE3iRuOItEUK+poEtw==
X-CSE-MsgGUID: /+jMMz2bSAKcEGdQXX78+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="189594321"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Nov 2025 04:06:32 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJsZR-0006YZ-2e;
	Fri, 14 Nov 2025 12:06:29 +0000
Date: Fri, 14 Nov 2025 20:05:42 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas Zampieri <lzampier@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/1] HID: input: Add support for multiple batteries
 per device
Message-ID: <202511141958.fl1Us8Zg-lkp@intel.com>
References: <20251111105634.1684751-2-lzampier@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251111105634.1684751-2-lzampier@redhat.com>

Hi Lucas,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on hid/for-next]
[also build test ERROR on linus/master v6.18-rc5 next-20251114]
[cannot apply to dtor-input/next dtor-input/for-linus]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lucas-Zampieri/HID-input-Add-support-for-multiple-batteries-per-device/20251111-191143
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20251111105634.1684751-2-lzampier%40redhat.com
patch subject: [RFC PATCH 1/1] HID: input: Add support for multiple batteries per device
config: nios2-randconfig-002-20251114 (https://download.01.org/0day-ci/archive/20251114/202511141958.fl1Us8Zg-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511141958.fl1Us8Zg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511141958.fl1Us8Zg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/hid/hid-input.c:2475:
   drivers/hid/hid-input-test.c: In function 'hid_test_input_update_battery_charge_status':
>> drivers/hid/hid-input-test.c:18:50: error: passing argument 1 of 'hidinput_update_battery_charge_status' from incompatible pointer type [-Werror=incompatible-pointer-types]
     handled = hidinput_update_battery_charge_status(dev, HID_DG_HEIGHT, 0);
                                                     ^~~
   drivers/hid/hid-input.c:672:71: note: expected 'struct hid_battery *' but argument is of type 'struct hid_device *'
    static bool hidinput_update_battery_charge_status(struct hid_battery *bat,
                                                      ~~~~~~~~~~~~~~~~~~~~^~~
   In file included from drivers/hid/hid-input.c:2475:
   drivers/hid/hid-input-test.c:22:50: error: passing argument 1 of 'hidinput_update_battery_charge_status' from incompatible pointer type [-Werror=incompatible-pointer-types]
     handled = hidinput_update_battery_charge_status(dev, HID_BAT_CHARGING, 0);
                                                     ^~~
   drivers/hid/hid-input.c:672:71: note: expected 'struct hid_battery *' but argument is of type 'struct hid_device *'
    static bool hidinput_update_battery_charge_status(struct hid_battery *bat,
                                                      ~~~~~~~~~~~~~~~~~~~~^~~
   In file included from drivers/hid/hid-input.c:2475:
   drivers/hid/hid-input-test.c:26:50: error: passing argument 1 of 'hidinput_update_battery_charge_status' from incompatible pointer type [-Werror=incompatible-pointer-types]
     handled = hidinput_update_battery_charge_status(dev, HID_BAT_CHARGING, 1);
                                                     ^~~
   drivers/hid/hid-input.c:672:71: note: expected 'struct hid_battery *' but argument is of type 'struct hid_device *'
    static bool hidinput_update_battery_charge_status(struct hid_battery *bat,
                                                      ~~~~~~~~~~~~~~~~~~~~^~~
   cc1: some warnings being treated as errors


vim +/hidinput_update_battery_charge_status +18 drivers/hid/hid-input-test.c

a608dc1c06397dc José Expósito 2022-11-24   9  
a82231b2a8712d0 José Expósito 2025-08-14  10  static void hid_test_input_update_battery_charge_status(struct kunit *test)
a608dc1c06397dc José Expósito 2022-11-24  11  {
a608dc1c06397dc José Expósito 2022-11-24  12  	struct hid_device *dev;
a608dc1c06397dc José Expósito 2022-11-24  13  	bool handled;
a608dc1c06397dc José Expósito 2022-11-24  14  
a608dc1c06397dc José Expósito 2022-11-24  15  	dev = kunit_kzalloc(test, sizeof(*dev), GFP_KERNEL);
a608dc1c06397dc José Expósito 2022-11-24  16  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
a608dc1c06397dc José Expósito 2022-11-24  17  
a82231b2a8712d0 José Expósito 2025-08-14 @18  	handled = hidinput_update_battery_charge_status(dev, HID_DG_HEIGHT, 0);
a608dc1c06397dc José Expósito 2022-11-24  19  	KUNIT_EXPECT_FALSE(test, handled);
a608dc1c06397dc José Expósito 2022-11-24  20  	KUNIT_EXPECT_EQ(test, dev->battery_charge_status, POWER_SUPPLY_STATUS_UNKNOWN);
a608dc1c06397dc José Expósito 2022-11-24  21  
a82231b2a8712d0 José Expósito 2025-08-14  22  	handled = hidinput_update_battery_charge_status(dev, HID_BAT_CHARGING, 0);
a608dc1c06397dc José Expósito 2022-11-24  23  	KUNIT_EXPECT_TRUE(test, handled);
a608dc1c06397dc José Expósito 2022-11-24  24  	KUNIT_EXPECT_EQ(test, dev->battery_charge_status, POWER_SUPPLY_STATUS_DISCHARGING);
a608dc1c06397dc José Expósito 2022-11-24  25  
a82231b2a8712d0 José Expósito 2025-08-14  26  	handled = hidinput_update_battery_charge_status(dev, HID_BAT_CHARGING, 1);
a608dc1c06397dc José Expósito 2022-11-24  27  	KUNIT_EXPECT_TRUE(test, handled);
a608dc1c06397dc José Expósito 2022-11-24  28  	KUNIT_EXPECT_EQ(test, dev->battery_charge_status, POWER_SUPPLY_STATUS_CHARGING);
a608dc1c06397dc José Expósito 2022-11-24  29  }
a608dc1c06397dc José Expósito 2022-11-24  30  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
