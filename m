Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A24202C21
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Feb 2025 11:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740309682; cv=none; b=ItBggsh7TPaF+E5A/oeqU/axleTMLmJ+QYZqNQMGe9tgUrkaJ8aF2jeQiio6AiyadJ0hZL34t8CqzHQ9X4RdYznnejuNiVLUiE2g5uxuUp0BxV29r8+uowgXIV22QCMnIWOM1CUkvXB613RjSapc6lk5teaJw2hyYCKsLRervYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740309682; c=relaxed/simple;
	bh=OkZI5aQkcBWjNhpD69Psm7WgEUVSk6skFuUvtHgG7d4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m5DKr2kpSR8S9ZO8g6IEviyA0vvlx8SFk0ndYJGKZ6gzdSk9pyUguURXF3A/t1AN35LPq0lADLItCvmKq/weB6N9PuLMeafk1nLqtccRNC91xGAkunCZ07aRWNJXNK3abU94kCBEZKWTNXpNXnAuwCAGcl2+Ckd2ct1xF2dBKsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MZ9wmtVm; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MZ9wmtVm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740309681; x=1771845681;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OkZI5aQkcBWjNhpD69Psm7WgEUVSk6skFuUvtHgG7d4=;
  b=MZ9wmtVmGG1CbKwUFOPk0FLH9TUCayarzzL/MS+Pcpsz/Pk5O6MZMqik
   abTgoSC7BrlcDHa4YQcpNpGxZqlEVBCpcizg8IABARzRwiNfL3ZMNe0fX
   Ge65Cujs4fQFZmof0OoPTmzGpyTABzx0w4RalLOppp8LFGXVexP+vvw64
   ajvKT+AuqCQbrRT0xUoFogBORFS6o/GF/+gUm+LEHTs17COnIN/yCnQ2d
   MiZvlj9oq1jczJrlNddcHbw+J5I8UzAyT39Li1eahlBZ4pNRVCKIYxEOG
   HLQx5k1ZImw9POqheFcZL8Vwq8dl4TLRTkjVUr/vyoPbt1tmYjSVuLfv0
   Q==;
X-CSE-ConnectionGUID: i/R6+upwSiKhzP86Q6NM7A==
X-CSE-MsgGUID: zCPHuFNzRYiygLAMBeDo8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="28673798"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="28673798"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2025 03:21:18 -0800
X-CSE-ConnectionGUID: 0fmQ3YI1R4qcCz/8Zx4Qfw==
X-CSE-MsgGUID: PDJ1iHZYQIqtNmpaY2v5+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="146704069"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 23 Feb 2025 03:21:17 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmA2s-0007Hx-2V;
	Sun, 23 Feb 2025 11:21:14 +0000
Date: Sun, 23 Feb 2025 19:20:48 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Mak <makb@juniper.net>
Cc: oe-kbuild-all@lists.linux.dev, Kees Cook <kees@kernel.org>
Subject: [kees:for-next/execve 1/2] fs/coredump.c:1273:undefined reference to
 `get_dump_page'
Message-ID: <202502231914.ROOVWMZN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/execve
head:   9a3e62e7aff182403c9cf21e7dc523a42ed66ea1
commit: ff41385709f01519a97379ce7671ee4e91e301e1 [1/2] coredump: Only sort VMAs when truncating or core_sort_vma sysctl is set
config: loongarch-randconfig-001-20250223 (https://download.01.org/0day-ci/archive/20250223/202502231914.ROOVWMZN-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250223/202502231914.ROOVWMZN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502231914.ROOVWMZN-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: fs/coredump.o: in function `dump_vma_snapshot':
>> fs/coredump.c:1273:(.text+0x8e0): undefined reference to `get_dump_page'


vim +1273 fs/coredump.c

  1206	
  1207	/*
  1208	 * Under the mmap_lock, take a snapshot of relevant information about the task's
  1209	 * VMAs.
  1210	 */
  1211	static bool dump_vma_snapshot(struct coredump_params *cprm)
  1212	{
  1213		struct vm_area_struct *gate_vma, *vma = NULL;
  1214		struct mm_struct *mm = current->mm;
  1215		VMA_ITERATOR(vmi, mm, 0);
  1216		int i = 0;
  1217		size_t sparse_vma_dump_size = 0;
  1218	
  1219		/*
  1220		 * Once the stack expansion code is fixed to not change VMA bounds
  1221		 * under mmap_lock in read mode, this can be changed to take the
  1222		 * mmap_lock in read mode.
  1223		 */
  1224		if (mmap_write_lock_killable(mm))
  1225			return false;
  1226	
  1227		cprm->vma_data_size = 0;
  1228		gate_vma = get_gate_vma(mm);
  1229		cprm->vma_count = mm->map_count + (gate_vma ? 1 : 0);
  1230	
  1231		cprm->vma_meta = kvmalloc_array(cprm->vma_count, sizeof(*cprm->vma_meta), GFP_KERNEL);
  1232		if (!cprm->vma_meta) {
  1233			mmap_write_unlock(mm);
  1234			return false;
  1235		}
  1236	
  1237		while ((vma = coredump_next_vma(&vmi, vma, gate_vma)) != NULL) {
  1238			struct core_vma_metadata *m = cprm->vma_meta + i;
  1239	
  1240			m->start = vma->vm_start;
  1241			m->end = vma->vm_end;
  1242			m->flags = vma->vm_flags;
  1243			m->dump_size = vma_dump_size(vma, cprm->mm_flags);
  1244			m->pgoff = vma->vm_pgoff;
  1245			m->file = vma->vm_file;
  1246			if (m->file)
  1247				get_file(m->file);
  1248			i++;
  1249		}
  1250	
  1251		mmap_write_unlock(mm);
  1252	
  1253		for (i = 0; i < cprm->vma_count; i++) {
  1254			struct core_vma_metadata *m = cprm->vma_meta + i;
  1255			unsigned long addr;
  1256	
  1257			if (m->dump_size == DUMP_SIZE_MAYBE_ELFHDR_PLACEHOLDER) {
  1258				char elfmag[SELFMAG];
  1259	
  1260				if (copy_from_user(elfmag, (void __user *)m->start, SELFMAG) ||
  1261						memcmp(elfmag, ELFMAG, SELFMAG) != 0) {
  1262					m->dump_size = 0;
  1263				} else {
  1264					m->dump_size = PAGE_SIZE;
  1265				}
  1266			}
  1267	
  1268			cprm->vma_data_size += m->dump_size;
  1269			sparse_vma_dump_size += m->dump_size;
  1270	
  1271			/* Subtract zero pages from the sparse_vma_dump_size. */
  1272			for (addr = m->start; addr < m->start + m->dump_size; addr += PAGE_SIZE) {
> 1273				struct page *page = get_dump_page(addr);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
