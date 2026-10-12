Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F08F3C1419
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Oct 2026 22:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791843195; cv=none; b=j6uRaJNT1T1XyNpxDkfhtEeUUfk+fn3FhYt3QgU0ypdomCXnKqMPk28q2s+p/L+d5TKuoVUhwTokE2Rzh3k5F6OCTWvyvi0qmpqFU+kgqzAMmzOEHEwnCeDtres60pFVyXmUX1ehNo44TCe7KVOc7kQWawG9XnS5Er1o23ww0R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791843195; c=relaxed/simple;
	bh=5EKikKoqH5V87ixhabJcneoQ1CTsd9NEfBdWDwdPBmc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=k/SMiT8YmfrIit+NCWyuYm+IossLvE0bTrHx3rAOI2IwFW53X4rfdNcMp+K8VB8NrkVDzou7HyANJie9HXDW5DrUfx23ZWx2/yOjTd7qyz5E40TnuWpKHQsnubJgtaTlHIAYhV1P1eyCzxqrB5i9bKbYkQIs2f8r1MrC8phN0ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VQk0bXaM; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VQk0bXaM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791843191; x=1823379191;
  h=date:from:to:cc:subject:message-id;
  bh=5EKikKoqH5V87ixhabJcneoQ1CTsd9NEfBdWDwdPBmc=;
  b=VQk0bXaMnhIeNR83YlCY8B30C1StNWLsEJHd7CJt5Id3XF95ZZX985lX
   Ra/qPT/h6lmVGrxL914Bpn0CgT7XxwSTgyLvAqQDZHECdljhfY3bQ6cUx
   ZltNSIG97nhHyM1BlMzXCUvFkd1FMMxJPJMV+o05H3SXPhxKnYaNBN4OP
   L984ZrJnrGr6mT1I3d2XUQtTcgCVtt59ZJt3MgEiNYXvIQ7yGcf0r8fER
   ERf2xqj2foZCiQF8FLigO//DRT7Vqj/3EL34Ep3ftM6TJgvLHgPMHgLng
   IBAPXR6CVCK6Xz9scArMTP8TA31eNzVpn4hHtoy+M0bStgFMP7JMH0ttC
   w==;
X-CSE-ConnectionGUID: S56MWvcoS5Sp6x6lE7WL3g==
X-CSE-MsgGUID: JEtpdE4JRFuWmG/r8vbllg==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="462337"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="462337"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 15:13:10 -0700
X-CSE-ConnectionGUID: VEF+P8AAToaQ87bOvknnjA==
X-CSE-MsgGUID: xP8IGXEATGaODNeAFuOawQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1011043"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Oct 2026 15:13:10 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGOGZ-00000000C9E-2Jvp;
	Mon, 12 Oct 2026 22:13:07 +0000
Date: Tue, 13 Oct 2026 06:12:43 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:spinwait-vanilla 6/6] arch/arm64/kernel/smp.c:111:12:
 warning: 'kexecbench_show' defined but not used
Message-ID: <202610130656.bCWZjnzD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux spinwait-vanilla
head:   79e142539e96f26748914dfd4ae38ad690f0b66d
commit: 79e142539e96f26748914dfd4ae38ad690f0b66d [6/6] [TEST] kexecbench: per-CPU kick/arrival cycle snapshots via /proc/kexecbench
config: arm64-randconfig-1002-20261013 (https://download.01.org/0day-ci/archive/20261013/202610130656.bCWZjnzD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261013/202610130656.bCWZjnzD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610130656.bCWZjnzD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/smp.c:111:12: warning: 'kexecbench_show' defined but not used [-Wunused-function]
     111 | static int kexecbench_show(struct seq_file *m, void *v)
         |            ^~~~~~~~~~~~~~~


vim +/kexecbench_show +111 arch/arm64/kernel/smp.c

   110	
 > 111	static int kexecbench_show(struct seq_file *m, void *v)
   112	{
   113		int cpu;
   114	
   115		for_each_possible_cpu(cpu) {
   116			if (!kexecbench_kick_cycles[cpu] && !kexecbench_arrive_cycles[cpu])
   117				continue;
   118			seq_printf(m, "cpu%d kick %llu arrive %llu\n", cpu,
   119				   kexecbench_kick_cycles[cpu],
   120				   kexecbench_arrive_cycles[cpu]);
   121		}
   122		return 0;
   123	}
   124	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
