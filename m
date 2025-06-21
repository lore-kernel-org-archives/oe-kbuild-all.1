Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143AB28F1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Jun 2025 16:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750524622; cv=none; b=i8DEnV2htyvv8zpdUQAwviV9YBSlQNJkONm316MMmZ7+PGUjOWxB51E6pOgD1tAFa/4Z7jC2Ygd2SrJS5sIdsA6bO3FKp3XPAwNyNU6ef0gf4lURqAoR9HWzJwqjV2Je6zkiSjl6bGX/d6YAo1C4Aq4jjWhAOJQxOncbqqLd+lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750524622; c=relaxed/simple;
	bh=0MuAhRHY13QkFGbG4vwJAd2aCM49CNhvIG/Wmn8rKmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jWl4UFEfNrqpkpgPj1WBcaAdepmiBDVwbzvdpHR1rKTdmaAX0HjrPSI6kDgyQDdbm1dGJqwXfQdwoJ+tv1VtHXv3Uwpryk3wzDdVEZWY171fiL7LYwSRN5laBsWhqYve1h2YJmXEsqrIDJM1RAV+/+uQHnMwOkj/eLQoWnWkSyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pn97NxVa; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pn97NxVa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750524621; x=1782060621;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0MuAhRHY13QkFGbG4vwJAd2aCM49CNhvIG/Wmn8rKmg=;
  b=Pn97NxVaXda/adDBFJOs+GVTwqvlTpZzgQrYNcQ+RQzwqTowE0+bnFeN
   5fMZJwVRPhNPJJT0soWbETOTY+tqLq0LCKyOHFww3k/nFFuF3FfDf2+BI
   iGnH7nG+Wy0zN8oxBM/6c6nZXnt3GSd8zvum/DqqB0VaMNeSLJHgS0DgZ
   vDrFeXHATyI75NJ1i+bV6gKkkOwSF2DNK2z3ZKuRzGexBjJ39nvkdflYR
   tZ+cNg/UuZ80HvWJ04k+e5DNLD/Kl4aoQ8Ca58nt27uu55Ulxfv2C1dii
   yDUkcdzLPmd0IQ+012/XJl0vefd/RoxqB63c7mBEPDd3sp69+EEeSClJA
   A==;
X-CSE-ConnectionGUID: uKN/2uaPTX2pwTyHD///UQ==
X-CSE-MsgGUID: uvQAknrpTKmFvd3ozEvJMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11470"; a="52479699"
X-IronPort-AV: E=Sophos;i="6.16,254,1744095600"; 
   d="scan'208";a="52479699"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2025 09:50:20 -0700
X-CSE-ConnectionGUID: 1JeNONO2Sq6VUKuMdXQ4KQ==
X-CSE-MsgGUID: lFuY1c0rSpa1RC+LLwbEbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,254,1744095600"; 
   d="scan'208";a="156666656"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 21 Jun 2025 09:50:19 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uT1Q0-000Mjt-29;
	Sat, 21 Jun 2025 16:50:16 +0000
Date: Sun, 22 Jun 2025 00:50:03 +0800
From: kernel test robot <lkp@intel.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 4/7] firmware: arm_scmi: Add System Telemetry driver
Message-ID: <202506220004.bYJ3ODLq-lkp@intel.com>
References: <20250620192813.2463367-5-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620192813.2463367-5-cristian.marussi@arm.com>

Hi Cristian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on soc/for-next]
[also build test WARNING on trace/for-next linus/master v6.16-rc2 next-20250620]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cristian-Marussi/firmware-arm_scmi-Define-a-common-SCMI_MAX_PROTOCOLS-value/20250621-033227
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20250620192813.2463367-5-cristian.marussi%40arm.com
patch subject: [RFC PATCH 4/7] firmware: arm_scmi: Add System Telemetry driver
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250622/202506220004.bYJ3ODLq-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250622/202506220004.bYJ3ODLq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506220004.bYJ3ODLq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/arm_scmi/scmi_system_telemetry.c: In function '__available_update_show':
>> drivers/firmware/arm_scmi/scmi_system_telemetry.c:346:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     346 | }
         | ^


vim +346 drivers/firmware/arm_scmi/scmi_system_telemetry.c

   328	
   329	//TODO Review available interval show
   330	#define BUF_SZ	1024
   331	static inline ssize_t
   332	__available_update_show(char *buf,
   333				const struct scmi_telemetry_update_interval *intervals)
   334	{
   335		int len = 0, num_intervals = intervals->num;
   336		char available[BUF_SZ];
   337	
   338		for (int i = 0; i < num_intervals; i++) {
   339			len += scnprintf(available + len, BUF_SZ - len, "%u ",
   340					 intervals->update_intervals[i]);
   341		}
   342	
   343		available[len - 1] = '\0';
   344	
   345		return sysfs_emit(buf, "%s\n", available);
 > 346	}
   347	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
