Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90AC384CD0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 13:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778765809; cv=none; b=sncJegtFWvnoiZpXvnuEzHzEL+aeXcB4snHztVjJfqx3zZbi/XEOmUPlgum7X9SVtxa/7ApoiyhXnp9h+9eUc1WuN1OuKIW4yfijmcLr2rAaRpjJp4QcR/t4ojp5f22pdHv1JGVpWNVWlMWuaW4YoDvLrwGnyagQkcL55Xm7kzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778765809; c=relaxed/simple;
	bh=PtcNRCfecyaRNTnGOia1+S8hbqxpFXgDYcZruN6O1y4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zlxta342hz35ULK+kYacx8lv49TYiL3QbrUKgWv8LiqpHsPd6cIdfn6xm+iCJ8+qudpJbAwgimPFlqtwfRPXiDMl1ECvY3Hb6nG2A5+qi6LNP6+cMqtdqUuxt1kkZBUJtwuzYZmq3MUU3iYm0+GR8TLB40L8+2qh8wkx2qqw4YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A4uWymL2; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A4uWymL2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778765808; x=1810301808;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PtcNRCfecyaRNTnGOia1+S8hbqxpFXgDYcZruN6O1y4=;
  b=A4uWymL2GPZ9JMh5VNytgQQFKDemT90DkoybPH3z4+nMXzcbaAIO951e
   xsJnNcxpZW7oXovMtcFre/ZGHpA0FiVLi8vx0o6hZl2A/GBD8vf4o2mHd
   0SGrS/jO7ZCNR9B/0zWalXT7Mwo0tXDkeP9fSr9r3oxQYntcDwTbTRWLC
   icrdml6hPK76SwwfyYs/DrTg3tSDdq/kkrOkAiTVgnJjUpS8N7fwh7bwX
   o9BgFjm1lhndvDdDuR8UsJ7J5w2jpU1yCgxHd500GDylRca/kS4DbxTzi
   DrVMLwYyO4Mv/JGTxTGiEZMjF0AUEr+F3ALOiFHfACwW36NhmhE4bhJtp
   w==;
X-CSE-ConnectionGUID: 9XvkBLlaToCgvXgMDp02Dg==
X-CSE-MsgGUID: SE/GzbaaRmeJehPufd4t2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79419232"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="79419232"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 06:36:48 -0700
X-CSE-ConnectionGUID: G3Y4H0UgQ5SVOxLNdDY9oA==
X-CSE-MsgGUID: sDVAeoLMT4OqjOyJ2SjZag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="238282136"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 May 2026 06:36:47 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNWF2-000000006b9-0u0X;
	Thu, 14 May 2026 13:36:44 +0000
Date: Thu, 14 May 2026 21:36:25 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Murray <amurray@thegoodpenguin.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC] printk: remove BOOT_PRINTK_DELAY
Message-ID: <202605142140.F3cH6Hfp-lkp@intel.com>
References: <20260505-printk_delay-v1-1-5dba51d7f17c@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505-printk_delay-v1-1-5dba51d7f17c@thegoodpenguin.co.uk>

Hi Andrew,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 7fd2df204f342fc17d1a0bfcd474b24232fb0f32]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrew-Murray/printk-remove-BOOT_PRINTK_DELAY/20260514-132813
base:   7fd2df204f342fc17d1a0bfcd474b24232fb0f32
patch link:    https://lore.kernel.org/r/20260505-printk_delay-v1-1-5dba51d7f17c%40thegoodpenguin.co.uk
patch subject: [PATCH RFC] printk: remove BOOT_PRINTK_DELAY
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20260514/202605142140.F3cH6Hfp-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605142140.F3cH6Hfp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605142140.F3cH6Hfp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/printk/sysctl.c:11:18: warning: 'ten_thousand' defined but not used [-Wunused-const-variable=]
      11 | static const int ten_thousand = 10000;
         |                  ^~~~~~~~~~~~


vim +/ten_thousand +11 kernel/printk/sysctl.c

faaa357a55e034 Xiaoming Ni 2022-01-21  10  
faaa357a55e034 Xiaoming Ni 2022-01-21 @11  static const int ten_thousand = 10000;
faaa357a55e034 Xiaoming Ni 2022-01-21  12  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
