Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C733B3815DB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 May 2026 12:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778503441; cv=none; b=l2kHsBJxod0+sVIeGpUC37av9txqiR5ry5YYFlGjwz77mnoDGXg+/kKV5VT5YLiyo4dnT+tXLPeTkvnD7VH2Wrr79QTgky4MmbdnCP/8GG0ZfW2SslWB/d07TM1H70LRZ+t7laG4l6n1Z7KPFJ0HEsOjbDvQ/gv1t/Tu3zZqDiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778503441; c=relaxed/simple;
	bh=UqAe3L0mgXbYVxoqkEgNJqME0Lv7i6bf9hjnqUOXOE4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=c9+/qU3SscRfNfx0DYDsGBKHN8h//VwA/QRzyh7+/M6tzb3zefrs5p/p3IX6PvDkCbQNeyOfPtNb+cutqtiI2avgkROIcqXj+jscSg1O6ROxms4NrT2ssJ703tms/+beI6ojROPqB9UJ/wI3wlPRUOsdfvdvmCvAZfItVqHuEuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hXK1M8ww; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hXK1M8ww"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778503440; x=1810039440;
  h=date:from:to:cc:subject:message-id;
  bh=UqAe3L0mgXbYVxoqkEgNJqME0Lv7i6bf9hjnqUOXOE4=;
  b=hXK1M8ww7li+zXiCoQhR+JQ8kWfT86ECFmytSuAEpkMHNPqgse7nwSVR
   tKDMFnfMH94bgq1YPqriQrEAyZ6P4k7iIxFAw2ZivPsAFeSLAXnX+2wIb
   H9RuoOc6Ie574nHhwTkrOw15f2gsoaAVkXlEKa/ubpfAqi042oRgJoVPw
   O830xZxr7tqqixAbAmdMh7dKYlTy6u8N19fatQzm4LOhPuB04SXD0wrtB
   3gKacY8MfqdDZAtLI2+50cn/6wV4NgY0k4Ya8EQ9a6EUWdA6aE7AgL7tm
   aYW5pvizVY9O8kUJY0PhRZLj866ZN06oj3R+DcPiSxQibPDERDWXPaNiD
   Q==;
X-CSE-ConnectionGUID: h7/jqrCZQ0aEPMklHNIHiw==
X-CSE-MsgGUID: qVkDPh48TbuCjhDeAeY5Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="79418782"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="79418782"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 05:43:59 -0700
X-CSE-ConnectionGUID: g+UT/kg/QWyCGBpiVAf8Ig==
X-CSE-MsgGUID: 6QUq5zR9Ruaz0ksXeL1Q7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="231050229"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 May 2026 05:43:58 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMPzH-000000000Yj-2elp;
	Mon, 11 May 2026 12:43:55 +0000
Date: Mon, 11 May 2026 20:43:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 1/1]
 mm/vmscan.c:4621:5: warning: no previous prototype for 'print_node_mglru'
Message-ID: <202605112031.Skstf2w2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Bryan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   80e99694479e5e9fe7c6230aad1327bbb9c655be
commit: 2038834ed810ff10b875445a030663d659c69500 [1/1] CHROMIUM: Reland of add implementation of MGLRU in sysfs
config: arm64-randconfig-001-20260511 (https://download.01.org/0day-ci/archive/20260511/202605112031.Skstf2w2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260511/202605112031.Skstf2w2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605112031.Skstf2w2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/vmscan.c:678:15: warning: no previous prototype for 'shrink_slab' [-Wmissing-prototypes]
     678 | unsigned long shrink_slab(gfp_t gfp_mask, int nid,
         |               ^~~~~~~~~~~
>> mm/vmscan.c:4621:5: warning: no previous prototype for 'print_node_mglru' [-Wmissing-prototypes]
    4621 | int print_node_mglru(struct lruvec *lruvec, char *buf, int orig_pos)
         |     ^~~~~~~~~~~~~~~~
   mm/vmscan.c: In function 'show_lru_gen_admin':
   mm/vmscan.c:4691:62: warning: format '%s' expects argument of type 'char *', but argument 5 has type 'void *' [-Wformat=]
    4691 |                                                 "memcg %5hu %s\n", mem_cgroup_id(memcg), path);
         |                                                             ~^                           ~~~~
         |                                                              |                           |
         |                                                              char *                      void *
         |                                                             %p
   mm/vmscan.c:4702:21: warning: assignment to 'char *' from 'long unsigned int' makes pointer from integer without a cast [-Wint-conversion]
    4702 |                 buf = PAGE_SIZE - 1;
         |                     ^


vim +/print_node_mglru +4621 mm/vmscan.c

  4620	
> 4621	int print_node_mglru(struct lruvec *lruvec, char *buf, int orig_pos)
  4622	{
  4623		unsigned long seq;
  4624		struct lrugen *lrugen = &lruvec->evictable;
  4625	
  4626		DEFINE_MAX_SEQ(lruvec);
  4627		DEFINE_MIN_SEQ(lruvec);
  4628	
  4629		int print_pos = orig_pos;
  4630	
  4631		seq = min(min_seq[0], min_seq[1]);
  4632	
  4633		for (; seq <= max_seq; seq++) {
  4634			int gen, type, zone;
  4635			unsigned int msecs;
  4636	
  4637			gen = lru_gen_from_seq(seq);
  4638			msecs = jiffies_to_msecs(jiffies - READ_ONCE(lrugen->timestamps[gen]));
  4639	
  4640			print_pos += snprintf(buf + print_pos, PAGE_SIZE - print_pos,
  4641				" %10lu %10u", seq, msecs);
  4642	
  4643			for (type = 0; type < ANON_AND_FILE; type++) {
  4644				long size = 0;
  4645	
  4646				if (seq < min_seq[type]) {
  4647					print_pos += snprintf(buf + print_pos,
  4648						PAGE_SIZE - print_pos, "         -0 ");
  4649					continue;
  4650				}
  4651	
  4652				for (zone = 0; zone < MAX_NR_ZONES; zone++)
  4653					size += READ_ONCE(lrugen->sizes[gen][type][zone]);
  4654	
  4655				print_pos += snprintf(buf + print_pos,
  4656					PAGE_SIZE - print_pos, " %10lu ", max(size, 0L));
  4657			}
  4658	
  4659			print_pos += snprintf(buf + print_pos, PAGE_SIZE - print_pos, "\n");
  4660	
  4661		}
  4662	
  4663		return print_pos - orig_pos;
  4664	}
  4665	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
