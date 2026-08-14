Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE0E3B1025
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Aug 2026 16:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786726036; cv=none; b=Tk7BhDLqNAO7uOssGl31Fdx5UE6HGAqduIdz7EV92/1Lpwgs7pKNgX//0rPwnu3EYHbLACa9KBBpD4tVcTMinonE9wf+L5vaq18L5OWHxqwP94dpd/SCS72PM1UFvp9bmrMfjpS4oOJ6ypOQxUSyrpqRbnYDoIyRwZraxIU02KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786726036; c=relaxed/simple;
	bh=M2qzlqpgkSbOaB2t0mDOSH5F0sy8a6KJN4WNRLdVrak=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=i30Jsp6Q+swEov8Vdu1CQf8gTKnSH6B49deJOIVCRpaq6tLJxp4tfGbKWAzsj26Oqg/U49wVuHE5IJ2MIzhfo6pJJu7ujzGNV68T2EAqYvItQOL5keX+97XukjCaknABkOaG+simPerdmH6Re9AVgPILoUILptkN/um6caLVRBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L1hdk/Zb; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L1hdk/Zb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786726036; x=1818262036;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M2qzlqpgkSbOaB2t0mDOSH5F0sy8a6KJN4WNRLdVrak=;
  b=L1hdk/ZbnExxBhl+Ra3KhTJGBTugxHuwX9s3EoQjorTzzoP5Vrc0z3FI
   bBPzrShc1b3O/SeOcNDuSK49VTMg4G3H1TrJdXoQYwU1YGiuXEVKUZOGv
   epHXscbQZ+GrMUUHnCBqjzu1GeJrmn7M9tATNFqs0gxTg3CMKEK0fxfk6
   1RONkRa2gLYSlUPvSYB3uKv4lDL6bxYyXijbyCUyqbuNk+vC4YyNozjiV
   Oj+DpKrEoZETCw4lHHJm7x4+V8ODhykvrZhWPlBsMIPiPb04nn81Gn7pb
   WGP43Uezk6922+BkIx2HEViF3CN0ZVFg22IQ3heyFiwmbV/aj95YLJBFC
   w==;
X-CSE-ConnectionGUID: WNqtiXoCT8aMc2uSF8yhnQ==
X-CSE-MsgGUID: y5pEytGvTgKf3+XaAwEmUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="98821722"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="98821722"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 09:47:15 -0700
X-CSE-ConnectionGUID: yx31Rvq6TaiDPa2qINqAcA==
X-CSE-MsgGUID: hEV4cxoBTa2haV/QTdomsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="261001638"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Aug 2026 09:47:13 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuv3m-00000000Zb4-1eoT;
	Fri, 14 Aug 2026 16:47:10 +0000
Date: Sat, 15 Aug 2026 00:46:50 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/tracing-cli-event-filter 8/8]
 kernel/trace/trace_boot.c:96:21: error: too few arguments to function
 'ftrace_set_clr_event'; expected 4, have 3
Message-ID: <202608150016.nxtrRlEC-lkp@intel.com>
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
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260815/202608150016.nxtrRlEC-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260815/202608150016.nxtrRlEC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608150016.nxtrRlEC-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/trace/trace_boot.c: In function 'trace_boot_enable_events':
>> kernel/trace/trace_boot.c:96:21: error: too few arguments to function 'ftrace_set_clr_event'; expected 4, have 3
      96 |                 if (ftrace_set_clr_event(tr, buf, 1) < 0)
         |                     ^~~~~~~~~~~~~~~~~~~~
   In file included from kernel/trace/trace_boot.c:18:
   include/linux/trace_events.h:876:5: note: declared here
     876 | int ftrace_set_clr_event(struct trace_array *tr, const char *buf, int set, bool handle_filter);
         |     ^~~~~~~~~~~~~~~~~~~~


vim +/ftrace_set_clr_event +96 kernel/trace/trace_boot.c

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
