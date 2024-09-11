Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC90A225D7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Sep 2024 05:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726033955; cv=none; b=sxouIE8jFL2pBXkkr5S3l9dxPXZTyPFAKTcJWLABVORftR/4SWGeL7+GFOWsJ1No/NXaSyl7NCPQPIrkRxqmmaqyDjqXLm9FiMlrgvbw68f8kbKUerkGxe9X7YAe2GnQ7xYcBXKDZj+ARNWXHi1uPLWsby/accWokAeL7Om0FJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726033955; c=relaxed/simple;
	bh=tbAhGS0A25TCg0JlaI8tBLfFsDEfE3pzQwFoqDEsZeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZgRKnbzjTr33Rg4RPL/hhmFBrOTLKSsTeSzHuOuwQL43LIyND6iX7/vmTZEaOlj2P6PBIKMVfE+e1JbsDP3FbuS6aJBZaQe8Lp0mSBgs+KlWdBjGyFqG+lt2KCmnnUUetGPUQyzQV7H2XldMDYLw5wWMHM9Lx4rPFr5r0GE7DSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nyhqd3my; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nyhqd3my"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726033953; x=1757569953;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tbAhGS0A25TCg0JlaI8tBLfFsDEfE3pzQwFoqDEsZeU=;
  b=Nyhqd3mymo20QGgyiZgyAEA2G7VtV5Xvvh/GNB7u+UubrKrfHLJxAFvn
   KnThWdmaI7GWnmJcwAV9fTxUBBgSPCMPacoLO2vHogEe7BDLI7ujQhuTL
   oQoYTTBurXz1ajzhdBQGI/9lEnLgmzczmQ+3Dh4i17EJElIwHG8joKFsP
   e7MTdmF5/7k6U50VFjQbE3YLE4oXYf97iAKFG5n1uBX9kULmdPyWDlApy
   sLMkmngQoaMi0QTwkm89Nph33Ut40W5C7d/6FfTyUpjAxqdbUaMIQ9NnG
   id1V4crxqZTh3UPxWp9vlgHpYYMUipRBDmjPy209V3Em+d0J+dBwmHRid
   g==;
X-CSE-ConnectionGUID: U9fmtvgCSG2ADgD0x68gzQ==
X-CSE-MsgGUID: WgefZ8HiRISAET9kJ1Yc7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="35483377"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="35483377"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 22:52:33 -0700
X-CSE-ConnectionGUID: E5ZFIETBThOlGpXz6YOJ8A==
X-CSE-MsgGUID: DVe3g8T7Qw6F8ooRWX4fcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="66890797"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Sep 2024 22:52:32 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soGHG-00036U-0j;
	Wed, 11 Sep 2024 05:52:30 +0000
Date: Wed, 11 Sep 2024 13:52:17 +0800
From: kernel test robot <lkp@intel.com>
To: Donglin Peng <dolinux.peng@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] function_graph: Support recording and printing the
 function return address
Message-ID: <202409111347.iY80vI4o-lkp@intel.com>
References: <20240908142544.1409032-1-dolinux.peng@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240908142544.1409032-1-dolinux.peng@gmail.com>

Hi Donglin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.11-rc7]
[cannot apply to next-20240910]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Donglin-Peng/function_graph-Support-recording-and-printing-the-function-return-address/20240908-222737
base:   linus/master
patch link:    https://lore.kernel.org/r/20240908142544.1409032-1-dolinux.peng%40gmail.com
patch subject: [RFC PATCH] function_graph: Support recording and printing the function return address
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240911/202409111347.iY80vI4o-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409111347.iY80vI4o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409111347.iY80vI4o-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/trace/trace_functions_graph.c: In function 'print_graph_entry_nested':
>> kernel/trace/trace_functions_graph.c:830:17: error: implicit declaration of function 'print_graph_retaddr'; did you mean 'print_graph_retval'? [-Wimplicit-function-declaration]
     830 |                 print_graph_retaddr(s, call, tr->trace_flags, true);
         |                 ^~~~~~~~~~~~~~~~~~~
         |                 print_graph_retval


vim +830 kernel/trace/trace_functions_graph.c

   797	
   798	static enum print_line_t
   799	print_graph_entry_nested(struct trace_iterator *iter,
   800				 struct ftrace_graph_ent_entry *entry,
   801				 struct trace_seq *s, int cpu, u32 flags)
   802	{
   803		struct ftrace_graph_ent *call = &entry->graph_ent;
   804		struct fgraph_data *data = iter->private;
   805		struct trace_array *tr = iter->tr;
   806		int i;
   807	
   808		if (data) {
   809			struct fgraph_cpu_data *cpu_data;
   810			int cpu = iter->cpu;
   811	
   812			cpu_data = per_cpu_ptr(data->cpu_data, cpu);
   813			cpu_data->depth = call->depth;
   814	
   815			/* Save this function pointer to see if the exit matches */
   816			if (call->depth < FTRACE_RETFUNC_DEPTH &&
   817			    !WARN_ON_ONCE(call->depth < 0))
   818				cpu_data->enter_funcs[call->depth] = call->func;
   819		}
   820	
   821		/* No time */
   822		print_graph_duration(tr, 0, s, flags | FLAGS_FILL_FULL);
   823	
   824		/* Function */
   825		for (i = 0; i < call->depth * TRACE_GRAPH_INDENT; i++)
   826			trace_seq_putc(s, ' ');
   827	
   828		trace_seq_printf(s, "%ps() {", (void *)call->func);
   829		if (flags & __TRACE_GRAPH_PRINT_RETADDR)
 > 830			print_graph_retaddr(s, call, tr->trace_flags, true);
   831		trace_seq_putc(s, '\n');
   832	
   833		if (trace_seq_has_overflowed(s))
   834			return TRACE_TYPE_PARTIAL_LINE;
   835	
   836		/*
   837		 * we already consumed the current entry to check the next one
   838		 * and see if this is a leaf.
   839		 */
   840		return TRACE_TYPE_NO_CONSUME;
   841	}
   842	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
