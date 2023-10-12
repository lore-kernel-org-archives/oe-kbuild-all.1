Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAD328E16
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 19:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C/avgVGA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697140202; x=1728676202;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=amM2WwJnvi8en0fmlC60YM6s+JIdnGfzbv1IrFyrLVo=;
  b=C/avgVGAYh5svasQGGnK7z4iFwPQandnTL4ZimyJUl2UsEPw7l2dclJ2
   qNCMXzR9CnyKzbtCKwxhnTwS9wGiQDy+woT06tyyRXAOuAA1oOW+tdJ8h
   2WGiG9sLfKX5eJkZy7keP4SzBpOxbDG0Rccj0usJIaY1O1fXr7QlTgvkQ
   h/H0hm7kXmo+g+NeptDvsuUndQMi9Cy/s7vtrjxDUShW0bUuCcbfMsFKg
   KnLl7QJG9OgLhgjdT4CyYt51T/De5IxrOJsJ/rXnDan5SZVsoO9PZPQ/h
   8HoEBPW6fAqGV1yD2W2mzMxLDeBF3NbfLoZZPlkW+anxCkcLvM/luH4Ub
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="451507923"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="451507923"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 12:50:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="783837197"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="783837197"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 12 Oct 2023 12:50:00 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qr1gc-0003o9-01;
	Thu, 12 Oct 2023 19:49:45 +0000
Date: Fri, 13 Oct 2023 03:48:34 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:sound/speaker-safety 160/196] checkpatch: WARNING:
 Missing a blank line after declarations
Message-ID: <202310130326.AyGHlUiH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux sound/speaker-safety
head:   899711ed1c90b438d31e322d1b0638b328435963
commit: b62b5beefef4d23b04695f7a7f84ad601d4c31d6 [160/196] ASoC: apple: mca: Support capture on multiples BEs
reproduce: (https://download.01.org/0day-ci/archive/20231013/202310130326.AyGHlUiH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310130326.AyGHlUiH-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:LINE_SPACING: Missing a blank line after declarations
#42: FILE: sound/soc/apple/mca.c:272:
+		int no = mca_dai_to_cluster(asoc_rtd_to_cpu(dpcm->be, 0))->no;
+		mask |= 1 << no;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
