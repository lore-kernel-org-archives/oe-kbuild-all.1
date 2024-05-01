Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C4045C16
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 May 2024 05:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714541473; cv=none; b=a5uhjft1DliGnOzLptafKDyuZn57dOw1RTnjiOk8RmmbrZSuVZ6qhwXnnVu8sEGJbaxenkU57jBcPTyBBsaOLL2ug9USWMolPBG0JtY3mJhwQlD8a4rJpBBP7eCs9MJKNmaboLiONNI+ElRAzhplao0JsNTruE4Hesb0GSXGKnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714541473; c=relaxed/simple;
	bh=wd8g5n9IYazR+NZBh8yNPwrxthTJ184Pfgig7TRWwSU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HhPZiXo7hgJ+mdkkVmWwmaBkwGvkIJL3TzM1ohyczcQ2P1vrLtVx5AKQtwKjYNemv7FyPEHeMQf4FHxqHh41A9eoVKatsXJj7+27fgmO3zqvUKXXrwWmqgdikD3Z7KD1sEvW+crQyprI2kRP/pKcOSQqU8XrAUxM5N4MZAukALk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RpIQ0jpw; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RpIQ0jpw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714541472; x=1746077472;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wd8g5n9IYazR+NZBh8yNPwrxthTJ184Pfgig7TRWwSU=;
  b=RpIQ0jpwGjQXaCnNq/pOwGRrhNpCyw9m1NjowFm5FwXOL1fcsCtB0MxV
   A/2gjAB30Xb874AXNI3BWrkoi74E1/rNYHWjG2vXJAaRTBpM20M5c2JBJ
   2mF7g/DFTRHKPXhV6A9gYfKP703fb/w+bI0GYd+o+IuOCn46qQcr0PTeD
   VsRXnzVRI/lZRtZh88fRbZG2RmfJl2RjhlPGKybmvOzEp2cJpokRFutZ8
   o4uwAOVM303vEz36YvED2TwPj1vng5qzZyZy03OEkN3D8UsXfyg1vtYai
   XDe0sFb+O0SGZWuKqfn+pI3AHURs7U3R6PLr6v96wH9jMrNEdLxvnthAn
   A==;
X-CSE-ConnectionGUID: e2vLGLwgTvaSGr2gefFBdA==
X-CSE-MsgGUID: 52R+2ks0RmOjsHH/t8Zs/g==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="10435471"
X-IronPort-AV: E=Sophos;i="6.07,244,1708416000"; 
   d="scan'208";a="10435471"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 22:31:11 -0700
X-CSE-ConnectionGUID: MHu7g47bTfq50QN25jrRjQ==
X-CSE-MsgGUID: zy+wbNHYTL2+op9HIe325g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,244,1708416000"; 
   d="scan'208";a="26699837"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 30 Apr 2024 22:31:09 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s22Yd-0008tM-0f;
	Wed, 01 May 2024 05:31:07 +0000
Date: Wed, 1 May 2024 13:30:22 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 9704/9709]
 net/wireless/tests/scan.c:377:(.text+0xf78): relocation truncated to fit:
 R_RISCV_GPREL_I against `.LANCHOR1'
Message-ID: <202405011322.fj6SQixq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d04466706db5e241ee026f17b5f920e50dee26b5
commit: 74adb5ef7e12b40b55319675a7b157e4575ec06b [9704/9709] Merge branch 'for-next/kspp' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git
config: riscv-randconfig-r012-20230803 (https://download.01.org/0day-ci/archive/20240501/202405011322.fj6SQixq-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240501/202405011322.fj6SQixq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405011322.fj6SQixq-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: section .data LMA [0000000001b76000,000000000347bf0f] overlaps section .text LMA [00000000001017a0,0000000002cd69a7]
   riscv64-linux-ld: section .init.pi.text LMA [0000000002cd69a8,0000000002cd8893] overlaps section .data LMA [0000000001b76000,000000000347bf0f]
   riscv64-linux-ld: section .got LMA [000000000347bf10,000000000347bf1f] overlaps section .rodata LMA [0000000002cd8c00,0000000003aa71b5]
   riscv64-linux-ld: section .init.pi.rodata.str1.8 VMA [ffffffff83aa71b8,ffffffff83aa723a] overlaps section .bss VMA [ffffffff83a66000,ffffffff84ad189f]
   net/wireless/tests/scan.o: in function `test_inform_bss_ssid_only':
>> net/wireless/tests/scan.c:377:(.text+0xf78): relocation truncated to fit: R_RISCV_GPREL_I against `.LANCHOR1'


vim +377 net/wireless/tests/scan.c

9d027a35a52a4e Benjamin Berg 2023-12-20  334  
9d027a35a52a4e Benjamin Berg 2023-12-20  335  static void test_inform_bss_ssid_only(struct kunit *test)
9d027a35a52a4e Benjamin Berg 2023-12-20  336  {
9d027a35a52a4e Benjamin Berg 2023-12-20  337  	struct inform_bss ctx = {
9d027a35a52a4e Benjamin Berg 2023-12-20  338  		.test = test,
9d027a35a52a4e Benjamin Berg 2023-12-20  339  	};
9d027a35a52a4e Benjamin Berg 2023-12-20  340  	struct wiphy *wiphy = T_WIPHY(test, ctx);
9d027a35a52a4e Benjamin Berg 2023-12-20  341  	struct t_wiphy_priv *w_priv = wiphy_priv(wiphy);
9d027a35a52a4e Benjamin Berg 2023-12-20  342  	struct cfg80211_inform_bss inform_bss = {
9d027a35a52a4e Benjamin Berg 2023-12-20  343  		.signal = 50,
9d027a35a52a4e Benjamin Berg 2023-12-20  344  		.drv_data = &ctx,
9d027a35a52a4e Benjamin Berg 2023-12-20  345  	};
9d027a35a52a4e Benjamin Berg 2023-12-20  346  	const u8 bssid[ETH_ALEN] = { 0x10, 0x22, 0x33, 0x44, 0x55, 0x66 };
9d027a35a52a4e Benjamin Berg 2023-12-20  347  	u64 tsf = 0x1000000000000000ULL;
9d027a35a52a4e Benjamin Berg 2023-12-20  348  	int beacon_int = 100;
9d027a35a52a4e Benjamin Berg 2023-12-20  349  	u16 capability = 0x1234;
9d027a35a52a4e Benjamin Berg 2023-12-20  350  	static const u8 input[] = {
9d027a35a52a4e Benjamin Berg 2023-12-20  351  		[0] = WLAN_EID_SSID,
9d027a35a52a4e Benjamin Berg 2023-12-20  352  		[1] = 4,
9d027a35a52a4e Benjamin Berg 2023-12-20  353  		[2] = 'T', 'E', 'S', 'T'
9d027a35a52a4e Benjamin Berg 2023-12-20  354  	};
9d027a35a52a4e Benjamin Berg 2023-12-20  355  	struct cfg80211_bss *bss, *other;
9d027a35a52a4e Benjamin Berg 2023-12-20  356  	const struct cfg80211_bss_ies *ies;
9d027a35a52a4e Benjamin Berg 2023-12-20  357  
9d027a35a52a4e Benjamin Berg 2023-12-20  358  	w_priv->ops->inform_bss = inform_bss_inc_counter;
9d027a35a52a4e Benjamin Berg 2023-12-20  359  
9d027a35a52a4e Benjamin Berg 2023-12-20  360  	inform_bss.chan = ieee80211_get_channel_khz(wiphy, MHZ_TO_KHZ(2412));
9d027a35a52a4e Benjamin Berg 2023-12-20  361  	KUNIT_ASSERT_NOT_NULL(test, inform_bss.chan);
9d027a35a52a4e Benjamin Berg 2023-12-20  362  
9d027a35a52a4e Benjamin Berg 2023-12-20  363  	bss = cfg80211_inform_bss_data(wiphy, &inform_bss,
9d027a35a52a4e Benjamin Berg 2023-12-20  364  				       CFG80211_BSS_FTYPE_PRESP, bssid, tsf,
9d027a35a52a4e Benjamin Berg 2023-12-20  365  				       capability, beacon_int,
9d027a35a52a4e Benjamin Berg 2023-12-20  366  				       input, sizeof(input),
9d027a35a52a4e Benjamin Berg 2023-12-20  367  				       GFP_KERNEL);
9d027a35a52a4e Benjamin Berg 2023-12-20  368  	KUNIT_EXPECT_NOT_NULL(test, bss);
9d027a35a52a4e Benjamin Berg 2023-12-20  369  	KUNIT_EXPECT_EQ(test, ctx.inform_bss_count, 1);
9d027a35a52a4e Benjamin Berg 2023-12-20  370  
9d027a35a52a4e Benjamin Berg 2023-12-20  371  	/* Check values in returned bss are correct */
9d027a35a52a4e Benjamin Berg 2023-12-20  372  	KUNIT_EXPECT_EQ(test, bss->signal, inform_bss.signal);
9d027a35a52a4e Benjamin Berg 2023-12-20  373  	KUNIT_EXPECT_EQ(test, bss->beacon_interval, beacon_int);
9d027a35a52a4e Benjamin Berg 2023-12-20  374  	KUNIT_EXPECT_EQ(test, bss->capability, capability);
9d027a35a52a4e Benjamin Berg 2023-12-20  375  	KUNIT_EXPECT_EQ(test, bss->bssid_index, 0);
9d027a35a52a4e Benjamin Berg 2023-12-20  376  	KUNIT_EXPECT_PTR_EQ(test, bss->channel, inform_bss.chan);
9d027a35a52a4e Benjamin Berg 2023-12-20 @377  	KUNIT_EXPECT_MEMEQ(test, bssid, bss->bssid, sizeof(bssid));
9d027a35a52a4e Benjamin Berg 2023-12-20  378  
9d027a35a52a4e Benjamin Berg 2023-12-20  379  	/* Check the IEs have the expected value */
9d027a35a52a4e Benjamin Berg 2023-12-20  380  	rcu_read_lock();
9d027a35a52a4e Benjamin Berg 2023-12-20  381  	ies = rcu_dereference(bss->ies);
9d027a35a52a4e Benjamin Berg 2023-12-20  382  	KUNIT_EXPECT_NOT_NULL(test, ies);
9d027a35a52a4e Benjamin Berg 2023-12-20  383  	KUNIT_EXPECT_EQ(test, ies->tsf, tsf);
9d027a35a52a4e Benjamin Berg 2023-12-20  384  	KUNIT_EXPECT_EQ(test, ies->len, sizeof(input));
9d027a35a52a4e Benjamin Berg 2023-12-20  385  	KUNIT_EXPECT_MEMEQ(test, ies->data, input, sizeof(input));
9d027a35a52a4e Benjamin Berg 2023-12-20  386  	rcu_read_unlock();
9d027a35a52a4e Benjamin Berg 2023-12-20  387  
9d027a35a52a4e Benjamin Berg 2023-12-20  388  	/* Check we can look up the BSS - by SSID */
9d027a35a52a4e Benjamin Berg 2023-12-20  389  	other = cfg80211_get_bss(wiphy, NULL, NULL, "TEST", 4,
9d027a35a52a4e Benjamin Berg 2023-12-20  390  				 IEEE80211_BSS_TYPE_ANY,
9d027a35a52a4e Benjamin Berg 2023-12-20  391  				 IEEE80211_PRIVACY_ANY);
9d027a35a52a4e Benjamin Berg 2023-12-20  392  	KUNIT_EXPECT_PTR_EQ(test, bss, other);
9d027a35a52a4e Benjamin Berg 2023-12-20  393  	cfg80211_put_bss(wiphy, other);
9d027a35a52a4e Benjamin Berg 2023-12-20  394  
9d027a35a52a4e Benjamin Berg 2023-12-20  395  	/* Check we can look up the BSS - by BSSID */
9d027a35a52a4e Benjamin Berg 2023-12-20  396  	other = cfg80211_get_bss(wiphy, NULL, bssid, NULL, 0,
9d027a35a52a4e Benjamin Berg 2023-12-20  397  				 IEEE80211_BSS_TYPE_ANY,
9d027a35a52a4e Benjamin Berg 2023-12-20  398  				 IEEE80211_PRIVACY_ANY);
9d027a35a52a4e Benjamin Berg 2023-12-20  399  	KUNIT_EXPECT_PTR_EQ(test, bss, other);
9d027a35a52a4e Benjamin Berg 2023-12-20  400  	cfg80211_put_bss(wiphy, other);
9d027a35a52a4e Benjamin Berg 2023-12-20  401  
9d027a35a52a4e Benjamin Berg 2023-12-20  402  	cfg80211_put_bss(wiphy, bss);
9d027a35a52a4e Benjamin Berg 2023-12-20  403  }
9d027a35a52a4e Benjamin Berg 2023-12-20  404  

:::::: The code at line 377 was first introduced by commit
:::::: 9d027a35a52a4ea9400390ef4414e4e9dcd54193 wifi: cfg80211: tests: add some scanning related tests

:::::: TO: Benjamin Berg <benjamin.berg@intel.com>
:::::: CC: Johannes Berg <johannes.berg@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
