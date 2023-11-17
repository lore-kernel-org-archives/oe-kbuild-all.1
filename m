Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3912F19BBB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Nov 2023 15:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n86HyAjt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700233425; x=1731769425;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TEJAgOt2XWSBUz2XPQPntlNht60e24ViT0YPSawe9e0=;
  b=n86HyAjtDG6RCftJ5Q/W1hok/CLJosILjM7Etd7rGQfvQW3xUANS1QW9
   PAiFtuOrRvxzEMVO6NI5H20cNtwpt98E+VzG+CX7TwayaIwHf3zam+MV8
   idP0FHRi0vSo/jAqvK80zrXaAHP1orzPC605u4JUHzD01rf+4ldqBGHI+
   M/f1AnnyX64DNM3qDVGdibbtV6xwzN5KPEEBuWykMwIPHcdNdaid+NC6F
   4TeZWHRcYEe0W8dYWfXsqnxniXZ+mkztb4pPJiIyv/YRN0OgddlUnO03s
   Oi6iFCevP4xDxmycbWxISXgAtoa8opgcZThMddTz+IhQ0UnWrmaTySPGh
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="12860980"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="12860980"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 07:03:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="889261608"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="889261608"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 17 Nov 2023 07:03:41 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r40Ne-0002rj-3C;
	Fri, 17 Nov 2023 15:03:38 +0000
Date: Fri, 17 Nov 2023 23:02:42 +0800
From: kernel test robot <lkp@intel.com>
To: Enlin Mu <enlin.mu@outlook.com>, catalin.marinas@arm.com,
	will@kernel.org, enlin.mu@unisoc.com, enlinmu@gmail.com,
	linux-arm-kernel@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: remove kaslr-seed node when it had used
Message-ID: <202311172203.QJYSLPKE-lkp@intel.com>
References: <TYSPR04MB7084AFDB414AA7AE49A02D608AB2A@TYSPR04MB7084.apcprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYSPR04MB7084AFDB414AA7AE49A02D608AB2A@TYSPR04MB7084.apcprd04.prod.outlook.com>

Hi Enlin,

kernel test robot noticed the following build errors:

[auto build test ERROR on arm64/for-next/core]
[also build test ERROR on linus/master v6.7-rc1 next-20231117]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Enlin-Mu/arm64-remove-kaslr-seed-node-when-it-had-used/20231114-220115
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/TYSPR04MB7084AFDB414AA7AE49A02D608AB2A%40TYSPR04MB7084.apcprd04.prod.outlook.com
patch subject: [PATCH] arm64: remove kaslr-seed node when it had used
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20231117/202311172203.QJYSLPKE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231117/202311172203.QJYSLPKE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311172203.QJYSLPKE-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: arch/arm64/kernel/pi/kaslr_early.pi.o: in function `get_kaslr_seed':
>> arch/arm64/kernel/pi/kaslr_early.c:84:(.init.text+0x18c): undefined reference to `__pi_fdt_nop_property'
   arch/arm64/kernel/pi/kaslr_early.c:84:(.init.text+0x18c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `__pi_fdt_nop_property'
   aarch64-linux-ld: .tmp_vmlinux.kallsyms1: hidden symbol `__pi_fdt_nop_property' isn't defined
   aarch64-linux-ld: final link failed: bad value


vim +84 arch/arm64/kernel/pi/kaslr_early.c

    68	
    69	static u64 get_kaslr_seed(void *fdt)
    70	{
    71		int node, len;
    72		fdt64_t *prop;
    73		u64 ret;
    74	
    75		node = fdt_path_offset(fdt, "/chosen");
    76		if (node < 0)
    77			return 0;
    78	
    79		prop = fdt_getprop_w(fdt, node, "kaslr-seed", &len);
    80		if (!prop || len != sizeof(u64))
    81			return 0;
    82	
    83		ret = fdt64_to_cpu(*prop);
  > 84		fdt_nop_property(fdt, node, "kaslr-seed");
    85		return ret;
    86	}
    87	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
