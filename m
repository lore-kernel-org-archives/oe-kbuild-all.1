Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CCC36A36B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Oct 2026 08:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791187619; cv=none; b=UIqi6of0AbP/+mY25E6xxmHhEdcNT4eiUOlYmrNsBhyGipKEZnPiVBHGRbtkE5GRaX/aUAwWNIGNbKLpu+SKe3evbWC5TomfjSBAbMqImeQUPIUQ27crYl3yOvsMlmd17M75ay0Pha1H868k1038gnJ0CDz9v2uprHIn7Xc4zeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791187619; c=relaxed/simple;
	bh=TvHJe9+hzkp0/+OPDeflar1L947xeUC2FRiJAKM4KTs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZNRv1959JrfZyWU9vhDvgEuRPJYk9+tZhob/Hhc3IWHSwe4rEtgi9Uimey7l9fXHHwEoICzYKKlVqapHmvqTTnjX+vwgqqrHOFSrjXvfVUFYqITCYnSU5ugSGHyYS9XkgJqlrGp919zESC/eAwLHjYnuHNku2GlWDhdxasD1Aa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hJVrTasF; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hJVrTasF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791187617; x=1822723617;
  h=date:from:to:cc:subject:message-id;
  bh=TvHJe9+hzkp0/+OPDeflar1L947xeUC2FRiJAKM4KTs=;
  b=hJVrTasFibWNRNXG1aHFgioFNAgfWuNQpJYhiGoaBqQi5+obH5gCP7fG
   3Kvph17MyWetuCQuazjHwIIpB6//Dp3nge0WAMbrERQWuZPTgqgz7fF8Y
   qTnorUsUJQNSTB0/wDElHBulwf5s6DAAjPE9mbHHcfhHJH36Be+g46S2s
   5qr1+kR6u6yD10mEU/Z7wLr12lus2nsNZ42LJmSzbnn3mxfiVCobfIIfE
   wsHU95de7cGa+rlL82y6RMh3qdZdXcs7oHJGBpojouRdzFwOJ1EwWi4pz
   mwmMdenJ7ENw4eqDw/3sk4+urSH0lviJE0CI5YNTuuVfQUqo0kr7bxNa2
   A==;
X-CSE-ConnectionGUID: KCeNn59PSq21hzkp+/VkSA==
X-CSE-MsgGUID: PgOKmSDTQ3euws3wfCHeKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="117371100"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="117371100"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 01:06:57 -0700
X-CSE-ConnectionGUID: D936daZERz2F5a0wIYLXaQ==
X-CSE-MsgGUID: hxTXD80PQdedSusC8DZsWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="303005637"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 05 Oct 2026 01:06:55 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDdin-0000000000v-12LB;
	Mon, 05 Oct 2026 08:06:53 +0000
Date: Mon, 05 Oct 2026 16:04:31 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:arm64-bti-veneers-v2 2/2] WARNING: modpost:
 arch/arm64/kernel/bti_veneer_test.ko: missing MODULE_DESCRIPTION()
Message-ID: <202610051519.cYMsJ420-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git arm64-bti-veneers-v2
head:   bf6d477cd43ba9f2d080dbb0acbaee5be7114cdd
commit: bf6d477cd43ba9f2d080dbb0acbaee5be7114cdd [2/2] DONOTMERGE: arm64: module: Test module for BTI veneers
config: arm64-randconfig-1002-20261005 (https://download.01.org/0day-ci/archive/20261005/202610051519.cYMsJ420-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261005/202610051519.cYMsJ420-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610051519.cYMsJ420-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: arch/arm64/kernel/bti_veneer_test.ko: missing MODULE_DESCRIPTION()

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
