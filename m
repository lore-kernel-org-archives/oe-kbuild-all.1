Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE2E361667
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Sep 2026 21:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790456444; cv=none; b=HB5Lew+mECZu116rNinBVKG8Oh7PKlGqjvfKTaH6f3jQS03DvAFaP+BVZ7jn8EsN34IP+c+5JV35BnuHOJ5ryIbuOiGVwpnxKvxp3K0XR8hi73D44TgDNyCjmwoVQPNDpq+kY+IkysbuHqeWv1mXUfyFOpOeaPlOUxrVHaVXhxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790456444; c=relaxed/simple;
	bh=VJQ1Gq867QC+jBtsPs5vTIb2lWdkkbgCyucN7UQcyaE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Gkwn9CNjokE5sWyiOcg6yvYMUQXzbr+u67Wtb73U/L7VO3ekOvSeJOVD/wVc4djpocPRFmqutbsi8PDh7Nws/Y9vL8uNpSdrMV5juvAGZIDX6LYy18TJ9gNa6a9ozpWM8yV2I/VfZ15DuwNaFML091weLKDRfYhd0MCz2/ZEIQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nCcvbN6X; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nCcvbN6X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790456442; x=1821992442;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VJQ1Gq867QC+jBtsPs5vTIb2lWdkkbgCyucN7UQcyaE=;
  b=nCcvbN6X5J5V6VfGPhEXzkDXnqmeTWDFd5BCN6SLT/+//rGs3XsYRfpn
   9jgq+MF57lhhyGtIIAYnc7wsyTUNRHSumnFO6lXsBUTQzGz2plkOM2jfi
   R8dDNFkQuHpRlwdPeS6UE3bJVdQr4Yis5t93XE7ApNQ9IN8X1la1lsOkT
   lgeNTMIMJaFx9FswmImAvLtUXAngKnwK4p50JclbrhlyNuVD+HO5SOAVT
   jyFpdWG2A/aEMgQU1zRQ4nvZB98UHR/xnOzUm0sT9I2XRA+F97WM3jrP1
   r2Jvtl/ZUsdHMavEUN8X3S32/ePn5gpEZSo/L3+b4QFZc/zenoUPkyr72
   g==;
X-CSE-ConnectionGUID: znrGcAdMSbClvDgOLhaFYg==
X-CSE-MsgGUID: J1rFaDrVTZuJQZl9vAx2OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="101777358"
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="101777358"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 14:00:41 -0700
X-CSE-ConnectionGUID: g6w7l4XlQKC98dTdtCIVeA==
X-CSE-MsgGUID: CSzBGjdQREGLdPy+gcS46A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="300932680"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 26 Sep 2026 14:00:39 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAZVd-00000000MBt-28e5;
	Sat, 26 Sep 2026 21:00:37 +0000
Date: Sun, 27 Sep 2026 04:59:52 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dyndbg-maple-clean 29/45] Warning:
 lib/dynamic_debug.c:740 expecting prototype for param_set_dyndbg_classes().
 Prototype was for param_set_dyndbg_module_classes() instead
Message-ID: <202609270459.azCuVPzh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dyndbg-maple-clean
head:   66849149b0a8cab7cdac143b22fd88b3df05636b
commit: 348633a83e28f1a7e0e32096b55eb6e5285ee48b [29/45] dyndbg-API: promote DYNAMIC_DEBUG_CLASSMAP_PARAM to API
config: i386-randconfig-1302-20260925 (https://download.01.org/0day-ci/archive/20260927/202609270459.azCuVPzh-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260927/202609270459.azCuVPzh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609270459.azCuVPzh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: lib/dynamic_debug.c:740 expecting prototype for param_set_dyndbg_classes(). Prototype was for param_set_dyndbg_module_classes() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
