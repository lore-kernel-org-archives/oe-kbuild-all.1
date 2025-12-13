Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EECB225390
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 18:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765650734; cv=none; b=eYtzrp5+VSJctQZQrq9f7NqCC52Enifw3mwWrFokjztt+H6j+xSNSdEoILPOmj5f+THa4vCqobb1S2dl2pyvO1E1oS3qI3iWWbmAbSJv9MkKgGbw2eTg/ahGJkZvpwoMtyT0SUEUWMQ0qyPDAY9wi6eo9rv4+SnyJ21E1+OVyqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765650734; c=relaxed/simple;
	bh=K6P+KFMCdstlf7zKmWpqTWEGUl4jZfTDwfRk5DEg79k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HsACF+LKalgg8r38SPVCAr2f0SqO57oHWvUnuq2+KfZM383PbbTn6QR7jRx4fL+uExYZnLLUoCOjtW58gIxKBn9NrOBkJFvdIbchwxIwqZ4G+S/Ck0Q//GKjy87YkZ00QJ4Pex3yKvhQXhiC14VIpmeoHjEE3Es/TSznrE1Ld7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZXTJVLeV; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZXTJVLeV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765650733; x=1797186733;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K6P+KFMCdstlf7zKmWpqTWEGUl4jZfTDwfRk5DEg79k=;
  b=ZXTJVLeV0szYCayaJhY14/P4mEsfkRrS69/KYpd2Jb5SHFKo8UQ2x38p
   JDYJ4pQVpx8p4pKz9WUhir/QUfg3/v75EoYB0f/KYtUNIYqLTGEKC+MQ9
   P0P3BnaCQX1/I+ULFZO0T13vFD4VzJ4jX2DltKb0s1XL1xB9W8cjvVZZe
   w7nb0Ndy1twy/CZFIwEYfBBbI1TPPYJWLlpILhHzm/A8pboJJbduaRbbX
   nuM8Vvhf8tcT9vKXamgLRTSYBAU/PDijIjNsZ6gLD2z5t5sz2a54Vvp/W
   z0pHst8EqbEuUA7GYFLJbRrinsWglrtk9CC2YEUtollU6yTcguw2yOzqG
   w==;
X-CSE-ConnectionGUID: JPXz0YYVRoCeCr3cGyUWLg==
X-CSE-MsgGUID: m5jOJFr8SmeFPf7lNa6YAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="79074802"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="79074802"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 10:32:13 -0800
X-CSE-ConnectionGUID: o876itBgTM6FDBp03dq/lQ==
X-CSE-MsgGUID: KFANyWl5R3qdIHFXWqdYSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="196427474"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 Dec 2025 10:32:12 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUUPZ-00000000847-2i8R;
	Sat, 13 Dec 2025 18:32:09 +0000
Date: Sun, 14 Dec 2025 02:31:41 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: drivers/gpu/drm/msm/hdmi/hdmi.c:439:1: sparse: sparse: symbol
 'msm_hdmi_pm_ops' was not declared. Should it be static?
Message-ID: <202512140237.eGaaP56U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9d9c1cfec01cdbf24bd9322ed555713a20422115
commit: 0c5ec818cc166b4633c5f12e26abfddb57f6af9f drm/msm/hdmi: implement proper runtime PM handling
date:   7 months ago
config: arm64-randconfig-r113-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140237.eGaaP56U-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140237.eGaaP56U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140237.eGaaP56U-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/msm/hdmi/hdmi.c:439:1: sparse: sparse: symbol 'msm_hdmi_pm_ops' was not declared. Should it be static?

vim +/msm_hdmi_pm_ops +439 drivers/gpu/drm/msm/hdmi/hdmi.c

   438	
 > 439	DEFINE_RUNTIME_DEV_PM_OPS(msm_hdmi_pm_ops, msm_hdmi_runtime_suspend, msm_hdmi_runtime_resume, NULL);
   440	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
