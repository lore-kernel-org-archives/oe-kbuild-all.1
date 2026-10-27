Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793135153;
	b=PDkhcCl/mc/O/CQw5nP2oQnThgF7Afeb62/bURA/rNPiRM0Z+Xfm0E2fr6mRInJjMXGi
	 IGR4XltC9G7FB/QI+8M7rSMBpWu+eBD3o92R9m2AZ3YVF8T8AgaRL8OvVsywvFqRk1prf
	 mrwp63mw7ZiyovrTcCsG4/ym7qxT4bF+Gw0m6CBUtALglRPSA9DWFHXa3SQr58u7wwXGO
	 MQzubE92GcVWnDyaFDfInmhMOKMiLIES0iCEbKIeK1PmpQfIlL0kzV8GHScW6Uo8p/xrL
	 B0WMCQHQDLXaq/xCq+KNXu/4Ki2we6CPUkjPwOPOXF0OVUanXxIloBJNJpIaXiinpAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793135153;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=CXsqtt6SORpTLyFeEx19H0kjE0sN1WPUCu0mO/HsW2k=;
	b=I+rf+Sm2thg9wAwX4LBzi01Rr79YEDKZFBfDuYAnPa0Yr6lmNFm9cp4Q+bmFC5qmMk1/
	 pZyt4CIPV1PZr1SLq9vGrovmjo9bCV6CHTjMXOVQunPXPF79r1ToZelY0hEbSPg0Sh6NA
	 0WJ0IyiIak2/tTNJrC9UeJmYbgFH2nDMTpaRXOwie1N3ETFZlEQLe6sUboteWCaPmEFGz
	 AG0SiuiXUA2e+3cAqyV2F5i5oa8vgnV5mjvESi+VkRyTMKIb+w06BdVAEnIIqaLwjKHuc
	 5UMsZO1zlXMawh2Z7sX1aAxVR81XUYhlwQI32Xg90cCMYGT+jBPEhIn22iiinq9gdZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="BgX/xqE2";
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63F0606A320
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Oct 2026 21:05:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C63F0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BgX/xqE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793135152; x=1824671152;
  h=date:from:to:cc:subject:message-id;
  bh=/kSoFj5vbOWlwmFOXKRqMSwmf7OZMJ8Cn4Emv932tC8=;
  b=BgX/xqE2db8412tZrdQ++TcfGEzKSwxeyGDXHg/XawTgmP6jzvQKlJaZ
   3k93C6nqNRaHMZMinn7/MEBc3a2VTUkoxjiGxL0O0WMreafimpzK7Jy4p
   A81fCj4/DfFoZezvGT0xjCBGlU3FR+l7OoGGN8BAUeCTQ/MKmonql7vST
   Ez/srBzb06SbWkEjRynrOxHQla/nNTdcXu+HMzqBjIsu2SdifzgqSG0ZI
   1HkPyZh2IRraDBF1m1HZvIBbB/tdgiDFO/RKLn5zT3XoBKc32Ip06wx8w
   69GWR2fUoNQ5Aeg5Pggp3c1pQlmlDzy1bNra0BJy/Xo+NGiMZv9Tx543c
   w==;
X-CSE-ConnectionGUID: QdSYouDySHGyzB4fp3HlxA==
X-CSE-MsgGUID: 64tItxzbRmCKUcMe9i2eHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1861589"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1861589"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 14:05:49 -0700
X-CSE-ConnectionGUID: gXpzVjxHSQyAazIdDLAzXg==
X-CSE-MsgGUID: P42z9qJ8StegXQHetTitLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="5044867"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 27 Oct 2026 14:05:47 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLoMb-000000004ct-1HjI;
	Tue, 27 Oct 2026 21:05:45 +0000
Date: Tue, 27 Oct 2026 22:05:41 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 608/608]
 drivers/net/ethernet/linkdata/sxe2/sxe2pf/sxe2_main.c:1533:27: error:
 'sxe2_pm_resume' declared 'static' but never defined
Message-ID: <202610272133.7ecvtvgW-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi liujie_answer,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   e8129feece4324195ea94555f0d752df963558bf
commit: e0244015478adde7baee3a127e43091668d91289 [608/608] anolis: net: update linkdata ethernet driver features.
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261027/202610272133.7ecvtvgW-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610272133.7ecvtvgW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610272133.7ecvtvgW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/linkdata/sxe2/sxe2pf/sxe2_main.c:1533:27: error: 'sxe2_pm_resume' declared 'static' but never defined [-Werror=unused-function]
    1533 | static int __maybe_unused sxe2_pm_resume(struct device *dev);
         |                           ^~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxe2/sxe2pf/sxe2_main.c:1534:27: error: 'sxe2_pm_suspend' declared 'static' but never defined [-Werror=unused-function]
    1534 | static int __maybe_unused sxe2_pm_suspend(struct device *dev);
         |                           ^~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/net/ethernet/linkdata/sxe2vf/sxe2vf/sxe2vf_main.c:1864:27: error: 'sxe2vf_pm_resume' declared 'static' but never defined [-Werror=unused-function]
    1864 | static int __maybe_unused sxe2vf_pm_resume(struct device *dev);
         |                           ^~~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxe2vf/sxe2vf/sxe2vf_main.c:1865:27: error: 'sxe2vf_pm_suspend' declared 'static' but never defined [-Werror=unused-function]
    1865 | static int __maybe_unused sxe2vf_pm_suspend(struct device *dev);
         |                           ^~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +1533 drivers/net/ethernet/linkdata/sxe2/sxe2pf/sxe2_main.c

  1532	
> 1533	static int __maybe_unused sxe2_pm_resume(struct device *dev);
> 1534	static int __maybe_unused sxe2_pm_suspend(struct device *dev);
  1535	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
