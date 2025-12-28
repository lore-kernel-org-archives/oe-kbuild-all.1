Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE2533EC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Dec 2025 13:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766927041; cv=none; b=qY1r/UEowR2VN3birSeGWsDMb/V5g3Wc0nMAEWRkGoZxxxeKbOJbCRfX1E73oIzF7zWWCj2kyLg3UXCQZOeKyxROA5KNvmmgOfV+joQtCY94rfuqEYs4k/6rZW/rjnTqgKYNFJx49EDulLAq+AK4MQHKnRSzIlbAXm4kpqfyWac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766927041; c=relaxed/simple;
	bh=FAwqmHKE0ZEa2bryfaTx4yR5tNwGqtSCVgTEtcj1nDs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=F8B1i6V+3sa1kZ/uGZxUexX3trhIgeTxm0YnoGG/AeD7Q4lJsgqmqcmUBKrkTxnius5dmDDOeJ08G10l50yWzYC95vAWc/1B/2nG4AvwETX7r8jcM+3COoRiozZVxZAvpyZ2xONcVq/Ka0OlEGWRlenlKBKIOIJK0qH2QYfoyCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G3FEJL0n; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G3FEJL0n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766927039; x=1798463039;
  h=date:from:to:cc:subject:message-id;
  bh=FAwqmHKE0ZEa2bryfaTx4yR5tNwGqtSCVgTEtcj1nDs=;
  b=G3FEJL0n+SB8cNR4EBEffpo14DuCPIx3onCjJQWtMeoj0s2ibdleZbH2
   +malwXBqgGFeAjpbzE2hpPjfdOpNSt8kcL9+ustYAfx5vIsSfTrYhNtZZ
   AgF9r58XWuZZbqhxssb8NTsxOGEwWrZjiXAhp5l0BMCUd2twSiQjVahkg
   Up1XPdGsVnMt9Xk7db/eOQakcAQeNzHSwblok5qt7QiOOuALT0Lp74IEz
   tvfSkoTB1f2gvHGjBP/rckIWpkiDeG+f9c1NKSgTKjJVhByWYeEEAJm48
   ao+frCUu8RWuYyb2zXDTJO1avHfaTBBApydIrirC5JVb2qVVQCopyznku
   g==;
X-CSE-ConnectionGUID: PD+mpZCPRx6IYKncBRd9VA==
X-CSE-MsgGUID: nIFSPVuLQV6jTTRns/8Yrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="79939369"
X-IronPort-AV: E=Sophos;i="6.21,183,1763452800"; 
   d="scan'208";a="79939369"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 05:03:58 -0800
X-CSE-ConnectionGUID: Yhf2vBNFT3KdY8s9G6CZyw==
X-CSE-MsgGUID: siYnr0LfQbqDDwcJbniZsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,183,1763452800"; 
   d="scan'208";a="200619548"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 28 Dec 2025 05:03:56 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZqR8-000000006Tp-1ino;
	Sun, 28 Dec 2025 13:03:54 +0000
Date: Sun, 28 Dec 2025 21:03:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Guo <guoyongqiang12@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 13/13]
 drivers/ub/urma/uburma/uburma_mmap.c:20:6: warning: no previous prototype for
 'uburma_umap_priv_init'
Message-ID: <202512282153.oGLU3b14-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   03c9c649e6f28e26260d276ce755f785b2435da3
commit: f01eef756655bd5f66bd1e3770da92e31982556d [13/13] uburma: introduce uburma basic types and helper functions
config: arm64-randconfig-004-20251226 (https://download.01.org/0day-ci/archive/20251228/202512282153.oGLU3b14-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251228/202512282153.oGLU3b14-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512282153.oGLU3b14-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/urma/uburma/uburma_mmap.c:20:6: warning: no previous prototype for 'uburma_umap_priv_init' [-Wmissing-prototypes]
      20 | void uburma_umap_priv_init(struct uburma_umap_priv *priv,
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/uburma/uburma_mmap.c:33:6: warning: no previous prototype for 'uburma_unmap_vma_pages' [-Wmissing-prototypes]
      33 | void uburma_unmap_vma_pages(struct uburma_file *ufile)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/uburma/uburma_mmap.c:169:36: warning: no previous prototype for 'uburma_get_umap_ops' [-Wmissing-prototypes]
     169 | const struct vm_operations_struct *uburma_get_umap_ops(void)
         |                                    ^~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for RESCTRL_FS
   Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
   Selected by [y]:
   - ARM64_MPAM [=y]


vim +/uburma_umap_priv_init +20 drivers/ub/urma/uburma/uburma_mmap.c

    19	
  > 20	void uburma_umap_priv_init(struct uburma_umap_priv *priv,
    21				   struct vm_area_struct *vma)
    22	{
    23		struct uburma_file *ufile = vma->vm_file->private_data;
    24	
    25		priv->vma = vma;
    26		vma->vm_private_data = priv;
    27	
    28		mutex_lock(&ufile->umap_mutex);
    29		list_add(&priv->node, &ufile->umaps_list);
    30		mutex_unlock(&ufile->umap_mutex);
    31	}
    32	
  > 33	void uburma_unmap_vma_pages(struct uburma_file *ufile)
    34	{
    35		struct uburma_umap_priv *priv, *next_priv;
    36		struct mm_struct *mm;
    37	
    38		if (list_empty(&ufile->umaps_list))
    39			return;
    40	
    41		lockdep_assert_held(&ufile->cleanup_rwsem);
    42		while (1) {
    43			struct list_head local_list;
    44	
    45			INIT_LIST_HEAD(&local_list);
    46			mm = NULL;
    47			mutex_lock(&ufile->umap_mutex);
    48			list_for_each_entry_safe(priv, next_priv, &ufile->umaps_list,
    49						 node) {
    50				struct mm_struct *curr_mm = priv->vma->vm_mm;
    51	
    52				if (!mm) {
    53					if (!mmget_not_zero(curr_mm)) {
    54						list_del_init(&priv->node);
    55						continue;
    56					}
    57					mm = curr_mm;
    58					list_move_tail(&priv->node, &local_list);
    59				} else if (curr_mm == mm) {
    60					list_move_tail(&priv->node, &local_list);
    61				}
    62			}
    63			mutex_unlock(&ufile->umap_mutex);
    64	
    65			if (list_empty(&local_list)) {
    66				if (mm)
    67					mmput(mm);
    68				return;
    69			}
    70	
    71			mmap_read_lock(mm);
    72	
    73			list_for_each_entry_safe(priv, next_priv, &local_list, node) {
    74				struct vm_area_struct *vma = priv->vma;
    75	
    76				list_del_init(&priv->node);
    77				if (vma->vm_mm == mm)
    78					zap_vma_ptes(vma, vma->vm_start,
    79						     vma->vm_end - vma->vm_start);
    80			}
    81			mmap_read_unlock(mm);
    82	
    83			mmput(mm);
    84		}
    85	}
    86	
    87	static void uburma_umap_open(struct vm_area_struct *vma)
    88	{
    89		struct uburma_file *ufile = vma->vm_file->private_data;
    90		struct uburma_umap_priv *priv;
    91	
    92		if (!down_read_trylock(&ufile->cleanup_rwsem))
    93			goto out_zap;
    94	
    95		priv = kzalloc(sizeof(*priv), GFP_KERNEL);
    96		if (!priv)
    97			goto out_unlock;
    98	
    99		uburma_umap_priv_init(priv, vma);
   100	
   101		up_read(&ufile->cleanup_rwsem);
   102		return;
   103	
   104	out_unlock:
   105		up_read(&ufile->cleanup_rwsem);
   106	out_zap:
   107		vma->vm_private_data = NULL;
   108		zap_vma_ptes(vma, vma->vm_start, vma->vm_end - vma->vm_start);
   109	}
   110	
   111	static void uburma_umap_close(struct vm_area_struct *vma)
   112	{
   113		struct uburma_file *ufile = vma->vm_file->private_data;
   114		struct uburma_umap_priv *priv = vma->vm_private_data;
   115	
   116		if (!priv)
   117			return;
   118	
   119		mutex_lock(&ufile->umap_mutex);
   120		list_del(&priv->node);
   121		mutex_unlock(&ufile->umap_mutex);
   122		kfree(priv);
   123		vma->vm_private_data = NULL;
   124	}
   125	
   126	static vm_fault_t uburma_umap_fault(struct vm_fault *vmf)
   127	{
   128		struct uburma_file *ufile = vmf->vma->vm_file->private_data;
   129		struct uburma_umap_priv *priv = vmf->vma->vm_private_data;
   130		struct page *page;
   131	
   132		if (unlikely(!priv))
   133			return VM_FAULT_SIGBUS;
   134	
   135		if (!(vmf->vma->vm_flags & (VM_WRITE | VM_MAYWRITE))) {
   136			vmf->page = ZERO_PAGE(0);
   137			get_page(vmf->page);
   138			return 0;
   139		}
   140	
   141		page = READ_ONCE(ufile->fault_page);
   142		if (likely(page)) {
   143			vmf->page = page;
   144			get_page(vmf->page);
   145			return 0;
   146		}
   147	
   148		mutex_lock(&ufile->umap_mutex);
   149		if (!ufile->fault_page) {
   150			ufile->fault_page = alloc_pages(vmf->gfp_mask | __GFP_ZERO, 0);
   151			if (!ufile->fault_page) {
   152				mutex_unlock(&ufile->umap_mutex);
   153				return VM_FAULT_SIGBUS;
   154			}
   155		}
   156		vmf->page = ufile->fault_page;
   157		get_page(vmf->page);
   158		mutex_unlock(&ufile->umap_mutex);
   159	
   160		return 0;
   161	}
   162	
   163	static const struct vm_operations_struct g_urma_umap_ops = {
   164		.open = uburma_umap_open,
   165		.close = uburma_umap_close,
   166		.fault = uburma_umap_fault,
   167	};
   168	
 > 169	const struct vm_operations_struct *uburma_get_umap_ops(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
