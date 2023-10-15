Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BC38C1D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 16:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CalVOdRE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697386047; x=1728922047;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cz2I3mDqrzkXXy9ZuCmhK0nU0PI1U82zfWZlyzZMakU=;
  b=CalVOdREGi2byGG3p6BAniAn/sVRXVboF02zlU2q7dpWPjkb2xq8YMSR
   u1M19rqcgfy01P5SdxRtTgTid4ZMzITedjlKRu9GZ/IgGwAhHdSLVaRlw
   WMTgjuhtBK13SaooiX4FX9hxVvMyXYt0iQmUc7XoY738+tGLx6PqsYl+e
   8cVMW3swG53h0Pv5ytuFCLXiraMqqwJvm7FXVjiI4XFmMx4/b2Lmh431D
   Ll+TMRBXKr6c8+lU0qkfamXUrWKrmlzlbXdvb6Tvbskf5E6lVUeq26W7a
   Oiqb2CeS5YKUKuLhYHcMDdYsk3p8xuUKqUaK2V9HU+KaxHAUsPjEUg16A
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="375764419"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="375764419"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 09:07:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="749010141"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="749010141"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 15 Oct 2023 09:07:19 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qs3e9-0007XR-1s;
	Sun, 15 Oct 2023 16:07:17 +0000
Date: Mon, 16 Oct 2023 00:06:46 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Subject: [mhiramat:topic/fgraph-multi 9/15] kernel/trace/fgraph.c:872:13:
 warning: variable 'command' set but not used
Message-ID: <202310152314.3tXHuAjm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fgraph-multi
head:   f89a72328944cb3136c9c44850970a9c8cc7021a
commit: 25051fce522d6f246d1061ea6a4b9d62c966d8aa [9/15] function_graph: Have the instances use their own ftrace_ops for filtering
config: loongarch-randconfig-001-20231015 (https://download.01.org/0day-ci/archive/20231015/202310152314.3tXHuAjm-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310152314.3tXHuAjm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310152314.3tXHuAjm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/trace/fgraph.c: In function '__ftrace_return_to_handler':
   kernel/trace/fgraph.c:499:34: warning: variable 'ret_stack' set but not used [-Wunused-but-set-variable]
     499 |         struct ftrace_ret_stack *ret_stack;
         |                                  ^~~~~~~~~
   kernel/trace/fgraph.c: In function 'register_ftrace_graph':
>> kernel/trace/fgraph.c:872:13: warning: variable 'command' set but not used [-Wunused-but-set-variable]
     872 |         int command = 0;
         |             ^~~~~~~
   kernel/trace/fgraph.c: In function 'unregister_ftrace_graph':
   kernel/trace/fgraph.c:933:13: warning: variable 'command' set but not used [-Wunused-but-set-variable]
     933 |         int command = 0;
         |             ^~~~~~~


vim +/command +872 kernel/trace/fgraph.c

   869	
   870	int register_ftrace_graph(struct fgraph_ops *gops)
   871	{
 > 872		int command = 0;
   873		int ret = 0;
   874		int i;
   875	
   876		mutex_lock(&ftrace_lock);
   877	
   878		if (!gops->ops.func) {
   879			gops->ops.flags |= FTRACE_OPS_FL_STUB;
   880			gops->ops.func = ftrace_stub;
   881	#ifdef FTRACE_GRAPH_TRAMP_ADDR
   882			gops->ops.trampoline = FTRACE_GRAPH_TRAMP_ADDR;
   883	#endif
   884		}
   885	
   886		if (!fgraph_array[0]) {
   887			/* The array must always have real data on it */
   888			for (i = 0; i < FGRAPH_ARRAY_SIZE; i++) {
   889				fgraph_array[i] = &fgraph_stub;
   890			}
   891		}
   892	
   893		/* Look for an available spot */
   894		for (i = 0; i < FGRAPH_ARRAY_SIZE; i++) {
   895			if (fgraph_array[i] == &fgraph_stub)
   896				break;
   897		}
   898		if (i >= FGRAPH_ARRAY_SIZE) {
   899			ret = -EBUSY;
   900			goto out;
   901		}
   902	
   903		fgraph_array[i] = gops;
   904		if (i + 1 > fgraph_array_cnt)
   905			fgraph_array_cnt = i + 1;
   906	
   907		ftrace_graph_active++;
   908	
   909		if (ftrace_graph_active == 1) {
   910			register_pm_notifier(&ftrace_suspend_notifier);
   911			ret = start_graph_tracing();
   912			if (ret) {
   913				ftrace_graph_active--;
   914				goto out;
   915			}
   916			/*
   917			 * Some archs just test to see if these are not
   918			 * the default function
   919			 */
   920			ftrace_graph_return = return_run;
   921			ftrace_graph_entry = entry_run;
   922			command = FTRACE_START_FUNC_RET;
   923		}
   924	
   925		ret = ftrace_startup(&gops->ops, command);
   926	out:
   927		mutex_unlock(&ftrace_lock);
   928		return ret;
   929	}
   930	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
