Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6525F331A7B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Mar 2026 04:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773291580; cv=none; b=ujCoHdBC1/oJyjKqlzGDxiMsz5NnYWH4qwgloB+qg5iaEi+d3Y/Odoup8I9XQJo91zIi5R3f/SKzW5d+eC69h6C6SssEK8UKJ0qpJ3QUJ8KhvpVFgpvO5kjpHr3rn5gx9JUQ1n2YwaHljAdzQssML745joqaS4jcE58daQ12OK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773291580; c=relaxed/simple;
	bh=bDKmjZfnCyPydNkF/CeI/HpC4psOozf+5Lm8+QTrOkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s+x37bodF7f9kM68qDwKzu04RdcbAaq1KVXQKj9/NuOgbGxJv8x7WUugFuFn8AuaNtZwAed7v52fxKMUHdwwr7qwrrqFk1XNa6SmuEQ3sBYRF9UBeux5HUJ4CE65FFaf0zT22MwAXCSH96DEgmVbL9u8nLcBYf13/d3wvI/U8Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FcgET5ZQ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FcgET5ZQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773291578; x=1804827578;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bDKmjZfnCyPydNkF/CeI/HpC4psOozf+5Lm8+QTrOkU=;
  b=FcgET5ZQ5AlA08kDHHd6xdT0RXLd0oQb7kv2GoyV4SfYkfYvmx4OBLtn
   bJXWDTAsr3DiDu2TBHGBDnqv5fkF72NwHHhkRyByQHbxCUzPKwmD8rIRB
   lmbchfgfZyAyTVt62/DeJX+mQ7iIjaiRUfVPuwNGfSK1fzrYZP0SUpaBG
   qFIxXPJQ3T7ipASZ3HYZFIaY7UjxW49rsb1WdvDmdPKPA1n0NfN8Fn9HN
   8ZR3NxMXYPJidjqf2NSKWjgGTa1ffrz3KbqivBgq6y+5H4m1L2JPO86DJ
   2pevxMOIgONvh17VdhHhgaT5f0CBAwq8F1lq5VwZQVL+Exw0dxDR2sZje
   Q==;
X-CSE-ConnectionGUID: eDcfXffeQe6DaymW60ysnw==
X-CSE-MsgGUID: GfopWGnjR5Sr86Y9+eXv0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="85728081"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="85728081"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 21:59:37 -0700
X-CSE-ConnectionGUID: n5UBlUAFRFKsK6ecRdXURA==
X-CSE-MsgGUID: uH6WLGbnQ8O+A0vULYvcYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="219967256"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Mar 2026 21:59:36 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0Y8z-0000000025z-3Zql;
	Thu, 12 Mar 2026 04:59:33 +0000
Date: Thu, 12 Mar 2026 12:59:04 +0800
From: kernel test robot <lkp@intel.com>
To: Ojaswin Mujoo <ojaswin@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 1/3] iomap: Support buffered RWF_WRITETHROUGH via async dio
 backend
Message-ID: <202603121258.meq4w3rG-lkp@intel.com>
References: <c84ddc3f864f840d646b6aa19fd9b3e83e079c0b.1773076216.git.ojaswin@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c84ddc3f864f840d646b6aa19fd9b3e83e079c0b.1773076216.git.ojaswin@linux.ibm.com>

Hi Ojaswin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on xfs-linux/for-next]
[also build test WARNING on linus/master v7.0-rc3 next-20260311]
[cannot apply to hch-configfs/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ojaswin-Mujoo/iomap-Support-buffered-RWF_WRITETHROUGH-via-async-dio-backend/20260310-013922
base:   https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git for-next
patch link:    https://lore.kernel.org/r/c84ddc3f864f840d646b6aa19fd9b3e83e079c0b.1773076216.git.ojaswin%40linux.ibm.com
patch subject: [RFC 1/3] iomap: Support buffered RWF_WRITETHROUGH via async dio backend
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260312/202603121258.meq4w3rG-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260312/202603121258.meq4w3rG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603121258.meq4w3rG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/zonefs/super.c:10:
>> include/linux/iomap.h:205:9: warning: 'IOMAP_WRITETHROUGH' redefined
     205 | #define IOMAP_WRITETHROUGH      (1 << 11)
         |         ^~~~~~~~~~~~~~~~~~
   In file included from arch/m68k/include/asm/io_mm.h:27,
                    from arch/m68k/include/asm/io.h:8,
                    from include/linux/io.h:12,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/m68k/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/highmem.h:12,
                    from include/linux/pagemap.h:11,
                    from fs/zonefs/super.c:8:
   arch/m68k/include/asm/kmap.h:11:9: note: this is the location of the previous definition
      11 | #define IOMAP_WRITETHROUGH              3
         |         ^~~~~~~~~~~~~~~~~~


vim +/IOMAP_WRITETHROUGH +205 include/linux/iomap.h

   186	
   187	/*
   188	 * Flags for iomap_begin / iomap_end.  No flag implies a read.
   189	 */
   190	#define IOMAP_WRITE		(1 << 0) /* writing, must allocate blocks */
   191	#define IOMAP_ZERO		(1 << 1) /* zeroing operation, may skip holes */
   192	#define IOMAP_REPORT		(1 << 2) /* report extent status, e.g. FIEMAP */
   193	#define IOMAP_FAULT		(1 << 3) /* mapping for page fault */
   194	#define IOMAP_DIRECT		(1 << 4) /* direct I/O */
   195	#define IOMAP_NOWAIT		(1 << 5) /* do not block */
   196	#define IOMAP_OVERWRITE_ONLY	(1 << 6) /* only pure overwrites allowed */
   197	#define IOMAP_UNSHARE		(1 << 7) /* unshare_file_range */
   198	#ifdef CONFIG_FS_DAX
   199	#define IOMAP_DAX		(1 << 8) /* DAX mapping */
   200	#else
   201	#define IOMAP_DAX		0
   202	#endif /* CONFIG_FS_DAX */
   203	#define IOMAP_ATOMIC		(1 << 9) /* torn-write protection */
   204	#define IOMAP_DONTCACHE		(1 << 10)
 > 205	#define IOMAP_WRITETHROUGH	(1 << 11)
   206	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
