Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854D363D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Mar 2025 03:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742010544; cv=none; b=pd/2cxG/1bsZpMP1jzR3ujFqweDiJsuMb77LcaY4x6mkuynQ6PRwJp/YIRBECpCH3jODD/IcvgmiD5Pb+BwzjZDqsMljzUlPHjywTAEPw90mHjyywKdbtHQ/kPwd/ruj8z2KJUP0bTD28/qQjjtLWw7HPJSpKLV+P9fnPyLzlxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742010544; c=relaxed/simple;
	bh=e2k5xCHJpSlYYYlOE++lB1S8rSLya8fKoGESDrtg/kQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OjZejrVlbnSK6tQt+SKhMHnSZDtIza+qI/sYj79rLeVG1If3coWMb0wM4hKRk4f5ikurFbvGIrl+TqbJCJJTomRWVURY+I9ZxK9BJLdlO2u6eCnzI1dP9CDv16qWXhIIreUz1NUF+7u8kFIySKEIWrenTbRtMyRLbkEumWHpbtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H0WvmRJV; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H0WvmRJV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742010543; x=1773546543;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e2k5xCHJpSlYYYlOE++lB1S8rSLya8fKoGESDrtg/kQ=;
  b=H0WvmRJVrV2J6uExsPgYq1uKn7jrhvvaewLDCeUCHSOoxzzWbtzm2FxK
   wLeTrtoCSSzRFy+XmO7Gw+2OVTmO33XF16/FBGlEwJX9uz6aBZNplYED9
   kx9BvldhFWYoEoh8FIHwTmAADuvVHAIPV4esypLjUcNgO1ayI7ECDmugv
   bwpsmG9SCwSRu9KUI52yKnDBzPaoX71KCNiLpYUvznMju/zdvUZUYKp9K
   h6uCo4MwZVpvgdt4kqUPE3Kxx3+i1E2cufNYGedJCCHrb6+aBcFQ77Qv3
   Yns81lo5zwCbk0wC+AbciWKOvXO1r09TVBLG3h/vaeOYIzclTijJjoQSc
   w==;
X-CSE-ConnectionGUID: qlZHK3lxR0GWDuWS1u6Ylg==
X-CSE-MsgGUID: /XI2V/eCQBuAY3hgNA4D6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="47072458"
X-IronPort-AV: E=Sophos;i="6.14,249,1736841600"; 
   d="scan'208";a="47072458"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 20:49:02 -0700
X-CSE-ConnectionGUID: jj9cHZ46SRmK3c/bWk4OOQ==
X-CSE-MsgGUID: V7Qad/7gRfuYZMaQdPSgrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,249,1736841600"; 
   d="scan'208";a="126327715"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 14 Mar 2025 20:49:00 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttIWA-000B2n-17;
	Sat, 15 Mar 2025 03:48:58 +0000
Date: Sat, 15 Mar 2025 11:48:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Tong Tiangen <tongtiangen@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2034/2034] aarch64-linux-ld: Unexpected GOT/PLT
 entries detected!
Message-ID: <202503151158.xNxBbX1r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   304c7f18d674a3cbb439f7ee346622b2e6c5bc9e
commit: b991780c836ceb9a479c6c6e385e914b487e353a [2034/2034] arm64: introduce copy_mc_to_kernel() implementation
config: arm64-randconfig-001-20250314 (https://download.01.org/0day-ci/archive/20250315/202503151158.xNxBbX1r-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250315/202503151158.xNxBbX1r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503151158.xNxBbX1r-lkp@intel.com/

All errors (new ones prefixed by >>):

>> aarch64-linux-ld: Unexpected GOT/PLT entries detected!
>> aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: mm/kasan/shadow.o: in function `memcpy_mc':
   mm/kasan/shadow.c:90:(.text+0x5d0): undefined reference to `__memcpy_mc'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
