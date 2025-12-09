Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7501830C354
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 21:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765314916; cv=none; b=tw+YbqR7RpLh7hRbw87L9kJ2wywmZCq9G6Yd6oHs4uip15m5kcXRTu0AyGbYsg2QF1uo+wc8HElFxrihUmzQXaFHSr1BIGRkA6MDIYbG1rLT/ulNfDm58Ms+ESoIoR1LIPN+9509vJMhhzuorod4hzeKn6s2g1VJ/Jt5x6aLymw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765314916; c=relaxed/simple;
	bh=DT3hsKO2oqlhTkQqS7rGkeEPPwAykFKU7AfjkrOJyvY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=py5BCY0In0nYvV7dwLKzJKoyiVqk49PouHmc7EWJNotW8KE6eDw8cbV4fchbjAdeX1Kelg/lBtHDQVlSs5z7onPyzQbGcoUUdylYdGKpsBGTkEZgUciDKyUipKRpqmtBOWVHV2VtOfP6ZG2NjDwM5kW13w+0tesjhFsFjgtbY/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bYHfO09w; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bYHfO09w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765314915; x=1796850915;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DT3hsKO2oqlhTkQqS7rGkeEPPwAykFKU7AfjkrOJyvY=;
  b=bYHfO09wF0QsMpgJp9qp3In1vevV4zAf4cY9uuXD6px3+1dZDdTSuIfl
   wtAISZk5UVnRInlJuT9GwdzBdSHU+qAQpGukeaMChGTG3VTqaiSmZ2DJu
   8Ja5IOnTLZD8vB0DNJRa4w4oGoSgvB/p++JChA4EZ86y7a6eEI9qnkFtU
   nxBUpoM+w3yI8ih6Dqp/Kj9yeIWL2FY6t3nn6Cl6A2oN3O5s2OXpa676w
   iS3+Irs/6GlkHu9mKahjNL+9RS8Q1SOQnNkxNxH4/AfoJcrYlsUpTQb/9
   XqM3AMLrG/u4tdtRrARU6TPNPcvbPMz5ezCMTPsmunTr4GqvuZRsxA3ds
   A==;
X-CSE-ConnectionGUID: FKUu3IbtTcKGL2bYqB0DbA==
X-CSE-MsgGUID: RMuQs4WXTYKADB/XYCzaGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67176491"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="67176491"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 13:15:14 -0800
X-CSE-ConnectionGUID: Tj0VjA3uSXeQ4YAfmgoitg==
X-CSE-MsgGUID: qTpmQiCrSAaGiLfAmdCGRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="196624069"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 09 Dec 2025 13:15:12 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vT537-000000000NN-3co8;
	Tue, 09 Dec 2025 21:15:09 +0000
Date: Tue, 9 Dec 2025 22:14:29 +0100
From: kernel test robot <lkp@intel.com>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: [qcom:clk-for-6.17 34/64] kismet: WARNING: unmet direct dependencies
 detected for QCS_GCC_615 when selected by QCS_VIDEOCC_615
Message-ID: <202512092259.lufPH8Tm-lkp@intel.com>
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
commit: f6a8abe0cc16c44eda30712a8922261363d6d3ac [34/64] clk: qcom: videocc-qcs615: Add QCS615 video clock controller driver
config: arm-kismet-CONFIG_QCS_GCC_615-CONFIG_QCS_VIDEOCC_615-0-0 (https://download.01.org/0day-ci/archive/20251209/202512092259.lufPH8Tm-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251209/202512092259.lufPH8Tm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512092259.lufPH8Tm-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for QCS_GCC_615 when selected by QCS_VIDEOCC_615
   WARNING: unmet direct dependencies detected for QCS_GCC_615
     Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=y] && (ARM64 || COMPILE_TEST [=n])
     Selected by [y]:
     - QCS_VIDEOCC_615 [=y] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
