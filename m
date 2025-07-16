Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEDA1922C0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Jul 2025 04:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752639623; cv=none; b=Q25sjxvIia6kAO5fSMXgdA0tTCJ4lg6kk7qKXDkdDjiQ6Bq/ZFQzUVJB80jCygMtJcPYQbDzmqcDLZ2W9jpVQa5dp/CkDCi1YKV+TKIeoGScOltUfYHuO8luyZ9cCk5B8qW91ZFYebVBKqFi0RiH2Ua9jZ0EDowZpoLkVV6vwvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752639623; c=relaxed/simple;
	bh=2lekIspWi8CrsQVqXZCtGLfs37A7YV3c2T5m7QvFLSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HBqSLKo6HOyyJBy/yvPbCa/1+96ePNU7fVf83nrvWXEUqZ1Af7HsAYNvDsVsbRctlWtlj8uchL3m4hDU7cLP0+MOWt/cUzS5+2MRnG9hsaob7Xu8Vcnjb2+rACPfxawI6+CGhrrpyN3PU2eyEhpP5yhx6biijFwabHpzavlA2KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=frXAXagC; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="frXAXagC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752639621; x=1784175621;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2lekIspWi8CrsQVqXZCtGLfs37A7YV3c2T5m7QvFLSc=;
  b=frXAXagCoUvwi5wdzd2Y6KKg5cUJjHLa5g6NGO1L6FFLM7uwhPbPx83D
   QBzzMJAOMtUe7StRwZ9cflkBucUs3wBe1/9nzd4WTUDCNQFnsSfDV7qXg
   BJJYuyynHcwa1pVFzEcrZWHSfHSnUkQpPujGRzgAqD7Jbd3rIzmWGVcWU
   E0IcUbhsLQOEjYTtohpAquot+Q5JffrpHHul21JSY4I3OwRa6TarXEZn1
   oWpLF1w6IQBD6vAcfeseMBdn17yDXsVzRfcah3+3IyS00sIMfjH0r/Kfs
   NLUbPOoOZV+I8P3FlT/dECTrkM+sEluYKbAJl/3yPAXeYzcQgoAszShoW
   g==;
X-CSE-ConnectionGUID: KnomwLKKQNCFz7p5fuB97g==
X-CSE-MsgGUID: wAB84nWnTQWKSVkd2pVbKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="65134809"
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; 
   d="scan'208";a="65134809"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 21:20:21 -0700
X-CSE-ConnectionGUID: RLT5pRW/RdujrBEkYny5iw==
X-CSE-MsgGUID: 6kO43LN/R3m+e+D/GOv9bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; 
   d="scan'208";a="188370513"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 15 Jul 2025 21:20:18 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubtct-000BsF-0X;
	Wed, 16 Jul 2025 04:20:15 +0000
Date: Wed, 16 Jul 2025 12:20:07 +0800
From: kernel test robot <lkp@intel.com>
To: Krishna Kumar <krikku@gmail.com>, netdev@vger.kernel.org,
	davem@davemloft.net, edumazet@google.com
Cc: oe-kbuild-all@lists.linux.dev, tom@herbertland.com, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, sdf@fomichev.me,
	kuniyu@google.com, ahmed.zaki@intel.com,
	aleksander.lobakin@intel.com, atenart@kernel.org,
	jdamato@fastly.com, krishna.ku@flipkart.com
Subject: Re: [PATCH v2 net-next 1/2] net: Prevent RPS table overwrite for
 active flows
Message-ID: <202507161125.rUCoz9ov-lkp@intel.com>
References: <20250715112431.2178100-2-krikku@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715112431.2178100-2-krikku@gmail.com>

Hi Krishna,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Krishna-Kumar/net-Prevent-RPS-table-overwrite-for-active-flows/20250715-192710
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250715112431.2178100-2-krikku%40gmail.com
patch subject: [PATCH v2 net-next 1/2] net: Prevent RPS table overwrite for active flows
config: arc-randconfig-002-20250716 (https://download.01.org/0day-ci/archive/20250716/202507161125.rUCoz9ov-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250716/202507161125.rUCoz9ov-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507161125.rUCoz9ov-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/core/dev.c:4853:13: warning: 'rps_flow_is_active' defined but not used [-Wunused-function]
    static bool rps_flow_is_active(struct rps_dev_flow *rflow,
                ^~~~~~~~~~~~~~~~~~


vim +/rps_flow_is_active +4853 net/core/dev.c

  4839	
  4840	/**
  4841	 * rps_flow_is_active - check whether the flow is recently active.
  4842	 * @rflow: Specific flow to check activity.
  4843	 * @flow_table: Check activity against the flow_table's size.
  4844	 * @cpu: CPU saved in @rflow.
  4845	 *
  4846	 * If the CPU has processed many packets since the flow's last activity
  4847	 * (beyond 10 times the table size), the flow is considered stale.
  4848	 *
  4849	 * Return values:
  4850	 *	True:  Flow has recent activity.
  4851	 *	False: Flow does not have recent activity.
  4852	 */
> 4853	static bool rps_flow_is_active(struct rps_dev_flow *rflow,
  4854				       struct rps_dev_flow_table *flow_table,
  4855				       unsigned int cpu)
  4856	{
  4857		return cpu < nr_cpu_ids &&
  4858		       ((int)(READ_ONCE(per_cpu(softnet_data, cpu).input_queue_head) -
  4859			READ_ONCE(rflow->last_qtail)) < (int)(10 << flow_table->log));
  4860	}
  4861	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
