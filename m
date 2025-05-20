Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C881624337C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 May 2025 16:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747756869; cv=none; b=MNJdyDhAh4joIvuoV7f+WyrKNFzWzLJthBEMuAhKl4Se7j+n8v8ex01ir7D15Y2dJDmIliwNR9TVQzWB0sz/SGHeRTWu/NL3VUiBIe9I6rtrejVHro56J93IH0T3zGbsiE8BbqnsRlj0Oi329jKzvEEHgxX/lI2T/reKjXcLy/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747756869; c=relaxed/simple;
	bh=El3qoL0dmGAAJxFLhmqwpbb/71r+8NNByfFhtZtxMEU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zam7u4DRMxUz9TE5jYJCSDDx7NFI4eKJmq+RufCn+aGi16I5CcZAfIjjwNN99rfDU3AiQQ5T9KcShcX5Chih19JmvuHg12ekRCvNUbWIPf1EGRYVJWIartfsnre3CfuNZ5KWxpL6Tu/0jc3WWTZ35ABO7hvo0dU3vJcF/7b4eZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bHQ0PSAD; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bHQ0PSAD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747756868; x=1779292868;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=El3qoL0dmGAAJxFLhmqwpbb/71r+8NNByfFhtZtxMEU=;
  b=bHQ0PSADVFoECtxjCzVRqrkRLsCdB1rhLNYrfRVAwc7RY8hZwGOqN01G
   tMZNVuDTEhnryi0T0Yg8ZtWIvhRkQY19uQkSyIaYmLYwz5wt8yQvtDSBi
   o3IN9NkO6Umg2jKMVnBuexmjBk3FHS76aYWXVsK8udSsoBqnhe3IErnLo
   oNGxw3kgnp7i/pnlDL3kxJxeCX1kZygzaMd5Nd1guE21gh3QQ+kTt4+xE
   FsK94OwHgrXiN79/zL0u8YbrWbdglOOvBnncpGWHBL3qfiq/gHi9ybneV
   fEOJ+tKw2TqK5QJg/hHB9IsHOtGwTjJv3910k9h62vAc1auoLg2lZClHW
   w==;
X-CSE-ConnectionGUID: k3J5dYxRT++rJL1p7G84iA==
X-CSE-MsgGUID: RLduIE+0TvWCjVwY/IJZcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="67254550"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="67254550"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 09:01:07 -0700
X-CSE-ConnectionGUID: iQA8nVv+S76NXxArI5xZfQ==
X-CSE-MsgGUID: rsE0mo09SUyBnGJVStwVag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="140241601"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 20 May 2025 09:01:06 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHPOp-000NJm-0k;
	Tue, 20 May 2025 16:01:03 +0000
Date: Wed, 21 May 2025 00:00:51 +0800
From: kernel test robot <lkp@intel.com>
To: Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	George Moussalem <george.moussalem@outlook.com>
Subject: [thermal:thermal/linux-next 12/13]
 drivers/thermal/qcom/tsens-v1.c:246:24: sparse: sparse: symbol 'ops_ipq5018'
 was not declared. Should it be static?
Message-ID: <202505202356.S21Sc7bk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git thermal/linux-next
head:   e23cba0ab49a9cf95e9bc3a86cfbf336b0e285f6
commit: 04b31cc53fe0df0e87a37d18a3c0363d7dee218f [12/13] thermal/drivers/qcom/tsens: Add support for IPQ5018 tsens
config: arm64-randconfig-r123-20250520 (https://download.01.org/0day-ci/archive/20250520/202505202356.S21Sc7bk-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce: (https://download.01.org/0day-ci/archive/20250520/202505202356.S21Sc7bk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505202356.S21Sc7bk-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/thermal/qcom/tsens-v1.c:246:24: sparse: sparse: symbol 'ops_ipq5018' was not declared. Should it be static?

vim +/ops_ipq5018 +246 drivers/thermal/qcom/tsens-v1.c

   245	
 > 246	const struct tsens_ops ops_ipq5018 = {
   247		.init		= init_tsens_v1_no_rpm,
   248		.calibrate	= tsens_calibrate_common,
   249		.get_temp	= get_temp_tsens_valid,
   250	};
   251	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
