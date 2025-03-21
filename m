Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21061E9B2C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Mar 2025 06:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742537647; cv=none; b=Iz06wh6jsvlP1s5dumHdB6LMsrgfowaibg+iClgNyUNxQFcdjkW9SDbl2ybtlE2f+p+zQHaE0QNwTlmMVASWut/3nbQtfwwN2raUk/yd/Yawbw7+umwsZSMhOYfB5b0cNooRuHmHVnmC8q5Agwf7JOuq6QDEciT/c8wnojHRKTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742537647; c=relaxed/simple;
	bh=dTB2QCx/jN/+F5WVCvwraUsJysF//S4vAos0myZvP5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XOeV8POwztE5u4ksBcwa0813/Gt0qgtEZw4BK8gVrmnN89o6XodMEKf0Vd8D9EPnpUF5HpS/CaATJiqFtLadYgPlbJmoykljoyMqWck8gF0KGAp4ZFMqj35FobQDqIxa0J0bNNq/6ziuG6Fm02dyfEsTYimWdgk0+I79agQ6FP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hOKDk/03; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hOKDk/03"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742537645; x=1774073645;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dTB2QCx/jN/+F5WVCvwraUsJysF//S4vAos0myZvP5A=;
  b=hOKDk/039SFCt/iiJHUqDL30OXiTGDrWhxUzRu9IOLhDUSznMkBKfJlE
   CUq0u34IPmmZrSjB4o1VE5mqGNnV9OrgX5yA67U4JBjlxcTEBjxgwBQNd
   wpnvhtl1FInr5LpNlRhTn1RvEzIDEDzrNskV3PvkjAEckPoDsIPIQSZmA
   4HBxfGtQ2l5xqH7XC08+49FQsIlm4hukOHbI4wnfG67JJ2BFp0jvCXTv+
   aCoshyl8Bo9/BJPDwGn9nrgR6NzTEj0A2WaGuP1icMiCNEFLr8tHzHHrG
   5KV1JHkwx0cFlZhqyat04aXOi7qevdUWqDU1jm1K4T8+JDrO45SA2neMC
   A==;
X-CSE-ConnectionGUID: 1txTamHrRJKuhGLPzYEIDA==
X-CSE-MsgGUID: HXigWKYGT6eoKB8AjxqBAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="54013356"
X-IronPort-AV: E=Sophos;i="6.14,263,1736841600"; 
   d="scan'208";a="54013356"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 23:14:04 -0700
X-CSE-ConnectionGUID: gfG4wWWeSeqgx1JwK81BIw==
X-CSE-MsgGUID: vIX1aNBnSJu7cnRG1B8BvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,263,1736841600"; 
   d="scan'208";a="123331856"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 20 Mar 2025 23:14:03 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvVdb-00015L-0V;
	Fri, 21 Mar 2025 06:13:48 +0000
Date: Fri, 21 Mar 2025 14:12:04 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 3/3] mm: integrate GCMA with CMA using dt-bindings
Message-ID: <202503211346.ihyR35WI-lkp@intel.com>
References: <20250320173931.1583800-4-surenb@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320173931.1583800-4-surenb@google.com>

Hi Suren,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 40caf747267c18b6206e26a37d6ea6b695236c11]

url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan/mm-implement-cleancache/20250321-014107
base:   40caf747267c18b6206e26a37d6ea6b695236c11
patch link:    https://lore.kernel.org/r/20250320173931.1583800-4-surenb%40google.com
patch subject: [RFC 3/3] mm: integrate GCMA with CMA using dt-bindings
config: arc-randconfig-002-20250321 (https://download.01.org/0day-ci/archive/20250321/202503211346.ihyR35WI-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250321/202503211346.ihyR35WI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503211346.ihyR35WI-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> mm/cma.c:282: warning: Function parameter or struct member 'gcma' not described in 'cma_init_reserved_mem'
--
   arc-linux-ld: mm/cma.o: in function `cma_range_alloc.constprop.0':
>> cma.c:(.text+0x2fe): undefined reference to `gcma_alloc_range'
>> arc-linux-ld: cma.c:(.text+0x2fe): undefined reference to `gcma_alloc_range'
   arc-linux-ld: mm/cma.o: in function `cma_release':
>> cma.c:(.text+0x978): undefined reference to `gcma_free_range'
>> arc-linux-ld: cma.c:(.text+0x978): undefined reference to `gcma_free_range'
   arc-linux-ld: mm/cma.o: in function `cma_activate_area':
>> cma.c:(.init.text+0x1a0): undefined reference to `gcma_register_area'
>> arc-linux-ld: cma.c:(.init.text+0x1a0): undefined reference to `gcma_register_area'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
