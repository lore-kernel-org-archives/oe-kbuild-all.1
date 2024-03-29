Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7423B1B2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Mar 2024 07:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711696003; cv=none; b=QJxMKLDKFk/9+AF47FkGLQle4tITrKBqe75mvRRdWAKnAfnExlOWB0y2m4MKUz7b3GYzZDLrEVNEUeoCxhHqMroFJyf63Ec/k8UsNl+MxOWVa+7aOiiGayEBaEMIkHlfWGAMxGBeCewFL4jxi63XUUIfeqablZMq/QNku0Hhr9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711696003; c=relaxed/simple;
	bh=Ns8O1x4bS7ZKlWYpCiIN6Tal8k0NTikz0cEOkrDuzvs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LjE6BbXdWBcqsGkzB+9QR2HZFbZ49qvlQ2DlwognPZoX84/EafFY3hM2ETB4OnR/Fu22JnXvdfw6IFSgZ3EIXqU56G8MEbEheT2g7/936s018z+L7N7aUfLncxVabvkcycQNc2nCkcJxsww0Zrt5F+AbS9l6O7X+yjjRXTIgwGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=alMr3k2W; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="alMr3k2W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711696001; x=1743232001;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ns8O1x4bS7ZKlWYpCiIN6Tal8k0NTikz0cEOkrDuzvs=;
  b=alMr3k2WN7oTTTV+6/tYZh7s8yKWXZun5EBsuj79CYV5kPDVX+PlQWEe
   j/WERGJtd2yZ7zI0+SrXwOLMI3F4rxCw2liXpd9ia/TfRY9F5kOsaQ7mj
   lx8/xv6lyUcceGjfSrGarH1YCdYp8DlClkrmcZY1jDD2o+Odg+hV6n/PL
   mxLlvCBXsIvGM4xJmPYTyq5A4ZqLrqPA+186O8ARVVXxR8GPeMorx1RjU
   oGnFkjcg4duYLnE5+prmb4y3kERNfBZSWVV1qMp1NZSrOqOpxl13/4OgA
   JUlYZzeM0DsuN+g59sTJUao7S9B1VHryLUDbUCm5tPYUZ6oXbDVUx+YRg
   A==;
X-CSE-ConnectionGUID: cdfSv4N1QHqid7JWtEPP9Q==
X-CSE-MsgGUID: 5o6K+4/LQfeHmXArJNwXWA==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="24373960"
X-IronPort-AV: E=Sophos;i="6.07,164,1708416000"; 
   d="scan'208";a="24373960"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2024 00:06:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,164,1708416000"; 
   d="scan'208";a="47865563"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 29 Mar 2024 00:06:40 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rq6Jw-0002wA-2f;
	Fri, 29 Mar 2024 07:06:36 +0000
Date: Fri, 29 Mar 2024 15:05:56 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 2147/2532] arch/s390/include/asm/hugetlb.h:46:34:
 error: redefinition of 'arch_clear_hugetlb_flags'
Message-ID: <202403291503.yoAZQm7A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a6bd6c9333397f5a0e2667d4d82fef8c970108f2
commit: 34ffd5e56690f9826603cd51e27df29dc5c286a6 [2147/2532] mm: convert arch_clear_hugepage_flags to take a folio
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240329/202403291503.yoAZQm7A-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240329/202403291503.yoAZQm7A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403291503.yoAZQm7A-lkp@intel.com/

Note: the linux-next/master HEAD a6bd6c9333397f5a0e2667d4d82fef8c970108f2 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from include/linux/hugetlb.h:828,
                    from include/linux/migrate.h:8,
                    from include/linux/balloon_compaction.h:41,
                    from drivers/virtio/virtio_balloon.c:16:
>> arch/s390/include/asm/hugetlb.h:46:34: error: redefinition of 'arch_clear_hugetlb_flags'
      46 | #define arch_clear_hugetlb_flags arch_clear_hugetlb_flags
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hugetlb.h:840:20: note: in expansion of macro 'arch_clear_hugetlb_flags'
     840 | static inline void arch_clear_hugetlb_flags(struct folio *folio) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/hugetlb.h:42:20: note: previous definition of 'arch_clear_hugetlb_flags' with type 'void(struct folio *)'
      42 | static inline void arch_clear_hugetlb_flags(struct folio *folio)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/arch_clear_hugetlb_flags +46 arch/s390/include/asm/hugetlb.h

    41	
    42	static inline void arch_clear_hugetlb_flags(struct folio *folio)
    43	{
    44		clear_bit(PG_arch_1, &folio->flags);
    45	}
  > 46	#define arch_clear_hugetlb_flags arch_clear_hugetlb_flags
    47	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
