Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DE421D59B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Mar 2025 11:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741692701; cv=none; b=h+HK7Qj+uPE8lKC6vJGktZ7ZzxDBda3wXZBYmwolweybL1uWa6g8mYqI0Ykkmb6Lz6UFsosKmHo47T0/JgCjSCoa33nwwvB+49yFtAY+dbXbWTbIMoptlxQ6ONvClJrhzjiRHSTJmg7kqw6BnFxdEzk1BOGuhzksCYjEaLy0pEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741692701; c=relaxed/simple;
	bh=Q4yzyZmUTCUmQKvJikZ41lz3PwHG+1gpcmxBdqweinI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lUWIvf79Grss6zvcjr2Xm0enfuEYlzGnM6ZNztiOzxBU6gO5TMjHWzbz1rm7MUpL1Q4VscomT5q2DQdgi2tVMxeZsMxOJrI/zNEPtF75KeHg9lsGZjVk9Apg2rLe2a53dU+3rZiSiJWNJ8aRnSj6E/wTQpO1Xhplp1cAex56a6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kd2btoW1; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kd2btoW1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741692700; x=1773228700;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q4yzyZmUTCUmQKvJikZ41lz3PwHG+1gpcmxBdqweinI=;
  b=kd2btoW1ohcn8WJoovUV9r+7M0CvLQAzK8XXOlGIsT0dkLZ52h99Tak2
   kbSh7EM7PccDp6h6IxPmNSrDuY1HnXPspMkmK+bA+4ERLEc3N1LziaXY9
   /WPNWGwzQFUavLGtvheKsyzLp1lpEZy5NNWGeerZb7qBM20vMfrreZvo5
   +agjOevQGoUG9axdijW/+VJJGran6SgGNz9MSLVygQpli3dJp2UvgsgWN
   eBlYf5uYbtgDQ4Xt/N+wFaZkxq1KR7/q++abNEbgJtKoa6LH9EJrOKRba
   6UHVa0AdG7vgajUrUO4rtdtrQsq4XppSZl918iiOBTC0RiLyHJuE8wKFn
   Q==;
X-CSE-ConnectionGUID: R0obmhSqQ26BOHJ2hAVCpA==
X-CSE-MsgGUID: eqSdQjJWTYWpWyUkIA5tJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="65182158"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="65182158"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 04:31:39 -0700
X-CSE-ConnectionGUID: f0K9stodQnC6IHVBGe50SQ==
X-CSE-MsgGUID: DN5oiFz4Q7yvMJOLdYBv8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="124897104"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 11 Mar 2025 04:31:36 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trxpe-0006c2-08;
	Tue, 11 Mar 2025 11:31:34 +0000
Date: Tue, 11 Mar 2025 19:31:23 +0800
From: kernel test robot <lkp@intel.com>
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: oe-kbuild-all@lists.linux.dev, maddy@linux.ibm.com, mpe@ellerman.id.au,
	npiggin@gmail.com, msuchanek@suse.de, mahesh@linux.ibm.com,
	tyreld@linux.ibm.com, hbabu@us.ibm.com, haren@linux.ibm.com,
	sv@linux.ibm.com
Subject: Re: [PATCH v7 7/7] powerpc/pseries: Add a char driver for
 physical-attestation RTAS
Message-ID: <202503111945.ijp4Nbkl-lkp@intel.com>
References: <20250309213916.762116-8-haren@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309213916.762116-8-haren@linux.ibm.com>

Hi Haren,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes linus/master v6.14-rc6]
[cannot apply to next-20250307]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Haren-Myneni/powerpc-pseries-Define-common-functions-for-RTAS-sequence-calls/20250310-054319
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20250309213916.762116-8-haren%40linux.ibm.com
patch subject: [PATCH v7 7/7] powerpc/pseries: Add a char driver for physical-attestation RTAS
config: powerpc64-randconfig-r072-20250311 (https://download.01.org/0day-ci/archive/20250311/202503111945.ijp4Nbkl-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e15545cad8297ec7555f26e5ae74a9f0511203e7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250311/202503111945.ijp4Nbkl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503111945.ijp4Nbkl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/platforms/pseries/papr-phy-attest.c:137: warning: Function parameter or struct member 'seq' not described in 'phy_attest_sequence_begin'


vim +137 arch/powerpc/platforms/pseries/papr-phy-attest.c

   121	
   122	/*
   123	 * Internal physical-attestation sequence APIs. A physical-attestation
   124	 * sequence is a series of calls to get ibm,physical-attestation
   125	 * for a given attestation command. The sequence ends when an error
   126	 * is encountered or all data for the attestation command has been
   127	 * returned.
   128	 */
   129	
   130	/**
   131	 * phy_attest_sequence_begin() - Begin a response data for attestation
   132	 * command retrieval sequence.
   133	 *
   134	 * Context: May sleep.
   135	 */
   136	static void phy_attest_sequence_begin(struct papr_rtas_sequence *seq)
 > 137	{
   138		struct rtas_phy_attest_params *param;
   139	
   140		/*
   141		 * We could allocate the work area before acquiring the
   142		 * function lock, but that would allow concurrent requests to
   143		 * exhaust the limited work area pool for no benefit. So
   144		 * allocate the work area under the lock.
   145		 */
   146		mutex_lock(&rtas_ibm_physical_attestation_lock);
   147		param =  (struct rtas_phy_attest_params *)seq->params;
   148		param->work_area = rtas_work_area_alloc(SZ_4K);
   149		memcpy(rtas_work_area_raw_buf(param->work_area), &param->cmd,
   150				param->cmd_len);
   151		param->sequence = 1;
   152		param->status = 0;
   153	}
   154	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
