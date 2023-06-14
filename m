Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280186D18
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jun 2023 10:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686737187; x=1718273187;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g2QfR8bmYgD+CN0RFxMr1eU3YYzbjEOX8nWdKHOLO6M=;
  b=iptheFDFrjssYkGHJGmXYNUW/k9GAJCMFMOfG+zuF7A/9GpnbTbCBVd4
   +mVf17fLmdx3+ix3mo5OOWOkIZ8fXJzOj1WBBrZdlAiXrpLRvO46q1DYk
   MwVTRXpis6PV8SbaMCN339LwL+TpTC4CBZmBtOVup/eznKbOCf7IuqDWT
   Aj/SeMb7KJeeHpL+waaQ2Rp5Vb/Et9DnHfHf8m9IzY47vmrzJ58nX4dHW
   XyOFOylVcfk0nk3KrW3F1hpbuGDj+aPz8HcVCBP/5KmCcgInE7FXiDoEm
   yMG/r6ESH7jS8mbYovPkZ0JVhLjaSOnKFp9QUHfAS6qH6Y0/UawGkDpyl
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="444943712"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; 
   d="scan'208";a="444943712"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 03:06:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="824753394"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; 
   d="scan'208";a="824753394"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 14 Jun 2023 03:06:21 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9NOP-0000Vn-06;
	Wed, 14 Jun 2023 10:06:21 +0000
Date: Wed, 14 Jun 2023 18:05:44 +0800
From: kernel test robot <lkp@intel.com>
To: Wei Chin Tsai <Wei-chin.Tsai@mediatek.com>,
	linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, wsd_upstream@mediatek.com,
	wei-chin.tsai@mediatek.com, mel.lee@mediatek.com,
	ivan.tseng@mediatek.com, linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 2/3] memory: export symbols for memory related
 functions
Message-ID: <202306141627.fYoZPKxi-lkp@intel.com>
References: <20230614032038.11699-3-Wei-chin.Tsai@mediatek.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230614032038.11699-3-Wei-chin.Tsai@mediatek.com>

Hi Wei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.4-rc6 next-20230614]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wei-Chin-Tsai/kernel-process-fork-exit-export-symbol-for-fork-exit-tracing-functions/20230614-112218
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20230614032038.11699-3-Wei-chin.Tsai%40mediatek.com
patch subject: [PATCH v2 2/3] memory: export symbols for memory related functions
config: csky-randconfig-r011-20230612 (https://download.01.org/0day-ci/archive/20230614/202306141627.fYoZPKxi-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add char-misc https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git
        git fetch char-misc char-misc-testing
        git checkout char-misc/char-misc-testing
        b4 shazam https://lore.kernel.org/r/20230614032038.11699-3-Wei-chin.Tsai@mediatek.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash fs/proc/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306141627.fYoZPKxi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/proc/task_mmu.c:776:6: warning: no previous prototype for 'smap_gather_stats' [-Wmissing-prototypes]
     776 | void smap_gather_stats(struct vm_area_struct *vma,
         |      ^~~~~~~~~~~~~~~~~


vim +/smap_gather_stats +776 fs/proc/task_mmu.c

   769	
   770	/*
   771	 * Gather mem stats from @vma with the indicated beginning
   772	 * address @start, and keep them in @mss.
   773	 *
   774	 * Use vm_start of @vma as the beginning address if @start is 0.
   775	 */
 > 776	void smap_gather_stats(struct vm_area_struct *vma,
   777			       struct mem_size_stats *mss, unsigned long start)
   778	{
   779		const struct mm_walk_ops *ops = &smaps_walk_ops;
   780	
   781		/* Invalid start */
   782		if (start >= vma->vm_end)
   783			return;
   784	
   785		if (vma->vm_file && shmem_mapping(vma->vm_file->f_mapping)) {
   786			/*
   787			 * For shared or readonly shmem mappings we know that all
   788			 * swapped out pages belong to the shmem object, and we can
   789			 * obtain the swap value much more efficiently. For private
   790			 * writable mappings, we might have COW pages that are
   791			 * not affected by the parent swapped out pages of the shmem
   792			 * object, so we have to distinguish them during the page walk.
   793			 * Unless we know that the shmem object (or the part mapped by
   794			 * our VMA) has no swapped out pages at all.
   795			 */
   796			unsigned long shmem_swapped = shmem_swap_usage(vma);
   797	
   798			if (!start && (!shmem_swapped || (vma->vm_flags & VM_SHARED) ||
   799						!(vma->vm_flags & VM_WRITE))) {
   800				mss->swap += shmem_swapped;
   801			} else {
   802				ops = &smaps_shmem_walk_ops;
   803			}
   804		}
   805	
   806		/* mmap_lock is held in m_start */
   807		if (!start)
   808			walk_page_vma(vma, ops, mss);
   809		else
   810			walk_page_range(vma->vm_mm, start, vma->vm_end, ops, mss);
   811	}
   812	EXPORT_SYMBOL_GPL(smap_gather_stats);
   813	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
