Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E6A78C96
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jun 2024 10:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717757336; cv=none; b=QjVFbZTSBLhP+eOnJUqF22ZIX3tsuzKkUfLjd4crmGiKcgm4dRNYXl2YH7BTYIC+PdbNc3uJZhtTur6X0AciXriUB4N42Sa5/5xwS3bVuh5843YuQwVWVqoTxEH3YM9XKCreLudY447aW0XtSUKiHAOWjqBrlbkNmLRl8hZ/Ck0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717757336; c=relaxed/simple;
	bh=HuGPzZSMD7q2VP1cuFUflIktIMHPigJfvave7u/UrGY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u+4oZApqevuq4iux4E1ThqMKPjINqoFO1Ko1VbwUFBnYIne5Tjn65UQKS9oEHA5aa5ImMFA9XkT3h3v1HG95stLFaglc87mNrz3mB9hWJogYdGwKggYfoM/HyGDt/7S+aSMYpQlg5rlrdD4ylAPym5xfUY+zlah/92oe83/xeVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jM7kqyws; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jM7kqyws"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717757335; x=1749293335;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HuGPzZSMD7q2VP1cuFUflIktIMHPigJfvave7u/UrGY=;
  b=jM7kqywsxeBEsWcEp/LAh+6ppzlo7JozBFRexaW2vOpuZk2dFBNBvxTg
   7Moz/vIgp/yVbbNtONpK8pApU+uCsU2IRY/PsFUmY+0N3RSQzBtmpbJd7
   v6p85SgbrIW86bqiT/BTECPxLR2j8RT+AvTOR0IHei3063bbTcLssiE2Q
   BEV3yqWMLJ78sWFL7ReSZO6HCE/6tWXj4QT6G4XP49/Qw7mf9GynqBSwu
   TD1pDgXWXO9oMYA8vG3rxGtqCVX3RIEzuH1n880Dyrvt41jlOINUJONiX
   hkgjW51vwf/5KbdIFTbsVbjppZ2vmDCIu2Bh/BqMFdHFznXpmavYJeCxq
   w==;
X-CSE-ConnectionGUID: Pm+DGm4ATTSYsq5cvYKQjw==
X-CSE-MsgGUID: M+80+8hzQ8aGOgsCyR13FQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="11962509"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; 
   d="scan'208";a="11962509"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 03:48:54 -0700
X-CSE-ConnectionGUID: joqy8trKTaqhT2swqlE6WQ==
X-CSE-MsgGUID: dVglu0PhRBCXl4ai5OLTKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; 
   d="scan'208";a="38226045"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 07 Jun 2024 03:48:53 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFX9P-0004fA-0j;
	Fri, 07 Jun 2024 10:48:51 +0000
Date: Fri, 7 Jun 2024 18:47:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (Google)" <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 4360/4582] kernel/trace/fgraph.c:1175:28:
 warning: unused variable 'op'
Message-ID: <202406071806.BRjaC5FF-lkp@intel.com>
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
commit: 4057fd2cddaea0d6f6c5f8af4a455741f5632259 [4360/4582] function_graph: Do not update pid func if CONFIG_DYNAMIC_FTRACE not enabled
config: csky-randconfig-001-20240607 (https://download.01.org/0day-ci/archive/20240607/202406071806.BRjaC5FF-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240607/202406071806.BRjaC5FF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406071806.BRjaC5FF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/trace/fgraph.c: In function 'fgraph_update_pid_func':
>> kernel/trace/fgraph.c:1175:28: warning: unused variable 'op' [-Wunused-variable]
    1175 |         struct ftrace_ops *op;
         |                            ^~
>> kernel/trace/fgraph.c:1174:28: warning: unused variable 'gops' [-Wunused-variable]
    1174 |         struct fgraph_ops *gops;
         |                            ^~~~
   kernel/trace/fgraph.c: At top level:
>> kernel/trace/fgraph.c:1154:12: warning: 'fgraph_pid_func' defined but not used [-Wunused-function]
    1154 | static int fgraph_pid_func(struct ftrace_graph_ent *trace,
         |            ^~~~~~~~~~~~~~~


vim +/op +1175 kernel/trace/fgraph.c

e73e679f656e67 Steven Rostedt (VMware  2018-11-15  1153) 
df3ec5da6a1e7f Steven Rostedt (Google  2024-06-03 @1154) static int fgraph_pid_func(struct ftrace_graph_ent *trace,
df3ec5da6a1e7f Steven Rostedt (Google  2024-06-03  1155) 			   struct fgraph_ops *gops)
df3ec5da6a1e7f Steven Rostedt (Google  2024-06-03  1156) {
df3ec5da6a1e7f Steven Rostedt (Google  2024-06-03  1157) 	struct trace_array *tr = gops->ops.private;
df3ec5da6a1e7f Steven Rostedt (Google  2024-06-03  1158) 	int pid;
df3ec5da6a1e7f Steven Rostedt (Google  2024-06-03  1159) 
df3ec5da6a1e7f Steven Rostedt (Google  2024-06-03  1160) 	if (tr) {
df3ec5da6a1e7f Steven Rostedt (Google  2024-06-03  1161) 		pid = this_cpu_read(tr->array_buffer.data->ftrace_ignore_pid);
df3ec5da6a1e7f Steven Rostedt (Google  2024-06-03  1162) 		if (pid == FTRACE_PID_IGNORE)
df3ec5da6a1e7f Steven Rostedt (Google  2024-06-03  1163) 			return 0;
df3ec5da6a1e7f Steven Rostedt (Google  2024-06-03  1164) 		if (pid != FTRACE_PID_TRACE &&
df3ec5da6a1e7f Steven Rostedt (Google  2024-06-03  1165) 		    pid != current->pid)
df3ec5da6a1e7f Steven Rostedt (Google  2024-06-03  1166) 			return 0;
df3ec5da6a1e7f Steven Rostedt (Google  2024-06-03  1167) 	}
df3ec5da6a1e7f Steven Rostedt (Google  2024-06-03  1168) 
df3ec5da6a1e7f Steven Rostedt (Google  2024-06-03  1169) 	return gops->saved_func(trace, gops);
df3ec5da6a1e7f Steven Rostedt (Google  2024-06-03  1170) }
df3ec5da6a1e7f Steven Rostedt (Google  2024-06-03  1171) 
df3ec5da6a1e7f Steven Rostedt (Google  2024-06-03  1172) void fgraph_update_pid_func(void)
df3ec5da6a1e7f Steven Rostedt (Google  2024-06-03  1173) {
df3ec5da6a1e7f Steven Rostedt (Google  2024-06-03 @1174) 	struct fgraph_ops *gops;
df3ec5da6a1e7f Steven Rostedt (Google  2024-06-03 @1175) 	struct ftrace_ops *op;
df3ec5da6a1e7f Steven Rostedt (Google  2024-06-03  1176) 
df3ec5da6a1e7f Steven Rostedt (Google  2024-06-03  1177) 	if (!(graph_ops.flags & FTRACE_OPS_FL_INITIALIZED))
df3ec5da6a1e7f Steven Rostedt (Google  2024-06-03  1178) 		return;
df3ec5da6a1e7f Steven Rostedt (Google  2024-06-03  1179) 

:::::: The code at line 1175 was first introduced by commit
:::::: df3ec5da6a1e7f6e142680d7c5266d3af187170b function_graph: Add pid tracing back to function graph tracer

:::::: TO: Steven Rostedt (Google) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
