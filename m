Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36E01C84DC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Aug 2026 18:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786731218; cv=none; b=F11PdWODt1EIsnaW8/AG3/G5nSUE1QVsbTsWRQKjRU4001pOERDlFwfc1Fg//pyW5y8fHoVaG0QIkxlxpwODFq3CSmDBeo5q1twsL0edXEz9YPLk6x5S78IgHYJPyESLV657sXUJmIGsNmqCEVYtdnXj5v8neigwrJocJTmWQos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786731218; c=relaxed/simple;
	bh=S5EPMvnSd8FWiqJXmBf8JJqVX1himvGuxbpYM771jN4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HCbcIzhwZmrufdz7M2gNCWvXvXcfxYWnHdkQ0+deAgNiMqMUaIRdF7acdOZuMPwqJJRYfEfHu6085VfqDhO7Y/BZW3aMlwmy3L6TNV5zgzHbuSrVTn121eWPf8Jc9SdBj/izHgGl+LIgDY46JT7DyjKPdAOEP8DnXC8pFfzRBWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iUtPMupY; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iUtPMupY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786731216; x=1818267216;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S5EPMvnSd8FWiqJXmBf8JJqVX1himvGuxbpYM771jN4=;
  b=iUtPMupYoxqvbc+mDKD8gURid3d3e6AlfaGA3qmazCzAJ1wS3/E2O+CV
   x8QHfdp9965l0sUEKvoq1IwJQthfDkfFNSkOlJ/jRpl0MJ3oBM2zWTvSn
   22keRI7HFfUh0XlJRLnukaXyphC3JIK7fVGeFYT160ndVwNUzkU5HZH6o
   BOgxqcokvo6AA6N72MCgW4EFqkXRQPCt4AwAUWPH5fiP3sP54ZAbTw2Xk
   z08vTqBpXd1EI/Fg9oBQ+g/DjbqHE5uDRlRaPp8AoR1SJuze95x0MdwIY
   LhtNa0iEmqSDD1tv7xD8QcbTOLt0vI+2PSv+8Wp+7VqHGnI9SYSqSgC7Y
   A==;
X-CSE-ConnectionGUID: LJaCxZsOTdaXls0mNPBxig==
X-CSE-MsgGUID: wh45mzJnQiSoNBSGaW8nWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="87529643"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="87529643"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 11:13:36 -0700
X-CSE-ConnectionGUID: eFUyOIFLRqeqR4HbamaBWg==
X-CSE-MsgGUID: Y1/opYPiRaaoH0m182PmDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="302526083"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Aug 2026 11:13:34 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuwPM-00000000ZnO-02kV;
	Fri, 14 Aug 2026 18:13:32 +0000
Date: Sat, 15 Aug 2026 02:13:20 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/tracing-cli-event-filter 8/8]
 kernel/trace/trace_boot.c:96:38: error: too few arguments to function call,
 expected 4, have 3
Message-ID: <202608150254.RnRhFwGw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/tracing-cli-event-filter
head:   dfd7ada96ceaa48bce6bd68227796cd99b3c8f1f
commit: dfd7ada96ceaa48bce6bd68227796cd99b3c8f1f [8/8] tracing: Parse filter from boot event string
config: i386-randconfig-141-20260814 (https://download.01.org/0day-ci/archive/20260815/202608150254.RnRhFwGw-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260815/202608150254.RnRhFwGw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608150254.RnRhFwGw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/trace_boot.c:96:38: error: too few arguments to function call, expected 4, have 3
      96 |                 if (ftrace_set_clr_event(tr, buf, 1) < 0)
         |                     ~~~~~~~~~~~~~~~~~~~~           ^
   include/linux/trace_events.h:876:5: note: 'ftrace_set_clr_event' declared here
     876 | int ftrace_set_clr_event(struct trace_array *tr, const char *buf, int set, bool handle_filter);
         |     ^                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +96 kernel/trace/trace_boot.c

9c5b9d3d65e485 Masami Hiramatsu        2020-01-11   81  
9c5b9d3d65e485 Masami Hiramatsu        2020-01-11   82  #ifdef CONFIG_EVENT_TRACING
9c5b9d3d65e485 Masami Hiramatsu        2020-01-11   83  static void __init
9c5b9d3d65e485 Masami Hiramatsu        2020-01-11   84  trace_boot_enable_events(struct trace_array *tr, struct xbc_node *node)
9c5b9d3d65e485 Masami Hiramatsu        2020-01-11   85  {
9c5b9d3d65e485 Masami Hiramatsu        2020-01-11   86  	struct xbc_node *anode;
9c5b9d3d65e485 Masami Hiramatsu        2020-01-11   87  	char buf[MAX_BUF_LEN];
9c5b9d3d65e485 Masami Hiramatsu        2020-01-11   88  	const char *p;
9c5b9d3d65e485 Masami Hiramatsu        2020-01-11   89  
9c5b9d3d65e485 Masami Hiramatsu        2020-01-11   90  	xbc_node_for_each_array_value(node, "events", anode, p) {
fddca7db4a4c17 Steven Rostedt (Google  2023-07-04   91) 		if (strscpy(buf, p, ARRAY_SIZE(buf)) < 0) {
9c5b9d3d65e485 Masami Hiramatsu        2020-01-11   92  			pr_err("String is too long: %s\n", p);
9c5b9d3d65e485 Masami Hiramatsu        2020-01-11   93  			continue;
9c5b9d3d65e485 Masami Hiramatsu        2020-01-11   94  		}
9c5b9d3d65e485 Masami Hiramatsu        2020-01-11   95  
9c5b9d3d65e485 Masami Hiramatsu        2020-01-11  @96  		if (ftrace_set_clr_event(tr, buf, 1) < 0)
9c5b9d3d65e485 Masami Hiramatsu        2020-01-11   97  			pr_err("Failed to enable event: %s\n", p);
9c5b9d3d65e485 Masami Hiramatsu        2020-01-11   98  	}
9c5b9d3d65e485 Masami Hiramatsu        2020-01-11   99  }
81a59555ff1593 Masami Hiramatsu        2020-01-11  100  

:::::: The code at line 96 was first introduced by commit
:::::: 9c5b9d3d65e485826fb935453f01171b1a337aa8 tracing/boot: Add boot-time tracing

:::::: TO: Masami Hiramatsu <mhiramat@kernel.org>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
