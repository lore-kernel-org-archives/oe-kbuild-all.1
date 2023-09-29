Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2E815A0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Sep 2023 04:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695962603; x=1727498603;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2j1OLPUEqCHDharOJexGiQdHaw8wNjQWvB9OHa+gR2o=;
  b=PUg6Hsor9wxDa8xug0vgBpaFZ2pFb+QQwmhNW+iPhyZWODXNihU68ZRB
   hGMAOlraFEOZguLujM8nhiB5JvxXEsDWlKkiUqny9j3+i7eyEoCLbEgvy
   hJNdp29s3/gSltZn+etLr65MKrQi1OKltaWlAniAIQlqXtk6wLJqDibwx
   kf8PFvqfCxlvUbnPF8bMF8Fl5QKHuPsHRHt04elYzFkfb0tAmDk62jF3r
   p/kF2ihqwrVCF4lI7j1yi1kRAKkmqj2sOdhohlCfBuix6bvmGYmhA2yLP
   yigGpZIISk09oXryNAAgMjC8Q6spqGZFna54KraopZTh8SDRlyOtskEIR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="3805080"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="3805080"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 21:43:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="779174672"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="779174672"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 28 Sep 2023 21:43:18 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qm5LQ-0002Tt-1k;
	Fri, 29 Sep 2023 04:43:16 +0000
Date: Fri, 29 Sep 2023 12:42:28 +0800
From: kernel test robot <lkp@intel.com>
To: Andrea Arcangeli <aarcange@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Suren Baghdasaryan <surenb@google.com>
Subject: [linux-next:master 8118/8345] mm/userfaultfd.c:1373 remap_pages()
 warn: unsigned 'src_start + len - src_addr' is never less than zero.
Message-ID: <202309291232.XVzIlXW7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   719136e5c24768ebdf80b9daa53facebbdd377c3
commit: b855aaa369f6d7115995aa486413ab7634f84d3f [8118/8345] userfaultfd: UFFDIO_REMAP uABI
config: i386-randconfig-141-20230928 (https://download.01.org/0day-ci/archive/20230929/202309291232.XVzIlXW7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230929/202309291232.XVzIlXW7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309291232.XVzIlXW7-lkp@intel.com/

smatch warnings:
mm/userfaultfd.c:1373 remap_pages() warn: unsigned 'src_start + len - src_addr' is never less than zero.

vim +1373 mm/userfaultfd.c

  1189	
  1190	/**
  1191	 * remap_pages - remap arbitrary anonymous pages of an existing vma
  1192	 * @dst_start: start of the destination virtual memory range
  1193	 * @src_start: start of the source virtual memory range
  1194	 * @len: length of the virtual memory range
  1195	 *
  1196	 * remap_pages() remaps arbitrary anonymous pages atomically in zero
  1197	 * copy. It only works on non shared anonymous pages because those can
  1198	 * be relocated without generating non linear anon_vmas in the rmap
  1199	 * code.
  1200	 *
  1201	 * It provides a zero copy mechanism to handle userspace page faults.
  1202	 * The source vma pages should have mapcount == 1, which can be
  1203	 * enforced by using madvise(MADV_DONTFORK) on src vma.
  1204	 *
  1205	 * The thread receiving the page during the userland page fault
  1206	 * will receive the faulting page in the source vma through the network,
  1207	 * storage or any other I/O device (MADV_DONTFORK in the source vma
  1208	 * avoids remap_pages() to fail with -EBUSY if the process forks before
  1209	 * remap_pages() is called), then it will call remap_pages() to map the
  1210	 * page in the faulting address in the destination vma.
  1211	 *
  1212	 * This userfaultfd command works purely via pagetables, so it's the
  1213	 * most efficient way to move physical non shared anonymous pages
  1214	 * across different virtual addresses. Unlike mremap()/mmap()/munmap()
  1215	 * it does not create any new vmas. The mapping in the destination
  1216	 * address is atomic.
  1217	 *
  1218	 * It only works if the vma protection bits are identical from the
  1219	 * source and destination vma.
  1220	 *
  1221	 * It can remap non shared anonymous pages within the same vma too.
  1222	 *
  1223	 * If the source virtual memory range has any unmapped holes, or if
  1224	 * the destination virtual memory range is not a whole unmapped hole,
  1225	 * remap_pages() will fail respectively with -ENOENT or -EEXIST. This
  1226	 * provides a very strict behavior to avoid any chance of memory
  1227	 * corruption going unnoticed if there are userland race conditions.
  1228	 * Only one thread should resolve the userland page fault at any given
  1229	 * time for any given faulting address. This means that if two threads
  1230	 * try to both call remap_pages() on the same destination address at the
  1231	 * same time, the second thread will get an explicit error from this
  1232	 * command.
  1233	 *
  1234	 * The command retval will return "len" is successful. The command
  1235	 * however can be interrupted by fatal signals or errors. If
  1236	 * interrupted it will return the number of bytes successfully
  1237	 * remapped before the interruption if any, or the negative error if
  1238	 * none. It will never return zero. Either it will return an error or
  1239	 * an amount of bytes successfully moved. If the retval reports a
  1240	 * "short" remap, the remap_pages() command should be repeated by
  1241	 * userland with src+retval, dst+reval, len-retval if it wants to know
  1242	 * about the error that interrupted it.
  1243	 *
  1244	 * The UFFDIO_REMAP_MODE_ALLOW_SRC_HOLES flag can be specified to
  1245	 * prevent -ENOENT errors to materialize if there are holes in the
  1246	 * source virtual range that is being remapped. The holes will be
  1247	 * accounted as successfully remapped in the retval of the
  1248	 * command. This is mostly useful to remap hugepage naturally aligned
  1249	 * virtual regions without knowing if there are transparent hugepage
  1250	 * in the regions or not, but preventing the risk of having to split
  1251	 * the hugepmd during the remap.
  1252	 *
  1253	 * If there's any rmap walk that is taking the anon_vma locks without
  1254	 * first obtaining the folio lock (for example split_huge_page and
  1255	 * folio_referenced), they will have to verify if the folio->mapping
  1256	 * has changed after taking the anon_vma lock. If it changed they
  1257	 * should release the lock and retry obtaining a new anon_vma, because
  1258	 * it means the anon_vma was changed by remap_pages() before the lock
  1259	 * could be obtained. This is the only additional complexity added to
  1260	 * the rmap code to provide this anonymous page remapping functionality.
  1261	 */
  1262	ssize_t remap_pages(struct mm_struct *dst_mm, struct mm_struct *src_mm,
  1263			    unsigned long dst_start, unsigned long src_start,
  1264			    unsigned long len, __u64 mode)
  1265	{
  1266		struct vm_area_struct *src_vma, *dst_vma;
  1267		unsigned long src_addr, dst_addr;
  1268		pmd_t *src_pmd, *dst_pmd;
  1269		long err = -EINVAL;
  1270		ssize_t moved = 0;
  1271	
  1272		/*
  1273		 * Sanitize the command parameters:
  1274		 */
  1275		BUG_ON(src_start & ~PAGE_MASK);
  1276		BUG_ON(dst_start & ~PAGE_MASK);
  1277		BUG_ON(len & ~PAGE_MASK);
  1278	
  1279		/* Does the address range wrap, or is the span zero-sized? */
  1280		BUG_ON(src_start + len <= src_start);
  1281		BUG_ON(dst_start + len <= dst_start);
  1282	
  1283		/*
  1284		 * Because these are read sempahores there's no risk of lock
  1285		 * inversion.
  1286		 */
  1287		mmap_read_lock(dst_mm);
  1288		if (dst_mm != src_mm)
  1289			mmap_read_lock(src_mm);
  1290	
  1291		/*
  1292		 * Make sure the vma is not shared, that the src and dst remap
  1293		 * ranges are both valid and fully within a single existing
  1294		 * vma.
  1295		 */
  1296		src_vma = find_vma(src_mm, src_start);
  1297		if (!src_vma || (src_vma->vm_flags & VM_SHARED))
  1298			goto out;
  1299		if (src_start < src_vma->vm_start ||
  1300		    src_start + len > src_vma->vm_end)
  1301			goto out;
  1302	
  1303		dst_vma = find_vma(dst_mm, dst_start);
  1304		if (!dst_vma || (dst_vma->vm_flags & VM_SHARED))
  1305			goto out;
  1306		if (dst_start < dst_vma->vm_start ||
  1307		    dst_start + len > dst_vma->vm_end)
  1308			goto out;
  1309	
  1310		err = validate_remap_areas(src_vma, dst_vma);
  1311		if (err)
  1312			goto out;
  1313	
  1314		for (src_addr = src_start, dst_addr = dst_start;
  1315		     src_addr < src_start + len;) {
  1316			spinlock_t *ptl;
  1317			pmd_t dst_pmdval;
  1318			unsigned long step_size;
  1319	
  1320			BUG_ON(dst_addr >= dst_start + len);
  1321			/*
  1322			 * Below works because anonymous area would not have a
  1323			 * transparent huge PUD. If file-backed support is added,
  1324			 * that case would need to be handled here.
  1325			 */
  1326			src_pmd = mm_find_pmd(src_mm, src_addr);
  1327			if (unlikely(!src_pmd)) {
  1328				if (!(mode & UFFDIO_REMAP_MODE_ALLOW_SRC_HOLES)) {
  1329					err = -ENOENT;
  1330					break;
  1331				}
  1332				src_pmd = mm_alloc_pmd(src_mm, src_addr);
  1333				if (unlikely(!src_pmd)) {
  1334					err = -ENOMEM;
  1335					break;
  1336				}
  1337			}
  1338			dst_pmd = mm_alloc_pmd(dst_mm, dst_addr);
  1339			if (unlikely(!dst_pmd)) {
  1340				err = -ENOMEM;
  1341				break;
  1342			}
  1343	
  1344			dst_pmdval = pmdp_get_lockless(dst_pmd);
  1345			/*
  1346			 * If the dst_pmd is mapped as THP don't override it and just
  1347			 * be strict. If dst_pmd changes into TPH after this check, the
  1348			 * remap_pages_huge_pmd() will detect the change and retry
  1349			 * while remap_pages_pte() will detect the change and fail.
  1350			 */
  1351			if (unlikely(pmd_trans_huge(dst_pmdval))) {
  1352				err = -EEXIST;
  1353				break;
  1354			}
  1355	
  1356			ptl = pmd_trans_huge_lock(src_pmd, src_vma);
  1357			if (ptl && !pmd_trans_huge(*src_pmd)) {
  1358				spin_unlock(ptl);
  1359				ptl = NULL;
  1360			}
  1361	
  1362			if (ptl) {
  1363				/*
  1364				 * Check if we can move the pmd without
  1365				 * splitting it. First check the address
  1366				 * alignment to be the same in src/dst.  These
  1367				 * checks don't actually need the PT lock but
  1368				 * it's good to do it here to optimize this
  1369				 * block away at build time if
  1370				 * CONFIG_TRANSPARENT_HUGEPAGE is not set.
  1371				 */
  1372				if ((src_addr & ~HPAGE_PMD_MASK) || (dst_addr & ~HPAGE_PMD_MASK) ||
> 1373				    src_start + len - src_addr < HPAGE_PMD_SIZE || !pmd_none(dst_pmdval)) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
