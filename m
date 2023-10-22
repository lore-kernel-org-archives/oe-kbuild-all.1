Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561E31879
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Oct 2023 16:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SKie5EBq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697992023; x=1729528023;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ImebWwdFqZ3nuwqWqm8lgRaQTJr/XylE66Ul0KbAMf8=;
  b=SKie5EBqRIbLtW07aXQqmkQIiDuFwzsia0yPqwB4gwX4NH2OPyn8PyUm
   nMs7vCfwwLeAr8UvqIxXX8j05fRvZrIy97G5wxai1AnMsgnkyhtsPrx/D
   IW0tSbzXAa+InfVQvcLM1OSaqCByslr1x+sTHS7r9eof6Z/vVsO0BNQjU
   8lFeQyexEX+777bzOrV+HMuEXDO+iufGXqH/6Tkzi889ntihI0J7IKEpd
   WsuFiLOTULYsv4T+2Gs69jUTiZEQgj9KR4P5Iuo+H65/ciLojyS8D5EcO
   JXXcqqG7os2Er2gXx/l1FaUiYY6AU1dqXPiZhx4dZ3/g4qWFlL9BO06qG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="386535915"
X-IronPort-AV: E=Sophos;i="6.03,243,1694761200"; 
   d="scan'208";a="386535915"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2023 09:27:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="1005081529"
X-IronPort-AV: E=Sophos;i="6.03,243,1694761200"; 
   d="scan'208";a="1005081529"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 22 Oct 2023 09:27:01 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qubI3-000662-04;
	Sun, 22 Oct 2023 16:26:59 +0000
Date: Mon, 23 Oct 2023 00:26:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/fgraph-multi 6/15] checkpatch: WARNING: externs
 should be avoided in .c files
Message-ID: <202310230025.DU4c2JaF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fgraph-multi
head:   7b4f1147ab12cc7de50a7a15d6a818b02a0e4fa2
commit: 36864ea521035c43f11f3012c090fd64a2984db1 [6/15] ftrace/function_graph: Pass fgraph_ops to function graph callbacks
reproduce: (https://download.01.org/0day-ci/archive/20231023/202310230025.DU4c2JaF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310230025.DU4c2JaF-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:AVOID_EXTERNS: externs should be avoided in .c files
#107: FILE: kernel/trace/fgraph.c:680:
+extern void ftrace_stub_graph(struct ftrace_graph_ret *,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
