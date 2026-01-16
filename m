Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75E5347FD9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jan 2026 06:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768544986; cv=none; b=cjNeXUeOJyOPUqV3MhqkJQaEzamaQbSzbsVM8uzc90EIp5+eck5NTj/ROmDQsDWXoyftmw7saoc45VA6oF54NogNFe4Zv9sMmih3XQB0O3D31Y6nCf5UdWa6h8owFN8v7rutXrkoq8nyBmE1fUD51IWec+9IkHNFIRt9LWwjbW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768544986; c=relaxed/simple;
	bh=203LEnegn6pgyEb+gr3UN6xlH03P3esILLrbrs6t1QA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=eGpWXbzwU+wnZ3QVKa4ouQdqHaIbvOu7ihUTp6v5YkJXIRT7LyHu979v8iInkrY49OMXsuArVZ32OsmGQJmsLX+g/BNAVSh4vgJXHmrut0zOTohQOm1qKYPIY7bqWiP+yEfn4Jz/aDnVH0be7Q0y3yEWaVfgqxbEFEvYRtXl4CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QdwiuEtr; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QdwiuEtr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768544985; x=1800080985;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=203LEnegn6pgyEb+gr3UN6xlH03P3esILLrbrs6t1QA=;
  b=QdwiuEtrEUO2MrZw5TOo4kvKeRaYCK53rPw6h1qblNw0xVBewZElZEP/
   Ya8wNR9mxMce79gMsGfdzDbNMNlDhIJ4vgad8T99Ha4CwcDfJutxTuatq
   RsPk20ZyFVEWj9EbY6Nqy+kfrZA8u4pfMwTcjDW75tAh9LcYAze7Xd47G
   iW6+N9badfes1vRuWkbVEKCEL+0lySp1aRuj9kzq4erZRWZhHLKTyKcCV
   iQEFwxLixFY5ORgy64L8XclJNDTxQnp3OI/rZ1YU7gEwVx9Gb6MaLvZwi
   W/p+u8uZuFD/wNcjSpoYYwNFWbBaf8Q6pL8kDgRhdkcvhBqkPH/OiFPmB
   g==;
X-CSE-ConnectionGUID: fONFZY1cQPqm2W40ACZPwQ==
X-CSE-MsgGUID: JR/XQYdbRtWq6It2tSzo0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="87276042"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="87276042"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 22:29:45 -0800
X-CSE-ConnectionGUID: XDAfVPo2QI+gwHcQWbjEMw==
X-CSE-MsgGUID: eS4cLMU1QCCDdiroYNztcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="204955513"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 15 Jan 2026 22:29:42 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgdL1-00000000KTq-1Vws;
	Fri, 16 Jan 2026 06:29:39 +0000
Date: Fri, 16 Jan 2026 14:29:31 +0800
From: kernel test robot <lkp@intel.com>
To: Byungchul Park <byungchul@sk.com>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Pavel Begunkov <asml.silence@gmail.com>,
 "Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen"?= <toke@redhat.com>
Subject: [akpm-mm:mm-unstable 101/288] net/core/netmem_priv.h:19:73:
 sparse: sparse: incorrect type in argument 1 (different base types)
Message-ID: <202601161420.8xY65Dyx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   f8ed52ac0cfbddff992bb9600941bfe51e1e385a
commit: 71b73571e052b94a2af7835373d4090afee5e1eb [101/288] mm: introduce a new page type for page pool in page type
config: x86_64-randconfig-123-20260116 (https://download.01.org/0day-ci/archive/20260116/202601161420.8xY65Dyx-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601161420.8xY65Dyx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601161420.8xY65Dyx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/core/skbuff.c: note: in included file:
>> net/core/netmem_priv.h:19:73: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted netmem_ref [usertype] netmem @@     got unsigned long @@
   net/core/netmem_priv.h:19:73: sparse:     expected restricted netmem_ref [usertype] netmem
   net/core/netmem_priv.h:19:73: sparse:     got unsigned long
>> net/core/netmem_priv.h:19:73: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted netmem_ref [usertype] netmem @@     got unsigned long @@
   net/core/netmem_priv.h:19:73: sparse:     expected restricted netmem_ref [usertype] netmem
   net/core/netmem_priv.h:19:73: sparse:     got unsigned long
   net/core/skbuff.c: note: in included file (through include/linux/skbuff.h, include/net/net_namespace.h, include/linux/inet.h):
   include/net/checksum.h:33:39: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __wsum [usertype] sum @@     got unsigned int @@
   include/net/checksum.h:33:39: sparse:     expected restricted __wsum [usertype] sum
   include/net/checksum.h:33:39: sparse:     got unsigned int

vim +19 net/core/netmem_priv.h

    10	
    11	static inline bool netmem_is_pp(netmem_ref netmem)
    12	{
    13		/* XXX: Now that the offset of page_type is shared between
    14		 * struct page and net_iov, just cast the netmem to struct page
    15		 * unconditionally by clearing NET_IOV if any, no matter whether
    16		 * it comes from struct net_iov or struct page.  This should be
    17		 * adjusted once the offset is no longer shared.
    18		 */
  > 19		return PageNetpp(__netmem_to_page((__force unsigned long)netmem & ~NET_IOV));
    20	}
    21	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
