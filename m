Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CF43597B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 04:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765687229; cv=none; b=WKkccRaFLNvLE2kDl1iMI3064i5qOBc+2G10dUTlYgbR7HypDani6O1k+qbdeE4T2bA7/f8cuxFNYi7NZx5gdq/WUs4cHFyVvYRqfh9BPYGtVLnZWeB+Gyt6DhIxVEnKgZN8RbFVbGfJkYW+QrO0bvLRVafGJMmI57XieHPsF38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765687229; c=relaxed/simple;
	bh=HKim62sGfj7m3GUoRofOks+mDH0M54wD7Axt+lzZ+dU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FtmJWnyJN6c/XqoMaLC26tM3bC3i7F4oh21CAVoO19s4fzXGKi6cewAV0GgndyCOSj5mt4FBaRksONxwwdI4Lnsyei7vg5xPcNimqweluDCtA3KCf+ZzyQsvRtXYGXoJedtaMJiPlOzsa8lhwZq3s0Ct5qb3op7RCuTdNVQ9nv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gC20wfTX; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gC20wfTX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765687226; x=1797223226;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HKim62sGfj7m3GUoRofOks+mDH0M54wD7Axt+lzZ+dU=;
  b=gC20wfTXo/DkCr+Io+ObOAHM49Fci13N3ufK7cEjsvKqanph4UF62lx7
   QfTHv5yQKDvOj+N0OPHB92KSWzbrDzOY/zt00aOdRKoWpf6Y6IT2fOHaY
   BXId2unKXw6O4moHZ3Rgu78p7CKkrLRcttvkRaqmR07HNirZhsPIdh1jT
   Bq5XI/tADcIWsqVecqbSnmCtsy7H7umycKqcmIVr8txPJaMed6wceyBv6
   BjBhWiaF0TaIzfEqRSxhs0tVUdxS8j34oS42DXQ8VTZ/5brxV8p3ovuRS
   hNZhe2p5f6hcGeLgw+/KSUdmwWOetD96+CPj3MI7Xw6KdKvVx857oudHx
   g==;
X-CSE-ConnectionGUID: W37A5wypTqOaGTzjybzudw==
X-CSE-MsgGUID: z6TckUN1R1S3Qo7JfIPx/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="79088183"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="79088183"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 20:40:26 -0800
X-CSE-ConnectionGUID: Kc4Q/041QHuHnNgFmx82PA==
X-CSE-MsgGUID: vj759tB9TWuGlvPgs1oaNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="201625531"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Dec 2025 20:40:25 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUduB-000000008a9-04Kf;
	Sun, 14 Dec 2025 04:40:23 +0000
Date: Sun, 14 Dec 2025 12:40:17 +0800
From: kernel test robot <lkp@intel.com>
To: Olga Kornievskaia <okorniev@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 1/1] nfsd: check that server is running in
 unlock_filesystem
Message-ID: <202512141252.JJ9YKez5-lkp@intel.com>
References: <20251212164711.55712-1-okorniev@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212164711.55712-1-okorniev@redhat.com>

Hi Olga,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.18 next-20251212]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Olga-Kornievskaia/nfsd-check-that-server-is-running-in-unlock_filesystem/20251213-010357
base:   linus/master
patch link:    https://lore.kernel.org/r/20251212164711.55712-1-okorniev%40redhat.com
patch subject: [PATCH v2 1/1] nfsd: check that server is running in unlock_filesystem
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20251214/202512141252.JJ9YKez5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512141252.JJ9YKez5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512141252.JJ9YKez5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/nfsd/nfs4state.c:1772 function parameter 'nn' not described in 'nfsd4_revoke_states'
>> Warning: fs/nfsd/nfs4state.c:1772 function parameter 'nn' not described in 'nfsd4_revoke_states'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
