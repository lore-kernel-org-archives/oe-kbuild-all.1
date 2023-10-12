Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B450F3D3B7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 20:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XexmQ1Ic"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697142667; x=1728678667;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XNjEHR9rCf0QrM7GgSDUNN43XnAggO90KCWA3IMChEA=;
  b=XexmQ1IciTZqQfhjPKqB8gF3L+5ePhNJ8evDA4epMFLS//L6LI0yCBd5
   vMoI9GzHQXyYbFnUkD5I1vj/VkogRoNEZfOsIDziLPzENsBVZESuhDDRl
   DlRXbYnFwhP+Bv4tg/BoeLvGQt86oSyLOscBCK+0LNsdR26Sdph51I1kS
   JpoXoYJeZiSTbExv7KXSOCxhv0dL2hVWCGXLBRzBwf/861BgdWMw0DeV5
   UpjoskNyIdP76DBAu/RVUV7T5jkdbEMFOBbAdztuccRvOzLUy2IW0cKIV
   +S93m3JKkcRsqYoN4Oa81iJEvlZtKeGoLETsDgBLwluBMv2FVdpR5bAZ6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="388897689"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="388897689"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 13:31:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="758184533"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="758184533"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 12 Oct 2023 13:31:05 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qr2Kl-0003r5-1U;
	Thu, 12 Oct 2023 20:31:03 +0000
Date: Fri, 13 Oct 2023 04:31:02 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:sound/speaker-safety 171/196] checkpatch: ERROR: code
 indent should use tabs where possible
Message-ID: <202310130402.TCvf4Qaa-lkp@intel.com>
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
commit: ace42ad6922695bcc0f1e9c622591ac3dbd1b5af [171/196] ASoC: tas2764: Add optional 'Apple quirks'
reproduce: (https://download.01.org/0day-ci/archive/20231013/202310130402.TCvf4Qaa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310130402.TCvf4Qaa-lkp@intel.com/

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
