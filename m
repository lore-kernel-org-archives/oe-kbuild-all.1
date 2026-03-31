Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB46E33F8D6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 17:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774978410; cv=none; b=HRYHJnbAVIyqy4Nkv75UTSJospt+3dyaZoCMzU6DAKyTxyduldlw806hX7Qrc9vdA26rrLY6N96gQDlJ8nHwGzXLNb5zIMeyX9+nlmzXkiRFbY5cdD0XiPk4FeG/NE6QjG32CxWG0KdSHXmcBbwot9bPM2yjCBfzF/grg23DQlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774978410; c=relaxed/simple;
	bh=Rkxo8myz9J7g2Z83c4VYdC6+ONh21dTEIxhfuPEF5YY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K+N0oRIx3WGrhbmxMGx8qbyMQ+FG9c81oEFWiu1ZY4/kMzXZxiI2CvFAGeSGz3gBgxwHfz3oYd4PwfENzFWscUZGs1Bb84agja5zVhypP67ix1iH2R80Pfcl0+YILcW19GLimD3/iq6dPkTUNvvG+bx9r7uFa/+Vn+yehJtFYro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EvBvX9mf; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EvBvX9mf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774978409; x=1806514409;
  h=date:from:to:cc:subject:message-id;
  bh=Rkxo8myz9J7g2Z83c4VYdC6+ONh21dTEIxhfuPEF5YY=;
  b=EvBvX9mfjHRWJINj2HtXSSOSZDmbdVJGjgj3mfc2SdRNky5TW9ZaIl1u
   44BXE41YBfUHr5PgOPq1pdF9usw8AYraBy8UGuy0l/rOMRLDozhpI0KcU
   c7Bf+nF6YbzK37hVxbKkG2YD+yIrKYc8h8F23qt8LVssFMQJKyu32GX+X
   W1m8S3ncivZd8NBgxY/My8lwddyw9EzTrlQnFh60wrh6LOLImBOVNOwOJ
   BEZgzeBNZKg58Gs2ddr1tieOngsaGBzvb0TN7yqGiBPvFudPu3UPky6jD
   L86eYiUHXHnyP3PKkGiDzMuEgUCW1XZfv7Sc32UgjA7RWKU2I0jpz/24d
   w==;
X-CSE-ConnectionGUID: YbKpiARESrawiCugLQcF6g==
X-CSE-MsgGUID: zyLDkImrTyqP/+Z2cVIHlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="98610679"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="98610679"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 10:33:28 -0700
X-CSE-ConnectionGUID: edLDLB1qSFOjDCkOXE2cxw==
X-CSE-MsgGUID: cQ/vkmWCTVunLJwUy45bsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="226677289"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 31 Mar 2026 10:33:27 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7cxv-000000003wV-3wJx;
	Tue, 31 Mar 2026 17:33:23 +0000
Date: Wed, 01 Apr 2026 01:33:15 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2024-11 1/1]
 drivers/net/ethernet/microchip/vcap/vcap_api_kunit.c:2001:1: warning: the
 frame size of 1040 bytes is larger than 1024 bytes
Message-ID: <202604010103.GfNz6qMI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6-2024-11
head:   8afee3a5a02e86617a56f39a05fbdfe3e2d5a469
commit: 088b154d2680429192da6ee83622037659e8b862 [1/1] ANDROID: GKI: Add OEM data to mutex/rwsem
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260401/202604010103.GfNz6qMI-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604010103.GfNz6qMI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604010103.GfNz6qMI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/microchip/vcap/vcap_api.c:3598:
   drivers/net/ethernet/microchip/vcap/vcap_api_kunit.c: In function 'vcap_api_next_lookup_advanced_test':
>> drivers/net/ethernet/microchip/vcap/vcap_api_kunit.c:2001:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
    2001 | }
         | ^

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
   Depends on [n]: IOMMU_SUPPORT [=y] && (ARM [=y] || ARM64 || COMPILE_TEST [=y]) && !GENERIC_ATOMIC64 [=y]
   Selected by [y]:
   - GKI_HIDDEN_QCOM_CONFIGS [=y] && ARCH_QCOM [=y]


vim +2001 drivers/net/ethernet/microchip/vcap/vcap_api_kunit.c

c956b9b318d9036 Steen Hegelund 2022-11-09  1925  
c956b9b318d9036 Steen Hegelund 2022-11-09  1926  static void vcap_api_next_lookup_advanced_test(struct kunit *test)
c956b9b318d9036 Steen Hegelund 2022-11-09  1927  {
129ff4de58ff0ca Arnd Bergmann  2023-02-17  1928  	struct vcap_admin admin[] = {
129ff4de58ff0ca Arnd Bergmann  2023-02-17  1929  	{
c956b9b318d9036 Steen Hegelund 2022-11-09  1930  		.vtype = VCAP_TYPE_IS0,
c956b9b318d9036 Steen Hegelund 2022-11-09  1931  		.vinst = 0,
c956b9b318d9036 Steen Hegelund 2022-11-09  1932  		.first_cid = 1000000,
c956b9b318d9036 Steen Hegelund 2022-11-09  1933  		.last_cid =  1199999,
c956b9b318d9036 Steen Hegelund 2022-11-09  1934  		.lookups = 6,
c956b9b318d9036 Steen Hegelund 2022-11-09  1935  		.lookups_per_instance = 2,
129ff4de58ff0ca Arnd Bergmann  2023-02-17  1936  	}, {
c956b9b318d9036 Steen Hegelund 2022-11-09  1937  		.vtype = VCAP_TYPE_IS0,
c956b9b318d9036 Steen Hegelund 2022-11-09  1938  		.vinst = 1,
c956b9b318d9036 Steen Hegelund 2022-11-09  1939  		.first_cid = 1200000,
c956b9b318d9036 Steen Hegelund 2022-11-09  1940  		.last_cid =  1399999,
c956b9b318d9036 Steen Hegelund 2022-11-09  1941  		.lookups = 6,
c956b9b318d9036 Steen Hegelund 2022-11-09  1942  		.lookups_per_instance = 2,
129ff4de58ff0ca Arnd Bergmann  2023-02-17  1943  	}, {
c956b9b318d9036 Steen Hegelund 2022-11-09  1944  		.vtype = VCAP_TYPE_IS0,
c956b9b318d9036 Steen Hegelund 2022-11-09  1945  		.vinst = 2,
c956b9b318d9036 Steen Hegelund 2022-11-09  1946  		.first_cid = 1400000,
c956b9b318d9036 Steen Hegelund 2022-11-09  1947  		.last_cid =  1599999,
c956b9b318d9036 Steen Hegelund 2022-11-09  1948  		.lookups = 6,
c956b9b318d9036 Steen Hegelund 2022-11-09  1949  		.lookups_per_instance = 2,
129ff4de58ff0ca Arnd Bergmann  2023-02-17  1950  	}, {
c956b9b318d9036 Steen Hegelund 2022-11-09  1951  		.vtype = VCAP_TYPE_IS2,
c956b9b318d9036 Steen Hegelund 2022-11-09  1952  		.vinst = 0,
c956b9b318d9036 Steen Hegelund 2022-11-09  1953  		.first_cid = 8000000,
c956b9b318d9036 Steen Hegelund 2022-11-09  1954  		.last_cid = 8199999,
c956b9b318d9036 Steen Hegelund 2022-11-09  1955  		.lookups = 4,
c956b9b318d9036 Steen Hegelund 2022-11-09  1956  		.lookups_per_instance = 2,
129ff4de58ff0ca Arnd Bergmann  2023-02-17  1957  	}, {
c956b9b318d9036 Steen Hegelund 2022-11-09  1958  		.vtype = VCAP_TYPE_IS2,
c956b9b318d9036 Steen Hegelund 2022-11-09  1959  		.vinst = 1,
c956b9b318d9036 Steen Hegelund 2022-11-09  1960  		.first_cid = 8200000,
c956b9b318d9036 Steen Hegelund 2022-11-09  1961  		.last_cid = 8399999,
c956b9b318d9036 Steen Hegelund 2022-11-09  1962  		.lookups = 4,
c956b9b318d9036 Steen Hegelund 2022-11-09  1963  		.lookups_per_instance = 2,
129ff4de58ff0ca Arnd Bergmann  2023-02-17  1964  	}
c956b9b318d9036 Steen Hegelund 2022-11-09  1965  	};
c956b9b318d9036 Steen Hegelund 2022-11-09  1966  	bool ret;
c956b9b318d9036 Steen Hegelund 2022-11-09  1967  
129ff4de58ff0ca Arnd Bergmann  2023-02-17  1968  	vcap_test_api_init(&admin[0]);
129ff4de58ff0ca Arnd Bergmann  2023-02-17  1969  	list_add_tail(&admin[1].list, &test_vctrl.list);
129ff4de58ff0ca Arnd Bergmann  2023-02-17  1970  	list_add_tail(&admin[2].list, &test_vctrl.list);
129ff4de58ff0ca Arnd Bergmann  2023-02-17  1971  	list_add_tail(&admin[3].list, &test_vctrl.list);
129ff4de58ff0ca Arnd Bergmann  2023-02-17  1972  	list_add_tail(&admin[4].list, &test_vctrl.list);
c956b9b318d9036 Steen Hegelund 2022-11-09  1973  
c956b9b318d9036 Steen Hegelund 2022-11-09  1974  	ret = vcap_is_next_lookup(&test_vctrl, 1000000, 1001000);
c956b9b318d9036 Steen Hegelund 2022-11-09  1975  	KUNIT_EXPECT_EQ(test, false, ret);
c956b9b318d9036 Steen Hegelund 2022-11-09  1976  	ret = vcap_is_next_lookup(&test_vctrl, 1000000, 1101000);
c956b9b318d9036 Steen Hegelund 2022-11-09  1977  	KUNIT_EXPECT_EQ(test, true, ret);
c956b9b318d9036 Steen Hegelund 2022-11-09  1978  
c956b9b318d9036 Steen Hegelund 2022-11-09  1979  	ret = vcap_is_next_lookup(&test_vctrl, 1100000, 1201000);
c956b9b318d9036 Steen Hegelund 2022-11-09  1980  	KUNIT_EXPECT_EQ(test, true, ret);
c956b9b318d9036 Steen Hegelund 2022-11-09  1981  	ret = vcap_is_next_lookup(&test_vctrl, 1100000, 1301000);
784c3067d094dde Steen Hegelund 2023-01-14  1982  	KUNIT_EXPECT_EQ(test, true, ret);
c956b9b318d9036 Steen Hegelund 2022-11-09  1983  	ret = vcap_is_next_lookup(&test_vctrl, 1100000, 8101000);
784c3067d094dde Steen Hegelund 2023-01-14  1984  	KUNIT_EXPECT_EQ(test, true, ret);
c956b9b318d9036 Steen Hegelund 2022-11-09  1985  	ret = vcap_is_next_lookup(&test_vctrl, 1300000, 1401000);
c956b9b318d9036 Steen Hegelund 2022-11-09  1986  	KUNIT_EXPECT_EQ(test, true, ret);
c956b9b318d9036 Steen Hegelund 2022-11-09  1987  	ret = vcap_is_next_lookup(&test_vctrl, 1400000, 1501000);
c956b9b318d9036 Steen Hegelund 2022-11-09  1988  	KUNIT_EXPECT_EQ(test, true, ret);
c956b9b318d9036 Steen Hegelund 2022-11-09  1989  	ret = vcap_is_next_lookup(&test_vctrl, 1500000, 8001000);
c956b9b318d9036 Steen Hegelund 2022-11-09  1990  	KUNIT_EXPECT_EQ(test, true, ret);
c956b9b318d9036 Steen Hegelund 2022-11-09  1991  
c956b9b318d9036 Steen Hegelund 2022-11-09  1992  	ret = vcap_is_next_lookup(&test_vctrl, 8000000, 8001000);
c956b9b318d9036 Steen Hegelund 2022-11-09  1993  	KUNIT_EXPECT_EQ(test, false, ret);
c956b9b318d9036 Steen Hegelund 2022-11-09  1994  	ret = vcap_is_next_lookup(&test_vctrl, 8000000, 8101000);
c956b9b318d9036 Steen Hegelund 2022-11-09  1995  	KUNIT_EXPECT_EQ(test, true, ret);
c956b9b318d9036 Steen Hegelund 2022-11-09  1996  
c956b9b318d9036 Steen Hegelund 2022-11-09  1997  	ret = vcap_is_next_lookup(&test_vctrl, 8300000, 8301000);
c956b9b318d9036 Steen Hegelund 2022-11-09  1998  	KUNIT_EXPECT_EQ(test, false, ret);
c956b9b318d9036 Steen Hegelund 2022-11-09  1999  	ret = vcap_is_next_lookup(&test_vctrl, 8300000, 8401000);
784c3067d094dde Steen Hegelund 2023-01-14  2000  	KUNIT_EXPECT_EQ(test, false, ret);
c956b9b318d9036 Steen Hegelund 2022-11-09 @2001  }
c956b9b318d9036 Steen Hegelund 2022-11-09  2002  

:::::: The code at line 2001 was first introduced by commit
:::::: c956b9b318d9036701c471dd458f9ed31defc629 net: microchip: sparx5: Adding KUNIT tests of key/action values in VCAP API

:::::: TO: Steen Hegelund <steen.hegelund@microchip.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
