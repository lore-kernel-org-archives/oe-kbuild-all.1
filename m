Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBA229D281
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Nov 2025 05:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763012854; cv=none; b=p4qdL9l22nwTktf8RP+7zIauWE3xxm0oUWxcPsHHBeulkBtO9PRka4H/msQESa+JEGkL5jnNqAfq+uzkmQhDl3af2dm8YEhvLrS+dp65DPHChzXtTX0TCVOgnp+M63dsxW1IT+WfyCcsebdL2AKOtICDjXd2QSGCw/y6sWYPpFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763012854; c=relaxed/simple;
	bh=tYTHNNf+YGbTSSvqqxsTBUg/KkDpiG6hdbKFlnGdIzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b2p/+8ghI92miK/cWjaEFE+lmmPs9V7QYc162tHn1iWbQg+C+xs297oBxHVI27666KSdUtOjFk8mBwoa0USUbaeb8MiPDfXkP5nF31q/C3h2OE77KQZi0t5cPEwNw8VzcbgHQlSp+U2GvDqL0aQziO7aWfWM/3YqCnGngFYPDuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gm2F9Djw; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gm2F9Djw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763012851; x=1794548851;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tYTHNNf+YGbTSSvqqxsTBUg/KkDpiG6hdbKFlnGdIzE=;
  b=gm2F9Djwvg4bPaEaByxaI8IiDyWT2gN7sQTMYLQXH2XsAuC7wq5pjj0O
   MDinV1FGkj70CtDk0RPk93k3NMpBUohFY6tVJQmPD0menOsEwnKMTQ9c1
   NxNc6Sq4clo9CtawtINdZ77K28T6ahSHY4GLXa/SAnygY+j8JK6B8nyLt
   F+ZxjHjh6QRUW43iWupM8RIO7ATClu/BEMycoR9MPMXA+2Ob6p0av/DXy
   UXO0MpZenFCpitAS2jGB3SMc01h57a70FN68CL/bj0Q80pnPHa6RXS1fj
   kI6BoYgYSFPe3ZBJjXnoiPyb9T2mEhJHTSmYMadlm66S5FQc5I1Jan+h7
   w==;
X-CSE-ConnectionGUID: +2o/t4hcS1yPhcugauiUXQ==
X-CSE-MsgGUID: 4/rSGg37Th6B+hG8MS8vNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65011339"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="65011339"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 21:47:30 -0800
X-CSE-ConnectionGUID: LZMRPt/QQRmtXvbcDjngVg==
X-CSE-MsgGUID: uhQmO3RJRcaWuElWg0Lv/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="189689750"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Nov 2025 21:47:25 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJQB1-0004wl-2L;
	Thu, 13 Nov 2025 05:47:23 +0000
Date: Thu, 13 Nov 2025 13:46:28 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	linux-riscv@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	devicetree@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
	linux-kernel@vger.kernel.org, Mike Rapoport <rppt@kernel.org>,
	Michal Hocko <mhocko@suse.com>, Conor Dooley <conor@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>
Subject: Re: [PATCH v3 06/22] mm: Always use page table accessor functions
Message-ID: <202511131118.UUi1EVXL-lkp@intel.com>
References: <20251113014656.2605447-7-samuel.holland@sifive.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113014656.2605447-7-samuel.holland@sifive.com>

Hi Samuel,

kernel test robot noticed the following build errors:

[auto build test ERROR on 24172e0d79900908cf5ebf366600616d29c9b417]

url:    https://github.com/intel-lab-lkp/linux/commits/Samuel-Holland/mm-ptdump-replace-READ_ONCE-with-standard-page-table-accessors/20251113-095117
base:   24172e0d79900908cf5ebf366600616d29c9b417
patch link:    https://lore.kernel.org/r/20251113014656.2605447-7-samuel.holland%40sifive.com
patch subject: [PATCH v3 06/22] mm: Always use page table accessor functions
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20251113/202511131118.UUi1EVXL-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251113/202511131118.UUi1EVXL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511131118.UUi1EVXL-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/madvise.c: In function 'guard_install_set_pte':
>> mm/madvise.c:1119:9: error: implicit declaration of function 'set_pte'; did you mean 'set_ptes'? [-Wimplicit-function-declaration]
    1119 |         set_pte(ptep, make_pte_marker(PTE_MARKER_GUARD));
         |         ^~~~~~~
         |         set_ptes


vim +1119 mm/madvise.c

  1112	
  1113	static int guard_install_set_pte(unsigned long addr, unsigned long next,
  1114					 pte_t *ptep, struct mm_walk *walk)
  1115	{
  1116		unsigned long *nr_pages = (unsigned long *)walk->private;
  1117	
  1118		/* Simply install a PTE marker, this causes segfault on access. */
> 1119		set_pte(ptep, make_pte_marker(PTE_MARKER_GUARD));
  1120		(*nr_pages)++;
  1121	
  1122		return 0;
  1123	}
  1124	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
