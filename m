Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092F8BA49
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Apr 2025 21:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744666801; cv=none; b=ukgsNyK4uwxXQQwIjV8UlAISizMBpkLgfbqOYhlfpRzzrzIkbV7+su1vh7yQgclq4IeTvReGzwSCKFQALNuTKg6HxmMsXRGFTQKrb0osYa3zwRC3IGVL/+IQwff3HVzdimnCbQPCoIUYrCBG2+6x1phYemHtxH/MrueoH3o/80U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744666801; c=relaxed/simple;
	bh=fCOpnrUVlyUgd/HniphSckBwx7crKBzn/K5BhMOL8Xk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A94OudlWp4gV36DrhZNyt6qMUPP77M2LAgcOhbcZ71o8czt7gzbfg93WzoVh6YWAULa/RzATlCv3qnKk9Cwg4mg3DTr/Wr1uJCTR6MsOkiYSX2WXV+qpAJeOCMX85wT4PYyjiYcP112KtlaEN2KRcgiRDX7AZ6x9iB8l/eqbquY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eawkplTR; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eawkplTR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744666801; x=1776202801;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fCOpnrUVlyUgd/HniphSckBwx7crKBzn/K5BhMOL8Xk=;
  b=eawkplTR8bjN18c/pF/Zfi+qmFFs/wbQ2pD1UoXEqclxYWwTla+kc+wI
   Z/RFrS3aBL7Zx0CQmkXoKCMM9jC6yWPksZIty1HLYx/J4uJc9uHa6OKVc
   VRp2AA4tIVPPPwXrhbp2iVFnBAZp6xBcArnHxwwPKOPxvXN1s20kowFic
   d9uI0/3xn1Wd2u4F13qZDRTsW+c8otfQ85Dh+GFpt+PKyES5UhzfSpLs0
   nGY1jlK+AqtS29ybQPPLjEdciQcYFm7UxNY1NwO8je2uIXEtHUWQVkhA5
   uXM2gH3G20Djua1/ee5apR9Cnk3OkUgEnWoyXDtGWNyax9TkRsqP8sXVz
   Q==;
X-CSE-ConnectionGUID: OrAaoY5dSpmTAYxRC8X7xw==
X-CSE-MsgGUID: RaoT/NiOS1Wt+R0RiKib8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="56333786"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="56333786"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 14:40:00 -0700
X-CSE-ConnectionGUID: CV4WC1jkSFGbu9F5uAO3FA==
X-CSE-MsgGUID: J4/W7hJaSPqEHmM8WaWTew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="134990698"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 14 Apr 2025 14:39:58 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4RX2-000Ei6-23;
	Mon, 14 Apr 2025 21:39:56 +0000
Date: Tue, 15 Apr 2025 05:39:13 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2123/2123] vmlinux.o: warning: objtool:
 kasan_report+0x10b: RET before UNTRAIN
Message-ID: <202504150515.bR3H6UHH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   8e04020e957c517ad3fb6bb3caa90e037dc3d5b8
commit: b73666e1e9554c77a69a647427cf77782e0bd9aa [2123/2123] x86/xen: don't do PV iret hypercall through hypercall page
config: x86_64-buildonly-randconfig-002-20250415 (https://download.01.org/0day-ci/archive/20250415/202504150515.bR3H6UHH-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250415/202504150515.bR3H6UHH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504150515.bR3H6UHH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: kasan_report+0x10b: RET before UNTRAIN

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
