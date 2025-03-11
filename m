Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BBF1684AC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Mar 2025 09:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741685978; cv=none; b=mGSlpxcLoUo7q2WCJv8vNw5OIvAogl0+7R6LFCrgXiXGTK/7q/oyXK1YNFui1QpaChCv6D7oBnjsh4Dd/uUWMrisgqJHH17dyfX4phP8EfL5q9A39+fpEZ5WXGM3AX/dO271WOfvff/KeHJPzsiSQdoWbq6KU6V2KqkVog7FY/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741685978; c=relaxed/simple;
	bh=W+ThvGzyags0oy0GD0f6DFZf/gVocxjUqYpDIHny/is=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X47HVJ4qXraio++sgiTuoXGejzywp9PA75yQiwwrLIWjDo4WfiIAY0BJOawgsMbNrA6tt+kmjOiVXEBxT2ATM+PV2Kfa833CDwHIZVYkm8yJ7gnxOhk48zBnrpnzLKysb+jhKwGE44z5WvTEV2KN1FYGagr7d3H9pyIBgfrfY9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MFkaRyO4; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MFkaRyO4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741685976; x=1773221976;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W+ThvGzyags0oy0GD0f6DFZf/gVocxjUqYpDIHny/is=;
  b=MFkaRyO4aLKQM4iYf6X7LBJQ6yYiwBqmabXZdTjTbbQrnBqOMPt18XH6
   h0UbIYqRcVuPTmj+o/MI6zMqhg7hafd7ee9a588Bbf8heoYgeGBQAg3V3
   uPSdtYrinNA3Pidxim6OyQtt8xDFCt6eoHNJJOfjT42hRRh8i2vDez8mM
   nn58YW9a+iRM/FEfH+YPoxvcsidsW4YJmIQ+5gZyXgX4lK+K0sgSJssd9
   evM2nBD7CUkaPksJ0B8rt+7sD5WwaIDKtLIsRJuOu8OWPoqxyFNFqkbCk
   k04VJrfe5YWpObM1Ocbs5r0HOZ3/vEv84LesbWPLeZdtnSPrNyM0pSvCw
   g==;
X-CSE-ConnectionGUID: JR7I8SxcRp6KihKkrRirxw==
X-CSE-MsgGUID: j6j9ozoAS5KJeXiT9K1IoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="53356858"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="53356858"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 02:39:35 -0700
X-CSE-ConnectionGUID: zmlavfLxSxOrlhQRGn1sdw==
X-CSE-MsgGUID: q1Pg65+qTAGO+/rVHn6w4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="121176978"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 11 Mar 2025 02:39:32 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trw57-0006XE-0P;
	Tue, 11 Mar 2025 09:39:26 +0000
Date: Tue, 11 Mar 2025 17:38:26 +0800
From: kernel test robot <lkp@intel.com>
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: oe-kbuild-all@lists.linux.dev, maddy@linux.ibm.com, mpe@ellerman.id.au,
	npiggin@gmail.com, msuchanek@suse.de, mahesh@linux.ibm.com,
	tyreld@linux.ibm.com, hbabu@us.ibm.com, haren@linux.ibm.com,
	sv@linux.ibm.com
Subject: Re: [PATCH v7 3/7] powerpc/pseries: Add papr-indices char driver for
 ibm,get-indices
Message-ID: <202503111710.tsPk3Snj-lkp@intel.com>
References: <20250309213916.762116-4-haren@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309213916.762116-4-haren@linux.ibm.com>

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
patch link:    https://lore.kernel.org/r/20250309213916.762116-4-haren%40linux.ibm.com
patch subject: [PATCH v7 3/7] powerpc/pseries: Add papr-indices char driver for ibm,get-indices
config: powerpc64-randconfig-r072-20250311 (https://download.01.org/0day-ci/archive/20250311/202503111710.tsPk3Snj-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e15545cad8297ec7555f26e5ae74a9f0511203e7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250311/202503111710.tsPk3Snj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503111710.tsPk3Snj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/platforms/pseries/papr-indices.c:124: warning: Function parameter or struct member 'seq' not described in 'indices_sequence_begin'


vim +124 arch/powerpc/platforms/pseries/papr-indices.c

   110	
   111	/*
   112	 * Internal indices sequence APIs. A sequence is a series of calls to
   113	 * ibm,get-indices for a given location code. The sequence ends when
   114	 * an error is encountered or all indices for the input has been
   115	 * returned.
   116	 */
   117	
   118	/**
   119	 * indices_sequence_begin() - Begin a indices retrieval sequence.
   120	 *
   121	 * Context: May sleep.
   122	 */
   123	static void indices_sequence_begin(struct papr_rtas_sequence *seq)
 > 124	{
   125		struct rtas_get_indices_params  *param;
   126	
   127		param = (struct rtas_get_indices_params *)seq->params;
   128		/*
   129		 * We could allocate the work area before acquiring the
   130		 * function lock, but that would allow concurrent requests to
   131		 * exhaust the limited work area pool for no benefit. So
   132		 * allocate the work area under the lock.
   133		 */
   134		mutex_lock(&rtas_ibm_get_indices_lock);
   135		param->work_area = rtas_work_area_alloc(RTAS_GET_INDICES_BUF_SIZE);
   136		param->next = 1;
   137		param->status = 0;
   138	}
   139	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
