Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374298F6E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 May 2025 09:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748078743; cv=none; b=HpA/IeP2e6vsI9X93+ryCDOFPziRM0RqHM/MQcnRnHRCKkTvoc//0pdlgEA5YGbEXWo0BJ11xmuv04mSmjzXn0r9xfkU96eaIoLVRaOoO3xPBhPHLqFyP6f4bWGiylLpS54fNZKH2DMKPr1sah9FmqMnJvWYaoETDg2v/0g3km8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748078743; c=relaxed/simple;
	bh=5xWdNO0ZR0jlR7gLgfKHewWMV8SBMcsVtVfY+qdS35c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o87w2FUp5VG/SWs4lX0G/vd8hD7IBudHnGz3qgvslSZv895PMYQ3EapUqWH5Ljb00swI8ilEK6WmFRr1D5TkmQDU2QWYP+EqE+93cOzd8lhVjG/OuVnwEffcKIp5nw5+xsppZqdn3CU1iaLy06X+C0juJ2pZCcEhkJl/0/VY3uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b8s8r4wx; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b8s8r4wx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748078741; x=1779614741;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5xWdNO0ZR0jlR7gLgfKHewWMV8SBMcsVtVfY+qdS35c=;
  b=b8s8r4wxO4u7d80jXRDTzUc+9QrrOc/GeftYzfowQdJkL2i6RGPd70PO
   5oJqsDE+j9m+7XjC63dxQWmE49kN1rIiAch4pBLhg4W3hJerQAbCAG7Ya
   cBQY2rWCrIWbdBzqObVEatNY3FMQ+OxMKmC7lUbKFwUkrCyCTnFABDnLf
   1vVGpZHVlBnmqSAH/IqWp6UeCVXZSQU8Ucp30IY5bbV8CzkFQ3/vtDA+H
   meM0zf3AfxKDo3Hgtw2+ewFAdjchqhGHT79qIto49UxKD3Tl4Vr+2g1b1
   GYGB7YC5ij9PBYteThYOXg+uxmXOMgzDAI/hWHAFWHF+sxLnGjrazOHPR
   w==;
X-CSE-ConnectionGUID: SuYioNqISLGqZjFmv28r0Q==
X-CSE-MsgGUID: g6CO0OlCQdmcesv2a7wCCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50006532"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="50006532"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 02:25:40 -0700
X-CSE-ConnectionGUID: aD7cHYJGQIqM1y+Hzqlo6g==
X-CSE-MsgGUID: CWmQI4DcSMC+FutgAG28jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="146489163"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 24 May 2025 02:25:39 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIl8K-000R59-2p;
	Sat, 24 May 2025 09:25:36 +0000
Date: Sat, 24 May 2025 17:25:01 +0800
From: kernel test robot <lkp@intel.com>
To: Steve Sistare <steven.sistare@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, LUCI Bot <vijayendra.suman@oracle.com>,
	Anthony Yznaga <anthony.yznaga@oracle.com>,
	Liam Howlett <liam.howlett@oracle.com>
Subject: [jlayton:uek-localio 2104/2262] mm/madvise.c:1320:14: error:
 'MADV_DONTEXEC' undeclared; did you mean 'MADV_DONTNEED'?
Message-ID: <202505241700.vej6cox4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git uek-localio
head:   65b0dc6bb1f5c18e63d8ee9ea1cca997456a81a9
commit: f540f4c926f0948adca7f8a3eb36b7d6a851c509 [2104/2262] mm: introduce MADV_DOEXEC
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20250524/202505241700.vej6cox4-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505241700.vej6cox4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505241700.vej6cox4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/pagemap.h:11,
                    from mm/madvise.c:10:
   include/linux/highmem.h: In function 'clear_user_highpage_uncached':
   include/linux/highmem.h:265:9: error: implicit declaration of function 'clear_user_page_uncached'; did you mean 'clear_user_highpage_uncached'? [-Wimplicit-function-declaration]
     265 |         clear_user_page_uncached(addr, vaddr, page);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         clear_user_highpage_uncached
   mm/madvise.c: In function 'madvise_vma_behavior':
   mm/madvise.c:1308:14: error: 'MADV_DOEXEC' undeclared (first use in this function); did you mean 'MADV_FREE'?
    1308 |         case MADV_DOEXEC:
         |              ^~~~~~~~~~~
         |              MADV_FREE
   mm/madvise.c:1308:14: note: each undeclared identifier is reported only once for each function it appears in
>> mm/madvise.c:1320:14: error: 'MADV_DONTEXEC' undeclared (first use in this function); did you mean 'MADV_DONTNEED'?
    1320 |         case MADV_DONTEXEC:
         |              ^~~~~~~~~~~~~
         |              MADV_DONTNEED
   mm/madvise.c: In function 'madvise_behavior_valid':
   mm/madvise.c:1460:14: error: 'MADV_DOEXEC' undeclared (first use in this function); did you mean 'MADV_FREE'?
    1460 |         case MADV_DOEXEC:
         |              ^~~~~~~~~~~
         |              MADV_FREE
   mm/madvise.c:1461:14: error: 'MADV_DONTEXEC' undeclared (first use in this function); did you mean 'MADV_DONTNEED'?
    1461 |         case MADV_DONTEXEC:
         |              ^~~~~~~~~~~~~
         |              MADV_DONTNEED


vim +1320 mm/madvise.c

  1249	
  1250	/*
  1251	 * Apply an madvise behavior to a region of a vma.  madvise_update_vma
  1252	 * will handle splitting a vm area into separate areas, each area with its own
  1253	 * behavior.
  1254	 */
  1255	static int madvise_vma_behavior(struct vm_area_struct *vma,
  1256					struct vm_area_struct **prev,
  1257					unsigned long start, unsigned long end,
  1258					unsigned long behavior)
  1259	{
  1260		int error;
  1261		struct anon_vma_name *anon_name;
  1262		unsigned long new_flags = vma->vm_flags;
  1263	
  1264		if (unlikely(!can_modify_vma_madv(vma, behavior)))
  1265			return -EPERM;
  1266	
  1267		switch (behavior) {
  1268		case MADV_REMOVE:
  1269			return madvise_remove(vma, prev, start, end);
  1270		case MADV_WILLNEED:
  1271			return madvise_willneed(vma, prev, start, end);
  1272		case MADV_COLD:
  1273			return madvise_cold(vma, prev, start, end);
  1274		case MADV_PAGEOUT:
  1275			return madvise_pageout(vma, prev, start, end);
  1276		case MADV_FREE:
  1277		case MADV_DONTNEED:
  1278		case MADV_DONTNEED_LOCKED:
  1279			return madvise_dontneed_free(vma, prev, start, end, behavior);
  1280		case MADV_NORMAL:
  1281			new_flags = new_flags & ~VM_RAND_READ & ~VM_SEQ_READ;
  1282			break;
  1283		case MADV_SEQUENTIAL:
  1284			new_flags = (new_flags & ~VM_RAND_READ) | VM_SEQ_READ;
  1285			break;
  1286		case MADV_RANDOM:
  1287			new_flags = (new_flags & ~VM_SEQ_READ) | VM_RAND_READ;
  1288			break;
  1289		case MADV_DONTFORK:
  1290			new_flags |= VM_DONTCOPY;
  1291			break;
  1292		case MADV_DOFORK:
  1293			if (vma->vm_flags & VM_IO)
  1294				return -EINVAL;
  1295			new_flags &= ~VM_DONTCOPY;
  1296			break;
  1297		case MADV_WIPEONFORK:
  1298			/* MADV_WIPEONFORK is only supported on anonymous memory. */
  1299			if (vma->vm_file || vma->vm_flags & VM_SHARED)
  1300				return -EINVAL;
  1301			new_flags |= VM_WIPEONFORK;
  1302			break;
  1303		case MADV_KEEPONFORK:
  1304			if (vma->vm_flags & VM_DROPPABLE)
  1305				return -EINVAL;
  1306			new_flags &= ~VM_WIPEONFORK;
  1307			break;
> 1308		case MADV_DOEXEC:
  1309			/*
  1310			 * MADV_DOEXEC is only supported on private, non-executable,
  1311			 * non-stack anonymous memory and if the VM_EXEC_KEEP flag
  1312			 * is available.
  1313			 */
  1314			if (!VM_EXEC_KEEP || !vma_is_anonymous(vma) || vma->vm_flags & (VM_EXEC|VM_SHARED|VM_STACK)) {
  1315				error = -EINVAL;
  1316				goto out;
  1317			}
  1318			new_flags |= (new_flags & ~VM_MAYEXEC) | VM_EXEC_KEEP;
  1319			break;
> 1320		case MADV_DONTEXEC:
  1321			if (!VM_EXEC_KEEP) {
  1322				error = -EINVAL;
  1323				goto out;
  1324			}
  1325			if (new_flags & VM_EXEC_KEEP)
  1326				new_flags = (new_flags & ~VM_EXEC_KEEP) | VM_MAYEXEC;
  1327			break;
  1328		case MADV_DONTDUMP:
  1329			new_flags |= VM_DONTDUMP;
  1330			break;
  1331		case MADV_DODUMP:
  1332			if ((!is_vm_hugetlb_page(vma) && new_flags & VM_SPECIAL) ||
  1333			    (vma->vm_flags & VM_DROPPABLE))
  1334				return -EINVAL;
  1335			new_flags &= ~VM_DONTDUMP;
  1336			break;
  1337		case MADV_MERGEABLE:
  1338		case MADV_UNMERGEABLE:
  1339			error = ksm_madvise(vma, start, end, behavior, &new_flags);
  1340			if (error)
  1341				goto out;
  1342			break;
  1343		case MADV_HUGEPAGE:
  1344		case MADV_NOHUGEPAGE:
  1345			error = hugepage_madvise(vma, &new_flags, behavior);
  1346			if (error)
  1347				goto out;
  1348			break;
  1349		case MADV_COLLAPSE:
  1350			return madvise_collapse(vma, prev, start, end);
  1351		case MADV_GUARD_INSTALL:
  1352			return madvise_guard_install(vma, prev, start, end);
  1353		case MADV_GUARD_REMOVE:
  1354			return madvise_guard_remove(vma, prev, start, end);
  1355		}
  1356	
  1357		anon_name = anon_vma_name(vma);
  1358		anon_vma_name_get(anon_name);
  1359		error = madvise_update_vma(vma, prev, start, end, new_flags,
  1360					   anon_name);
  1361		anon_vma_name_put(anon_name);
  1362	
  1363	out:
  1364		/*
  1365		 * madvise() returns EAGAIN if kernel resources, such as
  1366		 * slab, are temporarily unavailable.
  1367		 */
  1368		if (error == -ENOMEM)
  1369			error = -EAGAIN;
  1370		return error;
  1371	}
  1372	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
