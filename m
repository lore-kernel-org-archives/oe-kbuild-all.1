Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA5F4C9D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 04:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770697888; cv=none; b=ZAlCff79jL9lzfzmwEToBUucHL+gBNtZ/R1EcnJC5d7GBexLiOOtXPzpRnIt8K54qPNsT/psbmwqC/Op+3Sqg9u5F8/XTqujWZs93zptuovLrsbaBZn/EPRO7hpi5b5C56OWm0H3qowRcB2y2dEhCjhQM+BSYiJ3gvZqXAMDB3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770697888; c=relaxed/simple;
	bh=Me/7VaLko0TzZv6bW0CujcwPJzAN2FTuE8aRgepOsL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jqwsb3ALoszq8YZAA4djgrsDRmbSEsypclcd7vUKLo6i2cjoQu9GBGvfQ++ekVKAbdQFIocCo/2uwx+ay68NFzz4ErtV7+Ux0eP7jl5bFynutzZsHG7ZGBSykBm3LFD+g+xzHdZuNRCKtaXoJuOC82/xa6MI6rwRAFCJ77Z7l5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cvMnSySE; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cvMnSySE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770697888; x=1802233888;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Me/7VaLko0TzZv6bW0CujcwPJzAN2FTuE8aRgepOsL0=;
  b=cvMnSySELcJaYaFar5b0FK5TTwqAaQHtYNAKJTR7my3LCkIwB66BaTWU
   iujo9JgVDwNvm834e4K/C7wsftc0E7idLMpjeE0XiHRZRDFLI5LeA7xBH
   CNcM53mT71UBtzfGtlsTmVCZ6jPZN7SGwDV/byP3udbE5C1IrJqLsFjGi
   DN8bKd96q38Ms6gHxQTeocASPq1GmMHK9oijTlMr9buLLEZKjtU5d9FpZ
   g9n3xO6v8Tni21NtuT6/CBcnfLvK4Cey3dvJTLWHnvKdV/ASelmcazuNr
   DJBrEUeEeDt2vKlxASGnj1SUs2gh5vDn73Nz7L4Yp4wYMWfjR1//jz12r
   g==;
X-CSE-ConnectionGUID: QyYUR4EMSh2LPHeRfH8qnQ==
X-CSE-MsgGUID: 3mE1FTL7SFKrNF4zKVkm2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="75666142"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="75666142"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 20:31:27 -0800
X-CSE-ConnectionGUID: opAGqwogQuK4/Nh8z+UYSQ==
X-CSE-MsgGUID: n17DR2xjTCi7iCEwIuQxpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211872597"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Feb 2026 20:31:21 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpfPC-00000000odk-0nEk;
	Tue, 10 Feb 2026 04:31:18 +0000
Date: Tue, 10 Feb 2026 12:30:47 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org
Cc: oe-kbuild-all@lists.linux.dev, willy@infradead.org, david@kernel.org,
	ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com,
	rakie.kim@sk.com, byungchul@sk.com, gourry@gourry.net,
	ying.huang@linux.alibaba.com, apopple@nvidia.com,
	lorenzo.stoakes@oracle.com, baolin.wang@linux.alibaba.com,
	Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
	dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev,
	vbabka@suse.cz, jannh@google.com, rppt@kernel.org, mhocko@suse.com,
	pfalcato@suse.de, kees@kernel.org, maddy@linux.ibm.com,
	npiggin@gmail.com, mpe@ellerman.id.au, chleroy@kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 1/1] mm: replace vma_start_write() with
 vma_start_write_killable()
Message-ID: <202602101205.7QyEq3MD-lkp@intel.com>
References: <20260209220849.2126486-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209220849.2126486-1-surenb@google.com>

Hi Suren,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a1a876489abcc1e75b03bd3b2f6739ceeaaec8c5]

url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan/mm-replace-vma_start_write-with-vma_start_write_killable/20260210-061104
base:   a1a876489abcc1e75b03bd3b2f6739ceeaaec8c5
patch link:    https://lore.kernel.org/r/20260209220849.2126486-1-surenb%40google.com
patch subject: [PATCH 1/1] mm: replace vma_start_write() with vma_start_write_killable()
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260210/202602101205.7QyEq3MD-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602101205.7QyEq3MD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602101205.7QyEq3MD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/memory.c:381 duplicate section name 'Note'
>> Warning: mm/memory.c:381 duplicate section name 'Note'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
