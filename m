Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944B6153BC7
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Sep 2024 07:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725262189; cv=none; b=DiHF34b4tISrnNP1rqD+kcYQkEDMaIkRbrGlbLd9q/SnHbSKk7Vjk4RvFmKRoDmraCIHQ8Pe4S3v81Q7+1iBQq2re9yB69XTRfwiz+q3XR9QJex8Kbu0fJm6s3PEodmcvbZmqK5BA4kjLg0bzik9+Kqm4EcxkXM28V2vzRvurDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725262189; c=relaxed/simple;
	bh=D2ZBPEp+lyvONuErfhoMVAa+5K3aoCh3tp9JmazsJAI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qXNeAz7tYizDaOmTDy/uLb4E70v9KMAhXVDIbVGqfvu61cw21jTQGe4n+rCdt7hMd+PANvFhvOE41ETCIIY4ziUD6sAqY7Bike9kTnajUCYRlLlSEAnkOS+oT0MI9FF0/N0lxuWhWSHEGr1yQy7Qvq2+Dzh8CumgkLrqmf1W9Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kJHm7vk5; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kJHm7vk5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725262188; x=1756798188;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D2ZBPEp+lyvONuErfhoMVAa+5K3aoCh3tp9JmazsJAI=;
  b=kJHm7vk5GXbQuhNhQKwoxrBoRc1F3Iqap7jq9H7XhPG6uvl4mCP0cbS0
   SHhQbMxkHrNBpzGlDNkak7YoVP8qYTWJQMP828bRanK6YLCgLh32YnpSx
   9EET4uOh4tFuqU652h5kR4EooY6pSEVw9SWhzhaoS16TIoWMQzZUkEDHB
   1SYBUX3dYCDOQAyjmJOq3G1CDdMA3lG23U/ALQ2y85JG83V3Y0Sefd4KF
   nenUY3PdsGJSI2cnAMbs4hjh3w3AjryFPDojvkKA+iIzsKdh8jNCRDVxe
   2etgE4eIt1z17kKaVhta+5zzP+foD9XQvABGc7MNdwr7sn0OFf1DBWPVM
   w==;
X-CSE-ConnectionGUID: +6h0od0OTP6cSmGmGw0rRg==
X-CSE-MsgGUID: KLNFeCYzQnKw6IwUFIcVOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="23990748"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="23990748"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 00:29:47 -0700
X-CSE-ConnectionGUID: Wj/UhqGjQq+thAQQyDyDXg==
X-CSE-MsgGUID: ybsRg/RZSdKRN7qJ/g1tig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="68922738"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 02 Sep 2024 00:29:45 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sl1VP-0005Ec-1Y;
	Mon, 02 Sep 2024 07:29:43 +0000
Date: Mon, 2 Sep 2024 15:29:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, JangShui Yang <yangjiangshui@h-partners.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 26911/30000]
 drivers/ub/urma/ubcore/ubcore_umem.c:284:10: warning: no previous prototype
 for function 'ubcore_umem_find_best_page_size'
Message-ID: <202409021518.znzh3BK4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   02994a9b68a17040658e1a32a4438a31ae6f273b
commit: 5d130e2cfa3d2aaee4d10e18c075f6c3750600c5 [26911/30000] urma: upload kernel patch for 20240511_mig
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240902/202409021518.znzh3BK4-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240902/202409021518.znzh3BK4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409021518.znzh3BK4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ub/urma/ubcore/ubcore_umem.c:242:21: warning: no previous prototype for function 'ubcore_umem_get' [-Wmissing-prototypes]
     242 | struct ubcore_umem *ubcore_umem_get(struct ubcore_device *dev, uint64_t va,
         |                     ^
   drivers/ub/urma/ubcore/ubcore_umem.c:242:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     242 | struct ubcore_umem *ubcore_umem_get(struct ubcore_device *dev, uint64_t va,
         | ^
         | static 
   drivers/ub/urma/ubcore/ubcore_umem.c:260:6: warning: no previous prototype for function 'ubcore_umem_release' [-Wmissing-prototypes]
     260 | void ubcore_umem_release(struct ubcore_umem *umem)
         |      ^
   drivers/ub/urma/ubcore/ubcore_umem.c:260:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     260 | void ubcore_umem_release(struct ubcore_umem *umem)
         | ^
         | static 
>> drivers/ub/urma/ubcore/ubcore_umem.c:284:10: warning: no previous prototype for function 'ubcore_umem_find_best_page_size' [-Wmissing-prototypes]
     284 | uint64_t ubcore_umem_find_best_page_size(struct ubcore_umem *umem, uint64_t page_size_bitmap,
         |          ^
   drivers/ub/urma/ubcore/ubcore_umem.c:284:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     284 | uint64_t ubcore_umem_find_best_page_size(struct ubcore_umem *umem, uint64_t page_size_bitmap,
         | ^
         | static 
   3 warnings generated.
--
   drivers/ub/urma/ubcore/ubcore_netdev.c:41:25: warning: no previous prototype for function 'ubcore_lookup_sip_info_without_lock' [-Wmissing-prototypes]
      41 | struct ubcore_sip_info *ubcore_lookup_sip_info_without_lock(
         |                         ^
   drivers/ub/urma/ubcore/ubcore_netdev.c:41:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      41 | struct ubcore_sip_info *ubcore_lookup_sip_info_without_lock(
         | ^
         | static 
   drivers/ub/urma/ubcore/ubcore_netdev.c:75:5: warning: no previous prototype for function 'ubcore_notify_uvs_del_sip' [-Wmissing-prototypes]
      75 | int ubcore_notify_uvs_del_sip(struct ubcore_device *dev,
         |     ^
   drivers/ub/urma/ubcore/ubcore_netdev.c:75:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      75 | int ubcore_notify_uvs_del_sip(struct ubcore_device *dev,
         | ^
         | static 
   drivers/ub/urma/ubcore/ubcore_netdev.c:113:22: warning: no previous prototype for function 'ubcore_new_sip_req_msg' [-Wmissing-prototypes]
     113 | struct ubcore_nlmsg *ubcore_new_sip_req_msg(struct ubcore_device *dev,
         |                      ^
   drivers/ub/urma/ubcore/ubcore_netdev.c:113:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     113 | struct ubcore_nlmsg *ubcore_new_sip_req_msg(struct ubcore_device *dev,
         | ^
         | static 
   drivers/ub/urma/ubcore/ubcore_netdev.c:145:5: warning: no previous prototype for function 'ubcore_notify_uvs_add_sip' [-Wmissing-prototypes]
     145 | int ubcore_notify_uvs_add_sip(struct ubcore_device *dev,
         |     ^
   drivers/ub/urma/ubcore/ubcore_netdev.c:145:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     145 | int ubcore_notify_uvs_add_sip(struct ubcore_device *dev,
         | ^
         | static 
   drivers/ub/urma/ubcore/ubcore_netdev.c:177:5: warning: no previous prototype for function 'ubcore_check_port_state' [-Wmissing-prototypes]
     177 | int ubcore_check_port_state(struct ubcore_device *dev)
         |     ^
   drivers/ub/urma/ubcore/ubcore_netdev.c:177:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     177 | int ubcore_check_port_state(struct ubcore_device *dev)
         | ^
         | static 
>> drivers/ub/urma/ubcore/ubcore_netdev.c:204:6: warning: no previous prototype for function 'ubcore_fill_port_netdev' [-Wmissing-prototypes]
     204 | void ubcore_fill_port_netdev(struct ubcore_device *dev,
         |      ^
   drivers/ub/urma/ubcore/ubcore_netdev.c:204:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     204 | void ubcore_fill_port_netdev(struct ubcore_device *dev,
         | ^
         | static 
   drivers/ub/urma/ubcore/ubcore_netdev.c:268:5: warning: no previous prototype for function 'ubcore_set_port_netdev' [-Wmissing-prototypes]
     268 | int ubcore_set_port_netdev(struct ubcore_device *dev, struct net_device *ndev,
         |     ^
   drivers/ub/urma/ubcore/ubcore_netdev.c:268:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     268 | int ubcore_set_port_netdev(struct ubcore_device *dev, struct net_device *ndev,
         | ^
         | static 
   drivers/ub/urma/ubcore/ubcore_netdev.c:353:5: warning: no previous prototype for function 'ubcore_unset_port_netdev' [-Wmissing-prototypes]
     353 | int ubcore_unset_port_netdev(struct ubcore_device *dev, struct net_device *ndev,
         |     ^
   drivers/ub/urma/ubcore/ubcore_netdev.c:353:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     353 | int ubcore_unset_port_netdev(struct ubcore_device *dev, struct net_device *ndev,
         | ^
         | static 
   drivers/ub/urma/ubcore/ubcore_netdev.c:385:6: warning: no previous prototype for function 'ubcore_put_port_netdev' [-Wmissing-prototypes]
     385 | void ubcore_put_port_netdev(struct ubcore_device *dev)
         |      ^
   drivers/ub/urma/ubcore/ubcore_netdev.c:385:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     385 | void ubcore_put_port_netdev(struct ubcore_device *dev)
         | ^
         | static 
   drivers/ub/urma/ubcore/ubcore_netdev.c:412:5: warning: no previous prototype for function 'ubcore_sip_table_init' [-Wmissing-prototypes]
     412 | int ubcore_sip_table_init(struct ubcore_sip_table *sip_table, uint32_t size)
         |     ^
   drivers/ub/urma/ubcore/ubcore_netdev.c:412:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     412 | int ubcore_sip_table_init(struct ubcore_sip_table *sip_table, uint32_t size)
         | ^
         | static 
   drivers/ub/urma/ubcore/ubcore_netdev.c:431:6: warning: no previous prototype for function 'ubcore_sip_table_uninit' [-Wmissing-prototypes]
     431 | void ubcore_sip_table_uninit(struct ubcore_sip_table *sip_table)
         |      ^
   drivers/ub/urma/ubcore/ubcore_netdev.c:431:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     431 | void ubcore_sip_table_uninit(struct ubcore_sip_table *sip_table)
         | ^
         | static 
   drivers/ub/urma/ubcore/ubcore_netdev.c:442:5: warning: no previous prototype for function 'ubcore_sip_idx_alloc' [-Wmissing-prototypes]
     442 | int ubcore_sip_idx_alloc(struct ubcore_sip_table *sip_table)
         |     ^
   drivers/ub/urma/ubcore/ubcore_netdev.c:442:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     442 | int ubcore_sip_idx_alloc(struct ubcore_sip_table *sip_table)
         | ^
         | static 
   drivers/ub/urma/ubcore/ubcore_netdev.c:458:5: warning: no previous prototype for function 'ubcore_sip_idx_free' [-Wmissing-prototypes]
     458 | int ubcore_sip_idx_free(struct ubcore_sip_table *sip_table, uint32_t idx)
         |     ^
   drivers/ub/urma/ubcore/ubcore_netdev.c:458:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     458 | int ubcore_sip_idx_free(struct ubcore_sip_table *sip_table, uint32_t idx)
         | ^
         | static 
   drivers/ub/urma/ubcore/ubcore_netdev.c:471:5: warning: no previous prototype for function 'ubcore_add_sip_entry' [-Wmissing-prototypes]
     471 | int ubcore_add_sip_entry(struct ubcore_sip_table *sip_table, const struct ubcore_sip_info *sip,
         |     ^
   drivers/ub/urma/ubcore/ubcore_netdev.c:471:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     471 | int ubcore_add_sip_entry(struct ubcore_sip_table *sip_table, const struct ubcore_sip_info *sip,
         | ^
         | static 
   drivers/ub/urma/ubcore/ubcore_netdev.c:489:5: warning: no previous prototype for function 'ubcore_del_sip_entry' [-Wmissing-prototypes]
     489 | int ubcore_del_sip_entry(struct ubcore_sip_table *sip_table, uint32_t idx)
         |     ^
   drivers/ub/urma/ubcore/ubcore_netdev.c:489:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     489 | int ubcore_del_sip_entry(struct ubcore_sip_table *sip_table, uint32_t idx)
         | ^
         | static 
>> drivers/ub/urma/ubcore/ubcore_netdev.c:519:5: warning: no previous prototype for function 'ubcore_update_sip_entry' [-Wmissing-prototypes]
     519 | int ubcore_update_sip_entry(struct ubcore_sip_table *sip_table, struct ubcore_sip_info *new_sip,
         |     ^
   drivers/ub/urma/ubcore/ubcore_netdev.c:519:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     519 | int ubcore_update_sip_entry(struct ubcore_sip_table *sip_table, struct ubcore_sip_info *new_sip,
         | ^
         | static 
   drivers/ub/urma/ubcore/ubcore_netdev.c:548:5: warning: no previous prototype for function 'ubcore_lookup_sip_idx' [-Wmissing-prototypes]
     548 | int ubcore_lookup_sip_idx(struct ubcore_sip_table *sip_table, struct ubcore_sip_info *sip,
         |     ^
   drivers/ub/urma/ubcore/ubcore_netdev.c:548:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     548 | int ubcore_lookup_sip_idx(struct ubcore_sip_table *sip_table, struct ubcore_sip_info *sip,
         | ^
         | static 
   17 warnings generated.
--
>> drivers/ub/urma/ubcore/ubcore_tpg.c:85:6: warning: no previous prototype for function 'ubcore_tpg_kref_get' [-Wmissing-prototypes]
      85 | void ubcore_tpg_kref_get(struct ubcore_tpg *tpg)
         |      ^
   drivers/ub/urma/ubcore/ubcore_tpg.c:85:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      85 | void ubcore_tpg_kref_get(struct ubcore_tpg *tpg)
         | ^
         | static 
   drivers/ub/urma/ubcore/ubcore_tpg.c:100:30: warning: comparison of address of 'dev->ht[UBCORE_HT_TPG].head' equal to a null pointer is always false [-Wtautological-pointer-compare]
     100 |         if (&dev->ht[UBCORE_HT_TPG].head == NULL) {
         |              ~~~~~~~~~~~~~~~~~~~~~~~^~~~    ~~~~
>> drivers/ub/urma/ubcore/ubcore_tpg.c:131:29: warning: comparison of address of 'dev->ht[UBCORE_HT_TP].head' equal to a null pointer is always false [-Wtautological-pointer-compare]
     131 |         if (&dev->ht[UBCORE_HT_TP].head == NULL) {
         |              ~~~~~~~~~~~~~~~~~~~~~~^~~~    ~~~~
   3 warnings generated.
--
>> drivers/ub/urma/uburma/uburma_mmap.c:29:6: warning: no previous prototype for function 'uburma_umap_priv_init' [-Wmissing-prototypes]
      29 | void uburma_umap_priv_init(struct uburma_umap_priv *priv,
         |      ^
   drivers/ub/urma/uburma/uburma_mmap.c:29:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      29 | void uburma_umap_priv_init(struct uburma_umap_priv *priv,
         | ^
         | static 
>> drivers/ub/urma/uburma/uburma_mmap.c:42:6: warning: no previous prototype for function 'uburma_unmap_vma_pages' [-Wmissing-prototypes]
      42 | void uburma_unmap_vma_pages(struct uburma_file *ufile)
         |      ^
   drivers/ub/urma/uburma/uburma_mmap.c:42:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      42 | void uburma_unmap_vma_pages(struct uburma_file *ufile)
         | ^
         | static 
>> drivers/ub/urma/uburma/uburma_mmap.c:157:36: warning: no previous prototype for function 'uburma_get_umap_ops' [-Wmissing-prototypes]
     157 | const struct vm_operations_struct *uburma_get_umap_ops(void)
         |                                    ^
   drivers/ub/urma/uburma/uburma_mmap.c:157:7: note: declare 'static' if the function is not intended to be used outside of this translation unit
     157 | const struct vm_operations_struct *uburma_get_umap_ops(void)
         |       ^
         | static 
   3 warnings generated.


vim +/ubcore_umem_find_best_page_size +284 drivers/ub/urma/ubcore/ubcore_umem.c

   259	
 > 260	void ubcore_umem_release(struct ubcore_umem *umem)
   261	{
   262		uint64_t npages;
   263	
   264		if (IS_ERR_OR_NULL(umem) || umem->ub_dev == NULL || umem->owning_mm == NULL) {
   265			ubcore_log_err("Invalid parameter.\n");
   266			return;
   267		}
   268	
   269		if (((umem->va + umem->length) < umem->va) ||
   270			PAGE_ALIGN(umem->va + umem->length) < (umem->va + umem->length)) {
   271			ubcore_log_err("Invalid parameter, va or len is invalid.\n");
   272			return;
   273		}
   274	
   275		npages = umem_cal_npages(umem->va, umem->length);
   276		dma_unmap_sg(umem->ub_dev->dma_dev, umem->sg_head.sgl, (int)umem->nmap, DMA_BIDIRECTIONAL);
   277		umem_free_sgt(umem);
   278		umem_atomic_sub(npages, umem->owning_mm);
   279		mmdrop(umem->owning_mm);
   280		kfree(umem);
   281	}
   282	EXPORT_SYMBOL(ubcore_umem_release);
   283	
 > 284	uint64_t ubcore_umem_find_best_page_size(struct ubcore_umem *umem, uint64_t page_size_bitmap,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
