Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC01D1A724C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Feb 2026 07:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770621231; cv=none; b=qU4SR2AKYxWkmuLOLPuV+PtNzFF4Zcf3iO3sCduw7K85GfDGOiAjK0hUo4ecaLDdKm7ngGpT+GdnlfMMBuey5Dl4hzkHLYdTqmLWrbYyLqLkpv3GobbsWoLTtUcIuT+74PfOtItJuxaqnSGRadq/gA2so+kCkFMbiOIwN7dTXA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770621231; c=relaxed/simple;
	bh=RSI3TOyaUmY43Whu5MfJPWkdYUO5qTrlsv+dfwiwFng=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tB1ewH6adliQQ8VsfEJbW4oGYxX35hX0CytmxlXoNj3Sh+Jajgi5sc7C5nRyJVuRLAvYNe2pat8tmvCRrEgaznash6mJAwpCqNPfPbNMC0ctDbAUv/sR6+GLzsgLF5e9tvY7LzZDRhbxRE6HdWqa5hPFX5ADS2Pi2DT87xom85M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ww3PFYVr; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ww3PFYVr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770621231; x=1802157231;
  h=date:from:to:cc:subject:message-id;
  bh=RSI3TOyaUmY43Whu5MfJPWkdYUO5qTrlsv+dfwiwFng=;
  b=Ww3PFYVrxZrSjM35uYz0VJ2zuy55+pX4Hcru2vp19parG6Kq+xCNy2NL
   xarMmls7GOFy1/mJt/yYzPJmNmB+TYDagbLgqn7r8I3hGrv5y28uaeoG7
   WWUV2wnI5NTsoXep7HDQQYJTK4iNj2X8Cuq3qJjdkw1b+6yRb/j7sdpJ4
   x1C4Z+T0fEXPLWPgfMkxnLIZ1DZ5NPh9Dcj1FxKf5HoM7bwS+r6681k0S
   quU/3nKCNXpQi9TXvPKuPm+0AebUYADg2nzwqnz7sxhC89SvSruU0M6EU
   YEnRGgMGUbFozTo0fKlGa5oDX+ORD1oWToYnl7XlayJkghOTpI5al9eTi
   w==;
X-CSE-ConnectionGUID: H53eq0dJQj20zkZVFetVxg==
X-CSE-MsgGUID: 5cLcTraKQOWH1vZSkxzH+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="71628817"
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; 
   d="scan'208";a="71628817"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2026 23:13:50 -0800
X-CSE-ConnectionGUID: YamyPF5cTU+22Bv2pxNWHA==
X-CSE-MsgGUID: X/FYhXLeQPqK2dJr1/Iytw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; 
   d="scan'208";a="211149742"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Feb 2026 23:13:49 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpLSs-00000000mg0-3sDn;
	Mon, 09 Feb 2026 07:13:46 +0000
Date: Mon, 09 Feb 2026 15:13:03 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sre-misc:thinkpad-t14s-x1e 19/20]
 drivers/hwmon/lenovo-thinkpad-t14s-fan-ctrl.c:114:39: warning: variable 'id'
 set but not used
Message-ID: <202602091543.FW27o0XD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git thinkpad-t14s-x1e
head:   e59893f5d6ef4c024a8ce76f6922057dc52b8a9b
commit: dd514ecaa8a4e7b66d4d9a1c507b0c43226665b6 [19/20] hwmon: (t14s-fan-ctrl) add thermistor support
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260209/202602091543.FW27o0XD-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260209/202602091543.FW27o0XD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602091543.FW27o0XD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hwmon/lenovo-thinkpad-t14s-fan-ctrl.c: In function 't14s_fan_do_read_thermistor':
>> drivers/hwmon/lenovo-thinkpad-t14s-fan-ctrl.c:114:39: warning: variable 'id' set but not used [-Wunused-but-set-variable]
     114 |         enum t14s_fan_ctrl_thermistor id;
         |                                       ^~


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
