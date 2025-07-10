Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377FF3208
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Jul 2025 23:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752189492; cv=none; b=ni3Orpj7H0TSz54YIPT9gxQ5ZcwPloLucwSXFZTqrkw3bC/Jq258uvbhzzEWiQKurxRH5y0sx8aWkvkzLp2t8WFm2n0M1AIyUxzuAE95EA+IY1sIF3tdxtI9dQcjhzZT8zCULiRzDvSVlL0Cid8d5oE/3e18BQMgsBaXlmDhY1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752189492; c=relaxed/simple;
	bh=tjyghXvqEojFj3Pfwby+hkzR77SXqdDqIKc/4prwiCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lf58zNkXkWUDfQCd2bs0R6dO4u0zj2m3L7NvVspPFBCrE/ohUJor8HGwEQH96pnN+vW6REnqszNCSAJnimE/PP98D3kA0T8pDh1JoBQjaSdi7hlvGsgyKAH1Yh/TtlMjS8MN9EFYUCS/iV78QgXOPPyhKeWl6Pbac3G9oe5g79o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jw4R9Qng; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jw4R9Qng"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752189491; x=1783725491;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tjyghXvqEojFj3Pfwby+hkzR77SXqdDqIKc/4prwiCc=;
  b=Jw4R9QngzggoEYx+GEtSTwfVSt0CIVzEhr4FdG7afCnqPWMoNgeruT8i
   r0qGnP/5bJZHPCKc2Q1Wp8/1sT+3mYMaLoEC3pQZ6YJt+PSuj19SWjRYd
   W7A1aUDErf1yammTdiIc/DV8z/4gHmZ91ZHAwh0ysHAEzfJfQqjRw92ky
   cSPkpB1iJda2gHdMLTni7kbpqQhudGDzI26lbRCR04dhHBdJEcVqfpafe
   mMXdNAqcWauOS2+Ml3SrheL5pnU4PN/3b26UPxD5j0QFPeS/b7oHUaNdz
   Q+6fooGGAxDAstu0F5r3EiuGMBT4YCVYPafNmpNmbd/i936Z1hk1njRRc
   A==;
X-CSE-ConnectionGUID: /nsAn1mHRdCeRTnpRSSrEQ==
X-CSE-MsgGUID: QTTVGGo0R6uHAS+nPUAcpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54573700"
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; 
   d="scan'208";a="54573700"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 16:18:11 -0700
X-CSE-ConnectionGUID: /adAwK4+Sh6eT546oXugAA==
X-CSE-MsgGUID: Go9DAg15TKq2937p/k7/bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; 
   d="scan'208";a="160517973"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Jul 2025 16:18:09 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ua0Wk-0005Zj-25;
	Thu, 10 Jul 2025 23:18:06 +0000
Date: Fri, 11 Jul 2025 07:17:27 +0800
From: kernel test robot <lkp@intel.com>
To: Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	Ping-Ke Shih <pkshih@realtek.com>, Kalle Valo <kvalo@kernel.org>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Fiona Klute <fiona.klute@gmx.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrey Skvortsov <andrej.skvortzov@gmail.com>
Subject: Re: [PATCH v2 1/2] wifi: rtw88: introduce callback to override phy
 parameters from tables
Message-ID: <202507110636.fqI1Fyh7-lkp@intel.com>
References: <20250709223159.2787192-2-andrej.skvortzov@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709223159.2787192-2-andrej.skvortzov@gmail.com>

Hi Andrey,

kernel test robot noticed the following build warnings:

[auto build test WARNING on wireless-next/main]
[also build test WARNING on wireless/main linus/master v6.16-rc5 next-20250710]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrey-Skvortsov/wifi-rtw88-introduce-callback-to-override-phy-parameters-from-tables/20250710-063838
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20250709223159.2787192-2-andrej.skvortzov%40gmail.com
patch subject: [PATCH v2 1/2] wifi: rtw88: introduce callback to override phy parameters from tables
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20250711/202507110636.fqI1Fyh7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250711/202507110636.fqI1Fyh7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507110636.fqI1Fyh7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/wireless/realtek/rtw88/mac.c: In function 'rtw_mac_postinit':
>> drivers/net/wireless/realtek/rtw88/mac.c:1416:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    1416 |         int ret = 0;
         |             ^~~


vim +/ret +1416 drivers/net/wireless/realtek/rtw88/mac.c

  1412	
  1413	int rtw_mac_postinit(struct rtw_dev *rtwdev)
  1414	{
  1415		const struct rtw_chip_info *chip = rtwdev->chip;
> 1416		int ret = 0;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
