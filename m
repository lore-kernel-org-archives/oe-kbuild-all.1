Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCED1991CB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Feb 2026 05:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771132820; cv=none; b=o+MbvxnYN5ECq9n+gI+6WTsac1rfG7fMT2aCODPztUVvFj02L2+z+/p9UtFvTT8UnvsytvdupSWbpmwrVSBEuAeQS736OC5C7joDsLH1tDTibN6Vw0xOSXKWK0nR6B5nBpjNSQ9UEYjhAsFX3Xn5bOHnyIt4uPQGVFG2QoHDO+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771132820; c=relaxed/simple;
	bh=91BjDykpQZbtwZp4AJv78CJZ0tt240trqJOaI73YaIg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Og1vctD0EFCNXGK5IDTyMx3NUe38Agf/51keBl2DJ0zCJvJEMbemfskklHS98QfrMcvNcUAYt5zyGi59y4o+h/K4stIebPHKbBuhWLcFdP09xecRz0FKg5HQ8BdnrsXqL/IrZgmtZ62PV7HR68YpEi7oMH6/YhAInoglbAnLJbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MScmKpqz; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MScmKpqz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771132818; x=1802668818;
  h=date:from:to:cc:subject:message-id;
  bh=91BjDykpQZbtwZp4AJv78CJZ0tt240trqJOaI73YaIg=;
  b=MScmKpqz+Uc3KLvKX8yHSwUIaxssHWCNB5QBv0BvsYgAapilIhhPHK4l
   wf65vVwlAo3rjMynfMQzKVEYC4aJwK3hKij9zwMh2ZKwx53ZQS2/pY7y8
   jX2qS3BjTWAYcI1QzjUVB6ue2r6Ow5CMH6TZdTElFUbB5FvtV4X6PtduW
   bK+axKYWGk2LS09tuJwGU4PbEQgcANwUt5KtpQpRTLRWKb5Qwg0EuYlZO
   sQpSL831K8CUp2VKR/bLsiDqED35UZV23H2QLKyG0sofGkCvyU9Qj4O6q
   MgROTdQNq/3O/0aiH0u/lBwHTi157/ze+Mnh4QIA1LKSgzIMkuogjYaEO
   g==;
X-CSE-ConnectionGUID: TpgTQmTiT9CkRQTKJK2e5Q==
X-CSE-MsgGUID: 86Y4b1eoRXieHn+4vIfaqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11701"; a="72433138"
X-IronPort-AV: E=Sophos;i="6.21,291,1763452800"; 
   d="scan'208";a="72433138"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2026 21:20:17 -0800
X-CSE-ConnectionGUID: nEPSKvLZTKWm73KpAvmXxA==
X-CSE-MsgGUID: pFpR7n3uQ6KWRW3XojFk7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,291,1763452800"; 
   d="scan'208";a="211905719"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Feb 2026 21:20:16 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrUYH-00000000xUq-3Txx;
	Sun, 15 Feb 2026 05:20:13 +0000
Date: Sun, 15 Feb 2026 13:20:07 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 79/86]
 include/linux/pagewalk.h:205:17: error: implicit declaration of function
 'pte_unmap'; did you mean 'pmb_unmap'?
Message-ID: <202602151301.jIG2Y3HZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/bvanassche/linux thread-safety
head:   5dae0ec94ba21bf42e2cc04d42968fdab61ea4ca
commit: 07fde9a9dc7f957c183217bfa90b01e74f08be2a [79/86] treewide: Add lock context annotations in all include files
config: sh-allnoconfig (https://download.01.org/0day-ci/archive/20260215/202602151301.jIG2Y3HZ-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260215/202602151301.jIG2Y3HZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602151301.jIG2Y3HZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/internal.h:15,
                    from mm/filemap.c:54:
   include/linux/pagewalk.h: In function 'folio_walk_end':
>> include/linux/pagewalk.h:205:17: error: implicit declaration of function 'pte_unmap'; did you mean 'pmb_unmap'? [-Wimplicit-function-declaration]
     205 |                 pte_unmap(fw->ptep);
         |                 ^~~~~~~~~
         |                 pmb_unmap


vim +205 include/linux/pagewalk.h

   195	
   196	struct folio *folio_walk_start(struct folio_walk *fw,
   197			struct vm_area_struct *vma, unsigned long addr,
   198			folio_walk_flags_t flags);
   199	
   200	static inline void folio_walk_end(struct folio_walk *fw, struct vm_area_struct *vma)
   201		__no_context_analysis /* conditional locking */
   202	{
   203		spin_unlock(fw->ptl);
   204		if (likely(fw->level == FW_LEVEL_PTE))
 > 205			pte_unmap(fw->ptep);
   206		vma_pgtable_walk_end(vma);
   207	}
   208	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
