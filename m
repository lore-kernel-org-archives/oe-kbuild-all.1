Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEAEE16418
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 09:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YmV15clZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697706136; x=1729242136;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7OJYdqYOD8lX5YNcB8Q0tNTWtA+af94+w9wd2sUUe3A=;
  b=YmV15clZ9o+n+4ps3ODRZV5M6hYwLK122Zx4T8vjX2mrCKjDpFY8rLC/
   R4r/ZS7Ukle1q+IjcvT/JecJ6OGRutLZoxTCLzJiCZF9pudgTJrkoUr6p
   cyAoiDo6OuaPXpXD/rXduyETtGeA+OiEE+UeZcSnsRjIxwA6RrK+4XeGi
   c8r4h5XURvYw7Zt4gyuaUlbz72MFdgtsltjUDutqWzKAyzExX9SDYs3Ds
   j6FIpr+StuEvIevn28hv35lmzcR5uBGcQ83+PJMgmLBit9gXpv/0pFgk/
   SH/msPEW2qy8MZpancTbD1OaCQzJL/6KTt2ibIjjbGOiYA8jdI6EGwb6c
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="376581657"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="376581657"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 02:01:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="750446366"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="750446366"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 19 Oct 2023 02:01:02 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtOto-0001tg-0K;
	Thu, 19 Oct 2023 09:01:00 +0000
Date: Thu, 19 Oct 2023 17:00:30 +0800
From: kernel test robot <lkp@intel.com>
To: Sascha Hauer <s.hauer@pengutronix.de>,
	linux-rockchip@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] PM / devfreq: rockchip-dfi: Add perf support
Message-ID: <202310191638.953yyS7D-lkp@intel.com>
References: <20231019064819.3496740-1-s.hauer@pengutronix.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231019064819.3496740-1-s.hauer@pengutronix.de>

Hi Sascha,

kernel test robot noticed the following build warnings:



url:    https://github.com/intel-lab-lkp/linux/commits/UPDATE-20231019-145026/Sascha-Hauer/PM-devfreq-rockchip-dfi-Make-pmu-regmap-mandatory/20231018-142228
base:   the 16th patch of https://lore.kernel.org/r/20231018061714.3553817-17-s.hauer%40pengutronix.de
patch link:    https://lore.kernel.org/r/20231019064819.3496740-1-s.hauer%40pengutronix.de
patch subject: [PATCH] PM / devfreq: rockchip-dfi: Add perf support
reproduce: (https://download.01.org/0day-ci/archive/20231019/202310191638.953yyS7D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310191638.953yyS7D-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#219: FILE: drivers/devfreq/event/rockchip-dfi.c:332:
+#define DFI_ATTR_MB(_name) ^I^I\$

ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#219: FILE: drivers/devfreq/event/rockchip-dfi.c:332:
+#define DFI_ATTR_MB(_name) 		\
+	&_name.attr.attr,		\
+	&_name##_unit.attr.attr,	\
+	&_name##_scale.attr.attr

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
