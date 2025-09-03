Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6ED212D7C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Sep 2025 14:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756910479; cv=none; b=OGeMytLapPZg50KRuHASBkRAM6Z6b8EStgzfZPCcqbksEt7cS1fFM6VBPHx5mG32YS0uh5fZe2imfLaFaKT98W5x/lITIsM/+U2Y64Zr78Bsds7Plnr/mJXd/IvyFJSukMSGJtYBGY0sGpwrc8B+TnR55joCTG92m6u2InSZHk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756910479; c=relaxed/simple;
	bh=Q0LVTiQp+uyaIG8DTvlVIHk4pf80IYFqbW/ENXHVctA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EieYoCY+uEHsgVaecQLkjDMVRhEukKt7ZYC7ckXn4dlmPUnjnqRqNm2rOZZmgZ2AXkHZ8vxpORpVGG/wGsh89l6aerQexP7Nfv0T5JXF6afuU97YHSwDCoL7qne5HMfBbcpDehgCwVJZeF7WDqMtufGQvnvZpBfPrPwJtSMZNfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UURhiN35; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UURhiN35"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756910478; x=1788446478;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q0LVTiQp+uyaIG8DTvlVIHk4pf80IYFqbW/ENXHVctA=;
  b=UURhiN35kVG/QLaBcMT3e8N30akRnlqVVVRNVpCDhxmQxRVwsgTORg45
   37wmYfOQNlDHd5qnePXmgT+PcLuIIrWOjhzN2CB8yTfluobKuYiffs+kZ
   IrDHPeiPK/9c0v61rH+Vu0/mHstMIVLy1MudZIU/nCLntyMRh7jWxx+Ow
   fvcWPMNvS85GAG3kbtj0ZawBjVYY1COn5ssvv1iv88wZdd1roD02zf0Vt
   I9LaL9QGZlEvFDbWmRSwTC5ifvgxf5l/Nn6xHEAsFwL2QS4FwDxxOawGL
   Z0zIJtwRneEQ8Zo6RSOGt57WndcLWx+rEzkyZ3WSqVMwNg924JYamlhsN
   Q==;
X-CSE-ConnectionGUID: qOf0l73LR4SeF0RAAHKP4w==
X-CSE-MsgGUID: A/TBYwrbTr6vkUkpqioKQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="69838894"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="69838894"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 07:41:17 -0700
X-CSE-ConnectionGUID: c9hM8ejRT/ChgkG61QeJvw==
X-CSE-MsgGUID: yMDjmzYgRHyMqxgiP26n/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="171170902"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 03 Sep 2025 07:41:16 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utofi-00043r-1n;
	Wed, 03 Sep 2025 14:41:14 +0000
Date: Wed, 3 Sep 2025 22:40:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 1/1] mm/vmscan.c:4940:5:
 warning: no previous prototype for function 'print_node_mglru'
Message-ID: <202509032238.iYRZZxxE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   a455768539a13859e1ac78424797cae95f0dfaa2
commit: 5c82b782d441ff1b64fdf4d9f0617319c61c2e2b [1/1] CHROMIUM: Implementation of MGLRU in sysfs
config: i386-buildonly-randconfig-004-20250903 (https://download.01.org/0day-ci/archive/20250903/202509032238.iYRZZxxE-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250903/202509032238.iYRZZxxE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509032238.iYRZZxxE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/vmscan.c:683:15: warning: no previous prototype for function 'shrink_slab' [-Wmissing-prototypes]
     683 | unsigned long shrink_slab(gfp_t gfp_mask, int nid,
         |               ^
   mm/vmscan.c:683:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     683 | unsigned long shrink_slab(gfp_t gfp_mask, int nid,
         | ^
         | static 
>> mm/vmscan.c:4940:5: warning: no previous prototype for function 'print_node_mglru' [-Wmissing-prototypes]
    4940 | int print_node_mglru(struct lruvec *lruvec, char *buf, int orig_pos)
         |     ^
   mm/vmscan.c:4940:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4940 | int print_node_mglru(struct lruvec *lruvec, char *buf, int orig_pos)
         | ^
         | static 
   mm/vmscan.c:5063:54: warning: format specifies type 'int *' but the argument has type 'unsigned long *' [-Wformat]
    5062 |                 n = sscanf(cur, "%c %u %u %lu %n %u %n %lu %n", &cmd, &memcg_id, &nid,
         |                                                            ~~
    5063 |                            &seq, &end, &swappiness, &end, &nr_to_reclaim, &opt, &end);
         |                                                                           ^~~~
   mm/vmscan.c:5063:60: warning: data argument not used by format string [-Wformat-extra-args]
    5062 |                 n = sscanf(cur, "%c %u %u %lu %n %u %n %lu %n", &cmd, &memcg_id, &nid,
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    5063 |                            &seq, &end, &swappiness, &end, &nr_to_reclaim, &opt, &end);
         |                                                                                 ^
   mm/vmscan.c:5069:42: error: incompatible integer to pointer conversion passing 'unsigned int' to parameter of type 'struct scan_control *' [-Wint-conversion]
    5069 |                 err = run_cmd(cmd, memcg_id, nid, seq, swappiness, nr_to_reclaim, opt);
         |                                                        ^~~~~~~~~~
   mm/vmscan.c:4867:27: note: passing argument to parameter 'sc' here
    4867 |                    struct scan_control *sc, int swappiness, unsigned long opt);
         |                                         ^
   4 warnings and 1 error generated.


vim +/print_node_mglru +4940 mm/vmscan.c

  4939	
> 4940	int print_node_mglru(struct lruvec *lruvec, char *buf, int orig_pos)
  4941	{
  4942		unsigned long seq;
  4943		struct lru_gen_struct *lrugen = &lruvec->lrugen;
  4944	
  4945		DEFINE_MAX_SEQ(lruvec);
  4946		DEFINE_MIN_SEQ(lruvec);
  4947	
  4948		int print_pos = orig_pos;
  4949	
  4950		seq = min(min_seq[0], min_seq[1]);
  4951	
  4952		for (; seq <= max_seq; seq++) {
  4953			int gen, type, zone;
  4954			unsigned int msecs;
  4955	
  4956			gen = lru_gen_from_seq(seq);
  4957			msecs = jiffies_to_msecs(jiffies - READ_ONCE(lrugen->timestamps[gen]));
  4958	
  4959			print_pos += snprintf(buf + print_pos, PAGE_SIZE - print_pos,
  4960				" %10lu %10u", seq, msecs);
  4961	
  4962			for (type = 0; type < ANON_AND_FILE; type++) {
  4963				long size = 0;
  4964	
  4965				if (seq < min_seq[type]) {
  4966					print_pos += snprintf(buf + print_pos,
  4967						PAGE_SIZE - print_pos, "         -0 ");
  4968					continue;
  4969				}
  4970	
  4971				for (zone = 0; zone < MAX_NR_ZONES; zone++)
  4972					size += READ_ONCE(lrugen->nr_pages[gen][type][zone]);
  4973	
  4974				print_pos += snprintf(buf + print_pos,
  4975					PAGE_SIZE - print_pos, " %10lu ", max(size, 0L));
  4976			}
  4977	
  4978			print_pos += snprintf(buf + print_pos, PAGE_SIZE - print_pos, "\n");
  4979	
  4980		}
  4981	
  4982		return print_pos - orig_pos;
  4983	}
  4984	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
