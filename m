Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB9E6AAD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Mar 2024 03:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711770501; cv=none; b=imhnnjpbvtdtPs9zsCaTfrJyob8W12OcYgi+gU5sjnlOaFpHloFb87eYH14/5SF14dsEtBALgTPEzxpYy/j1u65Ykz/LyKzV7G3sGwcKMDY8+ELIch8V/iYFan+BHkgyDzgoorCeALIU/HZFnGLWQnRoGykL1xye6YfJHm1Rv/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711770501; c=relaxed/simple;
	bh=rsrZTz+4j78/W8zzV6sWU9fjjo9eDo5zxE0698Xg6a0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YhrXhopoOlbuuTaOtEfG9Ldqs3icMaz5NElM9V3Hl7FmJ7C5skZ6Q7RpiRcTHWsTrNEK35jPuVXV/KR8kCoBWWpv7lmdBv1P1LiH8qCtbM0R/UIOMH904L78GJploffqEwcDimOsV7muCroipD1X1ohS0w7QLURH2kks0Ci3l4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YT0FlIjc; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YT0FlIjc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711770499; x=1743306499;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rsrZTz+4j78/W8zzV6sWU9fjjo9eDo5zxE0698Xg6a0=;
  b=YT0FlIjca9Lr2HoI18PgOuM2efSMjKyovOzeAr0coLVlKFFZkfVmpEe6
   u4zGsco6yWDPCSt6h8AGZ7txCFGsaKx/oKxqvnK014RSC5HovJRka0hZS
   cHlOUIDW2tMtpLAeSzWMrTNx6ScPqrbvLzKRtHR+47TrmB3yPfUCmFoHZ
   wznzGERuljm1k3jhphEzi6VZ79YAYfC5NFrTPPG2mMW27+BfF8sSF9JCR
   1uVmv4FpAVA5pV27g2HvvL9mHXK01uE4UGjRD4Xgjp9ssqQifM+z6+M0X
   yb2AzCN4Q3cqw3HN9rIduiXESK6znYdHkTu6j18H2Xq88q1klKNvzQIWu
   Q==;
X-CSE-ConnectionGUID: vekSC/8oT7q9t1nttmCvRw==
X-CSE-MsgGUID: 7J94M40CQDyMzhGomgVlfA==
X-IronPort-AV: E=McAfee;i="6600,9927,11028"; a="6856436"
X-IronPort-AV: E=Sophos;i="6.07,166,1708416000"; 
   d="scan'208";a="6856436"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2024 20:48:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,166,1708416000"; 
   d="scan'208";a="17117610"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 Mar 2024 20:48:18 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqPhX-0003uy-20;
	Sat, 30 Mar 2024 03:48:15 +0000
Date: Sat, 30 Mar 2024 11:47:21 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:rust/cpufreq-dt 14/24] error[E0425]: cannot find function
 `of_match_device` in crate `bindings`
Message-ID: <202403301114.dvIZbiI0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git rust/cpufreq-dt
head:   9f4ea12e8f515e38ba593b149a6c196d795f99c4
commit: 0f52b11a439d23e354762fa86b8bd7eeb7aef8cc [14/24] rust: Import platform device's implementation from rust branch
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240330/202403301114.dvIZbiI0-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240330/202403301114.dvIZbiI0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403301114.dvIZbiI0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `of_match_device` in crate `bindings`
   --> rust/kernel/platform.rs:69:37
   |
   69 |         let id = unsafe { bindings::of_match_device(table.as_ref(), dev.raw_device()) };
   |                                     ^^^^^^^^^^^^^^^ not found in `bindings`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
