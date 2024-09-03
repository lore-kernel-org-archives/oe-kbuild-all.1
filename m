Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA95D18DF90
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Sep 2024 17:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725385887; cv=none; b=pNhqaG1FAL1W1SQE2yCioKzK+1jp/XGfFvbyJIx8rsjdatfX9SHv68HtoWKFsrtG6fwAi3NCiXRMGDSqRro6B1tXLXy0fgPir1xW2t4+aGPyYkE13DJMmn7TC4mvy5m0riIvIMZVjwMwzjC2xGWX5IlSf/bedaHYcJfwx2qWfyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725385887; c=relaxed/simple;
	bh=ygzor0MKxxVktMqVp1C7zOEUkofTr+JdIn10dAzHNAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ULMfdTzY4FEsEMLHbOhzElcp2Y9cDNld0BKicO9tk28TlRutRDk21CqEDcj1PNCYvzIKJ8cHzYYXeZFuH1wLGpL8lCOk2VaTOyJsDAKt2buLb+pGF04qR3niOfdE5Li2VdPnV/uNKfrhyf0iVbEV8z6+TrXTXuviG51QOTfDdg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y1yDfcOd; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y1yDfcOd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725385886; x=1756921886;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ygzor0MKxxVktMqVp1C7zOEUkofTr+JdIn10dAzHNAc=;
  b=Y1yDfcOd5q6k5ux7O6PPTczAW8Nbce1erOmNX2a/MQowMGR5obtPvnN1
   M9hnGbHNvRzkAI2CvYZT0zWAMOZWWLfC6IhJg+Nbeaj8zsMNxeymWXlTj
   JZAk6Um/ecusYdfS972xoFvj1wQCYtFsyqFoQ5OKdwB1zd2SzyXrPyfVy
   Tnuvlo6d8umuMGNx0pAprMFwVXmBeWlWikD5W0/hgVauJP11ropwOsmOu
   Hx0WEH3AInu9qDkKSMsrksOm86ja2nFYcH8rMGvm81rWn/W4VUU2jmY8S
   Qn7DIunhVi1WXnct0z0yTzhmxZEBm4df9Ql3rRi6pJaKNJZjb4Wr19Qhk
   g==;
X-CSE-ConnectionGUID: v5t0TcN/ToiMbSW1qxwVbw==
X-CSE-MsgGUID: ZccuswcwR/eYk6hj3UnhQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="49410320"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="49410320"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 10:51:26 -0700
X-CSE-ConnectionGUID: FdJd3AB4QY6GrLurhOpSXw==
X-CSE-MsgGUID: NeGxIv0nTCCKxYsZD/MqYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="64675624"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Sep 2024 10:51:24 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slXgX-0006zM-2j;
	Tue, 03 Sep 2024 17:51:21 +0000
Date: Wed, 4 Sep 2024 01:50:57 +0800
From: kernel test robot <lkp@intel.com>
To: Josua Mayer <josua@solid-run.com>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, Josua Mayer <josua@solid-run.com>
Subject: Re: [PATCH v2] phy: mvebu-cp110-utmi: support swapping d+/d- lanes
 by dts property
Message-ID: <202409040139.hNh9K4iF-lkp@intel.com>
References: <20240903-mvebu-utmi-phy-v2-1-7f49c131fad0@solid-run.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903-mvebu-utmi-phy-v2-1-7f49c131fad0@solid-run.com>

Hi Josua,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8400291e289ee6b2bf9779ff1c83a291501f017b]

url:    https://github.com/intel-lab-lkp/linux/commits/Josua-Mayer/phy-mvebu-cp110-utmi-support-swapping-d-d-lanes-by-dts-property/20240903-164826
base:   8400291e289ee6b2bf9779ff1c83a291501f017b
patch link:    https://lore.kernel.org/r/20240903-mvebu-utmi-phy-v2-1-7f49c131fad0%40solid-run.com
patch subject: [PATCH v2] phy: mvebu-cp110-utmi: support swapping d+/d- lanes by dts property
config: arc-randconfig-r071-20240903 (https://download.01.org/0day-ci/archive/20240904/202409040139.hNh9K4iF-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240904/202409040139.hNh9K4iF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409040139.hNh9K4iF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/phy/marvell/phy-mvebu-cp110-utmi.c:110: warning: Function parameter or struct member 'swap_dx' not described in 'mvebu_cp110_utmi_port'


vim +110 drivers/phy/marvell/phy-mvebu-cp110-utmi.c

2fc989f74b8dac Konstantin Porotchkin 2021-03-07   97  
2fc989f74b8dac Konstantin Porotchkin 2021-03-07   98  /**
2fc989f74b8dac Konstantin Porotchkin 2021-03-07   99   * struct mvebu_cp110_utmi_port - PHY port data
2fc989f74b8dac Konstantin Porotchkin 2021-03-07  100   *
2fc989f74b8dac Konstantin Porotchkin 2021-03-07  101   * @priv: PHY driver data
2fc989f74b8dac Konstantin Porotchkin 2021-03-07  102   * @id: PHY port ID
2fc989f74b8dac Konstantin Porotchkin 2021-03-07  103   * @dr_mode: PHY connection: USB_DR_MODE_HOST or USB_DR_MODE_PERIPHERAL
2fc989f74b8dac Konstantin Porotchkin 2021-03-07  104   */
2fc989f74b8dac Konstantin Porotchkin 2021-03-07  105  struct mvebu_cp110_utmi_port {
2fc989f74b8dac Konstantin Porotchkin 2021-03-07  106  	struct mvebu_cp110_utmi *priv;
2fc989f74b8dac Konstantin Porotchkin 2021-03-07  107  	u32 id;
2fc989f74b8dac Konstantin Porotchkin 2021-03-07  108  	enum usb_dr_mode dr_mode;
7208af25e8a67e Josua Mayer           2024-09-03  109  	bool swap_dx;
2fc989f74b8dac Konstantin Porotchkin 2021-03-07 @110  };
2fc989f74b8dac Konstantin Porotchkin 2021-03-07  111  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
