Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E21521ABC9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Aug 2025 10:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755857803; cv=none; b=ZYvKCgHaO3Ng6sMIZAllTme240QX1nhYjsxbxUzR+LWXRzhD1whFJVomwbyGr/g1RCt8LmZJYLBkN78LbtealsknVamndRW9oTPtjD6bSCgO6Lstx/5sihkbUZUHWFtQ6cLeRyubRPqz6GgCDuTGOTxnRBMdZ1IwlQ7l9xHwezQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755857803; c=relaxed/simple;
	bh=687QGmJmtyLThS2QRmq58uGc6uHiotTDCtc+h2KNrtY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tp8j7wtThl51NqEeVq/aEksb52Lc4sEiYWqCkycep19oRnV34RUET/SC9McxhMmGw0voG/CZr761eq8USB0+ooGkTgEeUfoqTIlwemoFA6l93tkHQWh7laWc4z7PGkzwb+WXwUITtALbKmH1tgRPjsbAgv3N4/qEFYrVDrBaiDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QUsyTXbT; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QUsyTXbT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755857800; x=1787393800;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=687QGmJmtyLThS2QRmq58uGc6uHiotTDCtc+h2KNrtY=;
  b=QUsyTXbT9X+IgqkHQUBd/PsUfr2iaHKxgP5Ru7AmIiJX0ERVhRJv/W6K
   N7UNO18nxjtfESJA+hfGtACWcMJJd9YU1YJOVuud6sSqYhY1ptFibMXfQ
   vP31aOrjwpmWSqRtPENfLdQ+qlYC4MWhRtUZ8+3V7TWa5O73LmmhMeMq1
   GF91gXgtF91w5ytaTylUm9Sw1TlMIRAmU3rhmEqZGvxpHvbyu3GpHek/H
   GCKqj/hOOXWeCsFf4X7n2Oya0A4ypwrafiXM3irGiFEbEggd0iyfTnfwp
   LjMIxJTptWrnDfS5cNNtBLzBvLC0MoUIosYoyPwuSaciuOXMzmdM81mWf
   g==;
X-CSE-ConnectionGUID: Xvpph4bxR8GfKXy6RMd3+Q==
X-CSE-MsgGUID: O3kVuQkSToiqO0zNANm85A==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58025242"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="58025242"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 03:16:40 -0700
X-CSE-ConnectionGUID: J62//+UqQoqVucWSYwZ9dQ==
X-CSE-MsgGUID: RVpyBf/ASkmWLZC/fU5bGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="192339599"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 22 Aug 2025 03:16:38 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upOoz-000L9n-1M;
	Fri, 22 Aug 2025 10:16:33 +0000
Date: Fri, 22 Aug 2025 18:16:05 +0800
From: kernel test robot <lkp@intel.com>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: kismet: WARNING: unmet direct dependencies detected for QCS_GCC_615
 when selected by QCS_GPUCC_615
Message-ID: <202508221808.oO7q5n12-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3957a5720157264dcc41415fbec7c51c4000fc2d
commit: f4b5b40805ab116aad57ee7042359f97d065bd70 clk: qcom: gpucc-qcs615: Add QCS615 graphics clock controller driver
date:   5 weeks ago
config: arm-kismet-CONFIG_QCS_GCC_615-CONFIG_QCS_GPUCC_615-0-0 (https://download.01.org/0day-ci/archive/20250822/202508221808.oO7q5n12-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250822/202508221808.oO7q5n12-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508221808.oO7q5n12-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for QCS_GCC_615 when selected by QCS_GPUCC_615
   WARNING: unmet direct dependencies detected for SM_GCC_6350
     Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=y] && (ARM64 || COMPILE_TEST [=n])
     Selected by [y]:
     - SM_VIDEOCC_6350 [=y] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=y]
   
   WARNING: unmet direct dependencies detected for QCS_GCC_615
     Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=y] && (ARM64 || COMPILE_TEST [=n])
     Selected by [y]:
     - QCS_GPUCC_615 [=y] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
