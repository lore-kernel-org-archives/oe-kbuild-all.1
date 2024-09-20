Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC7114A91
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Sep 2024 03:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726802718; cv=none; b=Qa2Fc0+0wMRO/v2cNcJRTFBZWiuv5A7kNTkRAyA+ozB3ClWBR5z2305z3wY7cGpF+0lOZJDIhce14qaUwr+lJNkjwCkU4a+HBNv3T8qFBNdZQIdxV0X8DchK/tPp/7uqqPZc2gKO7X9WMUbN7bSJnpwqaA/3ZXopezxpV4t+ywM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726802718; c=relaxed/simple;
	bh=0vWwejWY7H/U4G+v0APxhXu0im+eW2lr06gsDIjapwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ic2sgWcjoNBrjfEin5gGX7DIVJovMus/VOSycYabv3Mu8dMLRwmwHdhFuAOZXhy553KniV3prg9+247HnqtPjX06TgYiyNLxv3wU+9xemn0ZYx7xBdYh7G8e7jBR+LRBD9ckhLmiErZ7hvjsyPKjlmixFwqXl5TwwAeujEJaRj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZrycVFoH; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZrycVFoH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726802716; x=1758338716;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0vWwejWY7H/U4G+v0APxhXu0im+eW2lr06gsDIjapwk=;
  b=ZrycVFoHAolIFG7AHCzOYsT8V2nVav0deHjBHKJk+lxsqpmHucww504U
   BRqpCaVVExVeHROeVNNXh378N5s7OqylUJIDChkpjVfUEKX8+NVnk9JAP
   CBFCY1gRRMXS56Qhbjr+Myp6EJJJOUjV3OcffQAmlR/8/jsROYpt9bqKu
   Ngv1gXCLqTs74bhrsQB7L6Bsxf3074o0OKDAGD6UzgbPoSbZqsBLZtATW
   cCxB1DSwdwYInN9Xvl3rUZFUiSqSIK62ihr+X0/jiYbUuf8n364QgFDOe
   emaGJ3kHfD9m05X6YYk7jpIVctp8DmAfAV2KRzYOy6LgXZzUC5AiLExqz
   w==;
X-CSE-ConnectionGUID: cY0yVcb0RgiT5ve5zpCbHQ==
X-CSE-MsgGUID: 3dEiIMPXRmKXSNUcP1QoZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25670601"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; 
   d="scan'208";a="25670601"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 20:25:15 -0700
X-CSE-ConnectionGUID: WgEYAgshQea4nMvh/pcsqQ==
X-CSE-MsgGUID: FQC/apmAR9ukocO46yr7RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; 
   d="scan'208";a="70590434"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 19 Sep 2024 20:25:13 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srUGc-000Dv1-2u;
	Fri, 20 Sep 2024 03:25:10 +0000
Date: Fri, 20 Sep 2024 11:25:06 +0800
From: kernel test robot <lkp@intel.com>
To: Gowthami Thiagarajan <gthiagarajan@marvell.com>, will@kernel.org,
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, sgoutham@marvell.com,
	lcherian@marvell.com, gcherian@marvell.com,
	Gowthami Thiagarajan <gthiagarajan@marvell.com>
Subject: Re: [PATCH v7] perf/marvell: Marvell PEM performance monitor support
Message-ID: <202409201045.9SbdJWT6-lkp@intel.com>
References: <20240919125117.3484572-1-gthiagarajan@marvell.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240919125117.3484572-1-gthiagarajan@marvell.com>

Hi Gowthami,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/smp/core]
[also build test ERROR on soc/for-next linus/master v6.11 next-20240919]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gowthami-Thiagarajan/perf-marvell-Marvell-PEM-performance-monitor-support/20240919-205406
base:   tip/smp/core
patch link:    https://lore.kernel.org/r/20240919125117.3484572-1-gthiagarajan%40marvell.com
patch subject: [PATCH v7] perf/marvell: Marvell PEM performance monitor support
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20240920/202409201045.9SbdJWT6-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240920/202409201045.9SbdJWT6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409201045.9SbdJWT6-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/perf/marvell_pem_pmu.c: In function 'pem_perf_read_counter':
>> drivers/perf/marvell_pem_pmu.c:232:16: error: implicit declaration of function 'readq_relaxed'; did you mean 'readw_relaxed'? [-Werror=implicit-function-declaration]
     232 |         return readq_relaxed(pmu->base + eventid_to_offset(eventid));
         |                ^~~~~~~~~~~~~
         |                readw_relaxed
   cc1: some warnings being treated as errors


vim +232 drivers/perf/marvell_pem_pmu.c

   228	
   229	static u64 pem_perf_read_counter(struct pem_pmu *pmu,
   230					 struct perf_event *event, int eventid)
   231	{
 > 232		return readq_relaxed(pmu->base + eventid_to_offset(eventid));
   233	}
   234	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
