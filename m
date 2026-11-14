Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794666825;
	b=JVK1rLzkfaOqGMAva5cpeSYhG9d91ykJOB9JryorZyMkGw5qEQklaVlj1FRlWX0JrMGZ
	 FAZ2ur+dgfEtmgYrtFPst8JfL0+iyjEDvsRYMAcHujdoNR7jmClHFmlP0VLko9jfElwpz
	 /uxpTEIjjzKitXNoLXpfTPQLb+JI4176WJfEU/KRLYB2PkkFQq3WjG6a2Pi7tZd3uVgWB
	 QHEmSi3KKTibsd0NOCTEZJPWjZl2kE8z+eqi4IW37PcorT9JqcwF2PoVma5accOvCtpdJ
	 i3cFiy221+PL5+eFkN80VMjdtVzskd/Ii7fZtptozkuHxVlpqQurs2YEt69S87YR/kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794666825;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=99YOryFgd3WUa6Yjl/B2YyhTcVY4QI0DANzKejNnKHQ=;
	b=MdiCYMlY+5y9DssKiZZLpGTI+slpW+4HPmSbdYHocmNME967Sdvwzs7DYfQOfx6lgZae
	 fXeHzrKnozDyew3Zu0hqUofXblp0ql/+0q+COWh02I++SIrUSZJ2ddJmSYjsSzybbZ8DU
	 FxbjyZlRJdf0KXCfj+99FxhArDJAP94x6ovpWn8bhl8JjKrh07wbJr43w5++ig5mMmtjh
	 PC6+NQXjIEpT1ganbjKOCtIxkzSLPG7mT7DPNHewO5tdbe8H+DZuZ55E5zzpgCY2a+gN+
	 QnaZM6Pr31vU0eAjoV2B2Pa/P4tM/+UIRZBjZ76PRG5ELb/Nv/4dNP4PHsmvZx0Bzqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZUKcNFoK;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BD8606A323
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Nov 2026 14:33:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23BD8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZUKcNFoK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794666824; x=1826202824;
  h=date:from:to:cc:subject:message-id;
  bh=dRgMAo/vrlLl4VZYnut2zSSx2g/x+IAx/W26i1U3cmQ=;
  b=ZUKcNFoKOG2pjIQ/Q8zBwgEdAx+CNMBaC7phrSkzBQsfZV6NcjMefNGY
   uk/e05CxDdPKQNSwavs1PPH99NWwVyYvCY+71O0RqFoo2cA59f8bHOtB9
   T2bnt00GbsuPQLrbN7WMIGErlGdvHOTNnaPtehpL863qbN5q6qIW0UKcd
   Go7o4Po+K7wqKkeQVayaiubJqHQergR/cBU22miHdZSN9bvgcRu5V9maq
   k0ShOLXX6VnzfvrF1iedQtVXnfOeKp5BAYk7flwjx4qGpSKRobrrj71hA
   cutirWeJB6tCE2pD0LvnlJEmQV+8yVnXmHNXcmKbHg8bqrxsolSKSKBwR
   g==;
X-CSE-ConnectionGUID: f7Jr0oLTS3WoN5uVKXLoag==
X-CSE-MsgGUID: JZ4/Vy4MRjmOx33hHj3Cyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3457652"
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="3457652"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2026 06:33:43 -0800
X-CSE-ConnectionGUID: kQhCKi7aTnac1a0blRUi1A==
X-CSE-MsgGUID: S6ZyqE+TRhagGZHdC4+bNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="9243363"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 14 Nov 2026 06:33:42 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSEp2-000000001fD-1U2w;
	Sat, 14 Nov 2026 14:33:40 +0000
Date: Sat, 14 Nov 2026 15:33:06 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 0/6] ERROR: modpost:
 "asoc_sdw_get_codec_info_list_count"
 [sound/soc/sof/intel/snd-sof-intel-hda-generic.ko] undefined!
Message-ID: <202611141536.z6TPFkNb-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Bard,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   7c083a341351db9ca54c7d972208de38a5a62488
commit: dcf066e2640127f5a26ff2394968a8fe39220475 [0/6] UPSTREAM: ASoC: SOF: Intel: use sof_sdw as default SDW machine driver
config: i386-randconfig-2105-20261114 (https://download.01.org/0day-ci/archive/20261114/202611141536.z6TPFkNb-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261114/202611141536.z6TPFkNb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611141536.z6TPFkNb-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: memblock_end_of_DRAM: EXPORT_SYMBOL used for init symbol. Remove __init or EXPORT_SYMBOL.
>> ERROR: modpost: "asoc_sdw_get_codec_info_list_count" [sound/soc/sof/intel/snd-sof-intel-hda-generic.ko] undefined!
>> ERROR: modpost: "codec_info_list" [sound/soc/sof/intel/snd-sof-intel-hda-generic.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
