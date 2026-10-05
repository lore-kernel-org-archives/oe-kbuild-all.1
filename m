Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3864AD4C8
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Oct 2026 16:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791216157; cv=none; b=mpDHc3axYw5M3X7m6BSMrc/cIyb80vd07jMeVKDANL+KApByJrtGHoFo6BlFCbIO6CcLnsb86DRqDA4s7ARq0l+ytUTATIVOr15TYL+sOxuIA9HP0ip/cetact/S7NWlUqf/BzdHUBC+uNq6hdcmR151ZiGUicHkhN2tkoWKamM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791216157; c=relaxed/simple;
	bh=yh1dbvDkzGHuQuag076JKRLXFefPxDbREEvSG4dIEW4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=n6bSnUxNKI2JZOjX8lbyxMdnJPi3cRUaAsJsY/DKh0TGbfjFdRkLDWfQ1Q+FJx3OHSnFrB9F5n6XF3olX1yHudAKvy891dHec7F87yslJtLxpLxd2yxOgBiWHvMTSHqS2AIjtnCv1Haw90dp9NLdCIGRMF8PTWrvJuJ76ziMdeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g4P/tlVn; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g4P/tlVn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791216154; x=1822752154;
  h=date:from:to:cc:subject:message-id;
  bh=yh1dbvDkzGHuQuag076JKRLXFefPxDbREEvSG4dIEW4=;
  b=g4P/tlVnWPJMXRSm0nte35QTtY7pqlxSvCCSbqYl1kGqPKSk8sAV/nPV
   6DrIa1iBhpdz2tWFpJH2UL2/NfKV/ecBPz+2hTTFvQ/yxxzoTn+3KUtPU
   ETFpVp5wtR+6yDx2pqYwg/ZbpTfkLSXbA4QaOxSXq+KsYCKpl7MQePbp0
   V6aw+VUULwMamI4trDfgUyUdF8sd+cp5buU0vNmP/XaB2c1cDl7DMr+ZM
   NCQqwnaYyEuTZAdVX8OjwfZcyAYlcBz4n3IEPEbincwbFHEFTXf/Beozh
   nLiwCkvzX9xMTJXOcmdNoDFRyq0BNbUDYjr4Rca3GLFbChwEQLGGgQGIX
   Q==;
X-CSE-ConnectionGUID: NcWvvwU4R62gdo9Fqb3uGw==
X-CSE-MsgGUID: 9/EYwFeDR0WSjsykCun37g==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="91752191"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="91752191"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 09:02:34 -0700
X-CSE-ConnectionGUID: Ur8cpQ3qSMqeUTT8XpAruw==
X-CSE-MsgGUID: /y5onG3yRZerQmj8ARZoMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="275501887"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 05 Oct 2026 09:02:33 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDl94-000000000DD-1vrO;
	Mon, 05 Oct 2026 16:02:30 +0000
Date: Mon, 05 Oct 2026 18:02:27 +0200
From: kernel test robot <lkp@intel.com>
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/media/platform/qcom/iris/iris_ctrls.c:1635:13:
 warning: unused variable 'ret'
Message-ID: <202610051710.bnOqLkUl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Deepa-Guthyappa-Madivalara/media-v4l2-core-add-new-control-type-V4L2_CTRL_TYPE_S8/20260930-113024
head:   aff4d347c60c51044e7f911399fbd7ea2e63a2a8
commit: aff4d347c60c51044e7f911399fbd7ea2e63a2a8 media: iris: Add BUF_ROIMB_DELTAQP metadata buffer for ROI delta QP
date:   5 days ago
config: nios2-randconfig-r2202-20261005 (https://download.01.org/0day-ci/archive/20261005/202610051710.bnOqLkUl-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261005/202610051710.bnOqLkUl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610051710.bnOqLkUl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/qcom/iris/iris_ctrls.c: In function 'iris_set_roi_params':
>> drivers/media/platform/qcom/iris/iris_ctrls.c:1635:13: warning: unused variable 'ret' [-Wunused-variable]
    1635 |         int ret = 0;
         |             ^~~


vim +/ret +1635 drivers/media/platform/qcom/iris/iris_ctrls.c

  1623	
  1624	int iris_set_roi_params(struct iris_inst *inst, u32 plane)
  1625	{
  1626		struct iris_buffers *buffers = &inst->buffers[BUF_ROIMB_DELTAQP];
  1627		u32 height = inst->fmt_src->fmt.pix_mp.height;
  1628		u32 width = inst->fmt_src->fmt.pix_mp.width;
  1629		u32 metadata_header_bytes = 256;
  1630		u32 lcu_height = 0;
  1631		u32 lcu_width = 0;
  1632		u32 lcu_size = 16;
  1633		u32 n_shift = 0;
  1634		u32 size = 0;
> 1635		int ret = 0;

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
