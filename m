Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12737FF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 00:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gYr8iS4+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697417541; x=1728953541;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hhJH8Qf8yIY2eCJVYWag3wMRhJHpmQrDilzo7mMZs4w=;
  b=gYr8iS4+PjexqowCOBou8jimGdjfV7FkF2n04M3VF2vppIbR3/y+KiCa
   z96t16vBrek3Qu3NwJBAArnwwiub/PtBlFWERuHha0AtSCeYSqtNaGuWy
   RhqEfCAUUHNmWTIksTvw5X5QCTWNH7BxYjj6tq9FBO6i1KNm6C/auacVz
   86gdHpX5GQEChuKqf3ecPffCeMyADNYeEI26dDEcCh/BBSGE3ixUzf6B9
   a12nv58saIF/jUeHJelFoAe9CtMLzRw/1ZpOGXucqXsPV2nLhvjq9hege
   QPQTStMEHQCSteoUhphfw7OVuQiBgPX67SwumqFXBnTRhFl56hD11fy6o
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="370499727"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="370499727"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 17:52:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="784906690"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="784906690"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 15 Oct 2023 17:52:20 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsBqD-0007yx-20;
	Mon, 16 Oct 2023 00:52:17 +0000
Date: Mon, 16 Oct 2023 08:52:09 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:sound/speaker-safety 148/206] checkpatch: ERROR:
 trailing whitespace
Message-ID: <202310160859.E6utYVPk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux sound/speaker-safety
head:   c4c1ca0ec7d6b3dcce7304ea88eaaad52f090d90
commit: eec526acb066b8b1237ad30153aede16ef04f69d [148/206] ASoC: macaudio: Start speaker sense capture support
reproduce: (https://download.01.org/0day-ci/archive/20231016/202310160859.E6utYVPk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310160859.E6utYVPk-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:TRAILING_WHITESPACE: trailing whitespace
#104: FILE: sound/soc/apple/macaudio.c:988:
+^I{ "PCM2 RX", NULL, "Speaker Sense Capture" },^I$

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
