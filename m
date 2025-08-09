Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4EA1F1311
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Aug 2025 09:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754733007; cv=none; b=EWJWQUiG8IvcVv+czV5NuuJ9IcYQx5BkKPQR0yg39bke9KRn3PiAJ304ZhDMP1/Rf/MkAi8NbdKxBBjYuxV3Ob/1UaSs2Zg3+JySE9sOsmGglKYnDYuCD0lD8GIywqE7O9otxdkw+58tN7+bDd6lfD1Fv35yHAq3jbHAvldgc0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754733007; c=relaxed/simple;
	bh=y2NimrbATQVoFr1N2v8HHZgSF8korxkvbxcvj7u54Ss=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=awwEp7cayXqVjFHckGXjFycbQR8IJcl//Pa7YQQRcKOIti22vBdffFxSqSC34NbohOSISLL7RM8nFjLm6ScUwRI54mdbjyh2vHqwzhm07uC4inoKrsv6qb6Bj2MmsuriMWlhKCieUif0J/J3PnWfnZpvXtL9j5MoSKaS8hmE0Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=It/DUe7p; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="It/DUe7p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754733005; x=1786269005;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y2NimrbATQVoFr1N2v8HHZgSF8korxkvbxcvj7u54Ss=;
  b=It/DUe7pRNrMK+C0UCtafVtCcT5ibaHy04Wh1wHEgQywuU11Ae0AJ6re
   QVIx6e6t/dLTJPWhU4dlUvw7tPA30wh5lsVy2wcGrvrQ2kD8wdFUWu371
   3l2e1IYQ+5bs0eJiTdpNmGDKfi5yW9D2T6dbcv57ds9ldvR61hh64Dv4l
   3VaBrMToe9odV9UNcrTpdFoNqZM0jCVYUn1L3hMk19b8ztOrVlVrFR0Q8
   FpG6QrVIOarHSW8EjFeAGteESJQvsyyX68CQqN+T9McDk+J6axx1Pugi5
   fSgF3boCquTZTvubF1b8yy1+9O96yiON1jgrZcgj3TCaOoVGTxiYIVjFK
   g==;
X-CSE-ConnectionGUID: 2rwj/OtDRPyBOrojh3eisQ==
X-CSE-MsgGUID: 6Un3l6gCRl6suC+4+CvTsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="60689069"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="60689069"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2025 02:50:05 -0700
X-CSE-ConnectionGUID: oWd4RIdqTiqO2dVDLPIcVA==
X-CSE-MsgGUID: EZDafcuZTguXE0JExIExWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="196335923"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa001.fm.intel.com with ESMTP; 09 Aug 2025 02:50:04 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukgDB-0002mh-2E;
	Sat, 09 Aug 2025 09:50:01 +0000
Date: Sat, 9 Aug 2025 11:49:02 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhengchao Shao <shaozhengchao@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1753/1753]
 net/netfilter/nf_nat_proto.c:56:6: warning: no previous prototype for
 'nf_nat_csum_recalc'
Message-ID: <202508091141.LQ39llkM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   748957057cef2d3b3e35d749c9a1ade66e2b5e73
commit: 83abe3a3b85762720192809ac8695ff9255cfd23 [1753/1753] netfilter: nat: remove csum_recalc hook
config: x86_64-buildonly-randconfig-2002-20250806 (https://download.01.org/0day-ci/archive/20250809/202508091141.LQ39llkM-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250809/202508091141.LQ39llkM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508091141.LQ39llkM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/netfilter/nf_nat_proto.c:56:6: warning: no previous prototype for 'nf_nat_csum_recalc' [-Wmissing-prototypes]
      56 | void nf_nat_csum_recalc(struct sk_buff *skb,
         |      ^~~~~~~~~~~~~~~~~~


vim +/nf_nat_csum_recalc +56 net/netfilter/nf_nat_proto.c

    55	
  > 56	void nf_nat_csum_recalc(struct sk_buff *skb,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
