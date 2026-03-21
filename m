Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7184632D0CF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Mar 2026 17:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774113047; cv=none; b=gIX9FKfgNt93o7bMDDuJtQAvHrukx2h9FI68cB6kr3Bt6IGsC6nAFHvcVN3MT5I4dC8X/cgoyf6vR9p/1dekm3s2qPS2TE+8zR3dtvlyCvlELPCtr56wcXjMoXd6o8Mxe/sf2PVH6NS04zNaWBDOlWEhpHlvoUNSXchzuHCmvNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774113047; c=relaxed/simple;
	bh=DX5T+L4GVDH6JicyRR4zZ6rjUsRLp6EmYUpASxbOlsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=myFIhWptTQkD94p2jr1mkd577EFc9HBKmQFt+l2x0IIOOUzmmmqBrnAydXxLYHKi3PMH+dXLK1XEi1+KzcsztGIrhyMpIOJP29TXzwkARN+it0Nh5/bRYgdPFDe6F4h0aHQ3QOrHTMO3np3ql368zmIbEMJbQ2OhxuWuEm/krJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DCWXQiy7; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DCWXQiy7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774113045; x=1805649045;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DX5T+L4GVDH6JicyRR4zZ6rjUsRLp6EmYUpASxbOlsY=;
  b=DCWXQiy7RU/Hjon8nZZXuRIsenMWgUXynjxON0F2PnFbtBBNrMMHb6d+
   Mma0xj0lDJQ00S0AyTxqKNtrrJ6Zxa/dDxp2exWMtoA9Fgtmk4WhTPZtS
   LxQ4Yjw/0BDrB2hvgFG1ymtNdElfzxqB+8qAIi+l05NjS+UodqWjpRZ3t
   /tHNMzbWXJ9dNjFEWY+4dWIiRlCtWuqZwE+e15motuA0jJEoD263Ouk87
   fy3aKu6mA45zUeCV5qUlyfhsX9MPSFQ/Qwzf7XNhtJOuf9a9Nq3qWJ75F
   Nof5tULWgxKxorRY6V2ZjTnvBNoPN7qQk2w5K9fuHvA9IXmsaKlKiyUgV
   g==;
X-CSE-ConnectionGUID: yCI6I0FcSwWA3/N508e6EA==
X-CSE-MsgGUID: 1wmJKvtyQDGDcMllH3ynRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11736"; a="74884875"
X-IronPort-AV: E=Sophos;i="6.23,133,1770624000"; 
   d="scan'208";a="74884875"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2026 10:10:44 -0700
X-CSE-ConnectionGUID: TrDnITc+TiSlkKxgqvh0Ag==
X-CSE-MsgGUID: WK5M9FYqQ0OGwVjL+TaFdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,133,1770624000"; 
   d="scan'208";a="254074287"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 21 Mar 2026 10:10:42 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3zqF-0000000014P-3h13;
	Sat, 21 Mar 2026 17:10:33 +0000
Date: Sun, 22 Mar 2026 01:09:51 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <ynorov@nvidia.com>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Yury Norov <ynorov@nvidia.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH 3/3] bitmap: add test_zero_nbits()
Message-ID: <202603220114.k5BHBav5-lkp@intel.com>
References: <20260319004349.849281-4-ynorov@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319004349.849281-4-ynorov@nvidia.com>

Hi Yury,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20260318]
[cannot apply to akpm-mm/mm-nonmm-unstable v7.0-rc4 v7.0-rc3 v7.0-rc2 linus/master v7.0-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yury-Norov/bitmap-test-bitmap_weight-for-more/20260319-221930
base:   next-20260318
patch link:    https://lore.kernel.org/r/20260319004349.849281-4-ynorov%40nvidia.com
patch subject: [PATCH 3/3] bitmap: add test_zero_nbits()
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260322/202603220114.k5BHBav5-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260322/202603220114.k5BHBav5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603220114.k5BHBav5-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__bitmap_or_equal" [lib/test_bitmap.ko] undefined!
ERROR: modpost: "__bitmap_weighted_or" [lib/test_bitmap.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
