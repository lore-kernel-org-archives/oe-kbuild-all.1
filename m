Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFE813E88C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Oct 2024 09:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728033195; cv=none; b=V0YJ7rkjXI75W+eUctUidFAcAHA6/ousxkOC6Cx0e5rIFHD8MgJBE7uJ0G0LPEZ7l+7PAvbAhCT27iK4ruUJ+4i+e2c25uUXrR+VocL2qIwgJV2CWhirSd6F8hX+BpKu4rXKgTpdumXWVbqJ9omNXKy5csOyiwIBppk0mcg5uIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728033195; c=relaxed/simple;
	bh=gcbAsza8QnPRL9tsh6MzEgMkUr5tH4Gc+UMHbSw18D0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IiOkpd2QCuer2ht2wiXau47fhZuc9LrmUhS/naX7y76DivKVqkHyAf30R6JK4SM/u3ZdpmSZ2zbrLntxPZ15sKzvoazjtnazwfBlPhKgD23rUKk5SH+ClpDfJFFq1H9F6zQTgcwqGyRMvXF2EkyAuAkH/87zQQszZota9K9chQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hNCThxSO; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hNCThxSO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728033195; x=1759569195;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gcbAsza8QnPRL9tsh6MzEgMkUr5tH4Gc+UMHbSw18D0=;
  b=hNCThxSOiMfX4IJIKuGEo6tgw6KovS/6oQQgX8ZIaazkjrJ+Noap42EH
   E8/vOlqHUxpADeVLY27lsvWrLuOzEppl0VZZclu+l7NGRVopS+FuNelp8
   OXW3gSf6G3FxobWsFO6Cfe2+Ci/561eeHT8B6SiH564X0KpgpbLDhT5Qo
   3/59nKvw9sgCt4EH6dYCfAiZcrEV7Xj7IG68Z9EPakFTq88ngO4t9GEwD
   JqQT0TAqGjNHoQlY9mm5NUj8XDKCjR0T5/jgLr9D7DDjcVYsWFay3zkTY
   jqRDCbhA/3yy6bQeNDeIDT3oesXpK7yE9S5DrlowGw/US91yDfAamSroN
   Q==;
X-CSE-ConnectionGUID: RIFqzzhIR2q2kbpVHB1+YQ==
X-CSE-MsgGUID: d3y8+ypsRsiX3gIkW41B7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27194784"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="27194784"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 02:13:12 -0700
X-CSE-ConnectionGUID: sfnHe+prQ56BR1Qd1MS79w==
X-CSE-MsgGUID: xG006mfwTyC13NGXvRq4xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="79207847"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Oct 2024 02:13:10 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sweN2-0001PM-0V;
	Fri, 04 Oct 2024 09:13:08 +0000
Date: Fri, 4 Oct 2024 17:12:31 +0800
From: kernel test robot <lkp@intel.com>
To: Namhyung Kim <namhyung@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 bpf-next 2/3] mm/bpf: Add bpf_get_kmem_cache() kfunc
Message-ID: <202410041709.GzXx543V-lkp@intel.com>
References: <20241002180956.1781008-3-namhyung@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002180956.1781008-3-namhyung@kernel.org>

Hi Namhyung,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9502a7de5a61bec3bda841a830560c5d6d40ecac]

url:    https://github.com/intel-lab-lkp/linux/commits/Namhyung-Kim/bpf-Add-kmem_cache-iterator/20241003-021144
base:   9502a7de5a61bec3bda841a830560c5d6d40ecac
patch link:    https://lore.kernel.org/r/20241002180956.1781008-3-namhyung%40kernel.org
patch subject: [PATCH v4 bpf-next 2/3] mm/bpf: Add bpf_get_kmem_cache() kfunc
config: mips-randconfig-r064-20241004 (https://download.01.org/0day-ci/archive/20241004/202410041709.GzXx543V-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410041709.GzXx543V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410041709.GzXx543V-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/mm_types_task.h:13,
                    from include/linux/mm_types.h:5,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from mm/slab_common.c:7:
   mm/slab_common.c: In function 'bpf_get_kmem_cache':
>> arch/mips/include/asm/page.h:218:27: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     218 |         __virt_addr_valid((const volatile void *) (kaddr))
         |                           ^
   mm/slab_common.c:1334:14: note: in expansion of macro 'virt_addr_valid'
    1334 |         if (!virt_addr_valid(addr))
         |              ^~~~~~~~~~~~~~~


vim +218 arch/mips/include/asm/page.h

d3ce88431892b7 arch/mips/include/asm/page.h Ralf Baechle   2012-12-28  215  
31875a5432248e arch/mips/include/asm/page.h Paul Burton    2019-05-28  216  extern bool __virt_addr_valid(const volatile void *kaddr);
d3ce88431892b7 arch/mips/include/asm/page.h Ralf Baechle   2012-12-28  217  #define virt_addr_valid(kaddr)						\
d3ce88431892b7 arch/mips/include/asm/page.h Ralf Baechle   2012-12-28 @218  	__virt_addr_valid((const volatile void *) (kaddr))
^1da177e4c3f41 include/asm-mips/page.h      Linus Torvalds 2005-04-16  219  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
