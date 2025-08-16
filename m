Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AD62EA14B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Aug 2025 16:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755361858; cv=none; b=qiw6db3F2SMLFsOS1/lEXFlNcu8zH4qhl3LfokHAZJ9p3RydlikUCpDgjFhkex42i8vddox2lWgWGzEYICz0gr99mmb75Jo1daJ/3QSxTUhSQXWN3pT2ObSBkl4IoMSlrDdWWl0WKy+AZyAKSJs8Yiw6nhCeL/pIB33hoPhpX4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755361858; c=relaxed/simple;
	bh=ZFfAo8apibsWsI1omhLl8iawazNCfUYxTJ6h2jfQBZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q04Dv76WMbpOZfapM64wjHU2EP3u66KPOybprqDScJ06fBB4qkzuSAJQZO/4+32p/CZT3QQTS2A7gQVBYEeXNNsx7cM3PBDq3wuWjT/FB3Mt8+SYFSYJ79gXkxYaEeDmD8SNB0Y8HEWEwi4ZIjJIEbeZJPieKUbFAICus31lgLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H9dQUkx9; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H9dQUkx9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755361856; x=1786897856;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZFfAo8apibsWsI1omhLl8iawazNCfUYxTJ6h2jfQBZY=;
  b=H9dQUkx9Xefw1Xz80U6ABqHd4CpCXLD9u2cXheUIHpAzOXWRusQJSF13
   o9gwt9C/tSryD0eVdkN4BQQ0g2teauc/CpoPMvgnCmEl2klvAVa1vxjjJ
   pcWOg49wPelEABiSTzOpo9VLdRJvTFgSuK3RsV2esPkSwb2DRuwW06VqE
   p04uehK9e5rB5hyOe63XM/6yKLH7MkRdGcgdQsR40tyedGD4YBIIn2Pv7
   z9BbIlkvWWdiMS7zwU7G8Ur0bOMXRqv+9GcT6B1kYxaFk74iw+B7vXyFw
   6r4yZBRAKv+Pf806ozw1MXOr+CysCudQd71YIilj1fm/XKVDfThyJEi8Z
   Q==;
X-CSE-ConnectionGUID: zU3SEAVESVqBLlAKyLL6nw==
X-CSE-MsgGUID: zxzZ+6GgSW69d+SfJZSRrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="69020222"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="69020222"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2025 09:30:56 -0700
X-CSE-ConnectionGUID: PZSfjvSKRIqbKzG5XmYmLA==
X-CSE-MsgGUID: CK+ohIFiTxO5RXZQZAbzeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="167481802"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 16 Aug 2025 09:30:52 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unJnu-000D0S-1k;
	Sat, 16 Aug 2025 16:30:50 +0000
Date: Sun, 17 Aug 2025 00:30:16 +0800
From: kernel test robot <lkp@intel.com>
To: Xiang Gao <gxxa03070307@gmail.com>, akpm@linux-foundation.org,
	david@redhat.com
Cc: oe-kbuild-all@lists.linux.dev, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, gaoxiang17 <gaoxiang17@xiaomi.com>
Subject: Re: [PATCH] mm/cma: print total and used pages in cma_alloc()
Message-ID: <202508170014.PK57XSd7-lkp@intel.com>
References: <20250816042842.3959315-1-gxxa03070307@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250816042842.3959315-1-gxxa03070307@gmail.com>

Hi Xiang,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Xiang-Gao/mm-cma-print-total-and-used-pages-in-cma_alloc/20250816-122940
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250816042842.3959315-1-gxxa03070307%40gmail.com
patch subject: [PATCH] mm/cma: print total and used pages in cma_alloc()
config: arm-randconfig-002-20250816 (https://download.01.org/0day-ci/archive/20250817/202508170014.PK57XSd7-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250817/202508170014.PK57XSd7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508170014.PK57XSd7-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/cma.c: In function 'cma_get_used_pages':
>> mm/cma.c:784:26: error: 'struct cma' has no member named 'bitmap'
     784 |  used = bitmap_weight(cma->bitmap, (int)cma_bitmap_maxno(cma));
         |                          ^~
>> mm/cma.c:784:41: error: too few arguments to function 'cma_bitmap_maxno'
     784 |  used = bitmap_weight(cma->bitmap, (int)cma_bitmap_maxno(cma));
         |                                         ^~~~~~~~~~~~~~~~
   In file included from mm/cma.c:34:
   mm/cma.h:77:29: note: declared here
      77 | static inline unsigned long cma_bitmap_maxno(struct cma *cma,
         |                             ^~~~~~~~~~~~~~~~


vim +784 mm/cma.c

   778	
   779	static unsigned long cma_get_used_pages(struct cma *cma)
   780	{
   781		unsigned long used;
   782	
   783		spin_lock_irq(&cma->lock);
 > 784		used = bitmap_weight(cma->bitmap, (int)cma_bitmap_maxno(cma));
   785		spin_unlock_irq(&cma->lock);
   786	
   787		return used << cma->order_per_bit;
   788	}
   789	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
