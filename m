Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1522D1A724C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 20:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765310535; cv=none; b=YpXDm9o0uBR2fjUL0qmeb4uCriqyYS7L+gl9msmxrsl/Uf8KyfE+scLozwAVkVkurfu/PLV6AhVoXeB+k5DFJbBPFiI8KMs28WHqMqu5CTOo+0iHiIGuzQJ0MW3jJVfAuwFmq/voA0pTrtbeLvWjyvPHuEekZnn1l9Zv1UVhDKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765310535; c=relaxed/simple;
	bh=lCAKatf8XQ0w35V4RelctuqiLj0yKAhYaZtZMWRliyE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E+bLXfT/wQdgKwZaBelY8YoCf1NbSecHLpaW6I8FbVzFSFjDahcKwyNZPCQuyd2/KXWHNYqg/0poXVw+pTshi6Nz+YOQeGRnfkQvb3ZCmv5eDeVbeZKJBaZ3D1f+Qz+vyK2s/SNlDP5UbR0gD9GpQMnepq9Dh1OVG5C9O0k6uh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q1g+9MbO; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q1g+9MbO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765310534; x=1796846534;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lCAKatf8XQ0w35V4RelctuqiLj0yKAhYaZtZMWRliyE=;
  b=Q1g+9MbOW1AubjQdipcKq535Kmb6EuvgdlN5P917YViNe33Oe5JTvQNp
   evA/eNAz5BX2UWQHHrnoAIEBfrdH/QyHQ39BtAJ6OpQ4i+tjmE1/q4/xO
   tEYGxnkKzcYHtn2xRid1loSSmBLvoDqSWnf1vU1mQrPLokK1+Avdyfxop
   z/wgWoahI+//Q9l6KvNIJGYkvUnBWLXliSJ69WQ2CZU/sIKGqp14RiON1
   8M1tYzYDX4JEN5Z6/6zDZXoMqHbi8B56Wb5jgAuv+h3xvhFNJrshVOxc1
   +8KWyeg2tZv3e4MQagiFGqjlag2FP+EYynqIRMT80DA8jlNzodWPoi8Fa
   w==;
X-CSE-ConnectionGUID: xApVS6FPRca3704UxE1G1g==
X-CSE-MsgGUID: aBrTHlrOSzOX1t3KCkNF5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67352017"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="67352017"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 12:02:13 -0800
X-CSE-ConnectionGUID: 9bhtG1iAQVus6KoCQZHgkg==
X-CSE-MsgGUID: hPMDZ2csS6uKRCXeFgTE6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="196320804"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 09 Dec 2025 12:02:12 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vT3uT-000000000MV-13nb;
	Tue, 09 Dec 2025 20:02:09 +0000
Date: Tue, 9 Dec 2025 21:01:09 +0100
From: kernel test robot <lkp@intel.com>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [qcom:clk-for-6.17 32/64] kismet: WARNING: unmet direct dependencies
 detected for QCS_GCC_615 when selected by QCS_GPUCC_615
Message-ID: <202512092140.ca9UuKw5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux clk-for-6.17
head:   45dd59885ca8d283f365774a82b9b785b65c8d37
commit: f4b5b40805ab116aad57ee7042359f97d065bd70 [32/64] clk: qcom: gpucc-qcs615: Add QCS615 graphics clock controller driver
config: arm-kismet-CONFIG_QCS_GCC_615-CONFIG_QCS_GPUCC_615-0-0 (https://download.01.org/0day-ci/archive/20251209/202512092140.ca9UuKw5-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251209/202512092140.ca9UuKw5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512092140.ca9UuKw5-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for QCS_GCC_615 when selected by QCS_GPUCC_615
   WARNING: unmet direct dependencies detected for QCS_GCC_615
     Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=y] && (ARM64 || COMPILE_TEST [=n])
     Selected by [y]:
     - QCS_GPUCC_615 [=y] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
