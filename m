Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1923030CDAA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Nov 2025 22:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763765339; cv=none; b=AJaebvH9nCgjkMpPzaCL05IUb7G2IlbtfjeDXgoT6/1wKZEajeOkpTLxQ+B7X1N8W9zU6xjUygdvXZXjbagAoAYT87rU10wJfKaWnXOGRp12cZ5cXZrLevbJW18RhtE2KjVTerbvdD1umbemGkoFR+i9V4NooJfVTNleQeiMPKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763765339; c=relaxed/simple;
	bh=SJUJREyDOnue43JJwtfKawHk2+Wo+9cAaLPLd7SvlNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TWX7o1u/wULIFh/qr5PCrrg/SDL7VpzimLvpvEAszeJuN4YfqOBUoJPGGRwqz9zJQtbajBD16rzUTZEI9f9nuxePhprMBPIs4QJdyT6QJOPbKBAxPvkFBla3qj2jEKIUGEeEfbYGmH9EmM2c1hV7m6wVZU4RNkyZ5oV3dKgjsgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GxjIAXQt; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GxjIAXQt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763765336; x=1795301336;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SJUJREyDOnue43JJwtfKawHk2+Wo+9cAaLPLd7SvlNg=;
  b=GxjIAXQttICke8vZ/w7fUfnTxlvTx3fIzBGduL0kuidGMadynjeM7RMf
   Hy1dmf0pgN+/pL/cwwEqWqtfQITx4GQWGrj/UnaEdDcYOzuCOOLGZ04Mi
   khxhYqLLoo1Jpgkj6nrbAWvrrBtE/iH7fqH4g6OdZ0movMqMpySb63Jqg
   wOe/xcfiygIxONAcSTvEIp6EkNzwQX+gmlAQvl7l1qUn3hw+yve5G8uUU
   DsHUjSvNDVlvplh0GBz05KglbnVzdgr2d4Epll50ClH4MMnbMMR/4cQZ/
   jhvdbPkQE3r7T2lRNYI1pixgfMeeOmE0bYlYImFPj/AKbX9fhfQGa5S0T
   A==;
X-CSE-ConnectionGUID: BnMpjB57Q++3jKOc0ijOww==
X-CSE-MsgGUID: UTDVTsc4Qn+0SEf1Sp1K8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65749120"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="65749120"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 14:48:53 -0800
X-CSE-ConnectionGUID: gycCK+/tQ4C9YuRr8gyMnQ==
X-CSE-MsgGUID: Ukkt/bnfTeeHEL9oDKxXOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="229105894"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 Nov 2025 14:48:51 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMZvt-0006w3-0j;
	Fri, 21 Nov 2025 22:48:49 +0000
Date: Sat, 22 Nov 2025 06:48:04 +0800
From: kernel test robot <lkp@intel.com>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v9 2/7] mm: introduce clear_pages() and clear_user_pages()
Message-ID: <202511220604.AijSWn1l-lkp@intel.com>
References: <20251121202352.494700-3-ankur.a.arora@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121202352.494700-3-ankur.a.arora@oracle.com>

Hi Ankur,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.18-rc6 next-20251121]
[cannot apply to akpm-mm/mm-everything tip/x86/core arm64/for-next/core gerg-m68knommu/for-next deller-parisc/for-next powerpc/next powerpc/fixes s390/features uml/next vgupta-arc/for-next vgupta-arc/for-curr openrisc/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ankur-Arora/treewide-provide-a-generic-clear_user_page-variant/20251122-042758
base:   linus/master
patch link:    https://lore.kernel.org/r/20251121202352.494700-3-ankur.a.arora%40oracle.com
patch subject: [PATCH v9 2/7] mm: introduce clear_pages() and clear_user_pages()
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20251122/202511220604.AijSWn1l-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511220604.AijSWn1l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511220604.AijSWn1l-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/util.c:1349:6: error: redefinition of 'clear_user_pages'
    1349 | void clear_user_pages(void *addr, unsigned long vaddr,
         |      ^~~~~~~~~~~~~~~~
   In file included from mm/util.c:2:
   include/linux/mm.h:3938:20: note: previous definition of 'clear_user_pages' with type 'void(void *, long unsigned int,  struct page *, unsigned int)'
    3938 | static inline void clear_user_pages(void *addr, unsigned long vaddr,
         |                    ^~~~~~~~~~~~~~~~


vim +/clear_user_pages +1349 mm/util.c

  1347	
  1348	#ifdef clear_user_page
> 1349	void clear_user_pages(void *addr, unsigned long vaddr,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
