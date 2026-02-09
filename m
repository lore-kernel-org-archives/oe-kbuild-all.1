Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B327C2264D3
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Feb 2026 23:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770680291; cv=none; b=Z+6zaafHTjN8h+6AW1nlWShoZ+LU+xPcXSC2bdmIjFqpR9dP7cEy7H73xJTJ/5hC+D6QxwU2p02n/R/lK9HwQJeB557wDpfpjg+GP5d8m1VSGbaNe1iZ3B0IE6GVboPsGmBNITdMEHjpEkf5mBaABfhmKeOixJixa9xDka2nhC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770680291; c=relaxed/simple;
	bh=wGlZDqmrdBbEgyHk+9taYE7VHOb5DA6r41ddHjaltyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sTogkAv0OL8B+5292oNQRdd07M7BPrh/MSkG5poCaAL2xvFbMiTC7UuiEvhPqtmHQMQJeKcpVFb8r/LS6HSRoL8BoaLyOVQ99JupDyzSwYqjNyIacyhenwQMrfq4PSNCfV8oKEAjC8iQDfPLZwZzIF+jiNKnQBK+0Z6y6vCS2Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KXOwU3xp; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KXOwU3xp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770680289; x=1802216289;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wGlZDqmrdBbEgyHk+9taYE7VHOb5DA6r41ddHjaltyQ=;
  b=KXOwU3xpxTb0NQplB2wEPKa0xqc8q/jf4eiWiBo4MhPIVgG1yqXMfDC4
   R/lY1OtkavrxeGi5LISqDwOzR9SF5KgEQi9V4GJ9iOou+hF2ZCAc1v0jY
   xR7DuA5d+5qXkoqTuYK3pyPzV8XTPczgfkTtCFbdtA3v8B3v2v5kN9V+0
   CFrIBsOyJ4yP7oI2e09XxYEPJE+l7XGO6pEqASG5PulvfE9LOqhKV53Mc
   sOEcpfHYa+cQklzyCBQTbyQsPmHiOpJWhd+ATSyMnL8FdqttBjr7N0Yog
   7mCEYZjbKFs4oEzuOqXSj6zVWNgrPXj28ydcsHuHituUbEA2iA7iLWGWg
   A==;
X-CSE-ConnectionGUID: gUG9kqO4QT6RNyZJDtwXIg==
X-CSE-MsgGUID: 7UhfCGjLTmibma2+MwD8+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="89384728"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="89384728"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 15:38:08 -0800
X-CSE-ConnectionGUID: cUlGTDknRj+p9ychtsexDA==
X-CSE-MsgGUID: 7ThtdMsuRPanMmjNvnfNww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216256848"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Feb 2026 15:38:03 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpapN-00000000oQ0-0GQ8;
	Mon, 09 Feb 2026 23:38:01 +0000
Date: Tue, 10 Feb 2026 07:37:52 +0800
From: kernel test robot <lkp@intel.com>
To: Deepanshu Kartikey <kartikey406@gmail.com>, akpm@linux-foundation.org,
	david@kernel.org, lorenzo.stoakes@oracle.com,
	baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
	npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
	baohua@kernel.org, ackerleytng@google.com, seanjc@google.com,
	pbonzini@redhat.com, michael.roth@amd.com, vannapurve@google.com
Cc: oe-kbuild-all@lists.linux.dev, ziy@nvidia.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+33a04338019ac7e43a44@syzkaller.appspotmail.com
Subject: Re: [PATCH] mm: thp: Deny THP for guest_memfd and secretmem in
 file_thp_enabled()
Message-ID: <202602100727.b1U4CHAA-lkp@intel.com>
References: <20260209033558.22943-1-kartikey406@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209033558.22943-1-kartikey406@gmail.com>

Hi Deepanshu,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Deepanshu-Kartikey/mm-thp-Deny-THP-for-guest_memfd-and-secretmem-in-file_thp_enabled/20260209-113800
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260209033558.22943-1-kartikey406%40gmail.com
patch subject: [PATCH] mm: thp: Deny THP for guest_memfd and secretmem in file_thp_enabled()
config: arc-randconfig-001-20260210 (https://download.01.org/0day-ci/archive/20260210/202602100727.b1U4CHAA-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602100727.b1U4CHAA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602100727.b1U4CHAA-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/huge_memory.c: In function 'file_thp_enabled':
>> mm/huge_memory.c:96:37: error: 'GUEST_MEMFD_MAGIC' undeclared (first use in this function)
      96 |         if (inode->i_sb->s_magic == GUEST_MEMFD_MAGIC ||
         |                                     ^~~~~~~~~~~~~~~~~
   mm/huge_memory.c:96:37: note: each undeclared identifier is reported only once for each function it appears in
>> mm/huge_memory.c:97:37: error: 'SECRETMEM_MAGIC' undeclared (first use in this function)
      97 |             inode->i_sb->s_magic == SECRETMEM_MAGIC)
         |                                     ^~~~~~~~~~~~~~~


vim +/GUEST_MEMFD_MAGIC +96 mm/huge_memory.c

    84	
    85	static inline bool file_thp_enabled(struct vm_area_struct *vma)
    86	{
    87		struct inode *inode;
    88	
    89		if (!IS_ENABLED(CONFIG_READ_ONLY_THP_FOR_FS))
    90			return false;
    91	
    92		if (!vma->vm_file)
    93			return false;
    94	
    95		inode = file_inode(vma->vm_file);
  > 96		if (inode->i_sb->s_magic == GUEST_MEMFD_MAGIC ||
  > 97		    inode->i_sb->s_magic == SECRETMEM_MAGIC)
    98			return false;
    99	
   100		return !inode_is_open_for_write(inode) && S_ISREG(inode->i_mode);
   101	}
   102	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
