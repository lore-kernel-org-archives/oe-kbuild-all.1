Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16AA13BC02
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jun 2024 12:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717764314; cv=none; b=OK2RAwf8QIv5vV4zWdrzRlYhWgvTqzktQnKR0USV0WBZT35l0md5TFFhsLQbKqVYt/pdtB+UwNmlWs5687zujKfgbMQ4cXhJj3nNojQdxmuFzRWL0l6XJoigLZz0hhncY4eVvlI4D45AsNfCuCishJYTf535dei0dNHZruH55W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717764314; c=relaxed/simple;
	bh=UR3/HiH60qEpw9kkbiAQMRIa8IHPZ/14uYeaewchTwE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HKxo05rClOne1e2U3wakOplIgnCaABXHQEyGba2H9GYoRTSFQQklliTTe54NjGSy3dNKKPXyP/lGVivAVB+g23ncWOTju6tvEAqQcZXs1iJM1/U+Egv2XptaMKi1hMi/n/lKrLo3VyAfamv0enZ2BczZk50Awx5r34+KK+kHevM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k+wsUPoa; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k+wsUPoa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717764313; x=1749300313;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UR3/HiH60qEpw9kkbiAQMRIa8IHPZ/14uYeaewchTwE=;
  b=k+wsUPoa3zOx/T4tl8f+eMJFAIc6F/d17TwbcTaSsMHmKRrgS4/7DpWS
   fGOUAQ50wmSszBmQ7uysZ0jL1bgk7v0Ge+VCQad9P5XVgoXkskYs/rvBc
   RX/qezcJ+8BahjuV0SiYn3i1d58qv+vcU+o3pq0TJRgq4dH4e9IUKNLLL
   kz45z/UPskukCvUTLVb6LtP+9ohbfqXn0v4b0EuYlLy5BIk0DTUDceSP+
   DlS2KBdGZW/TDXPpEQ28qSOgRgdlG6Olye+qf+jtTmcBr47Ed7FqoCBNk
   PAeBKowboS2zDQy+XK+6T2FG6rMEGYUIkVGCi5kKejYdpngmU5n1isZGz
   w==;
X-CSE-ConnectionGUID: TGtf0PdnTE+2oF2QuSpdlQ==
X-CSE-MsgGUID: 9z/8qR8cRbiR8+47H+2bZg==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25109932"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="25109932"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 05:45:12 -0700
X-CSE-ConnectionGUID: lp1wRkAHQD2sQc3r5MST2A==
X-CSE-MsgGUID: u0GVlLY4RZyKU3bI3yciZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="38234205"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 07 Jun 2024 05:45:11 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFYxw-0004n8-13;
	Fri, 07 Jun 2024 12:45:08 +0000
Date: Fri, 7 Jun 2024 20:44:27 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Subject: [linux-next:master 3354/4582] kernel/trace/fgraph.c:934:8: error:
 call to undeclared function 'ftrace_startup_subops'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202406072042.h0bVZTGa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d35b2284e966c0bef3e2182a5c5ea02177dd32e4
commit: c132be2c4fcc1150ad0791c2a85dd4c9ad0bd0c8 [3354/4582] function_graph: Have the instances use their own ftrace_ops for filtering
config: mips-randconfig-r052-20240607 (https://download.01.org/0day-ci/archive/20240607/202406072042.h0bVZTGa-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240607/202406072042.h0bVZTGa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406072042.h0bVZTGa-lkp@intel.com/

Note: the linux-next/master HEAD d35b2284e966c0bef3e2182a5c5ea02177dd32e4 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from kernel/trace/fgraph.c:12:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> kernel/trace/fgraph.c:934:8: error: call to undeclared function 'ftrace_startup_subops'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     934 |         ret = ftrace_startup_subops(&graph_ops, &gops->ops, command);
         |               ^
>> kernel/trace/fgraph.c:973:2: error: call to undeclared function 'ftrace_shutdown_subops'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     973 |         ftrace_shutdown_subops(&graph_ops, &gops->ops, command);
         |         ^
   1 warning and 2 errors generated.


vim +/ftrace_startup_subops +934 kernel/trace/fgraph.c

   888	
   889	int register_ftrace_graph(struct fgraph_ops *gops)
   890	{
   891		int command = 0;
   892		int ret = 0;
   893		int i;
   894	
   895		mutex_lock(&ftrace_lock);
   896	
   897		if (!fgraph_array[0]) {
   898			/* The array must always have real data on it */
   899			for (i = 0; i < FGRAPH_ARRAY_SIZE; i++)
   900				fgraph_array[i] = &fgraph_stub;
   901		}
   902	
   903		/* Look for an available spot */
   904		for (i = 0; i < FGRAPH_ARRAY_SIZE; i++) {
   905			if (fgraph_array[i] == &fgraph_stub)
   906				break;
   907		}
   908		if (i >= FGRAPH_ARRAY_SIZE) {
   909			ret = -ENOSPC;
   910			goto out;
   911		}
   912	
   913		fgraph_array[i] = gops;
   914		if (i + 1 > fgraph_array_cnt)
   915			fgraph_array_cnt = i + 1;
   916		gops->idx = i;
   917	
   918		ftrace_graph_active++;
   919	
   920		if (ftrace_graph_active == 1) {
   921			register_pm_notifier(&ftrace_suspend_notifier);
   922			ret = start_graph_tracing();
   923			if (ret)
   924				goto error;
   925			/*
   926			 * Some archs just test to see if these are not
   927			 * the default function
   928			 */
   929			ftrace_graph_return = return_run;
   930			ftrace_graph_entry = entry_run;
   931			command = FTRACE_START_FUNC_RET;
   932		}
   933	
 > 934		ret = ftrace_startup_subops(&graph_ops, &gops->ops, command);
   935	error:
   936		if (ret) {
   937			fgraph_array[i] = &fgraph_stub;
   938			ftrace_graph_active--;
   939		}
   940	out:
   941		mutex_unlock(&ftrace_lock);
   942		return ret;
   943	}
   944	
   945	void unregister_ftrace_graph(struct fgraph_ops *gops)
   946	{
   947		int command = 0;
   948		int i;
   949	
   950		mutex_lock(&ftrace_lock);
   951	
   952		if (unlikely(!ftrace_graph_active))
   953			goto out;
   954	
   955		if (unlikely(gops->idx < 0 || gops->idx >= fgraph_array_cnt))
   956			goto out;
   957	
   958		WARN_ON_ONCE(fgraph_array[gops->idx] != gops);
   959	
   960		fgraph_array[gops->idx] = &fgraph_stub;
   961		if (gops->idx + 1 == fgraph_array_cnt) {
   962			i = gops->idx;
   963			while (i >= 0 && fgraph_array[i] == &fgraph_stub)
   964				i--;
   965			fgraph_array_cnt = i + 1;
   966		}
   967	
   968		ftrace_graph_active--;
   969	
   970		if (!ftrace_graph_active)
   971			command = FTRACE_STOP_FUNC_RET;
   972	
 > 973		ftrace_shutdown_subops(&graph_ops, &gops->ops, command);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
