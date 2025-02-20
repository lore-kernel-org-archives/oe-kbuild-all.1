Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0071C6F70
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Feb 2025 14:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740063241; cv=none; b=FDaXn2+vVylBbI1JDGfeh60M3Wf6ixFdcWENZmWDQ9zZea/9D0+vbbndGZSsOMJGlw37NvPvneu/qlJL37ktiugJU5UFtIIoEgPFagkjCmghOQLCcAQyvhr2pfVgqOvbuXnDaUsMgHlUxW1voLSXnTYDR43ScDDYfyGqaBqrc+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740063241; c=relaxed/simple;
	bh=dV1VuRHLPs7RxVaxIJpZTE7Ns7cNvmfnifbiYGj65K4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PUVWycIcwrMn3/kyzHeTjIx6iOu+9pqhtz4Taxm+A+O/ghfPfDt+tmPJElpvw5tZbmvJwr/xUGueudWVDzgJLxFwFNkNI79YtgEHdtTRSuFPEFcW2ZFO1defZUYdaeA9FOQrGj3Hw07O3GzlH1k6Vz2FP1PU4tD5adWBP9KEsIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S9qbwBPL; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S9qbwBPL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740063240; x=1771599240;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dV1VuRHLPs7RxVaxIJpZTE7Ns7cNvmfnifbiYGj65K4=;
  b=S9qbwBPLJcSA7cyt+DirVlJ4bXhQPcWJEj9Dp69fyCmEBX8wo5W7KSWX
   ruZu/QF3G4UXErMr9JIvzuX/xoTBmzMMMHJYTZ3qMzomRBxl1O5sDpq5X
   39TrSgIaj/qx9LcbCf8zs2dAR5nfaFi0AyiKj4fWooLCuD02o02z7eo4i
   jHReJdtupiUIMTclQEY+GrW8jOmkdyzaPLcLDs1mcV6u3E9pGIoXJBHPb
   h/pTKSew75PW1LFOgo4TKOciQusX9jp2wEd2S6zLvimquxS369lHqmIl1
   jtVnQzXzp/frvGmJ2Dd3Ju7i2mxMeDrrc7hkQ9xIZ/X1cM9X3qvRtU4KP
   A==;
X-CSE-ConnectionGUID: vwdCs5HBS22ORd+lwi54tg==
X-CSE-MsgGUID: 0xp4K5VhR16Kb4aj9Fj+Aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40856515"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="40856515"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 06:53:59 -0800
X-CSE-ConnectionGUID: Ans8YNRvSPGt3vVgZub8IA==
X-CSE-MsgGUID: 9rtNQ1czSrCQ7qlZWaBdcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="115037097"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 20 Feb 2025 06:53:57 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tl7vC-0004PT-2C;
	Thu, 20 Feb 2025 14:53:23 +0000
Date: Thu, 20 Feb 2025 22:52:38 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1431/1431]
 drivers/net/wireless/mediatek/mt76/mt76x2_tx_common.o: warning: objtool:
 missing symbol for section .text
Message-ID: <202502202254.wtwvjOmm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   33c097cb0d6c8c1dcf8cde0f66b1c6c907ee2740
commit: 9367a9c7f956c02a696af111d46e155fb8f2412a [1431/1431] mt76: add mt76x2_tx_common to mt76x2-common module
config: x86_64-buildonly-randconfig-003-20250220 (https://download.01.org/0day-ci/archive/20250220/202502202254.wtwvjOmm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250220/202502202254.wtwvjOmm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502202254.wtwvjOmm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/wireless/mediatek/mt76/mt76x2_tx_common.c: In function 'mt76x2_tx':
   drivers/net/wireless/mediatek/mt76/mt76x2_tx_common.c:35:63: warning: comparison is always true due to limited range of data type [-Wtype-limits]
      35 |                 if (!info->control.hw_key && wcid->hw_key_idx != -1)
         |                                                               ^~
>> drivers/net/wireless/mediatek/mt76/mt76x2_tx_common.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
