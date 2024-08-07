Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31B4148FFF
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Aug 2024 21:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723064871; cv=none; b=FmGeZ6UCSyNsqTHgbEtDSPpGaieA7eoj+aq9oynUtug7cs5BCJWnTtiykSXh/aVxT7ZWqKT2N1pQyRjoRE76kCm4NpQCmNgLv+R3TJV6tOKdHGB5TNuKIRJGRKSJjrodyap9K69xG/zYlfeIv3pciyWOwLVvBlAKvE6fnVSmQyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723064871; c=relaxed/simple;
	bh=jYeVMJ7w+apiFCN8dfivaE10FWDiB1297+0xyWXhxEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iOr5A1WJozDDcbKITFiTEr762Nm535VD1WecT9SLnrHH9pzumOXhpmKbQZUMAi656VeC5rxKuqol7fykFaqxS6EuJ8WVAhaRsnCFtt46i41qfLaldQz/XUxSrjowAV3Mfl2rL0j7szoiU7HSi3p6e7vz0DTpBNF4aeZ3SablWfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hxbkQQpH; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hxbkQQpH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723064870; x=1754600870;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jYeVMJ7w+apiFCN8dfivaE10FWDiB1297+0xyWXhxEA=;
  b=hxbkQQpHpwaUOYYEDHGjhlS32c5IKVJ5YQjJLevn74DrRVIgFOq0xje5
   7jnrZTDm6A/07CZlupeWOP7YRFYofR38LlZCDdlqo1YAI7ZgnCUEsRfqr
   8DtGnfC23nRPYYODPRw/5VLTBlNqKE8BPRx+7qV+njvq+YNxA7m11IAIf
   lRwaegiyUmawUeO0jiWk9lCfpi9jHbE4pJWTCm840Uwcv+uorASFwglhT
   rEszW4R0afEtc8RvAPRJd/cR0WF09tkkvhEmYF888YnG5Mdws7vD+0Dkq
   vEr5BJn36g9FkDCKzfrVGioUTxMk5q3upKgbnZXIwYJJGUs1V7GFY26rx
   g==;
X-CSE-ConnectionGUID: CTLwfdIfQIG3PGI/w0Eehg==
X-CSE-MsgGUID: 7GT2L0pKTw6sfOAtPGyfjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="21019213"
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; 
   d="scan'208";a="21019213"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 14:07:50 -0700
X-CSE-ConnectionGUID: ZJf6ncTrSlyHcH/7/tRkLA==
X-CSE-MsgGUID: 2qXo65yQS3SQHErUIJa1EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; 
   d="scan'208";a="56839426"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 07 Aug 2024 14:07:48 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbnsn-0005ie-1B;
	Wed, 07 Aug 2024 21:07:45 +0000
Date: Thu, 8 Aug 2024 05:07:14 +0800
From: kernel test robot <lkp@intel.com>
To: Avri Altman <avri.altman@wdc.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	linux-mmc@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Ricky WU <ricky_wu@realtek.com>,
	Avri Altman <avri.altman@wdc.com>
Subject: Re: [PATCH v2 08/10] mmc: core: Allow mmc erase to carry large
 addresses
Message-ID: <202408080428.IWxLHNou-lkp@intel.com>
References: <20240807060309.2403023-9-avri.altman@wdc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240807060309.2403023-9-avri.altman@wdc.com>

Hi Avri,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.11-rc2 next-20240807]
[cannot apply to ulf-hansson-mmc-mirror/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Avri-Altman/mmc-sd-SDUC-Support-Recognition/20240807-140950
base:   linus/master
patch link:    https://lore.kernel.org/r/20240807060309.2403023-9-avri.altman%40wdc.com
patch subject: [PATCH v2 08/10] mmc: core: Allow mmc erase to carry large addresses
config: i386-randconfig-012-20240807 (https://download.01.org/0day-ci/archive/20240808/202408080428.IWxLHNou-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240808/202408080428.IWxLHNou-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408080428.IWxLHNou-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/mmc/core/core.o: in function `mmc_do_erase':
   drivers/mmc/core/core.c:1651: undefined reference to `__udivdi3'
   ld: drivers/mmc/core/core.c:1652: undefined reference to `__udivdi3'
   ld: drivers/mmc/core/core.o: in function `mmc_erase':
   drivers/mmc/core/core.c:1803: undefined reference to `__umoddi3'
>> ld: drivers/mmc/core/core.c:1827: undefined reference to `__umoddi3'
   ld: drivers/mmc/core/core.o: in function `mmc_align_erase_size':
   drivers/mmc/core/core.c:1745: undefined reference to `__umoddi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
