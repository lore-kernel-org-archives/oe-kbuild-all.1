Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35F74414
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Oct 2025 20:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761080027; cv=none; b=p2bOSYq5MGC1WupAKhmc5gaeOlLynRCl82BxL0HwemP2EZhx12/VJFQwVnSpeEkWAqTm41oDjlYXPol3+iQ61KxYY5KWRwm7EPu7ZM3pXcGkRSwma2uaiwrlkiAgkIvnfKuSWEoyjD59C8vr3H0uoyuYjUS6u5EwvHy4Um4mwjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761080027; c=relaxed/simple;
	bh=wiZ5X5fbwtZhxINSyVWyj5iTvVs82zVyv6tMmr0D6Nc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jy70Mm+9QqmzNHmp1kV/7IK9fxq9Ce330824co37IyIBgNuaComuNIPZIp1jN5MGCvUyZIfd05B87DAugKG9PYtv9zMp4QkZ0r5MU6oKHuxSYwf7zKQwcRgvLwmWebVirKlu0BlAow1C11+mTQ/HHuRZvYDJiPTqZ+TVuT107Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FlR6WEQ2; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FlR6WEQ2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761080026; x=1792616026;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wiZ5X5fbwtZhxINSyVWyj5iTvVs82zVyv6tMmr0D6Nc=;
  b=FlR6WEQ2FTtCvPQRGi8QmOGTW4ULfaxwWMaRciosurPGZ9LF3MwjblfU
   o3AKiQ03toucpcSoIUT8GxodO6/El1PAvvpr0gNjRW0g9IDwxaRkk6DHb
   mSYg6G34NNgd2Jbya/xhZFQqYojZ2Lry8YjUBb3KrIOr2wDdYgFJIa4Xi
   GhVWCEExX9fQstJIbklknrnYgNlqNYmrrz5+5ZC4IKwIEOK1MtMmrM5uk
   BK58ERSalaPJ9bHORwvq9aPg0cjL9zyOX2Sy/FFsksk4CfBnWn4Oado60
   +/9POlSOmNWKv3ng7wKNf23ig44LOETqPCEEhpEUqyfd9JgvcHCn8IeuK
   A==;
X-CSE-ConnectionGUID: isXl+677Saqluw2jt87UeA==
X-CSE-MsgGUID: Z871G+P6To+KAxfcthyHmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67082700"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="67082700"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 13:53:45 -0700
X-CSE-ConnectionGUID: m+yKIJxTS/6TiTmUFK8E0Q==
X-CSE-MsgGUID: JhbfACeKSbueu0cRmdzA4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="187728122"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 21 Oct 2025 13:53:44 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBJMT-000Bjx-2C;
	Tue, 21 Oct 2025 20:53:41 +0000
Date: Wed, 22 Oct 2025 04:53:05 +0800
From: kernel test robot <lkp@intel.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [linux-next:master 2463/3056] ERROR: modpost:
 "devm_acpm_get_by_node" [drivers/clk/samsung/clk-acpm.ko] undefined!
Message-ID: <202510220413.Jl3GvM6r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fe45352cd106ae41b5ad3f0066c2e54dbb2dfd70
commit: 40498a74205371400a5b0088acb886ac47a523aa [2463/3056] clk: samsung: add Exynos ACPM clock driver
config: loongarch-randconfig-r123-20251021 (https://download.01.org/0day-ci/archive/20251022/202510220413.Jl3GvM6r-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510220413.Jl3GvM6r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510220413.Jl3GvM6r-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "devm_acpm_get_by_node" [drivers/clk/samsung/clk-acpm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
