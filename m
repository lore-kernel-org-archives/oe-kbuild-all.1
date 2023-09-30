Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD9FDF44
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Sep 2023 19:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696103414; x=1727639414;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9DTMcaBSAW74KGcJnJ1xsd4ejmMko5rmwD9JLHNFu/A=;
  b=ifhViPK6AprHGU4g0uEtuteir3LNKhUndKZ0SuIPN+jVyfO5qR9S5m1g
   oVi1Zmyl8PKK89a3VnHbJxuLS6O2t8i1Cv6jbkVp7gcZwGq2a898co/AL
   G+IcpPdXzDadLODQG2ndbmzwKoOU3IAXsO2vEHwgPOvqfqpizROZ6X6QY
   YHxeeYwFB5Ccy2nQAqK8DbxLUBdr9222a/HH5XZ/t+VNH5wT5VtA1Pf/K
   KekKwq0VUkpgdVziuBQszyP/a6TfxZvIRBEsoLWQ0mj6gN9RX5pSWblL7
   8VYb6a29jq5kZlSZC3Mh6cNlOOtiZ+zPUaer36P4Z7GMkf3I6msOQKXSf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="386338160"
X-IronPort-AV: E=Sophos;i="6.03,190,1694761200"; 
   d="scan'208";a="386338160"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2023 12:50:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="699951683"
X-IronPort-AV: E=Sophos;i="6.03,190,1694761200"; 
   d="scan'208";a="699951683"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 30 Sep 2023 12:50:12 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmfyb-0004P7-2l;
	Sat, 30 Sep 2023 19:50:09 +0000
Date: Sun, 1 Oct 2023 03:49:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jamal Hadi Salim <jhs@mojatatu.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v6 net-next 11/17] p4tc: add action template create,
 update, delete, get, flush and dump
Message-ID: <202310010309.fX74KwgE-lkp@intel.com>
References: <20230930143542.101000-12-jhs@mojatatu.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230930143542.101000-12-jhs@mojatatu.com>

Hi Jamal,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jamal-Hadi-Salim/net-sched-act_api-Introduce-dynamic-actions-list/20230930-231804
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230930143542.101000-12-jhs%40mojatatu.com
patch subject: [PATCH RFC v6 net-next 11/17] p4tc: add action template create, update, delete, get, flush and dump
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20231001/202310010309.fX74KwgE-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231001/202310010309.fX74KwgE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310010309.fX74KwgE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/sched/p4tc/p4tc_action.c: In function 'init_prealloc_params':
   net/sched/p4tc/p4tc_action.c:402:32: warning: variable 'params' set but not used [-Wunused-but-set-variable]
     402 |         struct p4tc_act_param *params[P4TC_MSGBATCH_SIZE] = { NULL };
         |                                ^~~~~~
   net/sched/p4tc/p4tc_action.c: In function 'tcf_p4_prealloc_acts':
   net/sched/p4tc/p4tc_action.c:459:35: warning: variable 'p4act' set but not used [-Wunused-but-set-variable]
     459 |                 struct tcf_p4act *p4act;
         |                                   ^~~~~
   net/sched/p4tc/p4tc_action.c: In function '__tcf_act_put':
   net/sched/p4tc/p4tc_action.c:1605:31: warning: variable 'tn' set but not used [-Wunused-but-set-variable]
    1605 |         struct tc_action_net *tn;
         |                               ^~
   net/sched/p4tc/p4tc_action.c: In function 'p4tc_action_find_byname':
>> net/sched/p4tc/p4tc_action.c:870:45: warning: '%s' directive output may be truncated writing up to 255 bytes into a region of size 64 [-Wformat-truncation=]
     870 |         snprintf(full_act_name, ACTNAMSIZ, "%s/%s", pipeline->common.name,
         |                                             ^~
   net/sched/p4tc/p4tc_action.c:870:9: note: 'snprintf' output 2 or more bytes (assuming 257) into a destination of size 64
     870 |         snprintf(full_act_name, ACTNAMSIZ, "%s/%s", pipeline->common.name,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     871 |                  act_name);
         |                  ~~~~~~~~~
   net/sched/p4tc/p4tc_action.c: In function 'tcf_act_create':
   net/sched/p4tc/p4tc_action.c:1893:45: warning: '%s' directive output may be truncated writing up to 255 bytes into a region of size 64 [-Wformat-truncation=]
    1893 |         snprintf(act->ops.kind, ACTNAMSIZ, "%s/%s", pipeline->common.name,
         |                                             ^~
   net/sched/p4tc/p4tc_action.c:1893:9: note: 'snprintf' output 2 or more bytes (assuming 257) into a destination of size 64
    1893 |         snprintf(act->ops.kind, ACTNAMSIZ, "%s/%s", pipeline->common.name,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1894 |                  act_name);
         |                  ~~~~~~~~~
   net/sched/p4tc/p4tc_action.c:1956:48: warning: '%s' directive output may be truncated writing up to 255 bytes into a region of size 64 [-Wformat-truncation=]
    1956 |         snprintf(act->common.name, ACTNAMSIZ, "%s/%s", pipeline->common.name,
         |                                                ^~
   net/sched/p4tc/p4tc_action.c:1956:9: note: 'snprintf' output 2 or more bytes (assuming 257) into a destination of size 64
    1956 |         snprintf(act->common.name, ACTNAMSIZ, "%s/%s", pipeline->common.name,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1957 |                  act_name);
         |                  ~~~~~~~~~


vim +870 net/sched/p4tc/p4tc_action.c

   862	
   863	static struct p4tc_act *p4tc_action_find_byname(const char *act_name,
   864							struct p4tc_pipeline *pipeline)
   865	{
   866		char full_act_name[ACTPARAMNAMSIZ];
   867		unsigned long tmp, id;
   868		struct p4tc_act *act;
   869	
 > 870		snprintf(full_act_name, ACTNAMSIZ, "%s/%s", pipeline->common.name,
   871			 act_name);
   872		idr_for_each_entry_ul(&pipeline->p_act_idr, act, tmp, id)
   873			if (strncmp(act->common.name, full_act_name, ACTNAMSIZ) == 0)
   874				return act;
   875	
   876		return NULL;
   877	}
   878	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
