Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F851D0E2F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Oct 2024 20:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728677139; cv=none; b=C2mIYx5VqP8bXGyBQHb94DJOlmpOCD/KwJHisWo23MTXuLshYLbiJ4trRIqnC3YNKjEkeO2ZK6W7TZahDWmkdmE7It++9WTTtf66IY8duN9l0RhoqD4eHZWZlcAlH4+D1jfNtSLG5rwAqu3axzr2trEOvElzR0vVxLnUNyiTybA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728677139; c=relaxed/simple;
	bh=typeOLpuwI8EkPVUrco3wB1iE1XOaXXZP/UUTCqIqjs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XMOJoE8yXqzL2vxLue0n6jurallHKN1rWekS+FfJUbMA7dWZpEQwmn5mxyQ8W/5cNOERqpPCkXWtb0rzbl2KdGfuEZWqQnOSi/X2i5iiRD9kCzjm0NfF/LDX6IOCvIr8sThTRXD35Q2E+l0/Z4tHTk31T0HXymbFlJN5r1WKO9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LGd9JjTC; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LGd9JjTC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728677138; x=1760213138;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=typeOLpuwI8EkPVUrco3wB1iE1XOaXXZP/UUTCqIqjs=;
  b=LGd9JjTCz+HHQBRXI6EFwFIBSGvv9aR4OvG6HrAp6htBOMRqQhcLrBL+
   10JceIb042hUfcS47h4/8Qe7fj9cvSxvXBpazjftQsOO7fvAqZ/cmIWt+
   Hk6LoSHbvZ/S+QUsfqNSRCNUZRYOLv7mPJgEbJQOm464ETKQCzH9HDDGl
   Wii688ruhSgGZ2ZyQGoPjUGBJE5GdX4ew4Gj++lmaejeqXooUZSw5bZ0s
   mlZmFnpGvw8mRX3MUImTfXNfvdGHxssyAQ0WlYwMPMC9WKJhQfPdxpKId
   62S/RB69SUEXilhtB79H+bLfszmAbJ/blGQXVIgp5ozETlDPUXdv8GdbS
   A==;
X-CSE-ConnectionGUID: IlD+X2s8RC2rL1lOyhRaaA==
X-CSE-MsgGUID: Bx1uy5XCRlqDr6FEAGneZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31878810"
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; 
   d="scan'208";a="31878810"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 13:05:35 -0700
X-CSE-ConnectionGUID: rZB/U4/1TtujilGaMSCstQ==
X-CSE-MsgGUID: 7GCME9mjSy+9GZNwIkijLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; 
   d="scan'208";a="81623862"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Oct 2024 13:05:34 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szLtE-000Ch1-03;
	Fri, 11 Oct 2024 20:05:32 +0000
Date: Sat, 12 Oct 2024 04:04:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 71/72] mm/vmscan.c:1280:27: error: implicit
 declaration of function 'lru_raw_gen_from_flags'
Message-ID: <202410120401.AZlKhnl5-lkp@intel.com>
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
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241012/202410120401.AZlKhnl5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241012/202410120401.AZlKhnl5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410120401.AZlKhnl5-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/vmscan.c: In function 'page_check_references':
>> mm/vmscan.c:1280:27: error: implicit declaration of function 'lru_raw_gen_from_flags' [-Werror=implicit-function-declaration]
    1280 |                 int gen = lru_raw_gen_from_flags(READ_ONCE(page->flags));
         |                           ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/bits.h:22,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/printk.h:10,
                    from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:86,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:9,
                    from mm/vmscan.c:15:
>> mm/vmscan.c:1282:44: error: 'ISOLATED_PAGE_MIN' undeclared (first use in this function)
    1282 |                 VM_WARN_ON_ONCE_PAGE(gen < ISOLATED_PAGE_MIN, page);
         |                                            ^~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:30:63: note: in definition of macro 'BUILD_BUG_ON_INVALID'
      30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
         |                                                               ^
   mm/vmscan.c:1282:17: note: in expansion of macro 'VM_WARN_ON_ONCE_PAGE'
    1282 |                 VM_WARN_ON_ONCE_PAGE(gen < ISOLATED_PAGE_MIN, page);
         |                 ^~~~~~~~~~~~~~~~~~~~
   mm/vmscan.c:1282:44: note: each undeclared identifier is reported only once for each function it appears in
    1282 |                 VM_WARN_ON_ONCE_PAGE(gen < ISOLATED_PAGE_MIN, page);
         |                                            ^~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:30:63: note: in definition of macro 'BUILD_BUG_ON_INVALID'
      30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
         |                                                               ^
   mm/vmscan.c:1282:17: note: in expansion of macro 'VM_WARN_ON_ONCE_PAGE'
    1282 |                 VM_WARN_ON_ONCE_PAGE(gen < ISOLATED_PAGE_MIN, page);
         |                 ^~~~~~~~~~~~~~~~~~~~
   mm/vmscan.c: In function 'demote_page_list':
   mm/vmscan.c:1388:13: warning: variable 'err' set but not used [-Wunused-but-set-variable]
    1388 |         int err;
         |             ^~~
   cc1: some warnings being treated as errors


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
