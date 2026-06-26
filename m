Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C61435F5F8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jun 2026 04:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782449701; cv=none; b=E/NxH24NsmhA/sVqfSdRTsMs7O+foxnoLeHkGafmc9xeuSL6YCLaENqDHysPaZIvm6qCjnehs/qnr5PcUpfOPlhzBpZAD0iA1hzho/xC4uAgQ8H+64A54fNpS3dX2GkL/tjdlJZ9Z/lCsCWUnbatDu2qfMNWDVzLLTZp8NO/Vvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782449701; c=relaxed/simple;
	bh=u3b1STjl4yzzFtELpqEEALpMDyw71hALYZ6LVdfVQ8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RZsrFKZNLI+/QPQOOI3fdlDWvdI0SuFgDDC0I76RGJy3iZh+2CWGEWKjdcBmVUx4n0DYYo97IaaMCV/hPDkDuK2JekUCoLscWgWj81N2GB9dlGA6A95Z43cTanpgx5Ty4LBiDIhLZ9Uw9TpSALPNsvcybj19B0gqz7PqlpkhnAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sulv7G7b; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sulv7G7b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782449700; x=1813985700;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u3b1STjl4yzzFtELpqEEALpMDyw71hALYZ6LVdfVQ8k=;
  b=Sulv7G7bKyjoqeR9G6q8usu9Y7V1ThVrg+H9B0pJbHmLMjSwgJmBPVov
   sy6OWA4+xXgBsp27NLCIc/XFifbeDOUFVtubFTMW2UtNqJxhpOsDnVfnf
   niZ1qa1ljY27Xzo2XJBp0EZAa0mnxmL709mwlcyGVGBlqbKhdumcbcPHP
   bj5FXZ3vUBKhyY2BSBcTUuEuAkA6YCutAUUShPHzTymoJ5radb5rUQ6ZS
   58G16e6VogKF99kV9I71xjbU9YmDgDbyxO/XGz4z97rqJM7clZqYXj9IJ
   0QBjSivBNFMk3Npv/QT6+9TKJmQBc8ddSvpKW6F+dPdJv0jEPydVqTrJx
   A==;
X-CSE-ConnectionGUID: BRkiXdtjRP2PYtq1T0nOzA==
X-CSE-MsgGUID: DabWg2j7SXuuiY6YT5gOyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="83378619"
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; 
   d="scan'208";a="83378619"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 21:55:00 -0700
X-CSE-ConnectionGUID: PnRCxRIdRAud59V/9KWdQQ==
X-CSE-MsgGUID: FUOmsUQ9S9e+AvWQsoG2nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; 
   d="scan'208";a="250841154"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 25 Jun 2026 21:54:54 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcyaY-000000004mN-40QC;
	Fri, 26 Jun 2026 04:54:50 +0000
Date: Fri, 26 Jun 2026 12:54:39 +0800
From: kernel test robot <lkp@intel.com>
To: Hui Zhu <hui.zhu@linux.dev>, Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Kairui Song <kasong@tencent.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Hui Zhu <zhuhui@kylinos.cn>
Subject: Re: [PATCH v7] mm: assert exclusive nid/zonenum bits at the
 page/folio access sites
Message-ID: <202606261257.rnknH3QK-lkp@intel.com>
References: <20260626032012.1049667-1-hui.zhu@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260626032012.1049667-1-hui.zhu@linux.dev>

Hi Hui,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Hui-Zhu/mm-assert-exclusive-nid-zonenum-bits-at-the-page-folio-access-sites/20260626-112119
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260626032012.1049667-1-hui.zhu%40linux.dev
patch subject: [PATCH v7] mm: assert exclusive nid/zonenum bits at the page/folio access sites
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260626/202606261257.rnknH3QK-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260626/202606261257.rnknH3QK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606261257.rnknH3QK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/nios2/kernel/asm-offsets.c:10:
>> include/linux/mm.h:2: error: unterminated #ifndef
       2 | #ifndef _LINUX_MM_H
         | 
   make[3]: *** [scripts/Makefile.build:184: arch/nios2/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1390: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +2 include/linux/mm.h

^1da177e4c3f41 Linus Torvalds 2005-04-16 @2  #ifndef _LINUX_MM_H
^1da177e4c3f41 Linus Torvalds 2005-04-16  3  #define _LINUX_MM_H
^1da177e4c3f41 Linus Torvalds 2005-04-16  4  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
