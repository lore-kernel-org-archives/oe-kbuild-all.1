Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3742E88B0
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 22:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765319176; cv=none; b=cx+55zUr2wNVPVljoGISTikqUHHRnkJBFf6/tmB/h2+XoyQOqa+aySuqbF6vRuqKx/lA0/16mR/vIc2uEwz/++U9Y17bdgDkQnUYzdfZGtXWCpNojoDuq/8I7d6/zbEeUpOXd0WzNSMxJp8VsjmffSDJAOmqLfJzQ50yPDafv48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765319176; c=relaxed/simple;
	bh=NkSaBp5GsaznSr9JssBeCPqF7lN2V4iA2JmrpbY5z9o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DN7wtC0cU5WFrRCgIVMh9yPgd2sHTM551jgMuFItkgzq9Twh4GZ8DGIcHDSLsnRkWkEyEwFYtMOzPNiWFesy5kKawVXV4+PpdHpB6dH4eeOHXOAxgse7inNaUaEM28N3vyEEwCyjYiW4VztYgR0bHBOjaBt2rmdgoMzc+nI4KDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hXu8WOsC; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hXu8WOsC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765319175; x=1796855175;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NkSaBp5GsaznSr9JssBeCPqF7lN2V4iA2JmrpbY5z9o=;
  b=hXu8WOsCf7OxwUDCGcEgP/8VuXMnNH/M7Q9DTdWpDXk5O7OyGh77n0oO
   5nMEsJNAD0pZPi7PRP/Th5Z7I4KOMB4siM6HpkLA8+NFJoCvYKcekYcQX
   sKtaVkYpQQ7s/Oz7QHIgttx/ksJdtqS+wvY0pptApMzDHFH31G7BYnwrc
   EALWEBP4O+qfDIj0sxAp4CjTuI+Ie3TQ0D0RTR57aoqmoLlAzKTqREHs0
   G3Sc94rELmeuR+WSX42CG5yuhtM8BmDA0GRiSnPv4iRYe8nMhKjS6Uhtj
   Q8RmKQCAuFb/+x5w0AHJsiNk2hfcdb5Fg2EzlB4dqj8Ahf9AXzer3Ucpv
   w==;
X-CSE-ConnectionGUID: 5Ra8cEaLSk2TLlQaN++5OQ==
X-CSE-MsgGUID: uGmrxKJKR1ikpuLjF4cpwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="78649188"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="78649188"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 14:26:14 -0800
X-CSE-ConnectionGUID: 2lxbGSKdSVmx2CbRYFc0RQ==
X-CSE-MsgGUID: ZRv1UePWQKKMhRtvuGxz6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="227378359"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 09 Dec 2025 14:26:13 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vT69q-000000000OT-2kaa;
	Tue, 09 Dec 2025 22:26:10 +0000
Date: Tue, 9 Dec 2025 23:25:13 +0100
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Subject: [qcom:clk-for-6.17 13/64] kismet: WARNING: unmet direct dependencies
 detected for SM_GCC_6350 when selected by SM_VIDEOCC_6350
Message-ID: <202512092343.dmj5ns7I-lkp@intel.com>
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
commit: 720b1e8f20047e072b98a0931fc3e9a545fda18f [13/64] clk: qcom: Add video clock controller driver for SM6350
config: arm-kismet-CONFIG_SM_GCC_6350-CONFIG_SM_VIDEOCC_6350-0-0 (https://download.01.org/0day-ci/archive/20251209/202512092343.dmj5ns7I-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251209/202512092343.dmj5ns7I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512092343.dmj5ns7I-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SM_GCC_6350 when selected by SM_VIDEOCC_6350
   WARNING: unmet direct dependencies detected for SM_GCC_6350
     Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=y] && (ARM64 || COMPILE_TEST [=n])
     Selected by [y]:
     - SM_VIDEOCC_6350 [=y] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
