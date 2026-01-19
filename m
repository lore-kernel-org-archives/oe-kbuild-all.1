Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA1C3590CF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jan 2026 11:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768821089; cv=none; b=DKF14P2EewEwx3fsL8P8/GLEmU3HSDj7I+KQomhSpBdJAzhhZYkh+q9YRuDV7cBfdC2CczEWRGLdSaJcc4XsaJJPz77HC03Nids3y4iubu4jDxcpSCRa+Ytd86UzmUpF9RSHM+h7XyVwMpfIJ8zDy8kGInJu5hXs6O1S8F3bfsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768821089; c=relaxed/simple;
	bh=U5wsVEf5DpYOiCGHkC6zykvklU0nyMLozm323BFPiqw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CLsavGmzF69WJSLUfYZMpU00huk0kCsUPkq7c0nCoMbK90ioevOtp2BYtPwpk0egHdqXQx0c2wU6SVC4Vy3dkF+7/xRpHqPefjNE9njzBbHy89Fjy6Gn676/vlVRtajd+FnAjO07JgXQzVvmfTnEUiWIqsnxl2+VAJ64+4AG/Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R3yrF87Y; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R3yrF87Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768821088; x=1800357088;
  h=date:from:to:cc:subject:message-id;
  bh=U5wsVEf5DpYOiCGHkC6zykvklU0nyMLozm323BFPiqw=;
  b=R3yrF87YB8P84cfcjTSQAp/+A/B1N/T8dAcR6jtYOq3ZbVa2DJ/zprPg
   MURZ7evtYgogAopKNpPniyVSENZP/xYn/wAQnFE3ugR1exARI7grIfPjq
   uB2iSDq1n1lplxCZaIwIRgvtYB8r+NcBifniOQlIx0ptVTKFTWGUmn+oA
   Oymc28FJubxr6uXq2KT3zsC312mLM1da8oKuYfDRz2dk60viSOcxr6Vil
   AknEWoRGeYYWdYxBH6luhbbuIcxELiPpi34AnWjAxbbVekNycDMi8tigy
   UVFgjM7F/epFXiJ5p/nbG5Fz6/45dozHDRBKS7iDwxVn7HlvvOxLO29uc
   g==;
X-CSE-ConnectionGUID: Ojb8Qk2ORKuDrW3xZufj4w==
X-CSE-MsgGUID: drPhrsSvSUiyu1Hw9XSpfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="81472844"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="81472844"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 03:11:27 -0800
X-CSE-ConnectionGUID: MhFDcR3ITXyLo0Nan6LhBA==
X-CSE-MsgGUID: HCRJg8zWSI64G+lYjeDgFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="206272635"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 19 Jan 2026 03:11:25 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhnAI-00000000Nil-2ZqB;
	Mon, 19 Jan 2026 11:11:22 +0000
Date: Mon, 19 Jan 2026 19:11:03 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: drivers/gpu/drm/msm/hdmi/hdmi.c:439:1: sparse: sparse:
 symbol 'msm_hdmi_pm_ops' was not declared. Should it be static?
Message-ID: <202601191930.05BnzKNA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
commit: 0c5ec818cc166b4633c5f12e26abfddb57f6af9f drm/msm/hdmi: implement proper runtime PM handling
date:   8 months ago
config: powerpc-randconfig-r131-20260118 (https://download.01.org/0day-ci/archive/20260119/202601191930.05BnzKNA-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260119/202601191930.05BnzKNA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601191930.05BnzKNA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/msm/hdmi/hdmi.c:439:1: sparse: sparse: symbol 'msm_hdmi_pm_ops' was not declared. Should it be static?

vim +/msm_hdmi_pm_ops +439 drivers/gpu/drm/msm/hdmi/hdmi.c

   438	
 > 439	DEFINE_RUNTIME_DEV_PM_OPS(msm_hdmi_pm_ops, msm_hdmi_runtime_suspend, msm_hdmi_runtime_resume, NULL);
   440	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
