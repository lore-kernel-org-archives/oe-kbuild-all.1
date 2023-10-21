Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68BB61E51D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Oct 2023 19:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JiiZ+ppm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697916507; x=1729452507;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZlXBNXEzynAEo+nYWCA+ZNJ91ecCHvnj5ydM33RMczI=;
  b=JiiZ+ppmnzslCWteVYGgUH/l7YX1NO8DgszlOd/lK/8uu4iHQEZ5PB4V
   T8sWL8MSrSq5ZdHEBZ03//2jC/zLfuabG54JxoB00XTDmpVAOhzMByaMZ
   eFphcbLeHbDbHUauQ9a4aHzW/paQwMeSkkHPOkX0AbToNZHQMA1bhgUFO
   bW7eFTNsIz6DSFmihuPiXk2YW52pVsjobslV1b9SXtpxajIXewrEOt5+E
   ub+KG3UQK0wXnl4/qXhv0XIy6JbeX+N6TO91Ib/Xpj3rJzYQYRA6FIKb7
   RFsVuY47s2fuznHGMatIO7cwf/I25IJ7dv/7pHx1OA0IEcerR+fRPf4hF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="386466893"
X-IronPort-AV: E=Sophos;i="6.03,241,1694761200"; 
   d="scan'208";a="386466893"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 12:28:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="707533173"
X-IronPort-AV: E=Sophos;i="6.03,241,1694761200"; 
   d="scan'208";a="707533173"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 21 Oct 2023 12:28:21 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quHdz-0005BM-16;
	Sat, 21 Oct 2023 19:28:19 +0000
Date: Sun, 22 Oct 2023 03:28:01 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:sound/speaker-safety 168/209] checkpatch: ERROR: code
 indent should use tabs where possible
Message-ID: <202310220331.E6ooYXhU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux sound/speaker-safety
head:   37f4315008c663a55629554adcfcae4e5d88fdc7
commit: 6480e0ba718bc03b308095ed1b5c2880ad4b10e7 [168/209] ASoC: tas2764: Add optional 'Apple quirks'
reproduce: (https://download.01.org/0day-ci/archive/20231022/202310220331.E6ooYXhU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310220331.E6ooYXhU-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:CODE_INDENT: code indent should use tabs where possible
#69: FILE: sound/soc/codecs/tas2764-quirks.h:43:
+ ^IREG_SEQ0(TAS2764_REG(0x1, 0x37), 0x3a),$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#69: FILE: sound/soc/codecs/tas2764-quirks.h:43:
+ ^IREG_SEQ0(TAS2764_REG(0x1, 0x37), 0x3a),$

ERROR:CODE_INDENT: code indent should use tabs where possible
#166: FILE: sound/soc/codecs/tas2764-quirks.h:140:
+^I^I^I^I^I    ^I    TAS2764_PWR_CTRL_MASK,$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#166: FILE: sound/soc/codecs/tas2764-quirks.h:140:
+^I^I^I^I^I    ^I    TAS2764_PWR_CTRL_MASK,$

ERROR:CODE_INDENT: code indent should use tabs where possible
#167: FILE: sound/soc/codecs/tas2764-quirks.h:141:
+^I^I^I^I^I    ^I    TAS2764_PWR_CTRL_SHUTDOWN);$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#167: FILE: sound/soc/codecs/tas2764-quirks.h:141:
+^I^I^I^I^I    ^I    TAS2764_PWR_CTRL_SHUTDOWN);$

ERROR:CODE_INDENT: code indent should use tabs where possible
#176: FILE: sound/soc/codecs/tas2764-quirks.h:150:
+^I^I^I^I^I    ^I    TAS2764_PWR_CTRL_MASK, target);$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#176: FILE: sound/soc/codecs/tas2764-quirks.h:150:
+^I^I^I^I^I    ^I    TAS2764_PWR_CTRL_MASK, target);$

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#244: FILE: sound/soc/codecs/tas2764.c:583:
+static int tas2764_apply_init_quirks(struct tas2764_priv * tas2764)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
