Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB51D430EE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 20:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k865kMmk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697573552; x=1729109552;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ign5XhbNHxDaN++5wFGa92eD8VTrh8BEpjGc9Whzb+c=;
  b=k865kMmkXlyIUBbN/7Id7PEBt3N/qGlbEV89+ewIFGoi+ZY42GFV0WkD
   LbSzkXzDtCMpxnBhkwBZnIlLznbIyJ6Qcy/f+5TwA4k6L4bdfQKotcc7E
   LwYCCWKTRy8Le6ZTkacr7aqcqA9EMy0yPAk3ioBhLpZIwtnZxopFuDoXV
   pc/Ujutg7PHlEMkzKNDG+lQ0GE+MkQuA9yKa8y9KkgHCXeIzdsCorVqVY
   57VTf+fxjaDCLgJJoxwoSFklU8z1gsSwUE71qFeSBdFV5RsJ8iorDiU6Q
   VoJP6PVbtUYwfJJ6CjFbaXDQgEosr0zsYUewP57KIkkl71dRHBMzJOJkV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="450093017"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; 
   d="scan'208";a="450093017"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 13:12:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="756271922"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; 
   d="scan'208";a="756271922"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 17 Oct 2023 13:12:31 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsqQW-000A2Z-2b;
	Tue, 17 Oct 2023 20:12:28 +0000
Date: Wed, 18 Oct 2023 04:11:31 +0800
From: kernel test robot <lkp@intel.com>
To: John Watts <contact@jookia.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:fileyX32OV 39/112] checkpatch: WARNING: static const
 char * array should probably be static const char * const
Message-ID: <202310180456.iPsFIEda-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git fileyX32OV
head:   9a4bf1f0be01582806e85322d18bf5c9f21d0b40
commit: 00524a8415aa400567538c0e75a463d517cded7f [39/112] ASoC: wm8782: Constrain maximum audio rate at runtime
reproduce: (https://download.01.org/0day-ci/archive/20231018/202310180456.iPsFIEda-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310180456.iPsFIEda-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:STATIC_CONST_CHAR_ARRAY: static const char * array should probably be static const char * const
#27: FILE: sound/soc/codecs/wm8782.c:27:
+static const char *supply_names[] = {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
