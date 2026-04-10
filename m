Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1284D81732
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 19:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775850190; cv=none; b=qRojz68JivbExHmapgliwU2/K6TVz2639mc/18uSJdluIoPmzniOwqobu1JmEq832ku5oGTPPrr+rVYS8TbdmzGQRoz5ald2JTfZ9togOFmeIcymxy1CleUQI6ZBnunKJctCODhG0dInvhB5F9XEUM/Ff8pbsPfNcOaCpHm5VpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775850190; c=relaxed/simple;
	bh=npv4GzgMw5OPIGxncGaC5Wf/jIP5DWDHNiZgt34v2rY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BnvPzX+ByvABPcdW9FdIvxD+uEg1R66qkd+3FQrx2eCoACI25bqTBAi4MW6lx8yzFQc0ffRb0qqijE8ZkqETGxBS6bUnVbEmq0M/gqvL0vceVS5IW3aD6x5S/m+mKDI/zzB3MNz9Xx2NEaUM4Tj5nJN4UNdATEQqcyXPm/kOCTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bttFKHjc; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bttFKHjc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775850189; x=1807386189;
  h=date:from:to:cc:subject:message-id;
  bh=npv4GzgMw5OPIGxncGaC5Wf/jIP5DWDHNiZgt34v2rY=;
  b=bttFKHjcV/XBA4PZIDiec6MDBO7anS/cLmtm6W0fj142rmQDeQrlDXJ8
   ObnJ/RyQhBNADdxFzVDpoYOw1jBoCMbbD/sYM/2WDNxQdsQi6gzzKBsub
   MbEz3cxcV3Ql4YLD27I4Usj6+N3LTWTLBl9/s1mV+nDn8U+OyTW4OhyEb
   ge2uwBCY7DNobe+w2KCvCUjIFQKiqkna9P2ajkqdftvg1oG9Fv4Z0IfYe
   091Z6W+m4pJmlLUCQHqpee+utZZpgnfoXd5smHTUXvC5YAJMEbF8VXmlq
   TXAv21NUwuiY69W+ME6FzZIHwDHAMzEot1dgMnqqV0+PTyaOTgq7vuuee
   g==;
X-CSE-ConnectionGUID: aCGbK6DURnyOOyNXk2ll9g==
X-CSE-MsgGUID: bO8GEg50Tl6AaG7hT1tw6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76591839"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="76591839"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 12:43:09 -0700
X-CSE-ConnectionGUID: W7AtwVLMRamZNwSeauIEcw==
X-CSE-MsgGUID: p4GQArVPTu64fPKNB617yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="229092179"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Apr 2026 12:43:07 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBHku-0000000008H-46Pi;
	Fri, 10 Apr 2026 19:43:04 +0000
Date: Sat, 11 Apr 2026 03:42:37 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sre-misc:thinkpad-t14s-x1e 102/106]
 drivers/hwmon/lenovo-thinkpad-t14s-fan-ctrl.c:114:39: warning: variable 'id'
 set but not used
Message-ID: <202604110343.JFNEeIMb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git thinkpad-t14s-x1e
head:   c368130866898c0f67e75fb8e36b0708e623553b
commit: 63135d5eb5be2cfe4bab0b645506ea30a7e198e8 [102/106] hwmon: (t14s-fan-ctrl) add thermistor support
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260411/202604110343.JFNEeIMb-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604110343.JFNEeIMb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604110343.JFNEeIMb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hwmon/lenovo-thinkpad-t14s-fan-ctrl.c: In function 't14s_fan_do_read_thermistor':
>> drivers/hwmon/lenovo-thinkpad-t14s-fan-ctrl.c:114:39: warning: variable 'id' set but not used [-Wunused-but-set-variable]
     114 |         enum t14s_fan_ctrl_thermistor id;
         |                                       ^~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHY_QCOM_MIPI_CSI2
   Depends on [n]: (ARCH_QCOM || COMPILE_TEST [=y]) && OF [=y] && COMMON_CLK [=n]
   Selected by [m]:
   - VIDEO_QCOM_CAMSS [=m] && MEDIA_SUPPORT [=m] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && V4L_PLATFORM_DRIVERS [=y] && VIDEO_DEV [=m] && (ARCH_QCOM && IOMMU_DMA [=n] || COMPILE_TEST [=y])


vim +/id +114 drivers/hwmon/lenovo-thinkpad-t14s-fan-ctrl.c

   110	
   111	static int
   112	t14s_fan_do_read_thermistor(struct t14s_fan_ctrl *t14s_fan_ctrl, u32 attr, int channel, long *val)
   113	{
 > 114		enum t14s_fan_ctrl_thermistor id;
   115		int ret;
   116	
   117		switch (channel) {
   118		case 1:
   119			id = THERMISTOR1;
   120			break;
   121		case 2:
   122			id = THERMISTOR2;
   123			break;
   124		case 3:
   125			id = THERMISTOR3;
   126			break;
   127		case 4:
   128			id = THERMISTOR4;
   129			break;
   130		case 5:
   131			id = THERMISTOR5;
   132			break;
   133		case 6:
   134			id = THERMISTOR6;
   135			break;
   136		case 7:
   137			id = THERMISTOR7;
   138			break;
   139		default:
   140			return -EINVAL;
   141		}
   142	
   143		switch (attr) {
   144		case hwmon_temp_input:
   145			ret = t14s_fan_ctrl_thermistor(t14s_fan_ctrl, channel + THERMISTOR1 - 1);
   146			if (ret < 0)
   147				return ret;
   148			*val = ret;
   149			return 0;
   150		default:
   151			return -EOPNOTSUPP;
   152		}
   153	}
   154	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
