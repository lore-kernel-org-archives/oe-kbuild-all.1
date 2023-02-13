Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447B01FA8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Feb 2023 07:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676272274; x=1707808274;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I+vQFnom+bvAALGfcC4nRk2omWHea2VJ5B811Jc7O68=;
  b=gkSm/8EjE6l7bVpSA2bYqp6RvDP08ozZHq3ocreCwzzLAvu+BQIUyME/
   jRSDc2chRtPuOT6CJaYBA4okCltwYPR6efpG6PfHAyV/uuqGZzRiawv91
   lxpBnhKdaNwvp372q7VujJrN4UHyIaspL0EiSUoVDNbIBplsBlKXdSI4y
   ctQvsFdWF+l5LsSs++HmNXG+v5nMm5Du+AO/2s/gSTVzOFCOrLYqfIsZO
   8M3eUUUu4NYBhq38PHV2xpkxMUOE1ZnoramlDNqlvQ6wXEOcs1wQmG+9h
   sBIpvgcy+Hd7HBs2gIbUpE+NKFHYWXeEu3d8AbDsfEJRcr9voj/WVlPy8
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="395437462"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; 
   d="scan'208";a="395437462"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2023 23:11:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="646286048"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; 
   d="scan'208";a="646286048"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 12 Feb 2023 23:11:11 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRSzW-0007bv-17;
	Mon, 13 Feb 2023 07:11:10 +0000
Date: Mon, 13 Feb 2023 15:10:37 +0800
From: kernel test robot <lkp@intel.com>
To: Deepak Gupta <debug@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 RFC Zisslpcfi 05/20] mmap : Introducing new protection
 "PROT_SHADOWSTACK" for mmap
Message-ID: <202302131549.Yg5gbZzC-lkp@intel.com>
References: <20230213045351.3945824-6-debug@rivosinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230213045351.3945824-6-debug@rivosinc.com>

Hi Deepak,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on kees/for-next/execve]
[also build test ERROR on linus/master v6.2-rc8]
[cannot apply to next-20230210]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Deepak-Gupta/sslp-stubs-shadow-stack-and-landing-pad-stubs/20230213-125630
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/execve
patch link:    https://lore.kernel.org/r/20230213045351.3945824-6-debug%40rivosinc.com
patch subject: [PATCH v1 RFC Zisslpcfi 05/20] mmap : Introducing new protection "PROT_SHADOWSTACK" for mmap
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20230213/202302131549.Yg5gbZzC-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/567be16af6179da28239989ce50ddbf6a56c2d46
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Deepak-Gupta/sslp-stubs-shadow-stack-and-landing-pad-stubs/20230213-125630
        git checkout 567be16af6179da28239989ce50ddbf6a56c2d46
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302131549.Yg5gbZzC-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/mmap.c: In function 'do_mmap':
>> mm/mmap.c:1256:21: error: 'PROT_SHADOWSTACK' undeclared (first use in this function)
    1256 |         if ((prot & PROT_SHADOWSTACK) && !arch_supports_shadow_stack())
         |                     ^~~~~~~~~~~~~~~~
   mm/mmap.c:1256:21: note: each undeclared identifier is reported only once for each function it appears in


vim +/PROT_SHADOWSTACK +1256 mm/mmap.c

  1236	
  1237	/*
  1238	 * The caller must write-lock current->mm->mmap_lock.
  1239	 */
  1240	unsigned long do_mmap(struct file *file, unsigned long addr,
  1241				unsigned long len, unsigned long prot,
  1242				unsigned long flags, unsigned long pgoff,
  1243				unsigned long *populate, struct list_head *uf)
  1244	{
  1245		struct mm_struct *mm = current->mm;
  1246		vm_flags_t vm_flags;
  1247		int pkey = 0;
  1248	
  1249		validate_mm(mm);
  1250		*populate = 0;
  1251	
  1252		if (!len)
  1253			return -EINVAL;
  1254	
  1255	       /* If PROT_SHADOWSTACK is specified and arch doesn't support it, return -EINVAL */
> 1256		if ((prot & PROT_SHADOWSTACK) && !arch_supports_shadow_stack())
  1257			return -EINVAL;
  1258		/*
  1259		 * Does the application expect PROT_READ to imply PROT_EXEC?
  1260		 *
  1261		 * (the exception is when the underlying filesystem is noexec
  1262		 *  mounted, in which case we dont add PROT_EXEC.)
  1263		 */
  1264		if ((prot & PROT_READ) && (current->personality & READ_IMPLIES_EXEC))
  1265			if (!(file && path_noexec(&file->f_path)))
  1266				prot |= PROT_EXEC;
  1267	
  1268		/* force arch specific MAP_FIXED handling in get_unmapped_area */
  1269		if (flags & MAP_FIXED_NOREPLACE)
  1270			flags |= MAP_FIXED;
  1271	
  1272		if (!(flags & MAP_FIXED))
  1273			addr = round_hint_to_min(addr);
  1274	
  1275		/* Careful about overflows.. */
  1276		len = PAGE_ALIGN(len);
  1277		if (!len)
  1278			return -ENOMEM;
  1279	
  1280		/* offset overflow? */
  1281		if ((pgoff + (len >> PAGE_SHIFT)) < pgoff)
  1282			return -EOVERFLOW;
  1283	
  1284		/* Too many mappings? */
  1285		if (mm->map_count > sysctl_max_map_count)
  1286			return -ENOMEM;
  1287	
  1288		/* Obtain the address to map to. we verify (or select) it and ensure
  1289		 * that it represents a valid section of the address space.
  1290		 */
  1291		addr = get_unmapped_area(file, addr, len, pgoff, flags);
  1292		if (IS_ERR_VALUE(addr))
  1293			return addr;
  1294	
  1295		if (flags & MAP_FIXED_NOREPLACE) {
  1296			if (find_vma_intersection(mm, addr, addr + len))
  1297				return -EEXIST;
  1298		}
  1299	
  1300		if (prot == PROT_EXEC) {
  1301			pkey = execute_only_pkey(mm);
  1302			if (pkey < 0)
  1303				pkey = 0;
  1304		}
  1305	
  1306		/* Do simple checking here so the lower-level routines won't have
  1307		 * to. we assume access permissions have been handled by the open
  1308		 * of the memory object, so we don't do any here.
  1309		 */
  1310		vm_flags = calc_vm_prot_bits(prot, pkey) | calc_vm_flag_bits(flags) |
  1311				mm->def_flags | VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC;
  1312	
  1313		if (flags & MAP_LOCKED)
  1314			if (!can_do_mlock())
  1315				return -EPERM;
  1316	
  1317		if (mlock_future_check(mm, vm_flags, len))
  1318			return -EAGAIN;
  1319	
  1320		if (file) {
  1321			struct inode *inode = file_inode(file);
  1322			unsigned long flags_mask;
  1323	
  1324			if (!file_mmap_ok(file, inode, pgoff, len))
  1325				return -EOVERFLOW;
  1326	
  1327			flags_mask = LEGACY_MAP_MASK | file->f_op->mmap_supported_flags;
  1328	
  1329			switch (flags & MAP_TYPE) {
  1330			case MAP_SHARED:
  1331				/*
  1332				 * Force use of MAP_SHARED_VALIDATE with non-legacy
  1333				 * flags. E.g. MAP_SYNC is dangerous to use with
  1334				 * MAP_SHARED as you don't know which consistency model
  1335				 * you will get. We silently ignore unsupported flags
  1336				 * with MAP_SHARED to preserve backward compatibility.
  1337				 */
  1338				flags &= LEGACY_MAP_MASK;
  1339				fallthrough;
  1340			case MAP_SHARED_VALIDATE:
  1341				if (flags & ~flags_mask)
  1342					return -EOPNOTSUPP;
  1343				if (prot & PROT_WRITE) {
  1344					if (!(file->f_mode & FMODE_WRITE))
  1345						return -EACCES;
  1346					if (IS_SWAPFILE(file->f_mapping->host))
  1347						return -ETXTBSY;
  1348				}
  1349	
  1350				/*
  1351				 * Make sure we don't allow writing to an append-only
  1352				 * file..
  1353				 */
  1354				if (IS_APPEND(inode) && (file->f_mode & FMODE_WRITE))
  1355					return -EACCES;
  1356	
  1357				vm_flags |= VM_SHARED | VM_MAYSHARE;
  1358				if (!(file->f_mode & FMODE_WRITE))
  1359					vm_flags &= ~(VM_MAYWRITE | VM_SHARED);
  1360				fallthrough;
  1361			case MAP_PRIVATE:
  1362				if (!(file->f_mode & FMODE_READ))
  1363					return -EACCES;
  1364				if (path_noexec(&file->f_path)) {
  1365					if (vm_flags & VM_EXEC)
  1366						return -EPERM;
  1367					vm_flags &= ~VM_MAYEXEC;
  1368				}
  1369	
  1370				if (!file->f_op->mmap)
  1371					return -ENODEV;
  1372				if (vm_flags & (VM_GROWSDOWN|VM_GROWSUP))
  1373					return -EINVAL;
  1374				break;
  1375	
  1376			default:
  1377				return -EINVAL;
  1378			}
  1379		} else {
  1380			switch (flags & MAP_TYPE) {
  1381			case MAP_SHARED:
  1382				if (vm_flags & (VM_GROWSDOWN|VM_GROWSUP))
  1383					return -EINVAL;
  1384				/*
  1385				 * Ignore pgoff.
  1386				 */
  1387				pgoff = 0;
  1388				vm_flags |= VM_SHARED | VM_MAYSHARE;
  1389				break;
  1390			case MAP_PRIVATE:
  1391				/*
  1392				 * Set pgoff according to addr for anon_vma.
  1393				 */
  1394				pgoff = addr >> PAGE_SHIFT;
  1395				break;
  1396			default:
  1397				return -EINVAL;
  1398			}
  1399		}
  1400	
  1401		/*
  1402		 * Set 'VM_NORESERVE' if we should not account for the
  1403		 * memory use of this mapping.
  1404		 */
  1405		if (flags & MAP_NORESERVE) {
  1406			/* We honor MAP_NORESERVE if allowed to overcommit */
  1407			if (sysctl_overcommit_memory != OVERCOMMIT_NEVER)
  1408				vm_flags |= VM_NORESERVE;
  1409	
  1410			/* hugetlb applies strict overcommit unless MAP_NORESERVE */
  1411			if (file && is_file_hugepages(file))
  1412				vm_flags |= VM_NORESERVE;
  1413		}
  1414	
  1415		addr = mmap_region(file, addr, len, vm_flags, pgoff, uf);
  1416		if (!IS_ERR_VALUE(addr) &&
  1417		    ((vm_flags & VM_LOCKED) ||
  1418		     (flags & (MAP_POPULATE | MAP_NONBLOCK)) == MAP_POPULATE))
  1419			*populate = len;
  1420		return addr;
  1421	}
  1422	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
