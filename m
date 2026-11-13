Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794576601;
	b=EDJdeclkEB1Qn+a0NwdkavL3nlUVDLk5ZQlkBIASX8t7/pdYn1lf1z+vcw8DAuBcZPYL
	 XslALbS0UOBVd0l0eye2qlaYrobQzKD9Qnk68aUtL1RRJ8hviY6l+mZ8gwAjcorJDWWVi
	 4/THxMdx3otVk+/1MBFBnCgChlA1qlnGkDKi1xF8A1hA/V44x2vS66UUodSeHR5IpP1l3
	 oLFmSZBKZLsFB/FG4sY3Apcg1ZBroseFTSv4wsEJtxAeHQE9Gk5ZCmyZwjS0Np1wg9hUz
	 jjtVgDfHfEIAT0XSpQBob0YQ+tKPqm4mnpsdh76dmzUxvpat6LFJ8xxG4PwcHMM8OnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794576601;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=rG04TwV+aXkJ3tlNjFerWDM4B3GSxAC0ACNVgfYbO7k=;
	b=4yZ6FD76j2BhUyh8mqxee24sYlnWHlQMxp6LpVXyoamyq+HJIXMTEXH/iNatPqyvEAK/
	 oMWtkwu/j2+eNVcWzWM/CvPkQcKpih3u8AJp0LXb2NHuFfDVb6O9p0XuGrOY128pqLhwe
	 tJZzewO2IwK+5OkFV1fNuLRNhG2zpOpR8InhMf9Td11wCt68H5hsGT1RwgaH+xqMjH/VM
	 3dAJLo5gc1rp8LcRyimlZm/LdI/Q8iHepGnyZA6cT73RS73E6r0pNNyhXKmmxLR0ghq2n
	 BTW17cLMnWMWmsia+kFzggU1zOeyLEHnlFtUtmbfX9Eg5WHQMKlJDtiZ1Jzdj/UJukA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="ABDB/g7Y";
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB7A60706F3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Nov 2026 13:30:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EB7A60706F3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ABDB/g7Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794576601; x=1826112601;
  h=date:from:to:cc:subject:message-id;
  bh=l/tnBcaBNGJcgq4kYFCcHdlZTAOqbmLwHFmG/eNT78A=;
  b=ABDB/g7YBiSa6cvdZCwgxV923I9Xcyg+/UfJw0NrSpx2PV7KHasUShD3
   +6eq4hllmwsKZvJG5835WwbYRW+jg/0iBfjyuo0oPc1fp+0R5gGTFSA1K
   odaE33Z/eg9Q2ZzoFvCZ7jMYeu1eYD5XYA/dhfBq/9Ckd3Aoo/uhooX08
   5BgihPUbIIJtxND/ikx/J4SY9vfEaujSB6jjRijKt6VbTZifZZT7fgShw
   GWqLJGpnlVhCeCnUGJxy2/wxswaTNJhKsedPS6dTxt4g4S9S+fj7YOSkc
   5kIm9b8bIDHkOz4J+JqfdZBGHncOWkTe/MeG9XJQAc82tM1nVd6kM6jsA
   g==;
X-CSE-ConnectionGUID: Xkq43mgqT6azuCxRxKRm4Q==
X-CSE-MsgGUID: gEzMzZp4RiaEaLMbjh8xnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3285194"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3285194"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 05:30:00 -0800
X-CSE-ConnectionGUID: dl4b/IjPSqyTM3G8ujv+Nw==
X-CSE-MsgGUID: gEAAOc6NRYqsnqHSswrDbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="9103122"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 13 Nov 2026 05:29:58 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRrLn-000000001HH-3HhY;
	Fri, 13 Nov 2026 13:29:55 +0000
Date: Fri, 13 Nov 2026 14:29:18 +0100
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 mm-commits@vger.kernel.org,
 "Liam R. Howlett (Google)" <liam@infradead.org>,
 "Oscar Salvador (SUSE)" <osalvador@kernel.org>
Subject: [akpm-mm:mm-new 307/308] mm/cma.c:493 cma_find_free_range()
 warn: always true condition '(start < (4294967296)) => (0-u32max <
 4294967296)'
Message-ID: <202611131415.4Nn1yaIf-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   31a696f9c37defab0f28f774e00ac7f135889ec3
commit: 4cbc68cde0e185ae7cefed74c1b56e61cfe13277 [307/308] mm/cma: simplify cma_declare_contiguous_multi()
config: um-randconfig-2200-20261113 (https://download.01.org/0day-ci/archive/20261113/202611131415.4Nn1yaIf-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8621950157210c1fa68f20f0614cb51310ec9dff)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611131415.4Nn1yaIf-lkp@intel.com/

smatch warnings:
mm/cma.c:493 cma_find_free_range() warn: always true condition '(start < (4294967296)) => (0-u32max < 4294967296)'

vim +493 mm/cma.c

   476	
   477	/*
   478	 * Find the largest free range above 4G that can hold a part of a multi-range
   479	 * CMA area.
   480	 */
   481	static phys_addr_t __init cma_find_free_range(phys_addr_t align,
   482			phys_addr_t size_align, int nid, phys_addr_t *basep)
   483	{
   484		phys_addr_t start, end, size;
   485		phys_addr_t max = 0;
   486		u64 i;
   487	
   488		/* no point searching if the system can't addres above 4G */
   489		if (!IS_ENABLED(CONFIG_PHYS_ADDR_T_64BIT))
   490			return 0;
   491	
   492		for_each_free_mem_range(i, nid, MEMBLOCK_NONE, &start, &end, NULL) {
 > 493			if (start < SZ_4G)
   494				continue;
   495	
   496			start = ALIGN(start, align);
   497			if (start >= end)
   498				continue;
   499	
   500			size = ALIGN_DOWN(end - start, size_align);
   501			if (size > max) {
   502				max = size;
   503				*basep = start;
   504			}
   505		}
   506	
   507		return max;
   508	}
   509	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
