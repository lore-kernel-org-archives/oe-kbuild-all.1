Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53151E47B3
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Apr 2025 14:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743518989; cv=none; b=aJNgZqN3dzj8o5qCYuO+VC0pHQ8ZdzOiy8qJhOGW6ulxdRitQGmAWi3jdMifHnhJQADMCgDqYwNkhLaFozkYnRyg1+XlolOMels60lgCLyyFE5anWv4atPBe9eHKeqnlYAMc2nbbEFoOXrOIDAAVotFIocnS+8atFFb37aig6tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743518989; c=relaxed/simple;
	bh=wzNIWaKBDBTccIO1fU5hOYuDEB0Asc9JxpS/1mHJtOA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=taEmf+eyd2+xaebpZga2Rm6rulQaojvy0VzMgKHDA4HBhRf2kER08MIiQKImT/h3L1EEhbmz4fjchsa4HnKGfvo7lNMknbzWOiF5ST4RO5LUuphQs5zhhGnuToOGuPvJHazJpdujgyzkglLyaqKgCipHaxJDY8WsE5/oKLZ40PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n069Buag; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n069Buag"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743518987; x=1775054987;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wzNIWaKBDBTccIO1fU5hOYuDEB0Asc9JxpS/1mHJtOA=;
  b=n069Buag+e9jIOjzikXwPLwRxWchUoXnZByNx9k0tiNGWgJAjmGKbwUF
   JtQoUytKRNNYs6BQJTBS7Y6+KjC/7W8kxvqzsQBy3/tAdEIglzYMTcCsz
   OrAeyNUFahZkV3UXlChJ/WE3O0wfkFJ2TpZGBCMIwoJA8ZF7c5s/N/cGO
   v0RSXFTYuV7bdGT7OmTdS1WfWqlyd82jHxwXn9ityPj7UaN3bbMVo9ZxO
   7lCd4kEjmw9XwcUCIzjzBrwlcPYDyymGKArRiXy/kQIrwZLnrSv4/5CFX
   aTk+6x+TqZYzxqtFDMbY5qQ6kPKo1K9416oNDITtFnyd8HvNYyTJ1/j+Q
   g==;
X-CSE-ConnectionGUID: 7YemG/Z8TqCk3tZivEkgaw==
X-CSE-MsgGUID: Hd8KnO7eR2qQVNxLt+3u+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="62379711"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="62379711"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 07:49:46 -0700
X-CSE-ConnectionGUID: FMR4Bz+1TcipfmQNpnhYgw==
X-CSE-MsgGUID: a2tK8EWxRTKR6ncc+D6BmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="126164131"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 01 Apr 2025 07:49:44 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzcvu-0009vu-18;
	Tue, 01 Apr 2025 14:49:42 +0000
Date: Tue, 1 Apr 2025 22:49:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Jian <cj.chengjian@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1544/1544] fs/proc/etmem_swap.c:86:
 undefined reference to `proc_swap_pages_operations'
Message-ID: <202504012235.IEGC6Idv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   54ad6c4559d2bcbb5d7a03050b2f417a326a1ce2
commit: fb3893e8dd62797b531a46bd3c49b2c14dc6eb27 [1544/1544] etmem: add etmem-swap feature
config: x86_64-randconfig-r113-20250401 (https://download.01.org/0day-ci/archive/20250401/202504012235.IEGC6Idv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250401/202504012235.IEGC6Idv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504012235.IEGC6Idv-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   ld: fs/proc/etmem_scan.o: in function `page_scan_entry':
   fs/proc/etmem_scan.c:1031: undefined reference to `proc_page_scan_operations'
   ld: fs/proc/etmem_scan.c:1032: undefined reference to `proc_page_scan_operations'
   ld: fs/proc/etmem_scan.c:1031: undefined reference to `proc_page_scan_operations'
   ld: fs/proc/etmem_scan.c:1033: undefined reference to `proc_page_scan_operations'
   ld: fs/proc/etmem_scan.c:1032: undefined reference to `proc_page_scan_operations'
   ld: fs/proc/etmem_scan.o:fs/proc/etmem_scan.c:1034: more undefined references to `proc_page_scan_operations' follow
   ld: fs/proc/etmem_swap.o: in function `swap_pages_entry':
>> fs/proc/etmem_swap.c:86: undefined reference to `proc_swap_pages_operations'
>> ld: fs/proc/etmem_swap.c:87: undefined reference to `proc_swap_pages_operations'
>> ld: fs/proc/etmem_swap.c:86: undefined reference to `proc_swap_pages_operations'
   ld: fs/proc/etmem_swap.c:88: undefined reference to `proc_swap_pages_operations'
>> ld: fs/proc/etmem_swap.c:87: undefined reference to `proc_swap_pages_operations'
   ld: fs/proc/etmem_swap.o:fs/proc/etmem_swap.c:89: more undefined references to `proc_swap_pages_operations' follow


vim +86 fs/proc/etmem_swap.c

    83	
    84	static int swap_pages_entry(void)
    85	{
  > 86			proc_swap_pages_operations.owner = THIS_MODULE;
  > 87			proc_swap_pages_operations.write = swap_pages_write;
    88			proc_swap_pages_operations.open = swap_pages_open;
    89			proc_swap_pages_operations.release = swap_pages_release;
    90	
    91			return 0;
    92	}
    93	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
