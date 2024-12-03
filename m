Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EB9364AE
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Dec 2024 02:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733193983; cv=none; b=CijzT7obuG3u4poS0di25S11+lA3MKZyRgVsWu5KkFF0PXmO0WdVqeXzzVQjT/8qGe9IjGhcbhpiCFC/ac7pb52w4cdPKHX86piLaMn1L57+o7l/bT5juUd76KAt68eh4YRNcIywJe1Vb6T4I8PCh2RVWl2EJDdfd+V2g2uRnKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733193983; c=relaxed/simple;
	bh=p+9IQaTEhjRDZgca43dmhPyEnBzM4e3/pQNVMyeVmmA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nbEp28xC5u3fcZ9V13AjUexqdgLasRI2euzJ11vzmn2DzpgkmjeYvfpigmAlavctBUfGu7gQH7Ln/LPVgvDkw8CaNCuIFpgrD9JzvxIPl9ACljHruYlXvvisiAymxGHp0BjY0MJblYVMu+VzvXBhC2HiMomWFXDjEzpQ6w0n+IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=buiFv81g; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="buiFv81g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733193982; x=1764729982;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p+9IQaTEhjRDZgca43dmhPyEnBzM4e3/pQNVMyeVmmA=;
  b=buiFv81gTs1sfCRB9UEfxZCFfPHqEBTnQtJDWk1WKHUolNgzZZIWtF7J
   awATrh1AaMJirAjdoK9JUhLKWPsHSU/0J84ekNERhfSGeyNIEOnHnAH6l
   qPHu2oP4utRjMoYW1fBsZ8PP6K0vg3IjXFotzzFYOx/jnb9+y+yGk0LiI
   zkaiGie1O2IBYRg2BiNiZ+rRBYuhPNs4G18L0AwvUeVbuuKBRJLDZVwbD
   TlBfhUyi0dRoW+2h2NukioMBKymKwf/liAaSoqZzmE/TLhffz90lhGCFs
   Pz9AFOstt3OeI9Z2BTiZKpr7aoEQWqe92wttQlr2wUfAE/1ue0ik33/8L
   A==;
X-CSE-ConnectionGUID: A5qyXDnfRaujaPmIsLwKLA==
X-CSE-MsgGUID: s5NTOuJwRraTxD1k6xNZgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="32743848"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="32743848"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 18:46:19 -0800
X-CSE-ConnectionGUID: 41wOvGGkQuquD4Prytiqpg==
X-CSE-MsgGUID: OaU9YnXKSXWZHy1MboyG8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="130753966"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 02 Dec 2024 18:46:18 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIIvX-0003Bx-2E;
	Tue, 03 Dec 2024 02:46:15 +0000
Date: Tue, 3 Dec 2024 10:45:40 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wupeng Ma <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2439/2439]
 arch/arm64/kernel/cpufeature.c:1729:13: warning: no previous prototype for
 'early_pbha_init'
Message-ID: <202412031005.m61DNVfj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ma,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   929a9df37c1b7dec73fd417d79a116d02a8f9380
commit: f43933b3f947a7f9314ec8d704c6ae01041dbbba [2439/2439] arm64: cpufeature: Enable PBHA for stage1 early via FDT
config: arm64-randconfig-004-20241117 (https://download.01.org/0day-ci/archive/20241203/202412031005.m61DNVfj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412031005.m61DNVfj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412031005.m61DNVfj-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the asmlinkage attribute
All warnings (new ones prefixed by >>):

   arch/arm64/kernel/cpufeature.c:1627:6: warning: no previous prototype for 'update_pbha_perf_only_bit' [-Wmissing-prototypes]
    1627 | void update_pbha_perf_only_bit(const u8 *bits, int cnt)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kernel/cpufeature.c:1729:13: warning: no previous prototype for 'early_pbha_init' [-Wmissing-prototypes]
    1729 | void __init early_pbha_init(void)
         |             ^~~~~~~~~~~~~~~


vim +/early_pbha_init +1729 arch/arm64/kernel/cpufeature.c

  1728	
> 1729	void __init early_pbha_init(void)
  1730	{
  1731		void *fdt;
  1732		int node;
  1733		const u8 *prop;
  1734		int size;
  1735	
  1736		spin_lock(&pbha_dt_lock);
  1737	
  1738		fdt = get_early_fdt_ptr();
  1739		if (!fdt)
  1740			goto unlock;
  1741	
  1742		node = fdt_path_offset(fdt, "/cpus");
  1743		if (node < 0)
  1744			goto unlock;
  1745	
  1746		prop = fdt_getprop(fdt, node, "arm,pbha-performance-only", &size);
  1747		if (!prop)
  1748			goto unlock;
  1749	
  1750		if (!cpu_has_pbha())
  1751			goto unlock;
  1752	
  1753		update_pbha_perf_only_bit(prop, size);
  1754		enable_pbha_inner();
  1755	
  1756		pbha_enabled = true;
  1757	
  1758	unlock:
  1759		spin_unlock(&pbha_dt_lock);
  1760	}
  1761	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
