Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1D921ADDB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Mar 2025 08:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742198933; cv=none; b=bNM7zJeIZ03AP+HXuHeRW9BDN6M1YQ85yFaX+nQPO83W1WZGW5zbCDES93BM6I8DRjd52xJp7wxywCUyi9DyuMEClZGrVVBVxnBxvt3kkI6PT/9vBpXL4dyK0MZYoRluo7iUzCKwoTy7E4NNv2OUOvC2e+kySD1Vn/ps+QkAz1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742198933; c=relaxed/simple;
	bh=/9KM7pHar8LkittmtFePyk3xmUVM2V+F6zBHqfBX90c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LjPNKbKSN08+zdevp7PpYVXJ9ZZk7ihp5xl0vA8rWlfL0MN8l19DPQw1eIvQmqXEJcSm8iWmTY7oPMbP5/4lCvtEhlwt27Ddp6rpxSwlFS2/DiQzwimQntgJkBr2BRV7tQPgfWWIkQIYFtigoAYbX0Wh54hIan3GTRpeJW3uBvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HeULLrWz; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HeULLrWz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742198932; x=1773734932;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/9KM7pHar8LkittmtFePyk3xmUVM2V+F6zBHqfBX90c=;
  b=HeULLrWzkfCyLbCfLz7fOKZMxDoH8o6Axxs65un3CWZhMC9XZIEubuVP
   GfqMVXFf9CuErTxyH4fqajCH1X+7Iq9wsmXq+iKIMv69z3B1PxaBMsdFf
   cnWajDy+ekiProgvrXXrAUZHvE6JKt4Z3qXw7mKuxCA+gz3nBa3wojb7f
   7r3U6tHMg+9C3WQbncJBHsDwpZDupPIcA+bqgiqZ1YHXIp/8wjfxXU7d/
   CTAqRLVAJr/2Yg+jAHYs5vX2GHeyCJAxu154WY5b45Af0irwBTIKCor5X
   LHop7NonYS8TP1LlQBtFJea9WtL8gRea7DBv3kCV6rKS9I0EY65iCn5c1
   g==;
X-CSE-ConnectionGUID: coZ1tTzvTEWG1iygXunVMg==
X-CSE-MsgGUID: 5UZikZp/Si+k8aXUebnqQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="68640544"
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="68640544"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 01:08:48 -0700
X-CSE-ConnectionGUID: HfM5MxavSqabWSWgDxrOcQ==
X-CSE-MsgGUID: q6ujSOj+SlmdZ8cJwZ/ARQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="122614049"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 17 Mar 2025 01:08:47 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tu5We-000Cah-30;
	Mon, 17 Mar 2025 08:08:44 +0000
Date: Mon, 17 Mar 2025 16:07:55 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [broonie-ci:20250313_tiwai_asoc_convert_to_modern_pm_macros 183/194]
 sound/soc/sof/snd-sof-acpi.mod.c:15:33: error: expected ')' before
 'SND_SOC_SOF_ACPI_DEV'
Message-ID: <202503171532.ACY3MdB1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git 20250313_tiwai_asoc_convert_to_modern_pm_macros
head:   9a2c84a9570fadf5fa15f3e6ca13a7ca23a6fb4c
commit: 431bdad71028cf4ad9958a49c76b8b54081930f2 [183/194] ASoC: SOF: acpi: Convert to EXPORT_NS_DEV_PM_OPS()
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20250317/202503171532.ACY3MdB1-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250317/202503171532.ACY3MdB1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503171532.ACY3MdB1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/soc/sof/snd-sof-acpi.mod.c:2:
>> sound/soc/sof/snd-sof-acpi.mod.c:15:33: error: expected ')' before 'SND_SOC_SOF_ACPI_DEV'
      15 | KSYMTAB_DATA(sof_acpi_pm, "", ""SND_SOC_SOF_ACPI_DEV"");
         |                                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/export-internal.h:45:28: note: in definition of macro '__KSYMTAB'
      45 |             "   .asciz \"" ns "\""                                      "\n"    \
         |                            ^~
   sound/soc/sof/snd-sof-acpi.mod.c:15:1: note: in expansion of macro 'KSYMTAB_DATA'
      15 | KSYMTAB_DATA(sof_acpi_pm, "", ""SND_SOC_SOF_ACPI_DEV"");
         | ^~~~~~~~~~~~
   include/linux/export-internal.h:41:12: note: to match this '('
      41 |         asm("   .section \"__ksymtab_strings\",\"aMS\",%progbits,1"     "\n"    \
         |            ^
   include/linux/export-internal.h:63:41: note: in expansion of macro '__KSYMTAB'
      63 | #define KSYMTAB_DATA(name, sec, ns)     __KSYMTAB(name, name, sec, ns)
         |                                         ^~~~~~~~~
   sound/soc/sof/snd-sof-acpi.mod.c:15:1: note: in expansion of macro 'KSYMTAB_DATA'
      15 | KSYMTAB_DATA(sof_acpi_pm, "", ""SND_SOC_SOF_ACPI_DEV"");
         | ^~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
