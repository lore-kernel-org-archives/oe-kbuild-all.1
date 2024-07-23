Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA01814C5A1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jul 2024 16:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721752367; cv=none; b=W7CB9pSgESbNlefpo+WsXWMEYFbUw9AaP9r5WTfPPX2Cmk0R4Uo9e2PU7NPZ8aui9E+QBWan945T2e+ZLBv/bmWM53Hd3YLXgzQZU2+6+LG8AZ5/uFL2xo3tpA4qtoT09b19Rr6IUAJrgaU7qCW/udLrnInGfFDXrlg4PjpH6Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721752367; c=relaxed/simple;
	bh=cnvPIfwizAqvslr5uEso+hiWNm2SQmgzu4MlHsst4Bk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MKWDMpt1kA6tbKTRTaCFNkjiqoizMVkA9Nx3aOOnz0DDmdTamFh3B75FZALSyeAN6k1lApNt6OZcN4R9q4gaX849ZfT6Gxtaq51HefR5d4pGVPBtcqP2g6yUZFEZMcwHmn0COamqSgeiXQ14mC1ZCcPUp8Xx3DWFNl8eP2SihnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cerCZCb2; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cerCZCb2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721752365; x=1753288365;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cnvPIfwizAqvslr5uEso+hiWNm2SQmgzu4MlHsst4Bk=;
  b=cerCZCb2Oto01jU/kdI71FL//IeuNAkQym4/8bcC59vy7IoxSZCIBW97
   jRWJfvlQ/BV0Zhq1j/GhvtPrD7zi7qqbKdV5lAfvCUcWnpv7gw4ifoAfB
   6K2D9csePeFmxZMamTHe0WyoK8Lt9WsYkK3n5k7IkPGv8g9LGSMWB0HJi
   5MMhH9YWyJPogXaxePzSFV1HIYzZcCCDCDkTuUsczazDc/+FdP8Qf1OBJ
   qk5VW+5D8Ae2/7Au3C7PevLVVVbzgEauvxtjduerEMBk57+7JSd8HnzwX
   CclFHiEXJRNtxVzVfiEzPbRHGaXaKiaF9tN/xWgJqZo9i/jxjGhlIUJco
   A==;
X-CSE-ConnectionGUID: LBRfX2ldTZOw/V1MQc+pGg==
X-CSE-MsgGUID: mxQx3gocRcyzQ7l9Ydc+Vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="19519201"
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; 
   d="scan'208";a="19519201"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2024 09:32:44 -0700
X-CSE-ConnectionGUID: fUN5DkLjTieuj5ma+L9J7g==
X-CSE-MsgGUID: Cbgr96wXQT6FRbBwVv68GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; 
   d="scan'208";a="51973211"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 Jul 2024 09:32:43 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWIRM-000m7o-39;
	Tue, 23 Jul 2024 16:32:40 +0000
Date: Wed, 24 Jul 2024 00:32:38 +0800
From: kernel test robot <lkp@intel.com>
To: Zi Yan <ziy@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Huang, Ying" <ying.huang@intel.com>
Subject: [akpm-mm:mm-unstable 9/30] mm/memory-tiers.c:64:6: error:
 redefinition of 'folio_has_cpupid'
Message-ID: <202407240024.Lhu1XDok-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   cecb3db438d76f7c1005fd52689809696a330474
commit: c57ceb62609b36d1a01e8bdd894d032379999b75 [9/30] memory tiering: introduce folio_has_cpupid() check
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20240724/202407240024.Lhu1XDok-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240724/202407240024.Lhu1XDok-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407240024.Lhu1XDok-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/memory-tiers.c:64:6: error: redefinition of 'folio_has_cpupid'
      64 | bool folio_has_cpupid(struct folio *folio)
         |      ^~~~~~~~~~~~~~~~
   In file included from mm/internal.h:11,
                    from mm/memory-tiers.c:11:
   include/linux/mm.h:1796:20: note: previous definition of 'folio_has_cpupid' with type 'bool(struct folio *)' {aka '_Bool(struct folio *)'}
    1796 | static inline bool folio_has_cpupid(struct folio *folio)
         |                    ^~~~~~~~~~~~~~~~


vim +/folio_has_cpupid +64 mm/memory-tiers.c

    53	
    54	/**
    55	 * folio_has_cpupid - check if a folio has cpupid information
    56	 * @folio: folio to check
    57	 *
    58	 * folio's _last_cpupid field is repurposed by memory tiering. In memory
    59	 * tiering mode, cpupid of slow memory folio (not toptier memory) is used to
    60	 * record page access time.
    61	 *
    62	 * Return: the folio _last_cpupid is used as cpupid
    63	 */
  > 64	bool folio_has_cpupid(struct folio *folio)
    65	{
    66		return !(sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING) ||
    67		       node_is_toptier(folio_nid(folio));
    68	}
    69	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
