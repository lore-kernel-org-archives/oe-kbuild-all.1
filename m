Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9138E13C80F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Jul 2024 16:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720282323; cv=none; b=fKsUslEh9ka8APF1aVs+O9Nikb6IE+ozxtlAeRLxjg3DF7w8F+pl+HE3RRpYahpdC1hEKgIG6B+FfSATUDsWOjAUB7bWNrPXGyJrbH2vWOmRg4ScfkB8nUF7tpyUihV2NGku0/SrTXUSQaeug4pZ7m94iKYqHpBIz/UvhzfW1uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720282323; c=relaxed/simple;
	bh=gSW11jhg9H27i3aM9QIGhGVKTILFEaQeQMvBowvIAOY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X7iQdKUKiXq0XRb6dya+UHXpyDbhQPf3UbQRj3bmqvvSvcLxLeP/4oCEZo9bA/i9Zxlru+hUhEAsfhsVIevMZ/DCBh9J8mqxU10QGIuq+BB9ekNJkqDZbq100iT1G/UefIyda7luvg2Jtcny88WXVXorHJmr820Mb6qkG1j7hEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JcwhlhMA; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JcwhlhMA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720282322; x=1751818322;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gSW11jhg9H27i3aM9QIGhGVKTILFEaQeQMvBowvIAOY=;
  b=JcwhlhMA8CPJ9zhbWvfrh6++2FAUj2bbyvcWdugFpJpGxFKLs4dtb4GT
   slVJ5aom0UMXQcpIgC7FJ4FqX33MvWajKo5ocTfiUuCSDYtAO2GTMlKy4
   TTmcQEZK9uJ8ZD7vF+N4NFt09Ki10by2Di8PTxYArKyXCw5qEpLtrj9QD
   wi4kSK5UJ7Jf57kIx2v0iA1i6WdklGVy1ReWcl0f9bcqE3TP3vRPjO5Kh
   f58k6MgrHLjlk+7SJOFaMWoRNQjNUNGvy4sDhnrD+Dtn9R88k94KOy73I
   o/EdKssqqnkTXVe7qcK63K7/kpwhayQgFVShwRHvxkbbhTHvyVdT+0QNY
   A==;
X-CSE-ConnectionGUID: uSx2MQGtQTqeTPt6XjinVA==
X-CSE-MsgGUID: 3QuOmc2FQTOdpoFule+h4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11125"; a="35072664"
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; 
   d="scan'208";a="35072664"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2024 09:12:01 -0700
X-CSE-ConnectionGUID: LpAQ6cX8RIOl59NzR/PQXQ==
X-CSE-MsgGUID: Q8BSbeETTg2N0aAvITXIOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; 
   d="scan'208";a="46879247"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Jul 2024 09:12:00 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQ810-000Tzu-04;
	Sat, 06 Jul 2024 16:11:58 +0000
Date: Sun, 7 Jul 2024 00:11:56 +0800
From: kernel test robot <lkp@intel.com>
To: "Jason A. Donenfeld" <zx2c4@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, zx2c4@kernel.org
Subject: [crng-random:jd/vdso-test-harness 1/4] mm/mmap.c:1281:21: error:
 'MAP_WIPEONFORK' undeclared; did you mean 'MADV_WIPEONFORK'?
Message-ID: <202407070028.sU8yBXtP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/crng/random.git jd/vdso-test-harness
head:   bc6504b8712589af209747a0b269445bce72e002
commit: 6a0dc09f49aae4dcd556d7fbf71bb04deefd7fb4 [1/4] mm: add VM_DROPPABLE for designating always lazily freeable mappings
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20240707/202407070028.sU8yBXtP-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240707/202407070028.sU8yBXtP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407070028.sU8yBXtP-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/mmap.c: In function 'do_mmap':
>> mm/mmap.c:1281:21: error: 'MAP_WIPEONFORK' undeclared (first use in this function); did you mean 'MADV_WIPEONFORK'?
    1281 |         if (flags & MAP_WIPEONFORK)
         |                     ^~~~~~~~~~~~~~
         |                     MADV_WIPEONFORK
   mm/mmap.c:1281:21: note: each undeclared identifier is reported only once for each function it appears in
>> mm/mmap.c:1283:21: error: 'MAP_DONTDUMP' undeclared (first use in this function); did you mean 'MADV_DONTDUMP'?
    1283 |         if (flags & MAP_DONTDUMP)
         |                     ^~~~~~~~~~~~
         |                     MADV_DONTDUMP
>> mm/mmap.c:1285:21: error: 'MAP_DROPPABLE' undeclared (first use in this function); did you mean 'VM_DROPPABLE'?
    1285 |         if (flags & MAP_DROPPABLE) {
         |                     ^~~~~~~~~~~~~
         |                     VM_DROPPABLE


vim +1281 mm/mmap.c

  1210	
  1211	/*
  1212	 * The caller must write-lock current->mm->mmap_lock.
  1213	 */
  1214	unsigned long do_mmap(struct file *file, unsigned long addr,
  1215				unsigned long len, unsigned long prot,
  1216				unsigned long flags, vm_flags_t vm_flags,
  1217				unsigned long pgoff, unsigned long *populate,
  1218				struct list_head *uf)
  1219	{
  1220		struct mm_struct *mm = current->mm;
  1221		int pkey = 0;
  1222	
  1223		*populate = 0;
  1224	
  1225		if (!len)
  1226			return -EINVAL;
  1227	
  1228		/*
  1229		 * Does the application expect PROT_READ to imply PROT_EXEC?
  1230		 *
  1231		 * (the exception is when the underlying filesystem is noexec
  1232		 *  mounted, in which case we don't add PROT_EXEC.)
  1233		 */
  1234		if ((prot & PROT_READ) && (current->personality & READ_IMPLIES_EXEC))
  1235			if (!(file && path_noexec(&file->f_path)))
  1236				prot |= PROT_EXEC;
  1237	
  1238		/* force arch specific MAP_FIXED handling in get_unmapped_area */
  1239		if (flags & MAP_FIXED_NOREPLACE)
  1240			flags |= MAP_FIXED;
  1241	
  1242		if (!(flags & MAP_FIXED))
  1243			addr = round_hint_to_min(addr);
  1244	
  1245		/* Careful about overflows.. */
  1246		len = PAGE_ALIGN(len);
  1247		if (!len)
  1248			return -ENOMEM;
  1249	
  1250		/* offset overflow? */
  1251		if ((pgoff + (len >> PAGE_SHIFT)) < pgoff)
  1252			return -EOVERFLOW;
  1253	
  1254		/* Too many mappings? */
  1255		if (mm->map_count > sysctl_max_map_count)
  1256			return -ENOMEM;
  1257	
  1258		/*
  1259		 * addr is returned from get_unmapped_area,
  1260		 * There are two cases:
  1261		 * 1> MAP_FIXED == false
  1262		 *	unallocated memory, no need to check sealing.
  1263		 * 1> MAP_FIXED == true
  1264		 *	sealing is checked inside mmap_region when
  1265		 *	do_vmi_munmap is called.
  1266		 */
  1267	
  1268		if (prot == PROT_EXEC) {
  1269			pkey = execute_only_pkey(mm);
  1270			if (pkey < 0)
  1271				pkey = 0;
  1272		}
  1273	
  1274		/* Do simple checking here so the lower-level routines won't have
  1275		 * to. we assume access permissions have been handled by the open
  1276		 * of the memory object, so we don't do any here.
  1277		 */
  1278		vm_flags |= calc_vm_prot_bits(prot, pkey) | calc_vm_flag_bits(flags) |
  1279				mm->def_flags | VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC;
  1280	
> 1281		if (flags & MAP_WIPEONFORK)
  1282			vm_flags |= VM_WIPEONFORK;
> 1283		if (flags & MAP_DONTDUMP)
  1284			vm_flags |= VM_DONTDUMP;
> 1285		if (flags & MAP_DROPPABLE) {
  1286			/* MAP_DROPPABLE is only supported on anonymous memory. */
  1287			if (file || !(flags & MAP_PRIVATE))
  1288				return -EINVAL;
  1289			vm_flags |= VM_DROPPABLE;
  1290		}
  1291	
  1292		/* Obtain the address to map to. we verify (or select) it and ensure
  1293		 * that it represents a valid section of the address space.
  1294		 */
  1295		addr = __get_unmapped_area(file, addr, len, pgoff, flags, vm_flags);
  1296		if (IS_ERR_VALUE(addr))
  1297			return addr;
  1298	
  1299		if (flags & MAP_FIXED_NOREPLACE) {
  1300			if (find_vma_intersection(mm, addr, addr + len))
  1301				return -EEXIST;
  1302		}
  1303	
  1304		if (flags & MAP_LOCKED)
  1305			if (!can_do_mlock())
  1306				return -EPERM;
  1307	
  1308		if (!mlock_future_ok(mm, vm_flags, len))
  1309			return -EAGAIN;
  1310	
  1311		if (file) {
  1312			struct inode *inode = file_inode(file);
  1313			unsigned long flags_mask;
  1314	
  1315			if (!file_mmap_ok(file, inode, pgoff, len))
  1316				return -EOVERFLOW;
  1317	
  1318			flags_mask = LEGACY_MAP_MASK;
  1319			if (file->f_op->fop_flags & FOP_MMAP_SYNC)
  1320				flags_mask |= MAP_SYNC;
  1321	
  1322			switch (flags & MAP_TYPE) {
  1323			case MAP_SHARED:
  1324				/*
  1325				 * Force use of MAP_SHARED_VALIDATE with non-legacy
  1326				 * flags. E.g. MAP_SYNC is dangerous to use with
  1327				 * MAP_SHARED as you don't know which consistency model
  1328				 * you will get. We silently ignore unsupported flags
  1329				 * with MAP_SHARED to preserve backward compatibility.
  1330				 */
  1331				flags &= LEGACY_MAP_MASK;
  1332				fallthrough;
  1333			case MAP_SHARED_VALIDATE:
  1334				if (flags & ~flags_mask)
  1335					return -EOPNOTSUPP;
  1336				if (prot & PROT_WRITE) {
  1337					if (!(file->f_mode & FMODE_WRITE))
  1338						return -EACCES;
  1339					if (IS_SWAPFILE(file->f_mapping->host))
  1340						return -ETXTBSY;
  1341				}
  1342	
  1343				/*
  1344				 * Make sure we don't allow writing to an append-only
  1345				 * file..
  1346				 */
  1347				if (IS_APPEND(inode) && (file->f_mode & FMODE_WRITE))
  1348					return -EACCES;
  1349	
  1350				vm_flags |= VM_SHARED | VM_MAYSHARE;
  1351				if (!(file->f_mode & FMODE_WRITE))
  1352					vm_flags &= ~(VM_MAYWRITE | VM_SHARED);
  1353				fallthrough;
  1354			case MAP_PRIVATE:
  1355				if (!(file->f_mode & FMODE_READ))
  1356					return -EACCES;
  1357				if (path_noexec(&file->f_path)) {
  1358					if (vm_flags & VM_EXEC)
  1359						return -EPERM;
  1360					vm_flags &= ~VM_MAYEXEC;
  1361				}
  1362	
  1363				if (!file->f_op->mmap)
  1364					return -ENODEV;
  1365				if (vm_flags & (VM_GROWSDOWN|VM_GROWSUP))
  1366					return -EINVAL;
  1367				break;
  1368	
  1369			default:
  1370				return -EINVAL;
  1371			}
  1372		} else {
  1373			switch (flags & MAP_TYPE) {
  1374			case MAP_SHARED:
  1375				if (vm_flags & (VM_GROWSDOWN|VM_GROWSUP))
  1376					return -EINVAL;
  1377				/*
  1378				 * Ignore pgoff.
  1379				 */
  1380				pgoff = 0;
  1381				vm_flags |= VM_SHARED | VM_MAYSHARE;
  1382				break;
  1383			case MAP_PRIVATE:
  1384				/*
  1385				 * Set pgoff according to addr for anon_vma.
  1386				 */
  1387				pgoff = addr >> PAGE_SHIFT;
  1388				break;
  1389			default:
  1390				return -EINVAL;
  1391			}
  1392		}
  1393	
  1394		/*
  1395		 * Set 'VM_NORESERVE' if we should not account for the
  1396		 * memory use of this mapping.
  1397		 */
  1398		if (flags & MAP_NORESERVE) {
  1399			/* We honor MAP_NORESERVE if allowed to overcommit */
  1400			if (sysctl_overcommit_memory != OVERCOMMIT_NEVER)
  1401				vm_flags |= VM_NORESERVE;
  1402	
  1403			/* hugetlb applies strict overcommit unless MAP_NORESERVE */
  1404			if (file && is_file_hugepages(file))
  1405				vm_flags |= VM_NORESERVE;
  1406		}
  1407	
  1408		addr = mmap_region(file, addr, len, vm_flags, pgoff, uf);
  1409		if (!IS_ERR_VALUE(addr) &&
  1410		    ((vm_flags & VM_LOCKED) ||
  1411		     (flags & (MAP_POPULATE | MAP_NONBLOCK)) == MAP_POPULATE))
  1412			*populate = len;
  1413		return addr;
  1414	}
  1415	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
