Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127DF1E2845
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 May 2025 08:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746087710; cv=none; b=gt7fWSXhpJm8Ma4m0IA8OziSYOTueUfhpa3YJ8kb5HoIYDpR1GfABxt/b/wZuMDjxXTcC6XoCjF/FEJl+4bQxLsWuMIDq6PNV1v4pwEEEW5f61TyknwzEUxqF9AGiE0Zlf+/tyHAyqbYUSEfG5FM0YYPd4qe6uSeY9gCCLptNdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746087710; c=relaxed/simple;
	bh=JrsVqruNLqAV/ELgH8TllIVis2N3L4EgEF29lBaO2s0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e56GHgNbaVooaj1f6Kw/sKanUTWtWilnbu0SpURgAS07aBYfxxRAhZBN1P61ezlP+QF4upIqzH7v5GgPXRuzne6LXZ/6FRcVMDGOA0p6VbceFN0U3nuJkKYVbPun2MdwVCEFlWqBJqLzTLJjOC6/B5vuHs55mB7AEwFg28pyr1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bxKalsuz; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bxKalsuz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746087708; x=1777623708;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JrsVqruNLqAV/ELgH8TllIVis2N3L4EgEF29lBaO2s0=;
  b=bxKalsuztBrm/iJlBJEzU3bNHEdRf6sgocIFULSZXIZ5iqydaS9xsjxV
   zUQYqaYMwXpgJvM3tsYNIzLjpkJlW51p94LpUoj0o6E5JWajZV5D4k98T
   ioV4+stmV1FZTQ0j+TTlqzfhcVZFVr1VIhYtxaFWWZaYV++IfP+TBvuYt
   NCtcMj0EsBYOp/+lTMNFt4qQOfPYsXCAMwMQomMYPtmfAMn3mzvcSl//w
   aFzyN3u9nGv0cKY+jCmy8dgj0LEtJMZgu8vCqPHHZ+4ip4bYBTlL7D6RV
   6H0JrmV4d9weus/kwzqNcgkYXt2lTZK4BjxhwUztXGsOj8J78cTDhrrSr
   A==;
X-CSE-ConnectionGUID: u/ZcgWq4QDW2N4Pjhuc3iA==
X-CSE-MsgGUID: JQNwtDOrRyafdU3tzgG9iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="47476824"
X-IronPort-AV: E=Sophos;i="6.15,253,1739865600"; 
   d="scan'208";a="47476824"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 01:21:48 -0700
X-CSE-ConnectionGUID: hCBzJqj9R1+0n+HPsXkreA==
X-CSE-MsgGUID: M3ehJoPSRzGDlQDeyfmp9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,253,1739865600"; 
   d="scan'208";a="139149152"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 01 May 2025 01:21:46 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAPAt-00043N-2m;
	Thu, 01 May 2025 08:21:43 +0000
Date: Thu, 1 May 2025 16:21:01 +0800
From: kernel test robot <lkp@intel.com>
To: Shivank Garg <shivankg@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 272/272] fs/jfs/jfs_metapage.c:637: warning:
 Function parameter or struct member 'mapping' not described in
 'metapage_migrate_folio'
Message-ID: <202505011647.L0LGO7Lm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   ea17e4fdc13cae144d90ce8561c2f50a49492037
commit: ea17e4fdc13cae144d90ce8561c2f50a49492037 [272/272] jfs: implement migrate_folio for jfs_metapage_aops
config: csky-randconfig-002-20250501 (https://download.01.org/0day-ci/archive/20250501/202505011647.L0LGO7Lm-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250501/202505011647.L0LGO7Lm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505011647.L0LGO7Lm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/jfs/jfs_metapage.c:637: warning: Function parameter or struct member 'mapping' not described in 'metapage_migrate_folio'
>> fs/jfs/jfs_metapage.c:637: warning: Function parameter or struct member 'dst' not described in 'metapage_migrate_folio'
>> fs/jfs/jfs_metapage.c:637: warning: Function parameter or struct member 'src' not described in 'metapage_migrate_folio'
>> fs/jfs/jfs_metapage.c:637: warning: Function parameter or struct member 'mode' not described in 'metapage_migrate_folio'


vim +637 fs/jfs/jfs_metapage.c

   631	
   632	/**
   633	 * metapage_migrate_folio - Migration function for JFS metapages
   634	 */
   635	static int metapage_migrate_folio(struct address_space *mapping, struct folio *dst,
   636					  struct folio *src, enum migrate_mode mode)
 > 637	{
   638		int expected_count;
   639	
   640		if (!src->private)
   641			return filemap_migrate_folio(mapping, dst, src, mode);
   642	
   643		/* Check whether page does not have extra refs before we do more work */
   644		expected_count = folio_expected_ref_count(src) + 1;
   645		if (folio_ref_count(src) != expected_count)
   646			return -EAGAIN;
   647		return __metapage_migrate_folio(mapping, dst, src, mode);
   648	}
   649	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
