Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C979729B77E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 03:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765425154; cv=none; b=sTRu44+ETf9xoKnYoor6eH92hKPyz1VhlspSKc2D/JX0niVafe96Ljww2STvdIvYw7bsHQ1XL3dqTwHYUf4S2yr7NcIxOZxKrD9tLiYrqJC1Runb7LVI9qeWs5TLszQAyGgFw4vUd3mk/GCDJyL74BPrrfeY6wB0MRiO7w27EqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765425154; c=relaxed/simple;
	bh=pxm9JAsDb3UZ0YyVYKx5W6YI5Qy11DvGwSbLG0pxH10=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fWG4kyH1LDmGXokXEKemnCu+ATvQ0zMjumXzeTW7bnzdxocXlMdgADIW34mFr+NdAlyFw8RF0kwwk6+wZITBAyv89xAJshcMZBR+hVManMfYtIEJG6TQXh2JJ6QgrjBo2WxOC+whD7IRbB+GeCPiaCbXRG12npf5NcAOF3bxb04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RL1KnFph; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RL1KnFph"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765425153; x=1796961153;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pxm9JAsDb3UZ0YyVYKx5W6YI5Qy11DvGwSbLG0pxH10=;
  b=RL1KnFphcXckOSGLnX2I9fjj7zeIw0SjkbYv5MoIDU5XIrAPT4LBDEW6
   QIUaU56CysnXosY3wSPupSRGl209TJya35cVeaGopcY6RSucw2C4o0YhO
   eW/voKDSzBPBSvdivjYxa2lLvYqFu4OX+oH5N6hYwL8EXaiPvOlZ6qKfG
   qb5bWjr5A/t7cE0UMHCEORV7Tqr7Q7a30K1QtzM/mkKh4FrbaoJaeLdjk
   4dagrByRwmLV71i17k9nTaJlY/9AkvJmAguI5FUKs3fNLO5M0GIAsRGMp
   s54iM1F2SRIvKSGjFQ/VzoI7DVHTyaGM2SyxwOfm49QCrLQccxutmdWkh
   w==;
X-CSE-ConnectionGUID: ZXyST4rHQKiJ0Sdh/eREQw==
X-CSE-MsgGUID: 1pwVCAJ/QputTbhwwYjXyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="71250554"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="71250554"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 19:52:32 -0800
X-CSE-ConnectionGUID: svs3tJRJRvC5YdlDUjGFpw==
X-CSE-MsgGUID: V9H6E1kNT++4Q5a13DOiMA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Dec 2025 19:52:31 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTXjB-0000000047W-0KKe;
	Thu, 11 Dec 2025 03:52:29 +0000
Date: Thu, 11 Dec 2025 11:51:35 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-CWF-RDT-ANBZ24559 25/25]
 fs/proc/meminfo.c:39:37: warning: variable 'sunreclaim' set but not used
Message-ID: <202512111124.eu5QKxeA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-CWF-RDT-ANBZ24559
head:   443d7ee63a13180e69479cd694f03a167a87da2e
commit: 8f7eb2040fd583fc2f97df15f82f808a6969c4bc [25/25] anolis: meminfo: Add meminfo support for rich container
config: x86_64-anolis-intel-cloud-devel-6.6 (https://download.01.org/0day-ci/archive/20251211/202512111124.eu5QKxeA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111124.eu5QKxeA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111124.eu5QKxeA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/proc/meminfo.c: In function 'meminfo_proc_show':
>> fs/proc/meminfo.c:39:37: warning: variable 'sunreclaim' set but not used [-Wunused-but-set-variable]
      39 |         unsigned long sreclaimable, sunreclaim;
         |                                     ^~~~~~~~~~


vim +/sunreclaim +39 fs/proc/meminfo.c

e16e2d8e14a14b Joe Perches     2016-10-07  34  
e1759c215bee5a Alexey Dobriyan 2008-10-15  35  static int meminfo_proc_show(struct seq_file *m, void *v)
e1759c215bee5a Alexey Dobriyan 2008-10-15  36  {
e1759c215bee5a Alexey Dobriyan 2008-10-15  37  	struct sysinfo i;
e1759c215bee5a Alexey Dobriyan 2008-10-15  38  	unsigned long committed;
61f94e18de94f7 Vlastimil Babka 2018-10-26 @39  	unsigned long sreclaimable, sunreclaim;
e1759c215bee5a Alexey Dobriyan 2008-10-15  40  	int lru;
e1759c215bee5a Alexey Dobriyan 2008-10-15  41  
8f7eb2040fd583 Xunlei Pang     2021-06-04  42  	struct mem_cgroup *memcg = NULL;
8f7eb2040fd583 Xunlei Pang     2021-06-04  43  	struct sysinfo_ext ext;
8f7eb2040fd583 Xunlei Pang     2021-06-04  44  

:::::: The code at line 39 was first introduced by commit
:::::: 61f94e18de94f79abaad3bb83549ff78923ac785 mm, proc: add KReclaimable to /proc/meminfo

:::::: TO: Vlastimil Babka <vbabka@suse.cz>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
