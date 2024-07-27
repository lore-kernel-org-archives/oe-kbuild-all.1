Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B30B1E52C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Jul 2024 12:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722084870; cv=none; b=PC1Py08vE2cnbpYrL4dQQUdo4ont7NIkeRndlP6L3WE3tzKbSbprxE0WOwRSpVev3PfgKB+GjJBlqMaXc0NMkJEGDlZd/tXuqpabwtKnfmcFwaUoo2Foy4+rl+REKTXwzAKQ+0d2hOuB3OXolvFw2CgpldzE1/9g+4IhXaTmGz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722084870; c=relaxed/simple;
	bh=AcLzANvDxl71kbm8X/7ZWE/ooopCYJPt/R2NVIynB4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M/GuDbe06Zg5SfgR4fKLtRHsS/yYbxxkCxTiBirFxeCd5zFvuvJTtWGcmANKcJGGMqSSHcCOtDHG4SEH5N+z1NaCX2WYVvmBK6K1PwmaQQrH8Qob4S4JNBD4dfLa6n1TMujxGQXQwBcBujD29L9IrunRwNUWv9N0OPQyxRZr/TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PL0fHHmN; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PL0fHHmN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722084868; x=1753620868;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AcLzANvDxl71kbm8X/7ZWE/ooopCYJPt/R2NVIynB4Q=;
  b=PL0fHHmNzn8ut4Gtcxad7pPRPSYg1UU1rRbNtZbIkH106ZhOh5iak0yP
   H1Es0DcMYPIDTdT+xWf5UbCrosgNdKx03xGOtyQ2S+K88+0wvK+OsMTaJ
   KCiWOXppsG1Ci1ozUrL39uJMTHLK7vJWUrl98BTxoi7fI2/Yo2ZxPl2ty
   UEirsecUqF6SJidL31eX3IMmdjU0mIaXovouQR/ib68BZCV363qjY/uD6
   PnxBqnFlLPif9Lhe027LF6yABv2C9yg3T20r6J+sczd+OSav+pLJedPsF
   +5hxLi6FXfj9NYoa8Cn1TezgyRvnpCBLN3y8s2fZ/Fgzpegv6XxUpr5Om
   w==;
X-CSE-ConnectionGUID: ADqPfN3zSWW+LS1jta0b9Q==
X-CSE-MsgGUID: kjFAXMb4Svq9X7xF6+Y7+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11146"; a="42401128"
X-IronPort-AV: E=Sophos;i="6.09,241,1716274800"; 
   d="scan'208";a="42401128"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2024 05:54:27 -0700
X-CSE-ConnectionGUID: be7kGxs2SUGv8NYIV+oMsw==
X-CSE-MsgGUID: Kf+d93cYQimHZcPa/a5jaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,241,1716274800"; 
   d="scan'208";a="53736559"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 27 Jul 2024 05:54:26 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sXgwK-000pwq-1l;
	Sat, 27 Jul 2024 12:54:24 +0000
Date: Sat, 27 Jul 2024 20:53:59 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:folio_walk 7/16] include/linux/pgtable.h:105:9:
 error: implicit declaration of function 'kunmap_local'
Message-ID: <202407272045.NMjkg4f4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux folio_walk
head:   cc3861ad49dec1480e237e1ecfbe2d4ffa64cafd
commit: 77eea7c11c7ddc881412df294d15467ed7cb57e6 [7/16] mm/pagewalk: introduce folio_walk_start() + folio_walk_end()
config: i386-buildonly-randconfig-001-20240727 (https://download.01.org/0day-ci/archive/20240727/202407272045.NMjkg4f4-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240727/202407272045.NMjkg4f4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407272045.NMjkg4f4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mm.h:30,
                    from include/linux/pagewalk.h:5,
                    from mm/pagewalk.c:2:
   include/linux/pagewalk.h: In function 'folio_walk_end':
>> include/linux/pgtable.h:105:9: error: implicit declaration of function 'kunmap_local' [-Werror=implicit-function-declaration]
     105 |         kunmap_local((pte));    \
         |         ^~~~~~~~~~~~
   include/linux/mm.h:2969:9: note: in expansion of macro 'pte_unmap'
    2969 |         pte_unmap(pte);                                 \
         |         ^~~~~~~~~
   include/linux/pagewalk.h:188:17: note: in expansion of macro 'pte_unmap_unlock'
     188 |                 pte_unmap_unlock(fw->ptep, fw->ptl);
         |                 ^~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/kunmap_local +105 include/linux/pgtable.h

974b9b2c68f3d3 Mike Rapoport 2020-06-08  100  
0d940a9b270b92 Hugh Dickins  2023-06-08  101  #ifdef CONFIG_HIGHPTE
0d940a9b270b92 Hugh Dickins  2023-06-08  102  #define __pte_map(pmd, address) \
0d940a9b270b92 Hugh Dickins  2023-06-08  103  	((pte_t *)kmap_local_page(pmd_page(*(pmd))) + pte_index((address)))
0d940a9b270b92 Hugh Dickins  2023-06-08  104  #define pte_unmap(pte)	do {	\
0d940a9b270b92 Hugh Dickins  2023-06-08 @105  	kunmap_local((pte));	\
a349d72fd9efc8 Hugh Dickins  2023-07-11  106  	rcu_read_unlock();	\
0d940a9b270b92 Hugh Dickins  2023-06-08  107  } while (0)
974b9b2c68f3d3 Mike Rapoport 2020-06-08  108  #else
0d940a9b270b92 Hugh Dickins  2023-06-08  109  static inline pte_t *__pte_map(pmd_t *pmd, unsigned long address)
0d940a9b270b92 Hugh Dickins  2023-06-08  110  {
0d940a9b270b92 Hugh Dickins  2023-06-08  111  	return pte_offset_kernel(pmd, address);
0d940a9b270b92 Hugh Dickins  2023-06-08  112  }
0d940a9b270b92 Hugh Dickins  2023-06-08  113  static inline void pte_unmap(pte_t *pte)
0d940a9b270b92 Hugh Dickins  2023-06-08  114  {
a349d72fd9efc8 Hugh Dickins  2023-07-11  115  	rcu_read_unlock();
0d940a9b270b92 Hugh Dickins  2023-06-08  116  }
974b9b2c68f3d3 Mike Rapoport 2020-06-08  117  #endif
974b9b2c68f3d3 Mike Rapoport 2020-06-08  118  

:::::: The code at line 105 was first introduced by commit
:::::: 0d940a9b270b9220dcff74d8e9123c9788365751 mm/pgtable: allow pte_offset_map[_lock]() to fail

:::::: TO: Hugh Dickins <hughd@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
