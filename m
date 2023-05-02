Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DB436C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 May 2023 02:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682995391; x=1714531391;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PsohgX9b2YEs2h/REEApkMqD3dsmuknKgxQc/j3DzC0=;
  b=DftTAo3tyKcqztsBpZBuUE4vIrWp25ZBjaP0MI58pDyzfMRNu4l1Wx8p
   OSuPlZo/Kn1+xUQNnvOAZSnGnmWAhyQlySdB/ugfDVgDznTEjHhOoHQrC
   AV4BhBFzeTgHFKCyqGdeI8foJ4rTzTOLEMh/Hn9R7/4rxrlo+THYbJizq
   S4C2ar6L4R/gt2ab/+s/iA+tUZGnNUM8DzZSf9G3V5xSdQIqwIq81aMzI
   AWncMO6SYcwq43WftXExngZPr2Jx0UpbdzDU0e0WlVL9vtM5+/rMGjMFc
   ovA0LTTiY7W5SDnZyc74Led4smN8saRmF8kLnjI7EJ0xSoU4lpH9IZicK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="348336330"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; 
   d="scan'208";a="348336330"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2023 19:43:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="726573284"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; 
   d="scan'208";a="726573284"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 01 May 2023 19:43:09 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptfyu-0000mO-1r;
	Tue, 02 May 2023 02:43:08 +0000
Date: Tue, 2 May 2023 10:42:12 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/fprobe-event-ext 4/11]
 kernel/trace/trace_fprobe.c:853:20: error: 'MODULE_STATE_GOING' undeclared
Message-ID: <202305021017.KRmfAhn9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fprobe-event-ext
head:   32e07b49d560e18af3ea10fc794fa755eedceb83
commit: eb808ed99f69516d0c445a8a7eb0cfeb9c818410 [4/11] tracing/probes: Add tracepoint support on fprobe_events
config: s390-randconfig-r035-20230501 (https://download.01.org/0day-ci/archive/20230502/202305021017.KRmfAhn9-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git/commit/?id=eb808ed99f69516d0c445a8a7eb0cfeb9c818410
        git remote add mhiramat https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git
        git fetch --no-tags mhiramat topic/fprobe-event-ext
        git checkout eb808ed99f69516d0c445a8a7eb0cfeb9c818410
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash kernel/trace/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305021017.KRmfAhn9-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/trace/trace_fprobe.c: In function '__tracepoint_probe_module_cb':
>> kernel/trace/trace_fprobe.c:853:20: error: 'MODULE_STATE_GOING' undeclared (first use in this function)
     853 |         if (val != MODULE_STATE_GOING)
         |                    ^~~~~~~~~~~~~~~~~~
   kernel/trace/trace_fprobe.c:853:20: note: each undeclared identifier is reported only once for each function it appears in
>> kernel/trace/trace_fprobe.c:858:27: error: invalid use of undefined type 'struct tp_module'
     858 |                 if (tp_mod->mod == tf->mod) {
         |                           ^~


vim +/MODULE_STATE_GOING +853 kernel/trace/trace_fprobe.c

   845	
   846	static int __tracepoint_probe_module_cb(struct notifier_block *self,
   847						unsigned long val, void *data)
   848	{
   849		struct tp_module *tp_mod = data;
   850		struct trace_fprobe *tf;
   851		struct dyn_event *pos;
   852	
 > 853		if (val != MODULE_STATE_GOING)
   854			return NOTIFY_DONE;
   855	
   856		mutex_lock(&event_mutex);
   857		for_each_trace_fprobe(tf, pos) {
 > 858			if (tp_mod->mod == tf->mod) {
   859				tracepoint_probe_unregister(tf->tpoint,
   860						tf->tpoint->probestub, NULL);
   861				tf->tpoint = NULL;
   862				tf->mod = NULL;
   863			}
   864		}
   865		mutex_unlock(&event_mutex);
   866	
   867		return NOTIFY_DONE;
   868	}
   869	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
