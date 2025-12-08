Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD322E8B94
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Dec 2025 20:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765227010; cv=none; b=kTjsBUTioj4CDIxiksJToenfqssm4e70sEBMMqTMg9snW5G5Wfn041GqWVTEw8VKxOv5VZwEt5BL0Bo+xU37GoZPm7lsamcF9KH32Byaye2soRwE0x5+ueHI1aZ0lo0tKnB+6Q68wKiPhM6bfip4T/bDfIi7N72g0etD5a5PFZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765227010; c=relaxed/simple;
	bh=pos0LxUt0UGgUckXRikCaPFyr6rdco7WyUxtH8TqNVw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iTQDVdPyA+4SO7MJ9gVc1aiUG9D07Ztv5JiAVjaARCLI8pKXe3avbZ6tueOgrjQjZ9X4kdDA4vidocnmZ+ZY4ugB9KuTeQh2XMcy+1cPsyMga7K8aURcjBYC4X8mUDdlyCca1ixBbebFTN17QfQHAqQmYiEX8CB1XgmrbvvQR0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lokPtv+E; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lokPtv+E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765227008; x=1796763008;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pos0LxUt0UGgUckXRikCaPFyr6rdco7WyUxtH8TqNVw=;
  b=lokPtv+E1CkEJyJsTwc1ZHOQkLUBm0N5nJbTNPq7kOkXNkpCugzypDFM
   u9+BvUK+ezsZB7sT9WYBkVt6KZI2IklifD7GbwtMqazyS/Z1fCDtOYApm
   Y4S8smgbWv/4LZMeI48iX1ERgXbd76qDBwEOSah6b7O6G5MbCzSsRnsoU
   RiUdQ8M5Hro3gtacGZ+IvhoDXP5xkaBzGI9fjHS/XO5SdTcJUfngonCb5
   9NCExYMYBtH36xndVnlvpAx/O5d8vLMiRXGmwMnjYBVL31zAPM4UZm4f7
   QWa901hFA+qyw+cFRC1/XYW3A2ml82t4RE1kIAd9J95AL/tDUdnE09QZ0
   Q==;
X-CSE-ConnectionGUID: jwuBykUaSpyiBE2tE6RBkA==
X-CSE-MsgGUID: 88c1/Y9HQQCyMTFcPZ+6rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="89829547"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="89829547"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 12:50:07 -0800
X-CSE-ConnectionGUID: ZWedojEhRmKqu8xo+PCu4Q==
X-CSE-MsgGUID: Vqyr390bTq+CyWjtO36O4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="233407038"
Received: from igk-lkp-server01.igk.intel.com (HELO a9286e139fc0) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 08 Dec 2025 12:50:06 -0800
Received: from kbuild by a9286e139fc0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSiBH-000000002Fh-2cl8;
	Mon, 08 Dec 2025 20:50:03 +0000
Date: Mon, 8 Dec 2025 21:49:06 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3493/3493] arch/x86/kernel/cpu/proc.c:63:5:
 warning: no previous prototype for 'show_cpuinfo'
Message-ID: <202512082137.XtPdHfzc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi GONG,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   36141432a37f7dedddde8825e724b07ce3a440fb
commit: 9d3b0e8891b8b3450a7cd6d1367946a1c69e4eb9 [3493/3493] bpf: Add cpuinfo_x86 iterator target
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251208/202512082137.XtPdHfzc-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251208/202512082137.XtPdHfzc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512082137.XtPdHfzc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/cpu/proc.c:63:5: warning: no previous prototype for 'show_cpuinfo' [-Wmissing-prototypes]
      63 | int show_cpuinfo(struct seq_file *m, void *v)
         |     ^~~~~~~~~~~~


vim +/show_cpuinfo +63 arch/x86/kernel/cpu/proc.c

    62	
  > 63	int show_cpuinfo(struct seq_file *m, void *v)
    64	{
    65		struct cpuinfo_x86 *c = v;
    66		unsigned int cpu;
    67		int i;
    68	
    69		cpu = c->cpu_index;
    70		seq_printf(m, "processor\t: %u\n"
    71			   "vendor_id\t: %s\n"
    72			   "cpu family\t: %d\n"
    73			   "model\t\t: %u\n"
    74			   "model name\t: %s\n",
    75			   cpu,
    76			   c->x86_vendor_id[0] ? c->x86_vendor_id : "unknown",
    77			   c->x86,
    78			   c->x86_model,
    79			   c->x86_model_id[0] ? c->x86_model_id : "unknown");
    80	
    81		if (c->x86_stepping || c->cpuid_level >= 0)
    82			seq_printf(m, "stepping\t: %d\n", c->x86_stepping);
    83		else
    84			seq_puts(m, "stepping\t: unknown\n");
    85		if (c->microcode)
    86			seq_printf(m, "microcode\t: 0x%x\n", c->microcode);
    87	
    88		if (cpu_has(c, X86_FEATURE_TSC)) {
    89			unsigned int freq = arch_freq_get_on_cpu(cpu);
    90	
    91			seq_printf(m, "cpu MHz\t\t: %u.%03u\n", freq / 1000, (freq % 1000));
    92		}
    93	
    94		/* Cache size */
    95		if (c->x86_cache_size)
    96			seq_printf(m, "cache size\t: %u KB\n", c->x86_cache_size);
    97	
    98		show_cpuinfo_core(m, c, cpu);
    99		show_cpuinfo_misc(m, c);
   100	
   101		seq_puts(m, "flags\t\t:");
   102		for (i = 0; i < 32*NCAPINTS; i++)
   103			if (cpu_has(c, i) && x86_cap_flags[i] != NULL) {
   104				if (c->x86_vendor == X86_VENDOR_HYGON)
   105					seq_printf(m, " %s", i == X86_FEATURE_SEV ? "csv" :
   106						   (i == X86_FEATURE_SEV_ES ? "csv2" :
   107						    x86_cap_flags[i]));
   108				else
   109					seq_printf(m, " %s", x86_cap_flags[i]);
   110			}
   111	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
