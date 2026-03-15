Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56F62E3FE
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Mar 2026 04:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773550616; cv=none; b=afS13Vq8YIo0tW0fB0md73I4ModPXgjSYIWsb1orYyF4QTPDzSCNOmFnHJhFAUDLXy53dQZsHfsgkevCdIBIKGWMtnT9nHQco/QETU6g3WSUqtqxthrd+p0tUnhtqLoiYTLY4Yn66gvgEBrH8It81ZBx5qsNUA7KMi41Xw+kJCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773550616; c=relaxed/simple;
	bh=pfjDdH8wsQ47MtjB60HpEFpTG20ZmvtWRCkPa+YQpH8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lZ7uJj/fB5vX4MiycAOtzqAp0ZgGg82SpZoJGx7pj5D2239BzejE9146lPEsSl2uRqgzJfZBsikwWFwY6eH1PP/zo+CKSBDc0edtk11XYVUquTP94rgv7c8K56Esp2eAkK4u6OobhBRkrRHWZOsMNPhksAyAWEKGO+gvS5uZ/lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nqdTtZK1; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nqdTtZK1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773550615; x=1805086615;
  h=date:from:to:cc:subject:message-id;
  bh=pfjDdH8wsQ47MtjB60HpEFpTG20ZmvtWRCkPa+YQpH8=;
  b=nqdTtZK1BAEEnOndQmbjcxjVEqOROzqz7vyhvfIWXksec9kqt4nQs0zS
   oZxZyghtSlcdps/9lptrrGSdcbQ54RgHX/5CP7+7hejvoOb86hl7goX7L
   TfDax4x/tgD6B+LZvuaIddAxu9ZEtffm+yQTAjp8i0GfZDzrXZr0CvCmc
   pS/jovM2aj2nrWI7U33N6BKrY3dYCCo8AYH60lJuJ2RvK+ns8RZs/pNX/
   ah4aWZITMlTNQ0y3mCP5idxCuaC2aBlzIg27Ub0/V+mp20h6pcHO623M4
   w5eO3vYb88Xo35nbX1z1UiLeQk2njOM5qhiTxBxDXO5XPBHMao/vXSahT
   Q==;
X-CSE-ConnectionGUID: nxMefs49T3iVA5r0Ft6mXw==
X-CSE-MsgGUID: aRowNcaqTk2e5QFKf8WA9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11729"; a="84920013"
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; 
   d="scan'208";a="84920013"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2026 21:56:54 -0700
X-CSE-ConnectionGUID: t3dZ0Mp0TGqUIPBUZ3rTJA==
X-CSE-MsgGUID: wmSIc9/1SWSBSWdx2RmahQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; 
   d="scan'208";a="246584624"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Mar 2026 21:56:52 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w1dX0-000000006BR-0ox4;
	Sun, 15 Mar 2026 04:56:50 +0000
Date: Sun, 15 Mar 2026 12:55:58 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Gregory Greenman <gregory.greenman@intel.com>
Subject: drivers/net/wireless/intel/iwlwifi/pcie/trans.c:1093:9:
 warning: 'CAUSE' redefined
Message-ID: <202603151235.VjEiAR0o-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Johannes,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   80234b5ab240f52fa45d201e899e207b9265ef91
commit: c1918196427b917d1fbf064b07538410807f8b03 iwlwifi: pcie: simplify MSI-X cause mapping
date:   3 years, 10 months ago
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20260315/202603151235.VjEiAR0o-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260315/202603151235.VjEiAR0o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603151235.VjEiAR0o-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/intel/iwlwifi/pcie/trans.c:1093:9: warning: 'CAUSE' redefined
    1093 | #define CAUSE(reg, mask)                                                \
         |         ^~~~~
   In file included from arch/mips/include/asm/ptrace.h:19,
                    from include/linux/sched/signal.h:14,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from arch/mips/include/asm/elf.h:12,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/pci.h:37,
                    from drivers/net/wireless/intel/iwlwifi/pcie/trans.c:7:
   arch/mips/include/uapi/asm/ptrace.h:18:9: note: this is the location of the previous definition
      18 | #define CAUSE           65
         |         ^~~~~


vim +/CAUSE +1093 drivers/net/wireless/intel/iwlwifi/pcie/trans.c

  1092	
> 1093	#define CAUSE(reg, mask)						\
  1094		{								\
  1095			.mask_reg = reg,					\
  1096			.bit = ilog2(mask),					\
  1097			.addr = ilog2(mask) +					\
  1098				((reg) == CSR_MSIX_FH_INT_MASK_AD ? -16 :	\
  1099				 (reg) == CSR_MSIX_HW_INT_MASK_AD ? 16 :	\
  1100				 0xffff),	/* causes overflow warning */	\
  1101		}
  1102	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
