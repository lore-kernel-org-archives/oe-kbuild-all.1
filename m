Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68191DE2D3
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Mar 2026 09:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772359142; cv=none; b=OJ93ze7OAJO8jxTjP6sQcyzNNH0/NxtTlwsSC0x4JS4VKCR8rVr0Kc1u8X1v5NVArYHSJtaTGVyaqtsaOmKRTxaxfeeRKRLhP80+qb2m6yobGspr2Kuu+8yrNYlMfRLD6HDv/LahALC6Jmnu6IZrDAe0cA8M7JvWQsEMYRGUofo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772359142; c=relaxed/simple;
	bh=NCBld8mmxuLtKaHStIDh4/9H1baW1DIi3KJ2O6UMbls=;
	h=Date:From:To:Cc:Subject:Message-ID; b=REtI3/9MaDXlQw3BKQOeXmOpeojjPKCwuh2xNnFLg0jd0dUHL8F4k6ASthNkEMJsH2hll6NeGgkZ9hi9RI2LmiaJeQvqfyxIp5emgi3fI3E7GQTxoOXCdw61unBagLWdW/3pKpqoVP2gg1lGrDxs5jB3xYksAN37UewSge1zydc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HKmonwLp; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HKmonwLp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772359141; x=1803895141;
  h=date:from:to:cc:subject:message-id;
  bh=NCBld8mmxuLtKaHStIDh4/9H1baW1DIi3KJ2O6UMbls=;
  b=HKmonwLpuTVctgA+Jmj4m9NdTpTpjdnXrkKO0eHrxprYBrvd2h/eZrcE
   3wHJJ+GbveNdnkt12lxnB2krLeG9+ezNi4qR9PgmXNqzN1KWQm+MtGkd6
   VOYxBE4rjlocl67nrgYrLRkaEoqTeFHDVIdbLUjdeDmgxYmqiBPbKa+sk
   Bk4U17IhmVPNn3xLumCp2DxQ8mMAAVmXI/y4gBLn/z2o2qPX0saT/eepq
   0Jl7avZCFJWZbAepozeqkVD2QMuqVXweH/Uvc75y7OEe3TTfOBXSp68WB
   mxDLP+zRn9vj17ujvehXJv1QbdXhyU2HliBzdSoQ0F0yHzApwkQbyvkch
   A==;
X-CSE-ConnectionGUID: tqfRSv5jRV6FfiFl0aU+YA==
X-CSE-MsgGUID: ehlSBuJlQNe8cEYxIajYVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11715"; a="96006346"
X-IronPort-AV: E=Sophos;i="6.21,317,1763452800"; 
   d="scan'208";a="96006346"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2026 01:59:00 -0800
X-CSE-ConnectionGUID: 6kyd0bDwQQKQsDnZkHEIKQ==
X-CSE-MsgGUID: eiQmyw1tT+mf9eFU1Ft7hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,317,1763452800"; 
   d="scan'208";a="217245869"
Received: from lkp-server01.sh.intel.com (HELO 59784f1c7b2a) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 Mar 2026 01:58:59 -0800
Received: from kbuild by 59784f1c7b2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwdZf-000000001Nx-3MJP;
	Sun, 01 Mar 2026 09:58:55 +0000
Date: Sun, 01 Mar 2026 17:58:32 +0800
From: kernel test robot <lkp@intel.com>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Jiri Kosina <jikos@kernel.org>,
 Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: [linux-next:master 2661/2910] mips-linux-ld:
 drivers/hid/hid-lenovo-go-s.o:(.data.gamepad_mode+0x0): multiple definition
 of `gamepad_mode'; drivers/hid/hid-lenovo-go.o:(.data.gamepad_mode+0x0):
 first defined here
Message-ID: <202603011759.KrN1OC07-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3fa5e5702a82d259897bd7e209469bc06368bf31
commit: 14651777fd67507d19574cd7e7835c16e6174853 [2661/2910] HID: hid-lenovo-go-s: Add Feature Status Attributes
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20260301/202603011759.KrN1OC07-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260301/202603011759.KrN1OC07-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603011759.KrN1OC07-lkp@intel.com/

All errors (new ones prefixed by >>):

   mips-linux-ld: drivers/hid/hid-lenovo-go-s.o:(.bss.drvdata+0x0): multiple definition of `drvdata'; drivers/hid/hid-lenovo-go.o:(.bss.drvdata+0x0): first defined here
>> mips-linux-ld: drivers/hid/hid-lenovo-go-s.o:(.data.gamepad_mode+0x0): multiple definition of `gamepad_mode'; drivers/hid/hid-lenovo-go.o:(.data.gamepad_mode+0x0): first defined here
>> mips-linux-ld: drivers/hid/hid-lenovo-go-s.o:(.data.touchpad_enabled+0x0): multiple definition of `touchpad_enabled'; drivers/hid/hid-lenovo-go.o:(.data.touchpad_enabled+0x0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
