Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712AA214813
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Sep 2026 04:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789188951; cv=none; b=Mv1fJuEHNfNtD4QMbxNyqIIdtlbI0OIIXO9AqThBb/XJG8FQnhNbAvuOYANo5IxiNw/0pHjdcXKHwOZNqISfZU4qQNZczq7gSB1oSxQ9GVtmB7D2BhY8/PfTxloUY9eAT2aHfzgvywP4aPvXxP/FN6XznjCeqoIgO2Z05f49+Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789188951; c=relaxed/simple;
	bh=nlwJ1nj6VX78zyEaoerV+ll0szQq5kNKiMruPsRXwlc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qSDbF+V5m1ly+V7SPpDERdVjPqN1tRd86iMg4f2UFyO2ZCPuVOMDNQyye/fa3MhqUMR5Eo484eVqK6WJaZARZHXcU+FYqBJlK+fdOk2qF+6+qeLAv3oc2sgQBVmPNHhCKs7XLFD0JImt1H8YPUFWnzyDIheB0O5FPy6eJpvms0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nKzyrfLc; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nKzyrfLc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789188949; x=1820724949;
  h=date:from:to:cc:subject:message-id;
  bh=nlwJ1nj6VX78zyEaoerV+ll0szQq5kNKiMruPsRXwlc=;
  b=nKzyrfLcZR4w80xW8pZdim499RPRKs6VS8nSPh9CfoF0qshRA8HoBag6
   T69s4ISlaCiF/hZCgY8t5zLjSrrf888nAgRknZyVfjdqmDy1VrhEC+mWh
   n+ycMOnoQZgwrdTR6XStWV1U29dlkJmJ8noGj2GqePNJupKQqFPbl9wkb
   LGre0h6OC+CVG7Yu1MGDOd6CufPTWoJs73+M5zT9OkSznpx4aMOa7+cQe
   1y4GEd3EOsnj5oRyhQn+yc45qNvklWFrXzKpXm/QWiaQOvaEcDwUjlKtJ
   jXW9723qH+JaXL78CL4NTnqug29NrfX/1M7EgHzCCCDW/KtxmCBZYDEzV
   A==;
X-CSE-ConnectionGUID: qc1XmqWqRYSsGnPHiSzJ9Q==
X-CSE-MsgGUID: tCz3z6ixS1ODPtdujuIouw==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="89487038"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="89487038"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 21:55:49 -0700
X-CSE-ConnectionGUID: thO9qf/yR9OcjUTjcJR6tg==
X-CSE-MsgGUID: CsAqN5WnRyS6g0dTaMe5NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="354080"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 11 Sep 2026 21:55:47 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5FmC-000000000yd-36ui;
	Sat, 12 Sep 2026 04:55:44 +0000
Date: Sat, 12 Sep 2026 06:55:37 +0200
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
 Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [linux-next:master 5325/6369] kismet: WARNING: unmet direct
 dependencies detected for QCOM_SCM when selected by DRM_MSM
Message-ID: <202609120634.g0HMAp3g-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   68142f986ff04b2b70b31db00f719bf690f64a9a
commit: 8fecd3194de338bdc0c57597be61fdcf33e1832d [5325/6369] firmware: QCOM interfaces should depend on ARCH_QCOM
config: arm-kismet-CONFIG_QCOM_SCM-CONFIG_DRM_MSM-0-0 (https://download.01.org/0day-ci/archive/20260912/202609120634.g0HMAp3g-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260912/202609120634.g0HMAp3g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609120634.g0HMAp3g-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for QCOM_SCM when selected by DRM_MSM
   WARNING: unmet direct dependencies detected for QCOM_SCM
     Depends on [n]: ARCH_QCOM [=n] || COMPILE_TEST [=n]
     Selected by [y]:
     - DRM_MSM [=y] && HAS_IOMEM [=y] && DRM [=y] && (ARCH_QCOM [=n] || SOC_IMX5 [=y] || COMPILE_TEST [=n]) && COMMON_CLK [=y] && IOMMU_SUPPORT [=y] && OF [=y] && (QCOM_AOSS_QMP [=n] || QCOM_AOSS_QMP [=n]=n [=n]) && (QCOM_OCMEM [=n] || QCOM_OCMEM [=n]=n [=n]) && (QCOM_LLCC [=n] || QCOM_LLCC [=n]=n [=n]) && (QCOM_COMMAND_DB [=n] || QCOM_COMMAND_DB [=n]=n [=n]) && (QCOM_SMEM [=n] || QCOM_SMEM [=n]=n [=n]) && PM [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
