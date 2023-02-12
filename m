Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DB8290B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Feb 2023 23:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676244659; x=1707780659;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0NcMJX4KW9oVwIGsuS9g+US/oN4MjNS7FnDZhjnjtnE=;
  b=BOl7C6dqcZnkQ+9d5rOt4lDlqsan/UckUpxC7s5sd4F2eTT0r5+iggQS
   Et+tIdBfVZNOemz01N+78ju2RF+LbO/obfwSg2rR+rRmQ6ZyS2hEPur6R
   yGrtzt0zV5D6UCo0/ytAIz+uQSZtH0Iz3Ej+jplDeC6OxbK9Sy/jh5QqL
   LO0Zy4OC4bRCZLNuxeUH7qTo70BDrJ9ENgX+VSvW9DAXt64yTg8S0N/1B
   QZiNVYje6JqE0ISRuEq9StBL4fB6/reBUqpDS6SpsYez1UM8AkJlkPHBI
   4lE3pxZf1V887VyRu8DCdx1F1ge3Ud+QqkvhajGMFbC9/8R0UUPojqHH1
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="311131964"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="311131964"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2023 15:30:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="914121240"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="914121240"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 12 Feb 2023 15:30:57 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRLo8-0007Qm-2U;
	Sun, 12 Feb 2023 23:30:56 +0000
Date: Mon, 13 Feb 2023 07:30:33 +0800
From: kernel test robot <lkp@intel.com>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: [trace:trace/urgent 13/13] kernel/trace/trace_events.c:158:5:
 warning: no previous prototype for 'trace_define_field_ext'
Message-ID: <202302130750.679RaRog-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace trace/urgent
head:   b6c7abd1c28a63ad633433d037ee15a1bc3023ba
commit: b6c7abd1c28a63ad633433d037ee15a1bc3023ba [13/13] tracing: Fix TASK_COMM_LEN in trace event format file
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230213/202302130750.679RaRog-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git/commit/?id=b6c7abd1c28a63ad633433d037ee15a1bc3023ba
        git remote add trace git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace
        git fetch --no-tags trace trace/urgent
        git checkout b6c7abd1c28a63ad633433d037ee15a1bc3023ba
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash kernel/trace/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302130750.679RaRog-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/trace_events.c:158:5: warning: no previous prototype for 'trace_define_field_ext' [-Wmissing-prototypes]
     158 | int trace_define_field_ext(struct trace_event_call *call, const char *type,
         |     ^~~~~~~~~~~~~~~~~~~~~~


vim +/trace_define_field_ext +158 kernel/trace/trace_events.c

   157	
 > 158	int trace_define_field_ext(struct trace_event_call *call, const char *type,
   159			       const char *name, int offset, int size, int is_signed,
   160			       int filter_type, int len)
   161	{
   162		struct list_head *head;
   163	
   164		if (WARN_ON(!call->class))
   165			return 0;
   166	
   167		head = trace_get_fields(call);
   168		return __trace_define_field(head, type, name, offset, size,
   169					    is_signed, filter_type, len);
   170	}
   171	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
