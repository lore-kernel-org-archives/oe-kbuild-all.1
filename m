Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3571A5BA0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Jul 2025 01:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753148451; cv=none; b=MVQcnLnVW0HSMt99w/Q6Pd8Yvd2d2Ppt/uRVxoeOUi/1o8pk//y1x1B75mLq7cyhzENCITxNXp7s9glwAvfF8RoZ3J6Q0VXI5rn0WeNIHzMf3pib6PdCmI16brHL04prj9Yigd9QJ/W/i0gcS8MR7fJ2YfNv1oiGKmQPHFm6xaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753148451; c=relaxed/simple;
	bh=T3VEyQlpJFPbNu3GFIK7/xckMTz7CThd92MMz22su4A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HGQQUX/mVlkriXchfxIueb5dmySHjVM3adP+sMsbeXtnOhBay/R+8mTnzUk8aiAILiUh9Zmk/9MIpuptokXxjvTUuZ2bKmRTd8NAMtimKU3iBRb2GKoYc8E6gg11cZUaZ0JM4UTg9PXk+WioQc6dHQC1nnVQoQzO6lTNY2yjBqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DaoAGcmW; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DaoAGcmW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753148450; x=1784684450;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T3VEyQlpJFPbNu3GFIK7/xckMTz7CThd92MMz22su4A=;
  b=DaoAGcmWzUJDCB5iJiM1FtR/DUMKDyT8AGOIpSyBppzlxVW/8iGwSxAF
   EFJy+1mDc312lSmXptAUisaFzEjXDqmEQwhwfh5S/EH3NrMWpjfxJAH9S
   ArcHaxQpk68zAU3UY7VssOPIvJ3zb7lYLct8dYGs3D+Gj59ih7FWknqIs
   MXuO2iHOQKFx/KxkWiouQ6NZ9oo3HRiKcWuhKuhQc1BzvaCQcGmwYK2hH
   J1N7UHD3OTJRuTAUQCa/cl6IHiQyBWxbUFn77NggqHGy1f//+tUHiWbGq
   1OdSeo1jHcRO7tUXtDNXKEjH7bA9kiDGZi+LoT6TcXps+UE/TTxdbmek2
   g==;
X-CSE-ConnectionGUID: kgSOSYdXQE+DHuDl8uz2BQ==
X-CSE-MsgGUID: ISxIbT2pTBuP+z8e8qmZcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="55470538"
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="55470538"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 18:40:49 -0700
X-CSE-ConnectionGUID: fbbM3t+JSGmJzds9GJiHlg==
X-CSE-MsgGUID: 9E5c6VjITcGNfJGl6z0N2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="196077113"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 Jul 2025 18:40:47 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ue1zp-000HKH-0W;
	Tue, 22 Jul 2025 01:40:45 +0000
Date: Tue, 22 Jul 2025 09:39:57 +0800
From: kernel test robot <lkp@intel.com>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: [linux-next:master 10114/11398] kismet: WARNING: unmet direct
 dependencies detected for QCS_GCC_615 when selected by QCS_VIDEOCC_615
Message-ID: <202507220927.C6zNUJt7-lkp@intel.com>
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
commit: f6a8abe0cc16c44eda30712a8922261363d6d3ac [10114/11398] clk: qcom: videocc-qcs615: Add QCS615 video clock controller driver
config: arm-kismet-CONFIG_QCS_GCC_615-CONFIG_QCS_VIDEOCC_615-0-0 (https://download.01.org/0day-ci/archive/20250722/202507220927.C6zNUJt7-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250722/202507220927.C6zNUJt7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507220927.C6zNUJt7-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for QCS_GCC_615 when selected by QCS_VIDEOCC_615
   WARNING: unmet direct dependencies detected for SM_GCC_6350
     Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=y] && (ARM64 || COMPILE_TEST [=n])
     Selected by [y]:
     - SM_VIDEOCC_6350 [=y] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=y]
   
   WARNING: unmet direct dependencies detected for QCS_GCC_615
     Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=y] && (ARM64 || COMPILE_TEST [=n])
     Selected by [y]:
     - QCS_VIDEOCC_615 [=y] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
