Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B1928373
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jan 2025 01:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737337108; cv=none; b=Cqj0IX3CVfRg1LuyCQME26tDC0d9RQz+jv4tjdN9SNMhJK8dzXKSbS8NCfLXXnhd83hSM4t/kFICN4T6UkMt3AnoT+SjkvGcVqG0L0yrmv6kflBadiSwTpywEyoL/ljCTtbY82C0lgJp7+FhVhwhcWXQd1aU48TnNgHBWpdOZDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737337108; c=relaxed/simple;
	bh=gePPZWI5Kff6CFqcXf6kILY4V2N0r5Fbsrvxe/B4raM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L+oGRruamRZP0DR7ZHm+TlCamzPmCOUTSGShxVjyAE0Fygp8OTHwPER2sSvRAw3eFwU7WVpEopp9r/uAi/+1h6P4k4jWdgDby4Vv+9PnhdMTY9Qi1QB7KUDlMajxGJF+YT/INSFuatXO7WYgYbGju695QfL854StGWdVMJ2gMpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WTVZkXTI; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WTVZkXTI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737337107; x=1768873107;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gePPZWI5Kff6CFqcXf6kILY4V2N0r5Fbsrvxe/B4raM=;
  b=WTVZkXTI0A211VWp0/dtFEmA/6eLN8AQWV7Wh/ZQUt/gPn1EvfQhBmJR
   ph1ogDadDUdy84l+baNShUUZ0h+He2EtL+NddFKoCDYU6rM+FaZG7KwIz
   C6xj2ZFKZ1oBtIwpgrHxXcYoB+C4u8wdFPoupAVZGc4bWGs6gG2bXTZgz
   P1GdDFeI9rZMEFHLYPRb9LaRoeqRLRF7N5wpOQbmeNPAvtBvRi3pb47hi
   /M9nkRs3E3iPcBUwvSKW1zyYkHi4KKHqfVa5FQ1HN5AoWX3HpfxB+aXvu
   /O0T7aq2msZk7hXDcaobaxQXjfjLvUQTlkJK+PqMiasDtl/jLcEXj5UGI
   g==;
X-CSE-ConnectionGUID: 3uIz/NJwTTiIskIvLSHrDg==
X-CSE-MsgGUID: EMt+YAXMT2KXWoRmmMU88A==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="41365400"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="41365400"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 17:38:26 -0800
X-CSE-ConnectionGUID: G3bISvqeRuSdCQp6oSgAyQ==
X-CSE-MsgGUID: pdlzElQJQaOLbc4dz7/rRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="111319563"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 19 Jan 2025 17:38:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZgkB-000W1p-0W;
	Mon, 20 Jan 2025 01:38:23 +0000
Date: Mon, 20 Jan 2025 09:37:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 333/333] drivers/rtc/rtc-mt6685.c:22:6:
 warning: no previous prototype for function 'power_on_mclk'
Message-ID: <202501200913.Ar8ILlC3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   57406f61d18c1c4fd302b7f258dbf947062f55c9
commit: 2fd541a9d43eceddbb3b4bfd2872a1655f335e09 [333/333] CHROMIUM: rtc: mediatek: Add mt6685 RTC driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250120/202501200913.Ar8ILlC3-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250120/202501200913.Ar8ILlC3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501200913.Ar8ILlC3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/rtc/rtc-mt6685.c:22:6: warning: no previous prototype for function 'power_on_mclk' [-Wmissing-prototypes]
      22 | void power_on_mclk(struct mt6685_rtc *rtc)
         |      ^
   drivers/rtc/rtc-mt6685.c:22:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      22 | void power_on_mclk(struct mt6685_rtc *rtc)
         | ^
         | static 
   1 warning generated.


vim +/power_on_mclk +22 drivers/rtc/rtc-mt6685.c

    21	
  > 22	void power_on_mclk(struct mt6685_rtc *rtc)
    23	{
    24		guard(mutex)(&rtc->clk_lock);
    25		/* Power on RTC MCLK and 32k clk before write RTC register */
    26		regmap_write(rtc->regmap, RG_RTC_32K_CK_PDN_CLR, RG_RTC_32K_CK_PDN_MASK);
    27		regmap_write(rtc->regmap, RG_RTC_MCLK_PDN_CLR, RG_RTC_MCLK_PDN_MASK);
    28	
    29		rtc->clk_cnt++;
    30	
    31		mdelay(1);
    32	}
    33	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
