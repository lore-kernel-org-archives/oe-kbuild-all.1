Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D7E4A02
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Mar 2026 00:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774572999; cv=none; b=YDP439THk4ku1BpaXGYfYiFKeNQnJtveFghxJ8YwLfhloBK1tJiogtjmvkcobGpoZm/TusmDwf8erQEYbteWRgS6MTWhjihhYw3kvMGUJha6YpBsJn0nO7aWiZMR+z0vCBtTCF4QREA5iLcBdFzmVrr9PWZwY5PI2nq1bSfErI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774572999; c=relaxed/simple;
	bh=taCNcc5q8CNq5kRK6AP0wtMc26se2e/+GRfGMzNbgkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JLvK7SvC42K0d3LcVSF8rC6bkiL43qAw6wLvqjppluBU8brSYvqLPpYkGj3VQFd/0o//5ZCWnQrMMXoTaxE3lg7Y9vbA7mK5LZ+ln09wqNfvNqNw+RLWnFZbwqTbROA4CbMHacPjWKiZmL8jYpRwX69opC2RRlh/WePH9NJMRSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kmgYTLn7; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kmgYTLn7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774572998; x=1806108998;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=taCNcc5q8CNq5kRK6AP0wtMc26se2e/+GRfGMzNbgkY=;
  b=kmgYTLn7BUKm2rcSp5vzpVHdipvQlurTl7ICVeNT8jsSkeweNNNyTtAT
   b0OFrEemZesPYFlhgN50ag1vLyEphK/qq3gCsHaUnLbFCZ6t7hd0YOYAi
   7uv7s+WfIFTrtd0zbSzk9zRGJNzBf++YfhB/pRKD+0gmRus8HuPwqpyz6
   c4rtQmTWd4wp09J2XkO7oy50Q1lNez/kvy14zbKIAbs4OWHs51drsOosC
   sdWYZMo2fP+FLlVvUPmEXDN7d5g1uS7hkpUaiWtWKSYysKLHXPbeKhaA5
   UihX2tf8VxR2Ch4cgUmiqLi4rDAU8xgeeppeAb2jKlKowEqg2nyRtJhmG
   Q==;
X-CSE-ConnectionGUID: cOqMUxogSnutD+WsubPhfQ==
X-CSE-MsgGUID: rchXm6lDR3GCuDlIy6oMAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="86721505"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="86721505"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 17:56:37 -0700
X-CSE-ConnectionGUID: Ik7MET35Rva3oxO6JL1Ljg==
X-CSE-MsgGUID: /wFhCrtUQXSw7chzov5iXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="226792302"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 Mar 2026 17:56:35 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5vV3-000000009bj-1nfe;
	Fri, 27 Mar 2026 00:56:33 +0000
Date: Fri, 27 Mar 2026 08:56:30 +0800
From: kernel test robot <lkp@intel.com>
To: Bharata B Rao <bharata@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v6 4/5] mm: pghot: Precision mode for pghot
Message-ID: <202603270852.mDmAfreN-lkp@intel.com>
References: <20260323095104.238982-5-bharata@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323095104.238982-5-bharata@amd.com>

Hi Bharata,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on a989fde763f4f24209e4702f50a45be572340e68]

url:    https://github.com/intel-lab-lkp/linux/commits/Bharata-B-Rao/mm-migrate-Allow-misplaced-migration-without-VMA/20260325-092849
base:   a989fde763f4f24209e4702f50a45be572340e68
patch link:    https://lore.kernel.org/r/20260323095104.238982-5-bharata%40amd.com
patch subject: [RFC PATCH v6 4/5] mm: pghot: Precision mode for pghot
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20260327/202603270852.mDmAfreN-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603270852.mDmAfreN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603270852.mDmAfreN-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/pghot-precise.c: In function 'pghot_nid_valid':
>> mm/pghot-precise.c:17:20: error: 'NUMA_NO_NODE' undeclared (first use in this function)
      17 |         if (nid != NUMA_NO_NODE && (nid < 0 || nid >= PGHOT_NID_MAX))
         |                    ^~~~~~~~~~~~
   mm/pghot-precise.c:17:20: note: each undeclared identifier is reported only once for each function it appears in
   mm/pghot-precise.c: In function 'pghot_update_record':
   mm/pghot-precise.c:33:23: error: 'NUMA_NO_NODE' undeclared (first use in this function)
      33 |         nid = (nid == NUMA_NO_NODE) ? pghot_target_nid : nid;
         |                       ^~~~~~~~~~~~


vim +/NUMA_NO_NODE +17 mm/pghot-precise.c

    11	
    12	bool pghot_nid_valid(int nid)
    13	{
    14		/*
    15		 * TODO: Add node_online() and node_is_toptier() checks?
    16		 */
  > 17		if (nid != NUMA_NO_NODE && (nid < 0 || nid >= PGHOT_NID_MAX))
    18			return false;
    19	
    20		return true;
    21	}
    22	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
