Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0727F1F76B4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 20:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729801525; cv=none; b=NrvHVulBUEiIQfHsZLolOHk48cz/MtQkGPlohmVDCJ5/6G0qhGAxpfdjVAHVi7pCaYj89q/gRqYniO/XeKCapXpIAIC++6Z6IzPjXgc37Y1VJ0ITF088YHvOjRn0Ia/lPxBlTCzK/b6o9eQ0hPDvkvoKiwh10XrIDjxkP9C2dfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729801525; c=relaxed/simple;
	bh=fDNx0gaZIo/XeFW3mMVqVc8o2NiQDf0i0bihTkPEvxo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WXgc77KjW9h1cbrj5MKc4ilTAV3E2GBSOp3vAs7mpZvznahjur733C/d417BDccGaVZ9YJ76PKSUlMhSZkVacf4bFylrHasKYkH44UZm1QPqTSwKa8fz+qhP4zGMNkI48eMsC1nsRLsFSvSmQoMBuBgFKraIK6AUJcuFodmzOoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GmIWVv/w; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GmIWVv/w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729801522; x=1761337522;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fDNx0gaZIo/XeFW3mMVqVc8o2NiQDf0i0bihTkPEvxo=;
  b=GmIWVv/wPFwKnSGVjaeDrGKwP/ZvJ1/msDtqdmDpxq/3Wyt9ok2GOa1M
   QZPDj6rzj22w0G3mNsUd2M8sMsEgGQVRjYHM04LqQ/QNW1xGmW5IkQ/ts
   xIHvJjTqZnDj/wK/VYW609thF+2Q7Ipq6gH1m1Z+7AzxMSrkaztAG32fi
   6maLyCeXWj3ForNC8Yh2q8sNB0/6dn3ZLIB/IAjwIKd1JmSl9T3UWuy7t
   dbUrYHQZcI4IFoDn5rNsRrLwiz9U1NrudRt8vaVtRU3TFJNWnS3LeXlVN
   itfrW43wTLtwAQUrlTgYAPClBxK4D+rVpJ3y2ewOLdNnoSVDb8kMptGvj
   g==;
X-CSE-ConnectionGUID: hWoxWTPMTXuj20ViBg6BoA==
X-CSE-MsgGUID: LvfSW0S2Tba/kJJ5MDCl0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29230501"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29230501"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 13:25:21 -0700
X-CSE-ConnectionGUID: Kc1R/rOdQuO/+ajn0a1sAA==
X-CSE-MsgGUID: Bjr/X8BuQK+Ea9j+9BiS5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; 
   d="scan'208";a="84661510"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 24 Oct 2024 13:25:19 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t44OT-000X3m-11;
	Thu, 24 Oct 2024 20:25:17 +0000
Date: Fri, 25 Oct 2024 04:24:19 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Ard Biesheuvel <ardb@kernel.org>,
	Abbott Liu <liuwenliang@huawei.com>,
	Florian Fainelli <f.fainelli@gmail.com>
Subject: drivers/base/test/property-entry-test.c:214:1: warning: the frame
 size of 1032 bytes is larger than 1024 bytes
Message-ID: <202410250410.ZAcgUmQY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c2ee9f594da826bea183ed14f2cc029c719bf4da
commit: 421015713b306e47af95d4d61cdfbd96d462e4cb ARM: 9017/2: Enable KASan for ARM
date:   4 years ago
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20241025/202410250410.ZAcgUmQY-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410250410.ZAcgUmQY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410250410.ZAcgUmQY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/base/test/property-entry-test.c: In function 'pe_test_uint_arrays':
>> drivers/base/test/property-entry-test.c:214:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     214 | }
         | ^
--
   drivers/interconnect/qcom/bcm-voter.c: In function 'qcom_icc_bcm_voter_commit':
>> drivers/interconnect/qcom/bcm-voter.c:339:1: warning: the frame size of 1128 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     339 | }
         | ^


vim +214 drivers/base/test/property-entry-test.c

c032ace71c29d5 Dmitry Torokhov 2019-12-04  100  
c032ace71c29d5 Dmitry Torokhov 2019-12-04  101  static void pe_test_uint_arrays(struct kunit *test)
c032ace71c29d5 Dmitry Torokhov 2019-12-04  102  {
c032ace71c29d5 Dmitry Torokhov 2019-12-04  103  	static const u8 a_u8[16] = { 8, 9 };
c032ace71c29d5 Dmitry Torokhov 2019-12-04  104  	static const u16 a_u16[16] = { 16, 17 };
c032ace71c29d5 Dmitry Torokhov 2019-12-04  105  	static const u32 a_u32[16] = { 32, 33 };
c032ace71c29d5 Dmitry Torokhov 2019-12-04  106  	static const u64 a_u64[16] = { 64, 65 };
c032ace71c29d5 Dmitry Torokhov 2019-12-04  107  	static const struct property_entry entries[] = {
c032ace71c29d5 Dmitry Torokhov 2019-12-04  108  		PROPERTY_ENTRY_U8_ARRAY("prop-u8", a_u8),
c032ace71c29d5 Dmitry Torokhov 2019-12-04  109  		PROPERTY_ENTRY_U16_ARRAY("prop-u16", a_u16),
c032ace71c29d5 Dmitry Torokhov 2019-12-04  110  		PROPERTY_ENTRY_U32_ARRAY("prop-u32", a_u32),
c032ace71c29d5 Dmitry Torokhov 2019-12-04  111  		PROPERTY_ENTRY_U64_ARRAY("prop-u64", a_u64),
c032ace71c29d5 Dmitry Torokhov 2019-12-04  112  		{ }
c032ace71c29d5 Dmitry Torokhov 2019-12-04  113  	};
c032ace71c29d5 Dmitry Torokhov 2019-12-04  114  
c032ace71c29d5 Dmitry Torokhov 2019-12-04  115  	struct fwnode_handle *node;
c032ace71c29d5 Dmitry Torokhov 2019-12-04  116  	u8 val_u8, array_u8[32];
c032ace71c29d5 Dmitry Torokhov 2019-12-04  117  	u16 val_u16, array_u16[32];
c032ace71c29d5 Dmitry Torokhov 2019-12-04  118  	u32 val_u32, array_u32[32];
c032ace71c29d5 Dmitry Torokhov 2019-12-04  119  	u64 val_u64, array_u64[32];
c032ace71c29d5 Dmitry Torokhov 2019-12-04  120  	int error;
c032ace71c29d5 Dmitry Torokhov 2019-12-04  121  
c032ace71c29d5 Dmitry Torokhov 2019-12-04  122  	node = fwnode_create_software_node(entries, NULL);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  123  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, node);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  124  
c032ace71c29d5 Dmitry Torokhov 2019-12-04  125  	error = fwnode_property_read_u8(node, "prop-u8", &val_u8);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  126  	KUNIT_EXPECT_EQ(test, error, 0);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  127  	KUNIT_EXPECT_EQ(test, (int)val_u8, 8);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  128  
c032ace71c29d5 Dmitry Torokhov 2019-12-04  129  	error = fwnode_property_read_u8_array(node, "prop-u8", array_u8, 1);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  130  	KUNIT_EXPECT_EQ(test, error, 0);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  131  	KUNIT_EXPECT_EQ(test, (int)array_u8[0], 8);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  132  
c032ace71c29d5 Dmitry Torokhov 2019-12-04  133  	error = fwnode_property_read_u8_array(node, "prop-u8", array_u8, 2);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  134  	KUNIT_EXPECT_EQ(test, error, 0);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  135  	KUNIT_EXPECT_EQ(test, (int)array_u8[0], 8);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  136  	KUNIT_EXPECT_EQ(test, (int)array_u8[1], 9);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  137  
c032ace71c29d5 Dmitry Torokhov 2019-12-04  138  	error = fwnode_property_read_u8_array(node, "prop-u8", array_u8, 17);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  139  	KUNIT_EXPECT_NE(test, error, 0);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  140  
c032ace71c29d5 Dmitry Torokhov 2019-12-04  141  	error = fwnode_property_read_u8(node, "no-prop-u8", &val_u8);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  142  	KUNIT_EXPECT_NE(test, error, 0);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  143  
c032ace71c29d5 Dmitry Torokhov 2019-12-04  144  	error = fwnode_property_read_u8_array(node, "no-prop-u8", array_u8, 1);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  145  	KUNIT_EXPECT_NE(test, error, 0);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  146  
c032ace71c29d5 Dmitry Torokhov 2019-12-04  147  	error = fwnode_property_read_u16(node, "prop-u16", &val_u16);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  148  	KUNIT_EXPECT_EQ(test, error, 0);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  149  	KUNIT_EXPECT_EQ(test, (int)val_u16, 16);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  150  
c032ace71c29d5 Dmitry Torokhov 2019-12-04  151  	error = fwnode_property_read_u16_array(node, "prop-u16", array_u16, 1);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  152  	KUNIT_EXPECT_EQ(test, error, 0);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  153  	KUNIT_EXPECT_EQ(test, (int)array_u16[0], 16);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  154  
c032ace71c29d5 Dmitry Torokhov 2019-12-04  155  	error = fwnode_property_read_u16_array(node, "prop-u16", array_u16, 2);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  156  	KUNIT_EXPECT_EQ(test, error, 0);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  157  	KUNIT_EXPECT_EQ(test, (int)array_u16[0], 16);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  158  	KUNIT_EXPECT_EQ(test, (int)array_u16[1], 17);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  159  
c032ace71c29d5 Dmitry Torokhov 2019-12-04  160  	error = fwnode_property_read_u16_array(node, "prop-u16", array_u16, 17);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  161  	KUNIT_EXPECT_NE(test, error, 0);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  162  
c032ace71c29d5 Dmitry Torokhov 2019-12-04  163  	error = fwnode_property_read_u16(node, "no-prop-u16", &val_u16);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  164  	KUNIT_EXPECT_NE(test, error, 0);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  165  
c032ace71c29d5 Dmitry Torokhov 2019-12-04  166  	error = fwnode_property_read_u16_array(node, "no-prop-u16", array_u16, 1);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  167  	KUNIT_EXPECT_NE(test, error, 0);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  168  
c032ace71c29d5 Dmitry Torokhov 2019-12-04  169  	error = fwnode_property_read_u32(node, "prop-u32", &val_u32);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  170  	KUNIT_EXPECT_EQ(test, error, 0);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  171  	KUNIT_EXPECT_EQ(test, (int)val_u32, 32);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  172  
c032ace71c29d5 Dmitry Torokhov 2019-12-04  173  	error = fwnode_property_read_u32_array(node, "prop-u32", array_u32, 1);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  174  	KUNIT_EXPECT_EQ(test, error, 0);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  175  	KUNIT_EXPECT_EQ(test, (int)array_u32[0], 32);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  176  
c032ace71c29d5 Dmitry Torokhov 2019-12-04  177  	error = fwnode_property_read_u32_array(node, "prop-u32", array_u32, 2);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  178  	KUNIT_EXPECT_EQ(test, error, 0);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  179  	KUNIT_EXPECT_EQ(test, (int)array_u32[0], 32);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  180  	KUNIT_EXPECT_EQ(test, (int)array_u32[1], 33);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  181  
c032ace71c29d5 Dmitry Torokhov 2019-12-04  182  	error = fwnode_property_read_u32_array(node, "prop-u32", array_u32, 17);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  183  	KUNIT_EXPECT_NE(test, error, 0);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  184  
c032ace71c29d5 Dmitry Torokhov 2019-12-04  185  	error = fwnode_property_read_u32(node, "no-prop-u32", &val_u32);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  186  	KUNIT_EXPECT_NE(test, error, 0);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  187  
c032ace71c29d5 Dmitry Torokhov 2019-12-04  188  	error = fwnode_property_read_u32_array(node, "no-prop-u32", array_u32, 1);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  189  	KUNIT_EXPECT_NE(test, error, 0);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  190  
c032ace71c29d5 Dmitry Torokhov 2019-12-04  191  	error = fwnode_property_read_u64(node, "prop-u64", &val_u64);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  192  	KUNIT_EXPECT_EQ(test, error, 0);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  193  	KUNIT_EXPECT_EQ(test, (int)val_u64, 64);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  194  
c032ace71c29d5 Dmitry Torokhov 2019-12-04  195  	error = fwnode_property_read_u64_array(node, "prop-u64", array_u64, 1);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  196  	KUNIT_EXPECT_EQ(test, error, 0);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  197  	KUNIT_EXPECT_EQ(test, (int)array_u64[0], 64);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  198  
c032ace71c29d5 Dmitry Torokhov 2019-12-04  199  	error = fwnode_property_read_u64_array(node, "prop-u64", array_u64, 2);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  200  	KUNIT_EXPECT_EQ(test, error, 0);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  201  	KUNIT_EXPECT_EQ(test, (int)array_u64[0], 64);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  202  	KUNIT_EXPECT_EQ(test, (int)array_u64[1], 65);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  203  
c032ace71c29d5 Dmitry Torokhov 2019-12-04  204  	error = fwnode_property_read_u64_array(node, "prop-u64", array_u64, 17);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  205  	KUNIT_EXPECT_NE(test, error, 0);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  206  
c032ace71c29d5 Dmitry Torokhov 2019-12-04  207  	error = fwnode_property_read_u64(node, "no-prop-u64", &val_u64);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  208  	KUNIT_EXPECT_NE(test, error, 0);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  209  
c032ace71c29d5 Dmitry Torokhov 2019-12-04  210  	error = fwnode_property_read_u64_array(node, "no-prop-u64", array_u64, 1);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  211  	KUNIT_EXPECT_NE(test, error, 0);
c032ace71c29d5 Dmitry Torokhov 2019-12-04  212  
c032ace71c29d5 Dmitry Torokhov 2019-12-04  213  	fwnode_remove_software_node(node);
c032ace71c29d5 Dmitry Torokhov 2019-12-04 @214  }
c032ace71c29d5 Dmitry Torokhov 2019-12-04  215  

:::::: The code at line 214 was first introduced by commit
:::::: c032ace71c29d513bf9df64ace1885fe5ff24981 software node: add basic tests for property entries

:::::: TO: Dmitry Torokhov <dmitry.torokhov@gmail.com>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
