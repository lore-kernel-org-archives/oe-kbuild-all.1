Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AFA328CE
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Oct 2023 15:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K+jujbEU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696521577; x=1728057577;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aKjgMuYZsRtSs4xPdMfRl1emk6n46p2cxkShwocdj+Q=;
  b=K+jujbEUqiQr/HbMCJN9Kld0p6Z71uuB7cQQveTGGPlRrS6BKzTKDs+E
   g56Wm4ooImq1+LbI2BGpOxERXVKI7xrVOOYHZ0k7UQCKLhBSnTbYZ2IlZ
   9nDPPM6FXsrahcVu/0W0+2o4xb8H9sTFm4Z43W1vwQRXiWhTKCikbbLnX
   Wuqm6vfaWeONG+c521fSPrmmEXqOcJn2oWU65ux4M7g572VzRnKffwPCN
   79Ae9QnSWVsnbcLkULS1sq+AZeTsXcZyHc3ZZNPbOEv3Seu92mPHLV/Qi
   PatnErkFmQ811oDLTq9mZVZRPHhRNj33ipFWuFk+w89Y4SofuOkQ8UPaq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="414503498"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="414503498"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 08:59:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="822165819"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="822165819"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 05 Oct 2023 08:59:14 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoQkq-000Lb9-0c;
	Thu, 05 Oct 2023 15:59:12 +0000
Date: Thu, 5 Oct 2023 23:58:36 +0800
From: kernel test robot <lkp@intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, Biju Das <biju.das.jz@bp.renesas.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-pwm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v16 3/4] pwm: Add support for RZ/G2L GPT
Message-ID: <202310052353.flpqN2Di-lkp@intel.com>
References: <20231004111451.126195-4-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231004111451.126195-4-biju.das.jz@bp.renesas.com>

Hi Biju,

kernel test robot noticed the following build errors:

[auto build test ERROR on 4aae44f65827f0213a7361cf9c32cfe06114473f]

url:    https://github.com/intel-lab-lkp/linux/commits/Biju-Das/dt-bindings-pwm-Add-RZ-G2L-GPT-binding/20231004-231907
base:   4aae44f65827f0213a7361cf9c32cfe06114473f
patch link:    https://lore.kernel.org/r/20231004111451.126195-4-biju.das.jz%40bp.renesas.com
patch subject: [PATCH v16 3/4] pwm: Add support for RZ/G2L GPT
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20231005/202310052353.flpqN2Di-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231005/202310052353.flpqN2Di-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310052353.flpqN2Di-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/pwm/pwm-rzg2l-gpt.o: in function `rzg2l_gpt_config':
>> pwm-rzg2l-gpt.c:(.text+0xae8): undefined reference to `__aeabi_uldivmod'
>> arm-linux-gnueabi-ld: pwm-rzg2l-gpt.c:(.text+0xb50): undefined reference to `__aeabi_uldivmod'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
