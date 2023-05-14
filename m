Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69EBD10E3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 May 2023 01:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684026742; x=1715562742;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BL3gXTlDPtjRQ02PdsakA5GhOQULnFBWoAr8tmwSARw=;
  b=n4zaJmgg4BJsObvVcJPNRq3pB5XT/28yiV/w7pCW7Frc5csDMgA4gkuu
   XwS0SAFSrjwOgIW4RWlyXwTQ1g/8LSnvrJzmIYbNbCIFaEtAe1DI4u6lH
   3+amERRRdhr1AL06NXh99T9bh+9UKF5PyYRBNXVKv8UiLMAba718x8QE5
   hxANACLSgDtjcsFGh0sL+3TVhLuNHAGBMw6niDAPj9RXrP5dCUbEoC8yP
   D1MoGcYVcuLPeQ7PyiWUSru+O5+8ZmcDFvsPMeJuVpXOVSd008MUuT+GJ
   e/JJw96wc0Rwld+bdNNy02zEjtjwj5rXr/BSgSjyYXmkYhuaVGYjELSvY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="330615982"
X-IronPort-AV: E=Sophos;i="5.99,273,1677571200"; 
   d="scan'208";a="330615982"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2023 18:12:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="678052174"
X-IronPort-AV: E=Sophos;i="5.99,273,1677571200"; 
   d="scan'208";a="678052174"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 13 May 2023 18:12:19 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1py0Ha-0005lU-1r;
	Sun, 14 May 2023 01:12:18 +0000
Date: Sun, 14 May 2023 09:11:54 +0800
From: kernel test robot <lkp@intel.com>
To: Shijie Luo <luoshijie1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Oscar Salvador <osalvador@suse.de>
Subject: [stable:linux-5.4.y 1353/9999] mm/mempolicy.c:499:22: warning:
 variable 'mapped_pte' set but not used
Message-ID: <202305140908.foLMWXHS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Shijie,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.4.y
head:   ea7862c507eca54ea6caad9dcfc8bba5e749fbde
commit: c1f729c7dec0df04d62550d981af849f970a660d [1353/9999] mm: mempolicy: fix potential pte_unmap_unlock pte error
config: ia64-generic_defconfig (https://download.01.org/0day-ci/archive/20230514/202305140908.foLMWXHS-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=c1f729c7dec0df04d62550d981af849f970a660d
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.4.y
        git checkout c1f729c7dec0df04d62550d981af849f970a660d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305140908.foLMWXHS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/mempolicy.c: In function 'queue_pages_pte_range':
>> mm/mempolicy.c:499:22: warning: variable 'mapped_pte' set but not used [-Wunused-but-set-variable]
     499 |         pte_t *pte, *mapped_pte;
         |                      ^~~~~~~~~~


vim +/mapped_pte +499 mm/mempolicy.c

   478	
   479	/*
   480	 * Scan through pages checking if pages follow certain conditions,
   481	 * and move them to the pagelist if they do.
   482	 *
   483	 * queue_pages_pte_range() has three possible return values:
   484	 * 0 - pages are placed on the right node or queued successfully.
   485	 * 1 - there is unmovable page, and MPOL_MF_MOVE* & MPOL_MF_STRICT were
   486	 *     specified.
   487	 * -EIO - only MPOL_MF_STRICT was specified and an existing page was already
   488	 *        on a node that does not follow the policy.
   489	 */
   490	static int queue_pages_pte_range(pmd_t *pmd, unsigned long addr,
   491				unsigned long end, struct mm_walk *walk)
   492	{
   493		struct vm_area_struct *vma = walk->vma;
   494		struct page *page;
   495		struct queue_pages *qp = walk->private;
   496		unsigned long flags = qp->flags;
   497		int ret;
   498		bool has_unmovable = false;
 > 499		pte_t *pte, *mapped_pte;
   500		spinlock_t *ptl;
   501	
   502		ptl = pmd_trans_huge_lock(pmd, vma);
   503		if (ptl) {
   504			ret = queue_pages_pmd(pmd, ptl, addr, end, walk);
   505			if (ret != 2)
   506				return ret;
   507		}
   508		/* THP was split, fall through to pte walk */
   509	
   510		if (pmd_trans_unstable(pmd))
   511			return 0;
   512	
   513		mapped_pte = pte = pte_offset_map_lock(walk->mm, pmd, addr, &ptl);
   514		for (; addr != end; pte++, addr += PAGE_SIZE) {
   515			if (!pte_present(*pte))
   516				continue;
   517			page = vm_normal_page(vma, addr, *pte);
   518			if (!page)
   519				continue;
   520			/*
   521			 * vm_normal_page() filters out zero pages, but there might
   522			 * still be PageReserved pages to skip, perhaps in a VDSO.
   523			 */
   524			if (PageReserved(page))
   525				continue;
   526			if (!queue_pages_required(page, qp))
   527				continue;
   528			if (flags & (MPOL_MF_MOVE | MPOL_MF_MOVE_ALL)) {
   529				/* MPOL_MF_STRICT must be specified if we get here */
   530				if (!vma_migratable(vma)) {
   531					has_unmovable = true;
   532					break;
   533				}
   534	
   535				/*
   536				 * Do not abort immediately since there may be
   537				 * temporary off LRU pages in the range.  Still
   538				 * need migrate other LRU pages.
   539				 */
   540				if (migrate_page_add(page, qp->pagelist, flags))
   541					has_unmovable = true;
   542			} else
   543				break;
   544		}
   545		pte_unmap_unlock(mapped_pte, ptl);
   546		cond_resched();
   547	
   548		if (has_unmovable)
   549			return 1;
   550	
   551		return addr != end ? -EIO : 0;
   552	}
   553	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
