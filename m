Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DF430FC05
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jan 2026 23:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768605089; cv=none; b=uR06fcPR4YbuxniXgmdCwnAk8ZE0AtyxerCmeCX/qCPZurDyS+FS75A+HFEob8l28qpihiqDPmveBW/wlGOsNtabc8ctWYxjEYtsZfqsz1hIdkdM7cjKdBYluzCBEKXjltCxgJ4AKbEO3Lj9QCUJsED2Iqg0qSaLX2qZ8kHCiQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768605089; c=relaxed/simple;
	bh=rdx70hYBsfrsRgYy+02Gn2hd+sAsTlF701w/BBjNuZE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AHHuHi6g0yorxq3grip+sF6QL0bOdNjqEgqtY0UPqU4TkwkhWc+05//TcLl124sD6kyNMg2XhervWijaoZED+kMPbLrLzLOqohlw8TaaF4NWgOfeIg0Z7L0lRbgHno9XuOIvvffs3F6SOkSAeasQvNLrCXVYUbyf3frBdLY5cPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kdb+xGNr; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kdb+xGNr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768605089; x=1800141089;
  h=date:from:to:cc:subject:message-id;
  bh=rdx70hYBsfrsRgYy+02Gn2hd+sAsTlF701w/BBjNuZE=;
  b=Kdb+xGNruiCUKiKPEDWk4+g1cEA+XlVmG84HWTcjs6SAHo7oLxo1wNCt
   7FgMxa1zcxA6rhTdxnZTqNYHqlVo6NDJ2JxBxrbNttekD6Id1Tb9omeIz
   uXn/n22pgQ+ucuH1+GflB2ECg/PzVlwdwU5+LnLpQ0uPIEaK9mju4j5GJ
   gXH5v4vOiWMlgOiQEiz07STgSQcEkgbGEbf4MqYEfaRXMwLHlL8nup8cT
   3HhYf65DJOTLOcvwvkH4n3d5eEVnnWoN6renL2GYBzolAVavFQR/LoMl5
   W9zRgs2Y+Z2OjM+0mihNGsH8sMDLKBvvr3bPcfzdUObvaP8Kv8N+wZUaK
   Q==;
X-CSE-ConnectionGUID: 9LgEBDTWSh2QnR/87Fjb8g==
X-CSE-MsgGUID: aduqFqUlRymYopvYtFNadw==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69656856"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="69656856"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 15:11:28 -0800
X-CSE-ConnectionGUID: /mJm+y72TFKv+Ywfe3iYgQ==
X-CSE-MsgGUID: P7/4JH2MRqaD9IyVOzlv1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="209496744"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 16 Jan 2026 15:11:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgsyR-00000000LKt-0gee;
	Fri, 16 Jan 2026 23:11:23 +0000
Date: Sat, 17 Jan 2026 07:11:02 +0800
From: kernel test robot <lkp@intel.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Corey Minyard <corey@minyard.net>, Chong Qiao <qiaochong@loongson.cn>,
 Huacai Chen <chenhuacai@loongson.cn>
Subject: drivers/char/ipmi/ipmi_si_ls2k.c:171:24: sparse: sparse:
 symbol 'ipmi_ls2k_platform_driver' was not declared. Should it be static?
Message-ID: <202601170753.3zDBerGP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b62ce2547fe8a8ba15857bb974bcad250c5420d6
commit: d46651d4e3c0caab554c4c591c0b6c3b026b1e93 ipmi: Add Loongson-2K BMC support
date:   4 months ago
config: loongarch-randconfig-r112-20260116 (https://download.01.org/0day-ci/archive/20260117/202601170753.3zDBerGP-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601170753.3zDBerGP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601170753.3zDBerGP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/char/ipmi/ipmi_si_ls2k.c:171:24: sparse: sparse: symbol 'ipmi_ls2k_platform_driver' was not declared. Should it be static?

vim +/ipmi_ls2k_platform_driver +171 drivers/char/ipmi/ipmi_si_ls2k.c

   170	
 > 171	struct platform_driver ipmi_ls2k_platform_driver = {
   172		.driver = {
   173			.name = "ls2k-ipmi-si",
   174		},
   175		.probe	= ipmi_ls2k_probe,
   176		.remove	= ipmi_ls2k_remove,
   177	};
   178	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
