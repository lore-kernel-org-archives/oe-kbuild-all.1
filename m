Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF41820E6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Apr 2023 04:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682743315; x=1714279315;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=F2hTU/F5aDIuC5oVO+uzOUZWYBtLqTWeHisfsGta3qY=;
  b=b8RQHi+LmHJjKu6FeC5yDy42MIaSByX+E9VnThp5o2bZTwLKCmx0wvVg
   dxLiGwkJ74U4JabDM/m7ZrVKHnIyJSkASWZ1ELQkiHaSRO+DFRy69MIwN
   yWEca99C78YMTKCjhVtYYts8WUZcIyk+0YG2V63fZIOYyxatGZiRV/uVy
   lFhGmiwoy1TGkTzbDNGzKioWNbFGdoc2Y5kaGTX/Yxp9pmVWUhZpkOd+6
   +C1V7QL2/MNJcKtpbneqg/D2SDs2dWBTyO+GnoUyYUa2j0DwRdh7RCgPl
   RQ8LZpoRBZx9m04f0iMzH09n0Nz4T/JdM8IHSrrEPDH4xeLFXbboH/DD1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="349936655"
X-IronPort-AV: E=Sophos;i="5.99,236,1677571200"; 
   d="scan'208";a="349936655"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 21:41:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="819256460"
X-IronPort-AV: E=Sophos;i="5.99,236,1677571200"; 
   d="scan'208";a="819256460"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 28 Apr 2023 21:41:53 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pscPA-0000tP-2L;
	Sat, 29 Apr 2023 04:41:52 +0000
Date: Sat, 29 Apr 2023 12:41:25 +0800
From: kernel test robot <lkp@intel.com>
To: Khalid Aziz <khalid.aziz@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v2 2/4] mm/ptshare: Add flag MAP_SHARED_PT to mmap()
Message-ID: <202304291211.bGS09oRt-lkp@intel.com>
References: <63bb4b1339bbdf33c3412cdd097af61285162cf5.1682453344.git.khalid.aziz@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63bb4b1339bbdf33c3412cdd097af61285162cf5.1682453344.git.khalid.aziz@oracle.com>

Hi Khalid,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on arnd-asm-generic/master]
[also build test WARNING on vfs-idmapping/for-next linus/master v6.3 next-20230428]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Khalid-Aziz/mm-ptshare-Add-vm-flag-for-shared-PTE/20230427-005143
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git master
patch link:    https://lore.kernel.org/r/63bb4b1339bbdf33c3412cdd097af61285162cf5.1682453344.git.khalid.aziz%40oracle.com
patch subject: [PATCH RFC v2 2/4] mm/ptshare: Add flag MAP_SHARED_PT to mmap()
config: x86_64-rhel-8.3-kselftests (https://download.01.org/0day-ci/archive/20230429/202304291211.bGS09oRt-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/a943075cdada2a04dc4ec8a3b5d15981456bb7bf
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Khalid-Aziz/mm-ptshare-Add-vm-flag-for-shared-PTE/20230427-005143
        git checkout a943075cdada2a04dc4ec8a3b5d15981456bb7bf
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304291211.bGS09oRt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/mmap.c: In function 'do_mmap':
>> mm/mmap.c:1200:13: warning: variable 'ptshare' set but not used [-Wunused-but-set-variable]
    1200 |         int ptshare = 0;
         |             ^~~~~~~


vim +/ptshare +1200 mm/mmap.c

  1188	
  1189	/*
  1190	 * The caller must write-lock current->mm->mmap_lock.
  1191	 */
  1192	unsigned long do_mmap(struct file *file, unsigned long addr,
  1193				unsigned long len, unsigned long prot,
  1194				unsigned long flags, unsigned long pgoff,
  1195				unsigned long *populate, struct list_head *uf)
  1196	{
  1197		struct mm_struct *mm = current->mm;
  1198		vm_flags_t vm_flags;
  1199		int pkey = 0;
> 1200		int ptshare = 0;
  1201	
  1202		validate_mm(mm);
  1203		*populate = 0;
  1204	
  1205		if (!len)
  1206			return -EINVAL;
  1207	
  1208		/*
  1209		 * Does the application expect PROT_READ to imply PROT_EXEC?
  1210		 *
  1211		 * (the exception is when the underlying filesystem is noexec
  1212		 *  mounted, in which case we dont add PROT_EXEC.)
  1213		 */
  1214		if ((prot & PROT_READ) && (current->personality & READ_IMPLIES_EXEC))
  1215			if (!(file && path_noexec(&file->f_path)))
  1216				prot |= PROT_EXEC;
  1217	
  1218		/* force arch specific MAP_FIXED handling in get_unmapped_area */
  1219		if (flags & MAP_FIXED_NOREPLACE)
  1220			flags |= MAP_FIXED;
  1221	
  1222		if (!(flags & MAP_FIXED))
  1223			addr = round_hint_to_min(addr);
  1224	
  1225		/* Careful about overflows.. */
  1226		len = PAGE_ALIGN(len);
  1227		if (!len)
  1228			return -ENOMEM;
  1229	
  1230		/* offset overflow? */
  1231		if ((pgoff + (len >> PAGE_SHIFT)) < pgoff)
  1232			return -EOVERFLOW;
  1233	
  1234		/* Too many mappings? */
  1235		if (mm->map_count > sysctl_max_map_count)
  1236			return -ENOMEM;
  1237	
  1238		/*
  1239		 * If MAP_SHARED_PT is set, MAP_SHARED or MAP_SHARED_VALIDATE must
  1240		 * be set as well
  1241		 */
  1242		if (flags & MAP_SHARED_PT) {
  1243	#if VM_SHARED_PT
  1244			if (flags & (MAP_SHARED | MAP_SHARED_VALIDATE))
  1245				ptshare = 1;
  1246			else
  1247				return -EINVAL;
  1248	#else
  1249			return -EINVAL;
  1250	#endif
  1251		}
  1252	
  1253		/* Obtain the address to map to. we verify (or select) it and ensure
  1254		 * that it represents a valid section of the address space.
  1255		 */
  1256		addr = get_unmapped_area(file, addr, len, pgoff, flags);
  1257		if (IS_ERR_VALUE(addr))
  1258			return addr;
  1259	
  1260		if (flags & MAP_FIXED_NOREPLACE) {
  1261			if (find_vma_intersection(mm, addr, addr + len))
  1262				return -EEXIST;
  1263		}
  1264	
  1265		if (prot == PROT_EXEC) {
  1266			pkey = execute_only_pkey(mm);
  1267			if (pkey < 0)
  1268				pkey = 0;
  1269		}
  1270	
  1271		/* Do simple checking here so the lower-level routines won't have
  1272		 * to. we assume access permissions have been handled by the open
  1273		 * of the memory object, so we don't do any here.
  1274		 */
  1275		vm_flags = calc_vm_prot_bits(prot, pkey) | calc_vm_flag_bits(flags) |
  1276				mm->def_flags | VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC;
  1277	
  1278		if (flags & MAP_LOCKED)
  1279			if (!can_do_mlock())
  1280				return -EPERM;
  1281	
  1282		if (mlock_future_check(mm, vm_flags, len))
  1283			return -EAGAIN;
  1284	
  1285		if (file) {
  1286			struct inode *inode = file_inode(file);
  1287			unsigned long flags_mask;
  1288	
  1289			if (!file_mmap_ok(file, inode, pgoff, len))
  1290				return -EOVERFLOW;
  1291	
  1292			flags_mask = LEGACY_MAP_MASK | file->f_op->mmap_supported_flags;
  1293	
  1294			switch (flags & MAP_TYPE) {
  1295			case MAP_SHARED:
  1296				/*
  1297				 * Force use of MAP_SHARED_VALIDATE with non-legacy
  1298				 * flags. E.g. MAP_SYNC is dangerous to use with
  1299				 * MAP_SHARED as you don't know which consistency model
  1300				 * you will get. We silently ignore unsupported flags
  1301				 * with MAP_SHARED to preserve backward compatibility.
  1302				 */
  1303				flags &= LEGACY_MAP_MASK;
  1304				fallthrough;
  1305			case MAP_SHARED_VALIDATE:
  1306				if (flags & ~flags_mask)
  1307					return -EOPNOTSUPP;
  1308				if (prot & PROT_WRITE) {
  1309					if (!(file->f_mode & FMODE_WRITE))
  1310						return -EACCES;
  1311					if (IS_SWAPFILE(file->f_mapping->host))
  1312						return -ETXTBSY;
  1313				}
  1314	
  1315				/*
  1316				 * Make sure we don't allow writing to an append-only
  1317				 * file..
  1318				 */
  1319				if (IS_APPEND(inode) && (file->f_mode & FMODE_WRITE))
  1320					return -EACCES;
  1321	
  1322				vm_flags |= VM_SHARED | VM_MAYSHARE;
  1323				if (!(file->f_mode & FMODE_WRITE))
  1324					vm_flags &= ~(VM_MAYWRITE | VM_SHARED);
  1325				fallthrough;
  1326			case MAP_PRIVATE:
  1327				if (!(file->f_mode & FMODE_READ))
  1328					return -EACCES;
  1329				if (path_noexec(&file->f_path)) {
  1330					if (vm_flags & VM_EXEC)
  1331						return -EPERM;
  1332					vm_flags &= ~VM_MAYEXEC;
  1333				}
  1334	
  1335				if (!file->f_op->mmap)
  1336					return -ENODEV;
  1337				if (vm_flags & (VM_GROWSDOWN|VM_GROWSUP))
  1338					return -EINVAL;
  1339				break;
  1340	
  1341			default:
  1342				return -EINVAL;
  1343			}
  1344		} else {
  1345			switch (flags & MAP_TYPE) {
  1346			case MAP_SHARED:
  1347				if (vm_flags & (VM_GROWSDOWN|VM_GROWSUP))
  1348					return -EINVAL;
  1349				/*
  1350				 * Ignore pgoff.
  1351				 */
  1352				pgoff = 0;
  1353				vm_flags |= VM_SHARED | VM_MAYSHARE;
  1354				break;
  1355			case MAP_PRIVATE:
  1356				/*
  1357				 * Set pgoff according to addr for anon_vma.
  1358				 */
  1359				pgoff = addr >> PAGE_SHIFT;
  1360				break;
  1361			default:
  1362				return -EINVAL;
  1363			}
  1364		}
  1365	
  1366		/*
  1367		 * Set 'VM_NORESERVE' if we should not account for the
  1368		 * memory use of this mapping.
  1369		 */
  1370		if (flags & MAP_NORESERVE) {
  1371			/* We honor MAP_NORESERVE if allowed to overcommit */
  1372			if (sysctl_overcommit_memory != OVERCOMMIT_NEVER)
  1373				vm_flags |= VM_NORESERVE;
  1374	
  1375			/* hugetlb applies strict overcommit unless MAP_NORESERVE */
  1376			if (file && is_file_hugepages(file))
  1377				vm_flags |= VM_NORESERVE;
  1378		}
  1379	
  1380		addr = mmap_region(file, addr, len, vm_flags, pgoff, uf);
  1381		if (!IS_ERR_VALUE(addr) &&
  1382		    ((vm_flags & VM_LOCKED) ||
  1383		     (flags & (MAP_POPULATE | MAP_NONBLOCK)) == MAP_POPULATE))
  1384			*populate = len;
  1385		return addr;
  1386	}
  1387	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
