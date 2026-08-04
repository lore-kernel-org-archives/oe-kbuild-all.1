Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BB23E49CF
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Aug 2026 09:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785835077; cv=none; b=iwk4aPS1YscIMlVbKHA1z0ZrVM6oSTzkcM+ivKEQ0fg0ciT0jQjvdr+L5utj+TSY07PQqYUvoY4U1DG+dwHFq+mK5/ROMAL9ql54P7Ikl09h9a/blA+8O+eNPm8Cemq1tmUibfLKlnAugIvgKw2NBr03Y+P2BXvnS3w+mONGhrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785835077; c=relaxed/simple;
	bh=kUox5FyZWdQYdbie9z3BNp1uk/LrgRGr+ifhcEW4Y9I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FPLRgbcrNnuzxxzl7OFMYQ7jOKLCIfYC593Ls4vJpcqHIso8FEg8wp/sSkpC6lRS30dZEymuzlstIYbCjDqmX4V+jGZceX+V6f9ZUaRKKQWMZyam43orVr0JYqe1TlWD27MN0ipz+Ztb/OyIl61k+tXYd5B/9e3b1A4kKYqyiLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A+CU5iAm; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A+CU5iAm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785835076; x=1817371076;
  h=date:from:to:cc:subject:message-id;
  bh=kUox5FyZWdQYdbie9z3BNp1uk/LrgRGr+ifhcEW4Y9I=;
  b=A+CU5iAmMnZAqEVNdNkR/KUJtt+Z1XBO7Fd3+hpaupG/kXsRpoB1P7Nf
   cRu9ccPJqbtXt3vlAgpj6bLnGAtNdg9tmO8pLdQsSXSY9WUAtY6eJxRfD
   p9A4cc8ZKFQJ/aJNN+2HA2wRP0oBsmrkfi9dfUmdJ8yk7A8mIOxkO6JKP
   j0ONCDwNBbhrqJnDbgX7FRGhfcfQLH9xYU9+iba45lorb8CVUQ3M5LUFZ
   MkSwcPt7kkEUSC0HCqg/SYMkUaFcdW1LLJ/yiOXVYI1fpi+bOqtOzccmq
   B9hajvUtcIGwluXFvw4ZmsTOPKrtrOoukIs68IXoMtwGdjZiwr84Gf3SJ
   Q==;
X-CSE-ConnectionGUID: MPRSlXZERQSkmCRHakc/KA==
X-CSE-MsgGUID: F2GQDTVzTHSVXndu5mVaDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86150468"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="86150468"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 02:17:55 -0700
X-CSE-ConnectionGUID: RmZCVcF+RuqSkdwUl979YQ==
X-CSE-MsgGUID: xNQ3AlGzRpaQz6PYeuZVjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="263448286"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Aug 2026 02:17:54 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrBHT-000000009Wn-35ll;
	Tue, 04 Aug 2026 09:17:51 +0000
Date: Tue, 04 Aug 2026 17:17:03 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chenxing:mstar_v6_5_reorder 543/700]
 drivers/rtc/rtc-ssd20xd-rtcpwc.c:466:25: error: 'ms_rtc_of_match_table'
 undeclared here (not in a function); did you mean
 'ssd20xd_rtcpwc_of_match_table'?
Message-ID: <202608041741.g20pL7Hk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/linux-chenxing/linux.git mstar_v6_5_reorder
head:   1a5c60e65ea399670a5384b869c4958338af2799
commit: 5aec260a6a86a28889118148b047111b7075e183 [543/700] rtc: mstar: ssd20xd rtcpwc
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260804/202608041741.g20pL7Hk-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260804/202608041741.g20pL7Hk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608041741.g20pL7Hk-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/rtc/rtc-ssd20xd-rtcpwc.c:8:
>> drivers/rtc/rtc-ssd20xd-rtcpwc.c:466:25: error: 'ms_rtc_of_match_table' undeclared here (not in a function); did you mean 'ssd20xd_rtcpwc_of_match_table'?
     466 | MODULE_DEVICE_TABLE(of, ms_rtc_of_match_table);
         |                         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/module.h:244:15: note: in definition of macro 'MODULE_DEVICE_TABLE'
     244 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |               ^~~~
>> include/linux/module.h:244:21: error: '__mod_of__ms_rtc_of_match_table_device_table' aliased to undefined symbol 'ms_rtc_of_match_table'
     244 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |                     ^~~~~~
   drivers/rtc/rtc-ssd20xd-rtcpwc.c:466:1: note: in expansion of macro 'MODULE_DEVICE_TABLE'
     466 | MODULE_DEVICE_TABLE(of, ms_rtc_of_match_table);
         | ^~~~~~~~~~~~~~~~~~~


vim +466 drivers/rtc/rtc-ssd20xd-rtcpwc.c

   461	
   462	static const struct of_device_id ssd20xd_rtcpwc_of_match_table[] = {
   463		{ .compatible = "sstar,ssd20xd-rtcpwc" },
   464		{ }
   465	};
 > 466	MODULE_DEVICE_TABLE(of, ms_rtc_of_match_table);
   467	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
