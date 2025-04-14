Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A3476410
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Apr 2025 12:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744632356; cv=none; b=VcarWG3eAa0psyjVR3Tm407k8yJLx+vqMT2si8zGhY3872uFTbTqP6Yl/G6JHQ4Rn1KKMm7TORUDNVlin6Noo+5wA8oV6EGZYJBC4kie4J+DElBR1rEKZC0kFigQPCSjTe17Jv5Zqzu4mJx0Gl6X+EQshI4CUXlbz0e2X/kPx24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744632356; c=relaxed/simple;
	bh=NeKBnKPC5g0J1V+qCeFXfljOUGhpf9ND/R3NsCvkzCo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DcFVzY1zyjy2+GoUomkAcNl0hxj5n0luq8J2smOXeOs56hJDTT8MX2K6h2GWk1LN4ebxKVk+0yaRB4DOQmwhgFx7aF5qDP3/O8ChmzPdI1q0GEnEqxJBOkOdWd3r9V7xJzy9jXqD/CAnIerKnHtuYMcd6fBxtRBe2N281TX2qfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P5wb2tW/; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P5wb2tW/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744632355; x=1776168355;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NeKBnKPC5g0J1V+qCeFXfljOUGhpf9ND/R3NsCvkzCo=;
  b=P5wb2tW/hdGH/5IMR8matHLtrBRAOMovAzxDhkqxFyaUeuDH6ESPMWe0
   puJ1tFkQ1LT/eurjMGvHNkYMo5pvtaXVCyAGFzmf3ogykR9tnR6x1crCm
   mh64zHYdhLnpos0d4swMmZoxtEus4E78NoA7l1pwTIQC+zD/+AafTrQwg
   BE2qJ/Pu0O6/q60a7gEEanma/anZtpMC1+pv4s4ZBGzmdU+T8yzHGAVGf
   v2Dcs3vFU6vifEz+vrzx5vI+rAMJX3iyXME5jRd4LQA3B6qOyhKZhcER1
   fQD21ysHXr3+0YryHE7Ve4jSOchvifnu9tnXahm/1KKaVWYmh7c6g6cNR
   g==;
X-CSE-ConnectionGUID: DaFOc3PpTUaubBgas0H+6g==
X-CSE-MsgGUID: V9FMCw7aSEK5ZA7hQ1vlhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="45986166"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="45986166"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 05:05:54 -0700
X-CSE-ConnectionGUID: xoebIWfOSm6I9Fr+yecE+Q==
X-CSE-MsgGUID: T8aJlek6SV2mNCOvordzYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="130773156"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 Apr 2025 05:05:54 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4IZT-000E9g-0f;
	Mon, 14 Apr 2025 12:05:51 +0000
Date: Mon, 14 Apr 2025 20:04:56 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Tong Tiangen <tongtiangen@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2121/2121] mm/kasan/shadow.c:90: undefined
 reference to `__memcpy_mc'
Message-ID: <202504142028.WisA9n7Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   856215a06729654f070692189189edc4570084a0
commit: b991780c836ceb9a479c6c6e385e914b487e353a [2121/2121] arm64: introduce copy_mc_to_kernel() implementation
config: arm64-randconfig-003-20250414 (https://download.01.org/0day-ci/archive/20250414/202504142028.WisA9n7Q-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250414/202504142028.WisA9n7Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504142028.WisA9n7Q-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: mm/kasan/shadow.o: in function `memcpy_mc':
>> mm/kasan/shadow.c:90: undefined reference to `__memcpy_mc'


vim +90 mm/kasan/shadow.c

    81	
    82	#ifdef __HAVE_ARCH_MEMCPY_MC
    83	#undef memcpy_mc
    84	int memcpy_mc(void *dest, const void *src, size_t len)
    85	{
    86		if (!kasan_check_range(src, len, false, _RET_IP_) ||
    87		    !kasan_check_range(dest, len, true, _RET_IP_))
    88			return (int)len;
    89	
  > 90		return __memcpy_mc(dest, src, len);
    91	}
    92	#endif
    93	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
