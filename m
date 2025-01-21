Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF4C8BFF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Jan 2025 00:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737420978; cv=none; b=fmUMoJlTr7+ULATENpvkZq0TXWMNEKrUWHf7vflxgXAgpKCxEJ2h2BGyKUcW/c88+Ipep3VqDj47k9KHFuh1w7JgvcnRGayT3wxM2NoDwQTBYIQhaafZm3zTP+7wOObuecSBVtNc1AnGW4RdV95Cgyx2ATTXNBEsIE0tpGKkNBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737420978; c=relaxed/simple;
	bh=OQ2ktPGFzjTLTawECSRTl0A8LRgwbsYMTI2ahG3KsOE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FiuMooZmw0Kr0f2kTqGZD4IgGiXhz6WK2+81Yv2Cu7cZTJIec3P8JJHgzR0BmCC+5xfFKXeNxrrzqkDn2CN8MS7xU1xOq4GMLjBGvpCjciSF/MzLlLrSubifCS9nNuqz2nXqqB4baihHqSvwCkrH9Pcp9GmdcLkWTqVG9c9UmVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RkeJDcIZ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RkeJDcIZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737420976; x=1768956976;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OQ2ktPGFzjTLTawECSRTl0A8LRgwbsYMTI2ahG3KsOE=;
  b=RkeJDcIZRtTf4DO8szEbvxoTk/MJIUXeean1rApyPHciy3cZAWhGbYBF
   /aKs8hajdDFT0actP5rphYE5tSzC9JDuY4ZsIDrl4OPouuiSy+tqwdf7K
   QpasayqpAG1wDCZdXtdQuQBIVCuLjaWYLPm6VAorn3Sq/q7NUh7tmQLtq
   m1n6q4gK+9LxAB47oCwnQyoUph+awgSrGLBNQejvBslDvZ7QqzPeCrMDZ
   iMmqdglIJnxQiVqS9RSA7BhKtVcSshPm4QgBXKFzC0nI0wWlvIPcmn3ql
   yEmtueRJBKlBsSHSPcEoqbyRMgN5/L5EUmGk9tP9tbRg5tuZ88p1Z3Aoa
   Q==;
X-CSE-ConnectionGUID: dVxpJ7cjR0iiGtH21EcpYg==
X-CSE-MsgGUID: /p3apqJaRveemp4QZO6jzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="55229344"
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; 
   d="scan'208";a="55229344"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 16:56:15 -0800
X-CSE-ConnectionGUID: 4CpagogkRC+scKzLz/L4vg==
X-CSE-MsgGUID: aTXdX0ozRQuNsx860JO4GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; 
   d="scan'208";a="111637333"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 Jan 2025 16:56:14 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ta2Yu-000XQh-0N;
	Tue, 21 Jan 2025 00:56:12 +0000
Date: Tue, 21 Jan 2025 08:55:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 336/336] drivers/rtc/rtc-mt6685.c:22:6:
 sparse: sparse: symbol 'power_on_mclk' was not declared. Should it be
 static?
Message-ID: <202501210804.UBzLda6o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   1f4dbd9903f644aa6c511f8a1e145ec3f4915d3a
commit: 2fd541a9d43eceddbb3b4bfd2872a1655f335e09 [336/336] CHROMIUM: rtc: mediatek: Add mt6685 RTC driver
config: arm64-randconfig-r131-20250121 (https://download.01.org/0day-ci/archive/20250121/202501210804.UBzLda6o-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce: (https://download.01.org/0day-ci/archive/20250121/202501210804.UBzLda6o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501210804.UBzLda6o-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/rtc/rtc-mt6685.c:22:6: sparse: sparse: symbol 'power_on_mclk' was not declared. Should it be static?

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
