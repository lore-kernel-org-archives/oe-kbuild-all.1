Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4BD1EF0AF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Jan 2025 12:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737463641; cv=none; b=fn85i8A8tGHbp0YiCGokkEP1sIBqTiuMRa92JZsJ/19GKoPjdq7CVaLBazeiVrvimOaJgyygE+G+oLIbZikqtwDgc7KacBq+bvvT82OZ5L/GzbeM4w4IUtZelS6kcd9AZhEy0HImJBB7CNOA3rjuofvS5hC1z4Fh0hBCFztav5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737463641; c=relaxed/simple;
	bh=hsQ0irnUWCbqyyftsVatPsmhSvts6eSOOc9hF5wEils=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tvSqCrguQL9e8XAeVE2+tHy9H4mKZj1VWo/+SLfI4SNTpgV6R2kZpVDh3MPxyFqi1j/XnCyWxXUmwwb7qf1GrmICIuCU6H3QfFCvaEzUd7gsN2CgXpu5sTRkAW43GRLMdZgiROtQoRw/LaBoGDMKeaRGpDoQKhbJ1key5LZ2HBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P7c/ZdAu; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P7c/ZdAu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737463640; x=1768999640;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hsQ0irnUWCbqyyftsVatPsmhSvts6eSOOc9hF5wEils=;
  b=P7c/ZdAuk/Oe7LiKbXUZu2omj/aB3TV7ZsCdfnBJfO5saKO7BnSW0N/Y
   OiR5t5qlXNPxgxr65LPamslibad3wmmj58nCb1grxIR7Me9uqn/xQ0A72
   eWaRFHa70ZlgAjzBBOUlVs/dldcJAE9w/BFhPY4HrNIsvNZ3EK+9NbdDh
   Xgm018V4pkzUmxsjH7Xz5JTs0cYjq5WUlkCiQ7erhXZX9BbnUWEFVQARj
   yegmPkEZJbizlqBSURILfbY4YgiZvtsrKODMW5iXUvgoKmqFzRNvJw1kx
   7xyNpitxR2j9pJMtjFiXJRSsuhTWd23DPTTLmarjgj2qkRb17Os/a0XqM
   w==;
X-CSE-ConnectionGUID: aOp5dAISTZiOj7R1QDUugQ==
X-CSE-MsgGUID: 5r74vMFUTwCLRZIZAjtQNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="49268575"
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; 
   d="scan'208";a="49268575"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 04:47:20 -0800
X-CSE-ConnectionGUID: caDfTlUvQqmepWN4IGQoSg==
X-CSE-MsgGUID: z+wT1ghtRfGhPn4lqjHXsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="130077721"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 Jan 2025 04:47:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taDez-000Y2X-1H;
	Tue, 21 Jan 2025 12:47:13 +0000
Date: Tue, 21 Jan 2025 20:46:57 +0800
From: kernel test robot <lkp@intel.com>
To: Hyesoo Yu <hyesoo.yu@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev, janghyuck.kim@samsung.com,
	Hyesoo Yu <hyesoo.yu@samsung.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Christoph Lameter <cl@linux-foundation.org>,
	Pekka Enberg <penberg@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Joonsoo Kim <iamjoonsoo.kim@lge.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: slub: Panic if the object corruption is checked.
Message-ID: <202501212026.lUnLNhv6-lkp@intel.com>
References: <20250120082908.4162780-1-hyesoo.yu@samsung.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120082908.4162780-1-hyesoo.yu@samsung.com>

Hi Hyesoo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Hyesoo-Yu/mm-slub-Panic-if-the-object-corruption-is-checked/20250120-163233
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250120082908.4162780-1-hyesoo.yu%40samsung.com
patch subject: [PATCH] mm: slub: Panic if the object corruption is checked.
config: mips-randconfig-r111-20250121 (https://download.01.org/0day-ci/archive/20250121/202501212026.lUnLNhv6-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250121/202501212026.lUnLNhv6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501212026.lUnLNhv6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/slub.c:1308:9: sparse: sparse: cast from restricted slab_flags_t
   mm/slub.c:1394:17: sparse: sparse: cast from restricted slab_flags_t
   mm/slub.c:4440:47: sparse: sparse: context imbalance in '__slab_free' - unexpected unlock

vim +1308 mm/slub.c

  1273	
  1274	/* Check the pad bytes at the end of a slab page */
  1275	static pad_check_attributes void
  1276	slab_pad_check(struct kmem_cache *s, struct slab *slab)
  1277	{
  1278		u8 *start;
  1279		u8 *fault;
  1280		u8 *end;
  1281		u8 *pad;
  1282		int length;
  1283		int remainder;
  1284	
  1285		if (!(s->flags & SLAB_POISON))
  1286			return;
  1287	
  1288		start = slab_address(slab);
  1289		length = slab_size(slab);
  1290		end = start + length;
  1291		remainder = length % s->size;
  1292		if (!remainder)
  1293			return;
  1294	
  1295		pad = end - remainder;
  1296		metadata_access_enable();
  1297		fault = memchr_inv(kasan_reset_tag(pad), POISON_INUSE, remainder);
  1298		metadata_access_disable();
  1299		if (!fault)
  1300			return;
  1301		while (end > fault && end[-1] == POISON_INUSE)
  1302			end--;
  1303	
  1304		slab_err(s, slab, "Padding overwritten. 0x%p-0x%p @offset=%tu",
  1305				fault, end - 1, fault - start);
  1306		print_section(KERN_ERR, "Padding ", pad, remainder);
  1307	
> 1308		BUG_ON(s->flags & SLAB_CORRUPTION_PANIC);
  1309	
  1310		restore_bytes(s, "slab padding", POISON_INUSE, fault, end);
  1311	}
  1312	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
