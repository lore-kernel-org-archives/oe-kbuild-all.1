Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2077A1F4FC2
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Nov 2024 13:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730898267; cv=none; b=mmPk0iXgHo2XyS8SeuZPQRqq/A7yFHaFU6GGhGBgmIkUndjHYoas0XUHBq2Xhf1ClmTcwgb3pxP3TGQUKOyil0ZZslWSCoy4MLtpY3QonQm3UWzmHzxaEgwex6tNlmlHMpJUgzgRo6Mxds/D7E0AqZPrndzjL9UfCD9suAO/ang=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730898267; c=relaxed/simple;
	bh=zYGtwBfV0x64QF/tybKaJiAALjjS0RIFDdMh4l262Ho=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NUluADb2vR65Cy880u1625OvrdwVOBGx7FbDRUZfBULRJxLlCl+JJV/J/rodnfp3uCVOam5V3QoPstPHazsyvmqs+x4Yq3WP2TGW7h0WZxMjnj3pnpbKbZg7e3Ot8qND7+gebMGskjKJltzvB3alPBygRNIYhschsB4hTBfq/MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kqulIxZY; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kqulIxZY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730898265; x=1762434265;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zYGtwBfV0x64QF/tybKaJiAALjjS0RIFDdMh4l262Ho=;
  b=kqulIxZY8iJFPIaS89dWdiYwF2+8GDvhv242VjQp70rQkw6JmoKJveCO
   vZAlCix4dw8IZJyNSd4TKrM6R6Psvm/WXCC0tkfASQ7rrJDZnblBRE7k0
   6ZJbKmeNAhiNp9UO3AtBdpd4NKTW0Of436bErZoeWiwXVIZtiGlBuLFU2
   wp9EvPUgvWR58O7Te6bhVUmW2mwZ4F+N+Z3BrdE8BaM4+gogWDYwu4+Yf
   ipxFRLy8jSJ0kbTQEmnwA79ua/VdFg+X3lsq2J6mx4aJX0pclb1EmA9zt
   rMrRJgTzCkrsin+sHVpMC66LVdUzkkA2cnBS5XbfQEwv5LOR0wqId31E1
   A==;
X-CSE-ConnectionGUID: uOPQN5ezRcibkloBfn4QMw==
X-CSE-MsgGUID: LKs2B1XkReyn6HbVeGaJ6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="30122058"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="30122058"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 05:04:11 -0800
X-CSE-ConnectionGUID: 1EKWuTk8Q/i0Y4iSjxwe9w==
X-CSE-MsgGUID: UWyxu7tfSFujPaIwjTgfZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="84076929"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Nov 2024 05:02:47 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8fgL-000o8W-0Q;
	Wed, 06 Nov 2024 13:02:45 +0000
Date: Wed, 6 Nov 2024 21:02:14 +0800
From: kernel test robot <lkp@intel.com>
To: Barry Song <v-songbaohua@oppo.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Nhat Pham <nphamcs@gmail.com>
Subject: [akpm-mm:mm-unstable 27/106] mm/page_io.c:220:17: error: implicit
 declaration of function 'count_objcg_events'; did you mean
 'count_objcg_event'?
Message-ID: <202411062114.V0749sXc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   7994b7ea6ac880efd0c38fedfbffd5ab8b1b7b2b
commit: c10966f19a878a66206327ebe3b85500f59f47e2 [27/106] mm: count zeromap read and set for swapout and swapin
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241106/202411062114.V0749sXc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411062114.V0749sXc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411062114.V0749sXc-lkp@intel.com/

Note: the akpm-mm/mm-unstable HEAD 7994b7ea6ac880efd0c38fedfbffd5ab8b1b7b2b builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   mm/page_io.c: In function 'swap_zeromap_folio_set':
>> mm/page_io.c:220:17: error: implicit declaration of function 'count_objcg_events'; did you mean 'count_objcg_event'? [-Werror=implicit-function-declaration]
     220 |                 count_objcg_events(objcg, SWPOUT_ZERO, nr_pages);
         |                 ^~~~~~~~~~~~~~~~~~
         |                 count_objcg_event
   cc1: some warnings being treated as errors


vim +220 mm/page_io.c

   204	
   205	static void swap_zeromap_folio_set(struct folio *folio)
   206	{
   207		struct obj_cgroup *objcg = get_obj_cgroup_from_folio(folio);
   208		struct swap_info_struct *sis = swp_swap_info(folio->swap);
   209		int nr_pages = folio_nr_pages(folio);
   210		swp_entry_t entry;
   211		unsigned int i;
   212	
   213		for (i = 0; i < folio_nr_pages(folio); i++) {
   214			entry = page_swap_entry(folio_page(folio, i));
   215			set_bit(swp_offset(entry), sis->zeromap);
   216		}
   217	
   218		count_vm_events(SWPOUT_ZERO, nr_pages);
   219		if (objcg) {
 > 220			count_objcg_events(objcg, SWPOUT_ZERO, nr_pages);
   221			obj_cgroup_put(objcg);
   222		}
   223	}
   224	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
