Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47C53C870E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Oct 2026 08:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791273610; cv=none; b=G1qoats3ydmCzc4C6TeD0eE85pKTW81u2LHe+e0D/1sikP3RA3lFuvq+f5HPsl+isS7UBT7TkmBogY9DfhBN6E/H5SL5XPIiub6qny7u27MCCqAI1buzM0ERVBJFs2Mi0NdCscBxMHJLvQQq1OllplqetvxBbvFwiEBVXrjdTJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791273610; c=relaxed/simple;
	bh=6My7G0qKsYm3MADAGh9vOYQ32QJR1gE+TsKoxC6YvJE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lbS2pq+jxSpX9cKnHom1pG0oee9pal5Z/YrROsLRLnVYYDFkn1CXJlKUMZWRV6AVNo/AR/OejtTh8Ooy51ii3jBT6oYIOrRRwW8+/wcROVJd8jF6AM3sLfzHBsvUrAppx9HU1VcKT+kbMI5jedD7rtgQiYmStHh7KVkATnlrqec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GYC6d9gU; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GYC6d9gU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791273608; x=1822809608;
  h=date:from:to:cc:subject:message-id;
  bh=6My7G0qKsYm3MADAGh9vOYQ32QJR1gE+TsKoxC6YvJE=;
  b=GYC6d9gUxoRlm3vvBpLSYji860vu1YeLDdQ+YiwyZztUAkm9bgach6c0
   +IBd6NSmYnzoht1tD3b5h683grIHWUNjrF7gWG90d6EYhmnf8I/ZHUCBP
   OirCLck2zHneHOIHQ4n09NwslSfOwfK1ev3t9iUfx/X5h1eoHMQgevkzx
   20333YpapHhn/x+j9TwBslg6QVAIa5aQO+ZeM85SdZkH5PWlVeddDUih0
   1QxENu/McDV6iA2eQUcbkJXZtBGOeZuXhTIecws9s5TdYCnavpPJPAMsD
   M7SzBbWIlgSbJHK0srG12JktvNKvwuwA2T0ehCBK+IRI3F63XWVqAJEvZ
   g==;
X-CSE-ConnectionGUID: 3QyCIXtsSc218loEejsgSw==
X-CSE-MsgGUID: VAQHZhALQwGWDopDEXYXWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="9539"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="9539"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 01:00:07 -0700
X-CSE-ConnectionGUID: MQE0RGkOQHy8OEVXJ0nJBw==
X-CSE-MsgGUID: aWGJpzkIQ1mK66QArobtIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="280805644"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Oct 2026 01:00:06 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xE05j-000000001KG-1CmV;
	Tue, 06 Oct 2026 08:00:03 +0000
Date: Tue, 06 Oct 2026 15:59:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 0/4]
 mm/vmscan.c:4621:5: warning: no previous prototype for 'print_node_mglru'
Message-ID: <202610061517.QwEgKdd2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Bryan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   6f82755ed602e815541b2c6617a3f30f53500cdc
commit: 2038834ed810ff10b875445a030663d659c69500 [0/4] CHROMIUM: Reland of add implementation of MGLRU in sysfs
config: i386-randconfig-1005-20261006 (https://download.01.org/0day-ci/archive/20261006/202610061517.QwEgKdd2-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261006/202610061517.QwEgKdd2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610061517.QwEgKdd2-lkp@intel.com/

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
