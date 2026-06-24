Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8613242CA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jun 2026 05:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782280289; cv=none; b=EHMn+GeSURGKzdGfNG3iK1TkicqRvRcIGCQ6UOUD85rkGn6TYp2JtJI8y/aXmNv1gz+cEW79JwP19FYuXQlpVWjse/zxNOYSfLbCxioN20VEYC6lJ45JXSAiI89absSjLsTOzwxcf2rhD9twDQBUm1LUeshk/LlXZ2s2ik3Z3Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782280289; c=relaxed/simple;
	bh=D9I/LTguC5OtyFwynVjoVCieJymaCyDcF7pGWxF94UM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uhcViDB+AegmV2KXMTcfRzbYnedtMTuBZNYjN8jMAhSY9v4tojYRRMUkEUWU3Cap5D/KfE5aOfCImIy0Pc1EVqwn7+mTHgl779eZcZE1lbPkpMcTiQF0e9ZVnFX5ALQzvLQRWhdWabUbBYZII1GoHszhQ9x+aQ+Vtb8JvXawDsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SQqkrw7s; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SQqkrw7s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782280287; x=1813816287;
  h=date:from:to:cc:subject:message-id;
  bh=D9I/LTguC5OtyFwynVjoVCieJymaCyDcF7pGWxF94UM=;
  b=SQqkrw7sxmabXOwJNyh2nr3LRvU/5D2Jm/IxUAZTjeHDqoEwRHyOkSAB
   7AryovmNDK5H4VOWusWg9rozREkOHA4vjb2g/fDvLK2pkkVimVB0lxjq4
   wiAWYSBh/x94ctF2jF/YhY2ykod5XySthPO6VUPwns9mM8YTClmom6Qxx
   RDswL8RfZhPMrhUzDCGQXGVPObLVGUUxVFBgMV5FWet5Ye0A2rTCLZyPA
   Dv1+vXEfV8ZNFbmqsDMAiWB204CoaxU6TFGS7ed8GiIb+T+Yf50JueQTL
   DhZczAR28+MnRuwF9k6Xa7EwktxatHRvhslbXIFjniWgupnqx3z+pfzxl
   w==;
X-CSE-ConnectionGUID: 6xESEQHgTsKE1UDXlXkiDw==
X-CSE-MsgGUID: gxZJpl1mSqOKILtxh36WsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="82147685"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="82147685"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 22:51:23 -0700
X-CSE-ConnectionGUID: TDaGHdk2TgGuFy2CTjR3sg==
X-CSE-MsgGUID: iv2UiRHLS5qIoLEZ8psrcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="249582966"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 23 Jun 2026 22:51:20 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcGW5-0000000039L-2yei;
	Wed, 24 Jun 2026 05:51:17 +0000
Date: Wed, 24 Jun 2026 13:51:04 +0800
From: kernel test robot <lkp@intel.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-acpi@vger.kernel.org,
 linux-pm@vger.kernel.org
Subject: [rafael-pm:linux-next 11/16]
 drivers/thermal/testing/command.c:91:27: sparse: sparse: symbol 'd_command'
 was not declared. Should it be static?
Message-ID: <202606241309.I4xxswNB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
head:   7b8d80921156c54cf7fcc35a830342686958aeea
commit: a36ab01e7cd43baf3150f4b3c68624c14ead27a8 [11/16] thermal: testing: zone: Flush work items during cleanup
config: powerpc-randconfig-r132-20260624 (https://download.01.org/0day-ci/archive/20260624/202606241309.I4xxswNB-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260624/202606241309.I4xxswNB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606241309.I4xxswNB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/thermal/testing/command.c:91:27: sparse: sparse: symbol 'd_command' was not declared. Should it be static?

vim +/d_command +91 drivers/thermal/testing/command.c

    90	
  > 91	struct dentry *d_testing, *d_command __ro_after_init;
    92	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
