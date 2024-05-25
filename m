Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07B3B652
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 May 2024 20:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716669781; cv=none; b=qGU+y6fnjhHBYwI3sZUcDUGxltRl9o8F0axtS+aOzDiHaRCYRqE6x+Ai4g1XEn0lObN8Z4bhgLoqzr1J0rhrxhM9ffl9p6TQkDqn+J1fe5YHXLmMUb2CDct8oUbE1LgRCPgdgd7o6bYMdgDeuBEz0WEkDjcS/SU5QYE0SE36nF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716669781; c=relaxed/simple;
	bh=EEKfYgTh4onrCGiGrfQrMwdJ3Qa098V89ig8My7ybhw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BJcSCZser1mI1CvYfqET8hO3QKcjkjfXNTVVQNeKBqnLiCK4vYFyiVCMznTX5/tYsCIEQ0Rjj5SrUxaERo5+aPtDFEk9TC5gPCdv7d3Tozh3XOTBm/DHaqzvkGxjxwg1ctLrgRYxI6Kp1YqMH3oQN7qtbhAKpJeDpWdEeMGoQKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BqQLt0eE; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BqQLt0eE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716669780; x=1748205780;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EEKfYgTh4onrCGiGrfQrMwdJ3Qa098V89ig8My7ybhw=;
  b=BqQLt0eE6agpkgdfj8513gnw8qhUTkzzP+VAXU+YwMmsQJRi+TtDYqm2
   9iIRZEA4e46Dt4DcII2FNaX6oClcVXxGqeDA+I7ZgUaTYHEPwFYE7D2OE
   2Pkd5nu4W0g2brXbNYtFrfqVRENnucKs3ic59YJirLixfkhlV6vOmHUPJ
   Nvf63iSSiHdzxNqy6eGA+NOg1guB5Wisqdm2X9Jo4pamlHQI6c3xHxouI
   A0u3KxmazIZI+WZetFh2O/KnKBQCGmL1KqBSEWxtfGPUm/X57SsWuW+sT
   RZMiH7u3JR4lGq1KiI3FvXLtqT77mF9blc+uOusUc+UYshi/on4q7z2CU
   w==;
X-CSE-ConnectionGUID: OecqbQ70Stq+DHOh8tlk/Q==
X-CSE-MsgGUID: JomHYxTbRJOF+TRtx+HyVg==
X-IronPort-AV: E=McAfee;i="6600,9927,11083"; a="12847497"
X-IronPort-AV: E=Sophos;i="6.08,189,1712646000"; 
   d="scan'208";a="12847497"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2024 13:42:59 -0700
X-CSE-ConnectionGUID: q65nBIoOR12RguTI1hPF0w==
X-CSE-MsgGUID: 7BZpJjXrTrWzsYcemSGIPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,189,1712646000"; 
   d="scan'208";a="34439617"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 25 May 2024 13:42:58 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAyEB-0007ON-1a;
	Sat, 25 May 2024 20:42:55 +0000
Date: Sun, 26 May 2024 04:42:52 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:cpumask-types 1/3] arch/s390/kernel/smp.c:749:17: error:
 'else' without a previous 'if'
Message-ID: <202405260448.8ysnV5Y7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux cpumask-types
head:   04d10bebce942cfc9871eca228852a351b276a06
commit: d5eb3dc501e35703d699513beb178aa90ce49a13 [1/3] cpumask: introduce assign_cpu() macro
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240526/202405260448.8ysnV5Y7-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240526/202405260448.8ysnV5Y7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405260448.8ysnV5Y7-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/s390/kernel/smp.c: In function 'smp_add_core':
>> arch/s390/kernel/smp.c:749:17: error: 'else' without a previous 'if'
     749 |                 else
         |                 ^~~~


vim +749 arch/s390/kernel/smp.c

8b646bd759086f Martin Schwidefsky 2012-03-11  723  
72a81ad9d6d62d Heiko Carstens     2019-11-17  724  static int smp_add_core(struct sclp_core_entry *core, cpumask_t *avail,
72a81ad9d6d62d Heiko Carstens     2019-11-17  725  			bool configured, bool early)
08d07968277cd8 Heiko Carstens     2008-01-26  726  {
8b646bd759086f Martin Schwidefsky 2012-03-11  727  	struct pcpu *pcpu;
72a81ad9d6d62d Heiko Carstens     2019-11-17  728  	int cpu, nr, i;
10ad34bc76dfbc Martin Schwidefsky 2015-01-14  729  	u16 address;
08d07968277cd8 Heiko Carstens     2008-01-26  730  
8b646bd759086f Martin Schwidefsky 2012-03-11  731  	nr = 0;
72a81ad9d6d62d Heiko Carstens     2019-11-17  732  	if (sclp.has_core_type && core->type != boot_core_type)
72a81ad9d6d62d Heiko Carstens     2019-11-17  733  		return nr;
72a81ad9d6d62d Heiko Carstens     2019-11-17  734  	cpu = cpumask_first(avail);
72a81ad9d6d62d Heiko Carstens     2019-11-17  735  	address = core->core_id << smp_cpu_mt_shift;
72a81ad9d6d62d Heiko Carstens     2019-11-17  736  	for (i = 0; (i <= smp_cpu_mtid) && (cpu < nr_cpu_ids); i++) {
72a81ad9d6d62d Heiko Carstens     2019-11-17  737  		if (pcpu_find_address(cpu_present_mask, address + i))
8b646bd759086f Martin Schwidefsky 2012-03-11  738  			continue;
8b646bd759086f Martin Schwidefsky 2012-03-11  739  		pcpu = pcpu_devices + cpu;
72a81ad9d6d62d Heiko Carstens     2019-11-17  740  		pcpu->address = address + i;
72a81ad9d6d62d Heiko Carstens     2019-11-17  741  		if (configured)
72a81ad9d6d62d Heiko Carstens     2019-11-17  742  			pcpu->state = CPU_STATE_CONFIGURED;
72a81ad9d6d62d Heiko Carstens     2019-11-17  743  		else
72a81ad9d6d62d Heiko Carstens     2019-11-17  744  			pcpu->state = CPU_STATE_STANDBY;
50ab9a9a60fc83 Heiko Carstens     2012-09-04  745  		smp_cpu_set_polarization(cpu, POLARIZATION_UNKNOWN);
8b646bd759086f Martin Schwidefsky 2012-03-11  746  		set_cpu_present(cpu, true);
72a81ad9d6d62d Heiko Carstens     2019-11-17  747  		if (!early && smp_add_present_cpu(cpu) != 0)
8b646bd759086f Martin Schwidefsky 2012-03-11  748  			set_cpu_present(cpu, false);
08d07968277cd8 Heiko Carstens     2008-01-26 @749  		else
8b646bd759086f Martin Schwidefsky 2012-03-11  750  			nr++;
72a81ad9d6d62d Heiko Carstens     2019-11-17  751  		cpumask_clear_cpu(cpu, avail);
72a81ad9d6d62d Heiko Carstens     2019-11-17  752  		cpu = cpumask_next(cpu, avail);
72a81ad9d6d62d Heiko Carstens     2019-11-17  753  	}
72a81ad9d6d62d Heiko Carstens     2019-11-17  754  	return nr;
72a81ad9d6d62d Heiko Carstens     2019-11-17  755  }
72a81ad9d6d62d Heiko Carstens     2019-11-17  756  

:::::: The code at line 749 was first introduced by commit
:::::: 08d07968277cd898c88bf12b7720d89c02c4f139 [S390] Standby cpu activation/deactivation.

:::::: TO: Heiko Carstens <heiko.carstens@de.ibm.com>
:::::: CC: Martin Schwidefsky <schwidefsky@de.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
