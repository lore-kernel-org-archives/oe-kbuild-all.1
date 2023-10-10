Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5411032190
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Oct 2023 19:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iZBc50JX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696966510; x=1728502510;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5B2G9z/bIGJlV/64G0Xn8f1BvX/tIPZ8p5ibeFFH+yI=;
  b=iZBc50JXFsXiC6dYojkQb43rwhiohxIe+mqea0PXWFgn6mklBlzuybet
   713rDmCyhcFHW2llNnqDuoZ2ttHBEehflYvR4CSQ/uy4opyWCknqpYPcc
   NHaPqcZMQ2KCKeGsT4XcDNZYwqatFUpYDckCyJXuELly5Pr/M2G/Uv5Xb
   CCn0UoKD1m2UxFanXnVburffCfl1RF5S1pv23sOLKXSWglyDqKqIx73An
   3Fbqq2ODuc+ZmatVuw16PdHQZ2p7N/I+K2bnUdkrEk7MdUzi1PAKWmbIa
   5kSwgbB9dWjdVI0LssCdigWVIwCJQz47zFhoLuVVq5pZm8VBYxFAVT/xg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="363844966"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; 
   d="scan'208";a="363844966"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 12:35:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="782989254"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; 
   d="scan'208";a="782989254"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 10 Oct 2023 12:35:08 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqIVV-0000zK-1k;
	Tue, 10 Oct 2023 19:35:05 +0000
Date: Wed, 11 Oct 2023 03:34:19 +0800
From: kernel test robot <lkp@intel.com>
To: John Watts <contact@jookia.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:filecCvnQF 39/101] checkpatch: WARNING: static const
 char * array should probably be static const char * const
Message-ID: <202310110335.WSzxoinl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git filecCvnQF
head:   52fee5c9158000db607d734383fd862969782de5
commit: 00524a8415aa400567538c0e75a463d517cded7f [39/101] ASoC: wm8782: Constrain maximum audio rate at runtime
reproduce: (https://download.01.org/0day-ci/archive/20231011/202310110335.WSzxoinl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310110335.WSzxoinl-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:STATIC_CONST_CHAR_ARRAY: static const char * array should probably be static const char * const
#27: FILE: sound/soc/codecs/wm8782.c:27:
+static const char *supply_names[] = {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
