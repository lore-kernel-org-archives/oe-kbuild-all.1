Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D1838F22E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Apr 2026 12:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775649781; cv=none; b=NCXJQxIG9CZCpg6oaBIyG+UCwAn5qkbcXIzvSZaLkp/Ww0VKMtiSLzA8fdy9394l1vsuRZSk7Z+1mkKAtwuS6BcQC5gPNcxmszrXInHXi7dsGqVWUGoSDXRZjTO8voUlxfUKAyhssspQktDrf6jCX/DQXyt7nq/EZncaAiFBv4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775649781; c=relaxed/simple;
	bh=BOvkqb224pD/CDnURc9440WNzd9jMf5vDI5yu+9ZPqk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jhR3sk9LdlsJ1Dg+2S18SZczC8EkEGuC+CSNqlBlzB8YW4ugOvs8sA8aoaS3xaXLJoUjOMadZwfrZjbsVuDII4fRRUnfk97x7UVEJbDvTw9pkMy+gL/Tk3t41/5bv8f2PZu90g+nwyYTb2co6Niy0vWLPQir6w8ptdmq3n/RS98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IKBVzvkT; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IKBVzvkT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775649780; x=1807185780;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BOvkqb224pD/CDnURc9440WNzd9jMf5vDI5yu+9ZPqk=;
  b=IKBVzvkTAkrHkBkPVYKVcduNS+ZJKPxhSgo60oLi4dCsSuMXDoPmxUjE
   vY6N53leyPW2UVCmRpha5PiBw1oM5pb2ZW8e/GSa3xypwHDLCZFp8LvfU
   ieT+2EoB0py6B+IasdmFa2wRtj7fkD1HPv5tdOX0K/udWfE/YK3t4SJhe
   a+74AyRnlWlarOKplcSN83hRK6N76fPRgEU/QfIXMGz2XqZmrvzw0Kcgo
   Akxg87qE4q/W02FM3t32Ge/hodGDhjaW1Kg8YM5hKA7HgPDCYKhp9Wu0z
   A6hN/p334Esj0/K11+z57bCoqJqjJ1AMySlkR4Mf19p52OtsK/9EqmTXW
   A==;
X-CSE-ConnectionGUID: c2qgDIs2TH64H2FZqEwcKg==
X-CSE-MsgGUID: 3t/uDefsS2mpQcNdk8DM1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="80490550"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="80490550"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 05:03:00 -0700
X-CSE-ConnectionGUID: fpyCCwevRK2pDINNLwfugQ==
X-CSE-MsgGUID: EYHSO3G1R2+PPOEOTlU2VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="228355898"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 Apr 2026 05:02:58 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wARcV-000000001ol-1DSb;
	Wed, 08 Apr 2026 12:02:55 +0000
Date: Wed, 08 Apr 2026 20:02:32 +0800
From: kernel test robot <lkp@intel.com>
To: "Ville =?utf-8?Q?Syrj=C3=A4l=C3=A4"?= <ville.syrjala@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vsyrjala:remap_tile_ys_64 18/30]
 drivers/gpu/drm/i915/i915_vma.c:968:1: error: conflicting types for
 'add_pages'; have 'struct scatterlist *(dma_addr_t,  unsigned int,  struct
 sg_table *, struct scatterlist *)' {aka 'struct scatterlist *(long long
 unsigned int,  unsigned int,  struct sg_...
Message-ID: <202604082018.XK73A8ei-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/vsyrjala/linux.git remap_tile_ys_64
head:   9a8f5dc5c6e5da24a2df0e93fda770ab217b0886
commit: 539e2225c8d7e19d4095bace6c48ec8d3d434e93 [18/30] drm/i915/vma: Extract add_pages()
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260408/202604082018.XK73A8ei-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260408/202604082018.XK73A8ei-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604082018.XK73A8ei-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/i915_vma.c:968:1: error: conflicting types for 'add_pages'; have 'struct scatterlist *(dma_addr_t,  unsigned int,  struct sg_table *, struct scatterlist *)' {aka 'struct scatterlist *(long long unsigned int,  unsigned int,  struct sg_table *, struct scatterlist *)'}
     968 | add_pages(dma_addr_t addr, unsigned int count,
         | ^~~~~~~~~
   In file included from include/linux/mmzone.h:1534,
                    from include/linux/gfp.h:7,
                    from include/linux/sched/mm.h:9,
                    from drivers/gpu/drm/i915/i915_vma.c:25:
   include/linux/memory_hotplug.h:153:5: note: previous declaration of 'add_pages' with type 'int(int,  long unsigned int,  long unsigned int,  struct mhp_params *)'
     153 | int add_pages(int nid, unsigned long start_pfn, unsigned long nr_pages,
         |     ^~~~~~~~~


vim +968 drivers/gpu/drm/i915/i915_vma.c

   966	
   967	static struct scatterlist *
 > 968	add_pages(dma_addr_t addr, unsigned int count,
   969		  struct sg_table *st, struct scatterlist *sg)
   970	{
   971		st->nents++;
   972	
   973		sg_set_page(sg, NULL, count * I915_GTT_PAGE_SIZE, 0);
   974		sg_dma_address(sg) = addr;
   975		sg_dma_len(sg) = count * I915_GTT_PAGE_SIZE;
   976	
   977		return sg_next(sg);
   978	}
   979	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
