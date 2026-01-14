Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCA82BE037
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 23:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768434517; cv=none; b=YwNEbIdhRAyMNTMDXaX2+IRsdhbjCiVfZcUgGC0mJqVA8bTxWd4CyOxYHyCLpqCbKchgTLKq+tM2FgUGV12Zaj/qhLkNQwquCZk3TLaS6zMbRGeLAavZ0fQEq/iTfpaTKC1Rc8+GXrFdhhZVqS6i/4E5kgbRdOI/IQtHzi5ILQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768434517; c=relaxed/simple;
	bh=fpZXJ3A96OROTDJRswE/08njjePXZh4rpSkE8q4iKxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZUO8FoxuoCU9bPQT8KHrUFwzvjotJtQ2nhr1J9vPO0WlZwKLm1NLO3DK5tI5qo3eXwAkF84seZcr0ZR3JmwT8ST0DcowGm/RAWSMeiYxBgRe1tT9WzNevuGoFQj7vm7P18yWIbfIUj0W1OhBcBi5pdakNMc34n5sOuMBKz4k2gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Stb8ea/b; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Stb8ea/b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768434516; x=1799970516;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fpZXJ3A96OROTDJRswE/08njjePXZh4rpSkE8q4iKxk=;
  b=Stb8ea/bUfF3T3/0f+fTHUnqGM+yDZxX+d1QbqKiaDQh+hXCOg3qbLum
   Fhdetuk2hu9/6UEIJboBimT+xFrpyinPuEwEFmv/bxvrbQx9SSIY7yZBm
   eIaD8RJtiPxWUa4YNb3UqH7FtdE7rMOurkfRdJb8BWcbNG8SJJlfDT458
   8LCXNkYeKvKRK9tUYMZY5+A4kBdwBaAoe/cXRv/aclZMa41miwUhkjQ3B
   HaEjOXf8vBtMNmlsIRtyMG1hPb9zvZd5SsaThDTgJMsQOH7IYDkUa3sYU
   GiwRDr/ufUsBiJB14W/Ug1faUN4JmtAeAELZAqdYpcUUap4ES5KEopzco
   A==;
X-CSE-ConnectionGUID: mNtLFMJNTHmbRlgeIFSJ6A==
X-CSE-MsgGUID: UNnWVqH2Qc6aPw9XiBQLaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69718408"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="69718408"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 15:48:36 -0800
X-CSE-ConnectionGUID: UdvjGCikQzS8ThzmgRTS7g==
X-CSE-MsgGUID: /9XX4dGIS8mnyB/rVlwF4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="205226157"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Jan 2026 15:48:32 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgAbF-00000000HDY-4A5R;
	Wed, 14 Jan 2026 23:48:29 +0000
Date: Thu, 15 Jan 2026 07:48:20 +0800
From: kernel test robot <lkp@intel.com>
To: Aman Kumar Pandey <aman.kumarpandey@nxp.com>,
	linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, broonie@kernel.org,
	lee@kernel.org, Frank.Li@nxp.com, lgirdwood@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, vikash.bansal@nxp.com,
	priyanka.jain@nxp.com, shashank.rebbapragada@nxp.com,
	Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Subject: Re: [PATCH v4 5/5] i3c: hub: p3h2x4x: Add support for NXP P3H2x4x
 I3C hub functionality
Message-ID: <202601150750.NiEqaaGg-lkp@intel.com>
References: <20260113114529.1692213-5-aman.kumarpandey@nxp.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113114529.1692213-5-aman.kumarpandey@nxp.com>

Hi Aman,

kernel test robot noticed the following build errors:

[auto build test ERROR on i3c/i3c/next]
[also build test ERROR on lee-mfd/for-mfd-next lee-mfd/for-mfd-fixes broonie-regulator/for-next linus/master v6.19-rc5 next-20260114]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aman-Kumar-Pandey/dt-bindings-i3c-Add-NXP-P3H2x4x-i3c-hub-support/20260113-195318
base:   https://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git i3c/next
patch link:    https://lore.kernel.org/r/20260113114529.1692213-5-aman.kumarpandey%40nxp.com
patch subject: [PATCH v4 5/5] i3c: hub: p3h2x4x: Add support for NXP P3H2x4x I3C hub functionality
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260115/202601150750.NiEqaaGg-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601150750.NiEqaaGg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601150750.NiEqaaGg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/i3c/hub/p3h2840_i3c_hub_common.c:12:
   drivers/i3c/hub/p3h2840_i3c_hub_common.c: In function 'p3h2x4x_configure_pullup':
>> drivers/i3c/hub/p3h2840_i3c_hub.h:64:17: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
      64 |                 FIELD_PREP(P3H2x4x_TP0145_PULLUP_CONF_MASK, x)
         |                 ^~~~~~~~~~
   drivers/i3c/hub/p3h2840_i3c_hub_common.c:51:18: note: in expansion of macro 'P3H2x4x_TP0145_PULLUP_CONF'
      51 |         pullup = P3H2x4x_TP0145_PULLUP_CONF(p3h2x4x_pullup_dt_to_reg
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/FIELD_PREP +64 drivers/i3c/hub/p3h2840_i3c_hub.h

    61	
    62	#define P3H2x4x_TP0145_PULLUP_CONF_MASK				GENMASK(7, 6)
    63	#define P3H2x4x_TP0145_PULLUP_CONF(x)	\
  > 64			FIELD_PREP(P3H2x4x_TP0145_PULLUP_CONF_MASK, x)
    65	#define P3H2x4x_TP2367_PULLUP_CONF_MASK				GENMASK(5, 4)
    66	#define P3H2x4x_TP2367_PULLUP_CONF(x)	\
    67			FIELD_PREP(P3H2x4x_TP2367_PULLUP_CONF_MASK, x)
    68	#define P3H2x4x_PULLUP_CONF_MASK					GENMASK(7, 4)
    69	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
