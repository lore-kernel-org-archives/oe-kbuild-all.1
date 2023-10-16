Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9468817EA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 02:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nAjb1+yZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697422420; x=1728958420;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MGYdPp+cN+vLLne50K3KSclHj10IIo9lP6DdHf1WHbg=;
  b=nAjb1+yZzQqu46iHnDDrdhc79Ful4eHdd5ymjz0wfo5BxdJONI1NUSK7
   bwKYDDzllrg36z+lzokpE70MllMwUYsbXdhIUfE8A6vIjtCB7dMpXDe6R
   y+p4X3Qd7fS0o1zKCEzJtfqAOMd7i+KbvC05nKOFFaWO0RL5pWmTEO9V1
   zUzIPyxFFB4lqB+YyDKKE72BtJuXjilMrBu/OLQiCzb1HURJ2O478PZj4
   yWbxmUcQrg2MX5aY7sz9ry0rQ/pXCvug6uWCgFTWdtrC9XAX4O683t3Fs
   jrcIhlyr0sKR9mLOVP9g4sYcFhKaadgQvFk2FigZ8q39qWFALW2NXBNkq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="382658389"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="382658389"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 19:13:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="846224121"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="846224121"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 15 Oct 2023 19:13:38 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsD6u-00081D-2W;
	Mon, 16 Oct 2023 02:13:36 +0000
Date: Mon, 16 Oct 2023 10:13:01 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:sound/speaker-safety 168/206] checkpatch: ERROR: code
 indent should use tabs where possible
Message-ID: <202310161012.gFRTOlqh-lkp@intel.com>
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
commit: 5b02a0cbab831c264982353463e6a3a8bf19dd1b [168/206] ASoC: tas2764: Add optional 'Apple quirks'
reproduce: (https://download.01.org/0day-ci/archive/20231016/202310161012.gFRTOlqh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310161012.gFRTOlqh-lkp@intel.com/

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
