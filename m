Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A2321D595
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 17:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734715977; cv=none; b=LWdMBF12KYtw0dAPbiY8E2VVufUhvmOgCn5o/XLRiTrHpbgynUVIrGkxt05zcINcxc+7KFV4yAl1/EAkjzjIrwzEfKHLfwPXrAxxxK0Ly/cYXQe/vv9nyDBCBjtCwwmP4tiOOhyxX8+/PcxGQDg1lVWUUhX9hGB1RBB/5sxlxr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734715977; c=relaxed/simple;
	bh=WLDSguGicwZVGxnouLRnblTcymibh7HmWwi2UeXOSCk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nZO+j+L6gCdgQVW6JogoWvEcje8dW6t8J4PNR036MRBVRsCIOdP/mAjViJkUsUG3t5tY3BgmbP73pep7B5mC1ofBmuS5jMVa6D/JjW9DszgrlNZ21XEbNQoKTZ0aGraL8RwZNaSHFWkZ01RjPWkjaQBZHemfTPKFioFWlL0vf24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KCUqcqwP; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KCUqcqwP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734715975; x=1766251975;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WLDSguGicwZVGxnouLRnblTcymibh7HmWwi2UeXOSCk=;
  b=KCUqcqwP6z2Pj3uhHJi31nI4vLV0drm5AKUXwmm/zLhpgCbO2IasdHQO
   9H91jNgVRGJ3/3+HuIMUaI26w40OZW2Tjv/TI1307FAiyDsE1kwj5rcZb
   /c18//LbhlCyvTW4la6whwK2Vxk08iMPf0SkD4MQGWAo1mfMh3bcqUkoV
   t3yULGbk58/tEnnQJ8NwtmvKWxx30VZkvoADwqdBKyx4R5f93YfM7slfb
   J5/wSByfvJNwo4y3bGOkrQb/esTGkE08ITG/gaf+bK2uLhkW2lW35AeY2
   tJ+jYHbwlPl0FM1NvAcF2SBPN5kwIqy4xTGlDZ6+cWKJbWCoTYtOtI2t5
   Q==;
X-CSE-ConnectionGUID: 6ZjIN4ZxTWOIS3wOGw2GAA==
X-CSE-MsgGUID: +YpGJhdlTayjH760Vpt8tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="35436417"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="35436417"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 09:32:54 -0800
X-CSE-ConnectionGUID: nLEmnzg0RhiJPltCNhNx3Q==
X-CSE-MsgGUID: HJXU36udToWgCByoWNT4zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103552811"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Dec 2024 09:32:53 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOgrr-0001U5-22;
	Fri, 20 Dec 2024 17:32:51 +0000
Date: Sat, 21 Dec 2024 01:32:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/optimized_usdt_3 5/15]
 arch/sparc/kernel/uprobes.c:312:1: error: conflicting types for
 'arch_uretprobe_hijack_return_addr'; have 'long unsigned int(long unsigned
 int,  struct arch_uprobe *, struct pt_regs *)'
Message-ID: <202412210136.a594Q8oq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/optimized_usdt_3
head:   f6bc1832180963f85ae355cd725b0755ff8eeb14
commit: b059d0a1ae256632fa1bade04c1ab8f7ac815cdb [5/15] uprobes: Add struct arch_uprobe to arch_uretprobe_hijack_return_addr
config: sparc64-defconfig (https://download.01.org/0day-ci/archive/20241221/202412210136.a594Q8oq-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412210136.a594Q8oq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412210136.a594Q8oq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/sparc/kernel/uprobes.c:312:1: error: conflicting types for 'arch_uretprobe_hijack_return_addr'; have 'long unsigned int(long unsigned int,  struct arch_uprobe *, struct pt_regs *)'
     312 | arch_uretprobe_hijack_return_addr(unsigned long trampoline_vaddr, struct arch_uprobe *auprobe,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/mm_types.h:16,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/xarray.h:16,
                    from include/linux/list_lru.h:14,
                    from include/linux/fs.h:13,
                    from include/linux/highmem.h:5,
                    from arch/sparc/kernel/uprobes.c:13:
   include/linux/uprobes.h:209:22: note: previous declaration of 'arch_uretprobe_hijack_return_addr' with type 'long unsigned int(struct arch_uprobe *, long unsigned int,  struct pt_regs *)'
     209 | extern unsigned long arch_uretprobe_hijack_return_addr(struct arch_uprobe *auprobe, unsigned long trampoline_vaddr,
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +312 arch/sparc/kernel/uprobes.c

   310	
   311	unsigned long
 > 312	arch_uretprobe_hijack_return_addr(unsigned long trampoline_vaddr, struct arch_uprobe *auprobe,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
