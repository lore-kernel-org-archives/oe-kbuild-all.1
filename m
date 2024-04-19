Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2561119F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Apr 2024 20:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713558980; cv=none; b=Pummt+cS42Kz4BpNHw9W3lcKFfXZmfDaXkHybQZsLURBr84OyTUnWCPtNMcVXhqklvWfzE2tLKArYfB0MbmOYsz2QpABw92VpdGgiAQ+XCwkPrO984XCZ1zaG1U85yyIX0LMj/MOR+3F61za0spe+HgD3PW4i4kh/6xNNYaxr1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713558980; c=relaxed/simple;
	bh=lpnfovx/Vlc7QPF74g/8oaXDUjN1kALKa4bR5fihKT0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AtI9GaY2kk8l2/r6khNd53z9eY/ErpEjsXvTprwZykK1FpTMNUZC4V9vtiN0kcbCExN0lZpWVj6M7aPamuPn6fJdNxDzj2+1HtfJfnNDrjy6027ZJIelhB44q2TPDhngBgXLOpHGRBsHNzvihHpp4SlkFKqzzhYiG/zBg+6fhDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JKQoF8e7; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JKQoF8e7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713558979; x=1745094979;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lpnfovx/Vlc7QPF74g/8oaXDUjN1kALKa4bR5fihKT0=;
  b=JKQoF8e7OrSo8U6QJI38KNchtj5LYHEgoOIvqgcPTDhuc0qUcHILFZcL
   X852d3OWnHICxx0CIxsCtnn+imFcZfal8jOdNOpUEbnWdi070hgFwTe78
   uvtw3EGyDwRS4YCInDgs5q2tPWNfBqBV+9qpwYM0BXpJAgHfkLH3ipRif
   5mIVA/tnpPbWJtLohnAgsx8jHgI9GKEOoWfjInp3XlH5sHp0JU2d0ddnB
   mOm8KbSHQIEvbwU5q7YdSF2rd33iq8rRwdwPRPtYvrl5LxrjQtc8GIZhH
   NeL1kdK52osF58/Vjc5GR9nrg2y6J04lxoLejX4S5kqte5hCd6OaFnA5c
   Q==;
X-CSE-ConnectionGUID: YpkmXCaaS9WX96CeHu9C0Q==
X-CSE-MsgGUID: SbSiJO81S4irofz/LhOxCA==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="12961163"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; 
   d="scan'208";a="12961163"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 13:36:18 -0700
X-CSE-ConnectionGUID: qft6r9d9Qfy6uk+LnY+6DA==
X-CSE-MsgGUID: dUftQWZSR2iC+J1mHwiyEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; 
   d="scan'208";a="60881042"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 19 Apr 2024 13:36:16 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxuxy-000AS0-00;
	Fri, 19 Apr 2024 20:36:14 +0000
Date: Sat, 20 Apr 2024 04:36:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 43/120]
 sound/soc/generic/simple-card-utils.c:75: warning: expecting prototype for
 asoc_simple_is_convert_required(). Prototype was for
 simple_util_is_convert_required() instead
Message-ID: <202404200459.U766Y9tG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   a5dee1b5b47deb12644f7fbf818e5a5517f3de02
commit: b4f448c9b96bb997a8df651f10322b8f2ec4200d [43/120] UPSTREAM: ASoC: simple_card_utils.h: convert not to use asoc_xxx()
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240420/202404200459.U766Y9tG-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240420/202404200459.U766Y9tG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404200459.U766Y9tG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/generic/simple-card-utils.c:75: warning: expecting prototype for asoc_simple_is_convert_required(). Prototype was for simple_util_is_convert_required() instead


vim +75 sound/soc/generic/simple-card-utils.c

13bb1cc0ad205b Kuninori Morimoto 2017-06-15  66  
32def55d237e85 Aidan MacDonald   2022-10-19  67  /**
32def55d237e85 Aidan MacDonald   2022-10-19  68   * asoc_simple_is_convert_required() - Query if HW param conversion was requested
32def55d237e85 Aidan MacDonald   2022-10-19  69   * @data: Link data.
32def55d237e85 Aidan MacDonald   2022-10-19  70   *
32def55d237e85 Aidan MacDonald   2022-10-19  71   * Returns true if any HW param conversion was requested for this DAI link with
32def55d237e85 Aidan MacDonald   2022-10-19  72   * any "convert-xxx" properties.
32def55d237e85 Aidan MacDonald   2022-10-19  73   */
b4f448c9b96bb9 Kuninori Morimoto 2023-09-11  74  bool simple_util_is_convert_required(const struct asoc_simple_data *data)
32def55d237e85 Aidan MacDonald   2022-10-19 @75  {
32def55d237e85 Aidan MacDonald   2022-10-19  76  	return data->convert_rate ||
32def55d237e85 Aidan MacDonald   2022-10-19  77  	       data->convert_channels ||
32def55d237e85 Aidan MacDonald   2022-10-19  78  	       data->convert_sample_format;
32def55d237e85 Aidan MacDonald   2022-10-19  79  }
b4f448c9b96bb9 Kuninori Morimoto 2023-09-11  80  EXPORT_SYMBOL_GPL(simple_util_is_convert_required);
32def55d237e85 Aidan MacDonald   2022-10-19  81  

:::::: The code at line 75 was first introduced by commit
:::::: 32def55d237e8507d4eb8442628fc2e59a899ea0 ASoC: simple-card: Fix up checks for HW param fixups

:::::: TO: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
