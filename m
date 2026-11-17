Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925888;
	b=fYNjOGZHdd1ziq4/BlKfdp99nvTmW1+dH38/hSefMUIhtGG32pwixb80ivQMJDa5cSi8
	 cPY157Jesew4TyKwE4WbUvgHJoNF85yWs7FlI0sa519tr4QiG0JfXDnkrSElDlpKf/TH/
	 dSAEOoYKLaCyxnf8D7Vw1PNDblGUOV4yTuaeloebTvb5bNWMG96gjNAc6KywvcL7y57i5
	 hGQHxEP1d3UJ9Mahhsi/vA9hJfaCkDVouafcYkDuT8C4pxkr24FHxGziuBxWREstIeVGe
	 WMRiSoyMh2oIA8UZlkmTCTX5PFEJ/x4ZMEqdNnAG5yUEq3TCwrXUKxTQ3Ve9ZYN6Pvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925888;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=xH9tcZglWaJ1kiuRkFTkQX6gMj5CAyVcpOW6g2tqcJU=;
	b=e0DMPZfltnPT38srJPSKjQIgoeuhQaDz+GJshP39cLK1Cqq20r0YS0nNS9vk9191quhL
	 AejUAePgGk5GYUz5NY4IS4Z75w2WrDkU5clwrdxTllEHi8KvU3duxnDt5jb2Hv8KRjv9Y
	 nXC1pEoNfz2ar9B0JjdVQogv6W5b7IogfDTMYjcDu8cr8yzodhsp8oc/YlwYp3hV6zBHB
	 UnqD4FRo9yO6B8CydRSGA6uBUsjrgi7VN1BW6BvY24qy5MFKsr1W+8KlI1dLeLHzUCSYg
	 wRLq+DdCCpr1fscnaFtQ7I42Jgz3OyzwWehPaT11oQNu6KyzrmHAbVU4mJ3q8LJFTDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A5BwESyG;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E669606A32F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Nov 2026 14:31:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E669606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A5BwESyG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794925888; x=1826461888;
  h=date:from:to:cc:subject:message-id;
  bh=qESQxRdtI0T0C25IAFaEYDROHtspRo5KVEHHKpLuNpc=;
  b=A5BwESyG2kHm/OlEItdnZSwUbTti3MMdVRoqq+gaf6Uk54SVB3h1q6Z6
   zN/Rlg1YEGRmd8UvEFy6kg0N1aHcI6zZn6AvNeq11ttm6vJPdISUefCC8
   bEgp1KS4rq6VUQzQPooPiH3/KfKba80VqQGyXOGVuzsTcmQxFIz7HpWzy
   sNx9ImasiOldhQdaxyAq7MnxiViWZDHY1UXJLi9czCkmCA+IslKeydezH
   5Q32sT9NCs16fULgRaLV7J9fFBR5CfuvfYxaj5ISEuqrHcr4fDKRKxrGp
   nzG+ep48jB5fW81S1HjX3Mq6KeXxrSXKB+GfEFzMKzugL+yjlydLYq8ZC
   w==;
X-CSE-ConnectionGUID: cg1rswKmTQuuon352IDmhg==
X-CSE-MsgGUID: 9m/2TUwXTK+HFuXHMHxdvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3580055"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3580055"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 06:25:10 -0800
X-CSE-ConnectionGUID: ourVcQSAQqSIsB/sk5cHgg==
X-CSE-MsgGUID: vjTNCCnSQledtl0jskpUsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="10108617"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 17 Nov 2026 06:25:08 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTK7O-0000000038M-1Jvs;
	Tue, 17 Nov 2026 14:25:06 +0000
Date: Tue, 17 Nov 2026 15:24:57 +0100
From: kernel test robot <lkp@intel.com>
To: Raghav Sharma <raghav.s@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>
Subject: [linux-next:master 7081/7459]
 arch/arm64/boot/dts/exynos/exynos8855-smdk.dtb: /soc@0/syscon@15420000:
 failed to match any schema with compatible:
 ['samsung,exynos8855-peric-sysreg', 'syscon']
Message-ID: <20261117151852.s7PLBra6-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   749a4de370409464cf8501ec5b2451df45c84eb4
commit: 14a87bfb0614d87b04134156e090d7b00590d2b2 [7081/7459] arm64: dts: exynos8855: add cmu_top & cmu_peric clock DT nodes
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261117/20261117151852.s7PLBra6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev7+g0fcb8d81a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/20261117151852.s7PLBra6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261117151852.s7PLBra6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/exynos/exynos8855-smdk.dtb: /soc@0/syscon@15420000: failed to match any schema with compatible: ['samsung,exynos8855-peric-sysreg', 'syscon']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
