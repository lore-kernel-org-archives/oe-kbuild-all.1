Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42381754B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Jul 2025 00:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753144724; cv=none; b=PVEdPUO3cnMDh1FXsg/7XGFmmgvhAoMLOnFHenhvRYAOScjQkCxSklaheln5KPCk1peHnt7F//qUAZHgn0wd+3AcNpnfE9Z8WEhj82ZlK6Pzfaz72+Mc8UEjuUwsMJJPa0bwLIz6vvUYZpEaBkGsDmHqyI/km7DKz0THkU28i54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753144724; c=relaxed/simple;
	bh=E5UNj7ieYnULkC1N1JDf2GFNmzQ2UZTp7aDt859BTcg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qb24mVLc0gaL+FEpdkcM4N8pNE+79hCw42Xu1HnxD6IPU4f/xJDJCQi1wt/IwNXEzuEAchtVnoa2P2qD8NLYWcily1pfDLR58tAJqNwyCXp/MW9fFlrvPD+gCYBvu3F5R2ltAcqjbREErJwE8vpLg3aUsxwWZlZQzy7jcx9I970=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jxm6kexW; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jxm6kexW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753144723; x=1784680723;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E5UNj7ieYnULkC1N1JDf2GFNmzQ2UZTp7aDt859BTcg=;
  b=jxm6kexWkWkMldW78A27wZPkUpMXOH+agY++6kgcK/ZK/mLXSeZEMkoV
   mV8vufjgXtqksv4iz1YME9N13K00gRPCy0utCIM+z9FGq39OeQBl7M1YT
   aEjIePGlr1B8neu6v7hBXloZ2Ys1ADR8m+UlbHOS9l0+lHdj2j6paBbKj
   MfAi8tbPJ+H0ffWyNptHLLp2gmr64PBFXnc0ivnglIDHSyTpQdNIaa+6L
   Zdr3HhqihGWQVqvvZhietRplr0SJAlLJspDDwBxpDPQbXkaJJbF8cyeWq
   tlHeU0LUX1rIe6q2bV61hsGw4HLdMIf/POOPvDUiNNi4FIY+ZSM0PJPQF
   A==;
X-CSE-ConnectionGUID: AHHzGwu8QGSVAAMu9zU08g==
X-CSE-MsgGUID: +u4Yk+XwTdqzCTzImBveeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="59039387"
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="59039387"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 17:38:42 -0700
X-CSE-ConnectionGUID: mgrne18eS5SiDFfD/uSiCA==
X-CSE-MsgGUID: TIry5wS4SSGfgq8ptKntEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="159389365"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 21 Jul 2025 17:38:40 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ue11h-000HHx-2s;
	Tue, 22 Jul 2025 00:38:37 +0000
Date: Tue, 22 Jul 2025 08:38:01 +0800
From: kernel test robot <lkp@intel.com>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [linux-next:master 10112/11398] kismet: WARNING: unmet direct
 dependencies detected for QCS_GCC_615 when selected by QCS_GPUCC_615
Message-ID: <202507220802.0Iz9U37j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   97987520025658f30bb787a99ffbd9bbff9ffc9d
commit: f4b5b40805ab116aad57ee7042359f97d065bd70 [10112/11398] clk: qcom: gpucc-qcs615: Add QCS615 graphics clock controller driver
config: arm-kismet-CONFIG_QCS_GCC_615-CONFIG_QCS_GPUCC_615-0-0 (https://download.01.org/0day-ci/archive/20250722/202507220802.0Iz9U37j-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250722/202507220802.0Iz9U37j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507220802.0Iz9U37j-lkp@intel.com/

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
