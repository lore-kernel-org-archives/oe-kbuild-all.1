Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669B61849
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Mar 2024 01:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710554077; cv=none; b=dc4GyLd3u7VeN7Sq7gB14qjykdhR9Hz++3kbKOIddEXje9lj08vjagnsX4f/i69/Vx07lLArCoSdc5ZZF/p5UrMjOnxow5yXJIPwrEcnait23zDgTaKiwm1TR/0SeHMTSOeG/w1lapwLxdRBYf40G9JKpvFpqTf6ieMCkIkyOoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710554077; c=relaxed/simple;
	bh=9z2hsWDZYh5jeaQ6zFhc165HIq+PxVTylpV4HlZjYrE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jnINL5c13QWF1Eu99jB2ALkS2hxb3f6eL699F3/Iq3vLUYirjj83k0xUlz6MSP1YyZEJZy4ukZz1Gs4IslNVAZa0IqmS21XfOj7b5WvGlhlZVWxU3AXaPxaj2ckcv/Y4ehDrYCqr7qk6YSrB5PkRnln7kHkissXVN9AmcnPIdvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z/0WvRgm; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z/0WvRgm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710554075; x=1742090075;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9z2hsWDZYh5jeaQ6zFhc165HIq+PxVTylpV4HlZjYrE=;
  b=Z/0WvRgm2TyeQA15lHzZIniCl4M9V0f9Q+J0Ur/aS9DAq358hHBELSFW
   MPex9b7nWNK2DgWmq4jQ9MMZ7Qb7N5/GkF2ukZrwplduXaSQ3Y7N/+b8g
   rKAsffRsXoIq+JC2SUvFIw/QhOnGN8pn+uB3OHQ5tYZ2VpD0AqABr1V3W
   hLiAGQ96kINBZ4L2D3M20bKWjbqtDAZYBqLs9i2B41J09CbnTBiBYjvA5
   hEKXeJpYXFT1OCod2TgOT0s/5+MrkAjDhCWmSoDldpiZgfTj+0dKZ4shu
   MHQkyjNIOJDTo3qCdJ+tahR9PcYfXea/GHN32/ITgKuQTBlCe5A2uir2p
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="5574039"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="5574039"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 18:54:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="12758894"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 15 Mar 2024 18:54:31 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlJFl-000EyP-0G;
	Sat, 16 Mar 2024 01:54:29 +0000
Date: Sat, 16 Mar 2024 09:54:28 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 26606/27507] fs/proc/stat.c:49:5:
 warning: no previous prototype for function 'get_idle_time'
Message-ID: <202403160947.XqsVu10P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   fdd5d0bfc620bd5147ff5b260822c7645aeddad6
commit: e217e373191dfc1d1f4beb2fa85780663869c068 [26606/27507] rue/cpu: Add /proc/bt_stat and /proc/pid/sched support for SCHED_BT
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240316/202403160947.XqsVu10P-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240316/202403160947.XqsVu10P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403160947.XqsVu10P-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/proc/stat.c:49:5: warning: no previous prototype for function 'get_idle_time' [-Wmissing-prototypes]
      49 | u64 get_idle_time(struct kernel_cpustat *kcs, int cpu)
         |     ^
   fs/proc/stat.c:49:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      49 | u64 get_idle_time(struct kernel_cpustat *kcs, int cpu)
         | ^
         | static 
>> fs/proc/stat.c:65:5: warning: no previous prototype for function 'get_iowait_time' [-Wmissing-prototypes]
      65 | u64 get_iowait_time(struct kernel_cpustat *kcs, int cpu)
         |     ^
   fs/proc/stat.c:65:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      65 | u64 get_iowait_time(struct kernel_cpustat *kcs, int cpu)
         | ^
         | static 
>> fs/proc/stat.c:96:6: warning: no previous prototype for function 'show_all_irqs' [-Wmissing-prototypes]
      96 | void show_all_irqs(struct seq_file *p)
         |      ^
   fs/proc/stat.c:96:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      96 | void show_all_irqs(struct seq_file *p)
         | ^
         | static 
   3 warnings generated.


vim +/get_idle_time +49 fs/proc/stat.c

    48	
  > 49	u64 get_idle_time(struct kernel_cpustat *kcs, int cpu)
    50	{
    51		u64 idle, idle_usecs = -1ULL;
    52	
    53		if (cpu_online(cpu))
    54			idle_usecs = get_cpu_idle_time_us(cpu, NULL);
    55	
    56		if (idle_usecs == -1ULL)
    57			/* !NO_HZ or cpu offline so we can rely on cpustat.idle */
    58			idle = kcs->cpustat[CPUTIME_IDLE];
    59		else
    60			idle = idle_usecs * NSEC_PER_USEC;
    61	
    62		return idle;
    63	}
    64	
  > 65	u64 get_iowait_time(struct kernel_cpustat *kcs, int cpu)
    66	{
    67		u64 iowait, iowait_usecs = -1ULL;
    68	
    69		if (cpu_online(cpu))
    70			iowait_usecs = get_cpu_iowait_time_us(cpu, NULL);
    71	
    72		if (iowait_usecs == -1ULL)
    73			/* !NO_HZ or cpu offline so we can rely on cpustat.iowait */
    74			iowait = kcs->cpustat[CPUTIME_IOWAIT];
    75		else
    76			iowait = iowait_usecs * NSEC_PER_USEC;
    77	
    78		return iowait;
    79	}
    80	
    81	#endif
    82	
    83	static void show_irq_gap(struct seq_file *p, unsigned int gap)
    84	{
    85		static const char zeros[] = " 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0";
    86	
    87		while (gap > 0) {
    88			unsigned int inc;
    89	
    90			inc = min_t(unsigned int, gap, ARRAY_SIZE(zeros) / 2);
    91			seq_write(p, zeros, 2 * inc);
    92			gap -= inc;
    93		}
    94	}
    95	
  > 96	void show_all_irqs(struct seq_file *p)
    97	{
    98		unsigned int i, next = 0;
    99	
   100		for_each_active_irq(i) {
   101			show_irq_gap(p, i - next);
   102			seq_put_decimal_ull(p, " ", kstat_irqs_usr(i));
   103			next = i + 1;
   104		}
   105		show_irq_gap(p, nr_irqs - next);
   106	}
   107	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
