Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1A034CD7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 16:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T8ECgc3u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697645890; x=1729181890;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=84//eHpfhNbtAen28kZoJaVI/m82vJ625HwjjvTVXJU=;
  b=T8ECgc3udMyp58WSiMK4VaifqG+5MjBDZ7O/efCMOPF7CaQU4qmkidFa
   txOxAJGpeYIgbqSo1xeBwnHqNG8pl5aaeKWhQ5Lq8j0V9mOVh2Vbiu+I8
   Yf3zA1u9R/VgK4oWWK4/3BWQdJ/5y6AKwsUPvUyna03Uy7WX37LCrSaoK
   fGtFHyU2B5zg7FXn+/AEcd4cilUeb35KCJCHEWO1fw1JMOQLStnCz7h9q
   WEgc2YCWLPeKVXdjMmDeumHS0c7xzYNXPqvottAR7iX6CUR2MhCpoqwq3
   6PQuovm8k9mgkEQ+/+rh0qK/WDJ5TzYO+dq79BzeCM1YBZc+RzLzfR3vB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="388913291"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="388913291"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 09:18:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="847319676"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="847319676"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 18 Oct 2023 09:18:06 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qt9FE-0000eI-1E;
	Wed, 18 Oct 2023 16:18:04 +0000
Date: Thu, 19 Oct 2023 00:17:29 +0800
From: kernel test robot <lkp@intel.com>
To: John Watts <contact@jookia.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:filekqPwtU 39/113] checkpatch: WARNING: static const
 char * array should probably be static const char * const
Message-ID: <202310190002.g4E3Qgj7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git filekqPwtU
head:   64c3259b5f86963c5214e63cfadedaa2278ba0ed
commit: 00524a8415aa400567538c0e75a463d517cded7f [39/113] ASoC: wm8782: Constrain maximum audio rate at runtime
reproduce: (https://download.01.org/0day-ci/archive/20231019/202310190002.g4E3Qgj7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310190002.g4E3Qgj7-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:STATIC_CONST_CHAR_ARRAY: static const char * array should probably be static const char * const
#27: FILE: sound/soc/codecs/wm8782.c:27:
+static const char *supply_names[] = {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
