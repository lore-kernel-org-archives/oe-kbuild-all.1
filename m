Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6621F1537
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Nov 2025 19:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763062085; cv=none; b=G9ItKwu+R8X5YOODCXpHu/gD7z2u/jmD5KNE9Wj6qQ3uVnGnoaemVEHcF7MQCs+So4haRaTGaTEEcGCbo1V/H5hiDLhFBNXGXpqnulj8GDkqZDvIfJs6OzUhj3XONeuxm9iCVHsEfj5QHpiJ1dyiiYkAcEAv33myCc+ywk3tuLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763062085; c=relaxed/simple;
	bh=WQ1At1+ZjGuWbj1pVi4Tp35itYpuTMRzWkOJLkvIEP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IgT1TwUNj/FAWzU+qnGnDn5yOlEiYq8X9VmOKZKVFoELdoyi5nYlLE5ORQlmGB/9UwSoIVWFxX5i/IjBrXCLw0tThPPwpDC89geZ5mk5Y7t+m8II2qTQ9dZkcIeZs5BctQaL2PuVhEAcP75xi7+rHL7y6ZXvZaRUj7VBjvXFzm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z2ZmZeRy; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z2ZmZeRy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763062084; x=1794598084;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WQ1At1+ZjGuWbj1pVi4Tp35itYpuTMRzWkOJLkvIEP0=;
  b=Z2ZmZeRyofH9oL3Zk+GCbmPSwBqojwTJypnwSUBZQs11+TfIexxZxkEk
   hEfR1G59kK3sEwZA41OY2FlFtAkK+Rb1NnDl0E9lx6RD83vr9RsTM9DEv
   IlG0DEczXmM4WRx/MY7Tfi1wlIDAlznkkiqLYacR4JxWwzjC48O4CeXDB
   uaN6+KwQ9qx8DHOa5TzfTSjn1Dm6RDVOsHap6Eao5e5QNWq/+p5dAijoD
   9/LfV7hxWrOfwEpHCO1uy/3ngU7/cBDpVp4bTsSzBf0qeeiWM2i+BPH1Q
   tepCGWMp/KfRfXZP1o0lNVuFXuUOZrJeC3AkMFOvpiLfviV0TzFN/I1H0
   g==;
X-CSE-ConnectionGUID: B0EDzHxtQqKtBmCkLzGSKg==
X-CSE-MsgGUID: eL8Qo0ULRZGmNEn1mOTTIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="90630796"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="90630796"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 11:28:02 -0800
X-CSE-ConnectionGUID: 3d1C3fd1Rz+qj/jFYqndfA==
X-CSE-MsgGUID: VtSMtCfgQNuuzOAK6Zzgfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="220218029"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Nov 2025 11:27:58 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJcz4-0005nP-2S;
	Thu, 13 Nov 2025 19:27:54 +0000
Date: Fri, 14 Nov 2025 03:26:56 +0800
From: kernel test robot <lkp@intel.com>
To: Yuntao Wang <yuntao.wang@linux.dev>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Catalin Marinas <catalin.marinas@arm.com>,
	James Morse <james.morse@arm.com>, Baoquan He <bhe@redhat.com>,
	Zhen Lei <thunder.leizhen@huawei.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Geoff Levand <geoff@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Changyuan Lyu <changyuanl@google.com>,
	Alexander Graf <graf@amazon.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Yuntao Wang <yuntao.wang@linux.dev>
Subject: Re: [PATCH v2 3/7] of/fdt: Fix the len check in
 early_init_dt_check_for_usable_mem_range()
Message-ID: <202511140206.XDGIw3J1-lkp@intel.com>
References: <20251113155104.226617-4-yuntao.wang@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113155104.226617-4-yuntao.wang@linux.dev>

Hi Yuntao,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.18-rc5 next-20251113]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yuntao-Wang/of-fdt-Consolidate-duplicate-code-into-helper-functions/20251114-004121
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20251113155104.226617-4-yuntao.wang%40linux.dev
patch subject: [PATCH v2 3/7] of/fdt: Fix the len check in early_init_dt_check_for_usable_mem_range()
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20251114/202511140206.XDGIw3J1-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511140206.XDGIw3J1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511140206.XDGIw3J1-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/of/fdt.c: In function 'early_init_dt_check_for_usable_mem_range':
>> drivers/of/fdt.c:903:45: error: passing argument 2 of 'of_fdt_read_addr_size' from incompatible pointer type [-Wincompatible-pointer-types]
     903 |                 of_fdt_read_addr_size(prop, &rgn[i].base, &rgn[i].size);
         |                                             ^~~~~~~~~~~~
         |                                             |
         |                                             phys_addr_t * {aka unsigned int *}
   drivers/of/fdt.c:663:60: note: expected 'u64 *' {aka 'long long unsigned int *'} but argument is of type 'phys_addr_t *' {aka 'unsigned int *'}
     663 | void __init of_fdt_read_addr_size(const __be32 *prop, u64 *addr, u64 *size)
         |                                                       ~~~~~^~~~
   drivers/of/fdt.c:903:59: error: passing argument 3 of 'of_fdt_read_addr_size' from incompatible pointer type [-Wincompatible-pointer-types]
     903 |                 of_fdt_read_addr_size(prop, &rgn[i].base, &rgn[i].size);
         |                                                           ^~~~~~~~~~~~
         |                                                           |
         |                                                           phys_addr_t * {aka unsigned int *}
   drivers/of/fdt.c:663:71: note: expected 'u64 *' {aka 'long long unsigned int *'} but argument is of type 'phys_addr_t *' {aka 'unsigned int *'}
     663 | void __init of_fdt_read_addr_size(const __be32 *prop, u64 *addr, u64 *size)
         |                                                                  ~~~~~^~~~


vim +/of_fdt_read_addr_size +903 drivers/of/fdt.c

   879	
   880	/**
   881	 * early_init_dt_check_for_usable_mem_range - Decode usable memory range
   882	 * location from flat tree
   883	 */
   884	void __init early_init_dt_check_for_usable_mem_range(void)
   885	{
   886		struct memblock_region rgn[MAX_USABLE_RANGES] = {0};
   887		const __be32 *prop;
   888		int len, i;
   889		unsigned long node = chosen_node_offset;
   890	
   891		if ((long)node < 0)
   892			return;
   893	
   894		pr_debug("Looking for usable-memory-range property... ");
   895	
   896		prop = of_fdt_get_addr_size_prop(node, "linux,usable-memory-range", &len);
   897		if (!prop)
   898			return;
   899	
   900		len = min(len, MAX_USABLE_RANGES);
   901	
   902		for (i = 0; i < len; i++) {
 > 903			of_fdt_read_addr_size(prop, &rgn[i].base, &rgn[i].size);
   904	
   905			pr_debug("cap_mem_regions[%d]: base=%pa, size=%pa\n",
   906				 i, &rgn[i].base, &rgn[i].size);
   907		}
   908	
   909		memblock_cap_memory_range(rgn[0].base, rgn[0].size);
   910		for (i = 1; i < MAX_USABLE_RANGES && rgn[i].size; i++)
   911			memblock_add(rgn[i].base, rgn[i].size);
   912	}
   913	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
