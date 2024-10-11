Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17451CFEB8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Oct 2024 20:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728677137; cv=none; b=JEh1ky10z3ThKIdAEX8sufL2i1PBywBXbvxNnsXoTEpdLEpzrGygwOErQ2eaVFylDZmGVnHvkY0+bitt6SVtuVKWCLhvzVItQprvmPF5YO3wrnPqkljwYw7EiKIlTaFMKySFT+NJkqGpqzVj/OXX9tBwZBhZELlTPqkkMqog0+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728677137; c=relaxed/simple;
	bh=DUSsYWn7XLkbO1LykSv/UmgJQea20VBGG6havQ2jQvM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ftDSBvLSgLVkYzUSJs/vadTy8aEDvVi6XMbYmjRj/z20cs3Z7KDdiSB8xYlkAzzAWHTsGiTyKs8ciZQiYOt7km+jt2w7XyoaY3xXgUcy+J/cULXU5PzhplgXSJQb8hPMpobHF/HaUdRMfWYM+n/9q33e8u2uzknKK87WmidNf8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HM0lagKy; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HM0lagKy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728677136; x=1760213136;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DUSsYWn7XLkbO1LykSv/UmgJQea20VBGG6havQ2jQvM=;
  b=HM0lagKyUVG3ZN7hCsDgXbmPmEwiIJ9xpjMnIbIqv23j1IErEzQT0GUL
   ThToaFO56x+QBd4wE75PYUW69rbY1E8PGCyJfH2Oy6c8K3aFy+ndrTyFa
   UiP/T2ppmW4iIcttXZ158dYhDb4fs5teCm1XneC9xmWmU8J+EX0maUSba
   tucDSeCuEokHPAMJ+uC+kbWv6/ZEjy/3CRPC/YAKus2C7NN9xmYgRxkLy
   ILHTGFKF1TPnu29wW/k5cwWxZnd7JAH4UUwqX6VfijFiZAR9N3NILw1F6
   Cmu8aJBI+ydlrIFBanqtFkhBDgGGDZS+fcEjjsBmCKZoBQcOEq6gcPqGl
   A==;
X-CSE-ConnectionGUID: 0D6GNWBpSIe2nSyBtdlU8Q==
X-CSE-MsgGUID: hf1KDWI0RSeSPCmq45RqJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31878808"
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; 
   d="scan'208";a="31878808"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 13:05:35 -0700
X-CSE-ConnectionGUID: dhaE1y8JSPWdNuwJHaKicQ==
X-CSE-MsgGUID: q6Nv6DC2Qvy5r+VJ8Pr/Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; 
   d="scan'208";a="81623859"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Oct 2024 13:05:34 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szLtE-000Ch5-0B;
	Fri, 11 Oct 2024 20:05:32 +0000
Date: Sat, 12 Oct 2024 04:04:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 71/72] mm/vmscan.c:1280:13: error: call to
 undeclared function 'lru_raw_gen_from_flags'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202410120437.U9aISglH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   8070bf471f6494714b588bfa46646537475fe527
commit: 0e16017a6378e81a7876a5cdb78447b9171cb047 [71/72] CHROMIUM: mm/mglru: Improve isolated page access bit harvesting
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241012/202410120437.U9aISglH-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241012/202410120437.U9aISglH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410120437.U9aISglH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/vmscan.c:1280:13: error: call to undeclared function 'lru_raw_gen_from_flags'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1280 |                 int gen = lru_raw_gen_from_flags(READ_ONCE(page->flags));
         |                           ^
>> mm/vmscan.c:1282:30: error: use of undeclared identifier 'ISOLATED_PAGE_MIN'
    1282 |                 VM_WARN_ON_ONCE_PAGE(gen < ISOLATED_PAGE_MIN, page);
         |                                            ^
   mm/vmscan.c:1284:13: error: use of undeclared identifier 'ISOLATED_PAGE_MIN'
    1284 |                 if (gen > ISOLATED_PAGE_MIN)
         |                           ^
   mm/vmscan.c:1285:29: error: use of undeclared identifier 'ISOLATED_PAGE_MIN'
    1285 |                         referenced_ptes += gen - ISOLATED_PAGE_MIN;
         |                                                  ^
   mm/vmscan.c:1388:6: warning: variable 'err' set but not used [-Wunused-but-set-variable]
    1388 |         int err;
         |             ^
   1 warning and 4 errors generated.


vim +/lru_raw_gen_from_flags +1280 mm/vmscan.c

  1268	
  1269	static enum page_references page_check_references(struct page *page,
  1270							  struct scan_control *sc)
  1271	{
  1272		int referenced_ptes, referenced_page;
  1273		unsigned long vm_flags;
  1274	
  1275		referenced_ptes = page_referenced(page, 1, sc->target_mem_cgroup,
  1276						  &vm_flags);
  1277		referenced_page = TestClearPageReferenced(page);
  1278	
  1279		if (lru_gen_enabled()) {
> 1280			int gen = lru_raw_gen_from_flags(READ_ONCE(page->flags));
  1281	
> 1282			VM_WARN_ON_ONCE_PAGE(gen < ISOLATED_PAGE_MIN, page);
  1283	
  1284			if (gen > ISOLATED_PAGE_MIN)
  1285				referenced_ptes += gen - ISOLATED_PAGE_MIN;
  1286		}
  1287	
  1288		/*
  1289		 * Mlock lost the isolation race with us.  Let try_to_unmap()
  1290		 * move the page to the unevictable list.
  1291		 */
  1292		if (vm_flags & VM_LOCKED)
  1293			return PAGEREF_RECLAIM;
  1294	
  1295		if (referenced_ptes) {
  1296			/*
  1297			 * All mapped pages start out with page table
  1298			 * references from the instantiating fault, so we need
  1299			 * to look twice if a mapped file page is used more
  1300			 * than once.
  1301			 *
  1302			 * Mark it and spare it for another trip around the
  1303			 * inactive list.  Another page table reference will
  1304			 * lead to its activation.
  1305			 *
  1306			 * Note: the mark is set for activated pages as well
  1307			 * so that recently deactivated but used pages are
  1308			 * quickly recovered.
  1309			 */
  1310			SetPageReferenced(page);
  1311	
  1312			if (referenced_page || referenced_ptes > 1)
  1313				return PAGEREF_ACTIVATE;
  1314	
  1315			/*
  1316			 * Activate file-backed executable pages after first usage.
  1317			 */
  1318			if ((vm_flags & VM_EXEC) && !PageSwapBacked(page))
  1319				return PAGEREF_ACTIVATE;
  1320	
  1321			return PAGEREF_KEEP;
  1322		}
  1323	
  1324		/* Reclaim if clean, defer dirty pages to writeback */
  1325		if (referenced_page && !PageSwapBacked(page))
  1326			return PAGEREF_RECLAIM_CLEAN;
  1327	
  1328		return PAGEREF_RECLAIM;
  1329	}
  1330	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
