Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5614502F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Nov 2025 22:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762209992; cv=none; b=pHzqqlTwZI+XZzmlPCTDdlEE33+yp3++mKal6SJb5CGUA1W10uILKSajxkhtaSwrpiDuCcRKcAzwU4m4H2wQFUz+zcsx56uZj1h+7dKGMTntgBGnJYdrb0kaFRuSrQ9wi+7pRV9d/PAbPREFXXrve7PFonVVaUhJTso0Lv6VQfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762209992; c=relaxed/simple;
	bh=3BFmzO5z7y5PeVrUSAPdQUIbeqshhHqbkpLTkYaKUc8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nlpmlIMZjENb/BZBRaHLNRWHBSSdW3XrB4j8+MOOUOWwrpYh3Jwt5IFELQcIYa1h2n61eF7Ch66rh3FRDFlMX73laXVyco0nncmuDfwTI/yd82jT0A546fEeYH8QT6KNhN99JLyl4TWwAK3+DBN9lYEX1nV6C59gfm9SWJR7KsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ae/V/Jj6; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ae/V/Jj6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762209990; x=1793745990;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3BFmzO5z7y5PeVrUSAPdQUIbeqshhHqbkpLTkYaKUc8=;
  b=Ae/V/Jj6TCJF9FLH4XaUJeEHi/bVjSE6Hup+sfGTOkPvqBApjbPggFdM
   7CpLVAqHPBLRU1AbomLL1v4yqFVwpNCca7fI24XhenOgR5md6l8R3nsuT
   g1WHseVididw5/8WRkUsUyQPDSL2r1H4L6KFbHG9qPMVLH2uYhkzN+qwD
   aWuFxwFNPmyaytjYYyYEmYealgQu+sM036HeH304FRC3jpN0XyrLf/+mR
   KxMsmeCR29zZEf4PE/AJ05/aOdAk5sIqYzwOWVDhtq6QMTO3q+vrTPTFh
   frUcgVVqtNGSjVBBco1YL9kSaQoHYDPwFlrfyl3wJEi56IVCrBLRJ7bZJ
   Q==;
X-CSE-ConnectionGUID: EtiZm718Sfq29jMqzVNitg==
X-CSE-MsgGUID: aeiLI5YBSRC/nmYlI+0KNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="66909275"
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="66909275"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 14:46:30 -0800
X-CSE-ConnectionGUID: QwXvmGRASmGkM0d6HTgJJw==
X-CSE-MsgGUID: TXrNna5gSzi1CD6EeEWdkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="210502019"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 03 Nov 2025 14:46:29 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vG3Jj-000Qao-08;
	Mon, 03 Nov 2025 22:46:27 +0000
Date: Tue, 4 Nov 2025 06:45:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3098/3098] arch/x86/kernel/cpu/bpf-rvi.c:129:25:
 warning: no previous prototype for 'bpf_arch_flags'
Message-ID: <202511040644.p8pfMDIP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a29fc03bd0ddaf7388cf31604ef5bd9807585109
commit: c7103b690d364f20ccabd4acc558fa4a4b293364 [3098/3098] bpf: Add bpf_arch_flags kunc for x86
config: x86_64-randconfig-001-20251104 (https://download.01.org/0day-ci/archive/20251104/202511040644.p8pfMDIP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511040644.p8pfMDIP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511040644.p8pfMDIP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/cpu/bpf-rvi.c:129:25: warning: no previous prototype for 'bpf_arch_flags' [-Wmissing-prototypes]
     129 | __bpf_kfunc const char *bpf_arch_flags(enum arch_flags_type t, int i)
         |                         ^~~~~~~~~~~~~~


vim +/bpf_arch_flags +129 arch/x86/kernel/cpu/bpf-rvi.c

   128	
 > 129	__bpf_kfunc const char *bpf_arch_flags(enum arch_flags_type t, int i)
   130	{
   131		switch (t) {
   132		case X86_CAP:
   133			return x86_cap_flags[i];
   134		case X86_BUG:
   135			return x86_bug_flags[i];
   136		case X86_POWER:
   137			return x86_power_flags[i];
   138		case X86_POWER_SIZE:
   139			return (void *)ARRAY_SIZE(x86_power_flags);
   140		default:
   141			return NULL;
   142		}
   143	}
   144	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
