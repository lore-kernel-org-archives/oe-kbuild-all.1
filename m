Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D20418B07
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Sep 2023 18:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696097814; x=1727633814;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FrKOA22l5Ov0HnkVd5ONdPpL1ChDe4bwV/NHE1RxkYM=;
  b=llv/5uGSFTxeMe78PQ0PACcjjsjnZygvZdHrb+b5k1DDc8UhO3wWb7nM
   /kI0tMJPCRLKsVhFomkjV6oMuCHnjy+2Nah/qV3zt41FPTy/Zc7CKqt7D
   5bGzewWY1x6w3yc7QWoJ0TIPbCvuygs24LJbdkyvnY9en+G1dx3TuBbwm
   4buHI7oLDWnypxz/6sQf/Emg5mexpQJ6eFaDlxmkMmk6LCPMkCrdXzfd8
   MD4u52E3Yc+jSYn4GwApKahjAHEA4soi3SUE7usSIC3u/fWO7RlbRViwy
   wIPte6Wy/g/WmDIo2b6DWiFDSXnRuih+7Ft4Ld4qN1sv32ae0WLbcUb1Z
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="367521961"
X-IronPort-AV: E=Sophos;i="6.03,190,1694761200"; 
   d="scan'208";a="367521961"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2023 11:16:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="866065378"
X-IronPort-AV: E=Sophos;i="6.03,190,1694761200"; 
   d="scan'208";a="866065378"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 30 Sep 2023 11:16:52 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmeWI-0004Lr-03;
	Sat, 30 Sep 2023 18:16:50 +0000
Date: Sun, 1 Oct 2023 02:16:12 +0800
From: kernel test robot <lkp@intel.com>
To: Jamal Hadi Salim <jhs@mojatatu.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v6 net-next 11/17] p4tc: add action template create,
 update, delete, get, flush and dump
Message-ID: <202310010138.Grr5fr9x-lkp@intel.com>
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
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20231001/202310010138.Grr5fr9x-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231001/202310010138.Grr5fr9x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310010138.Grr5fr9x-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/sched/p4tc/p4tc_action.c: In function 'init_prealloc_params':
>> net/sched/p4tc/p4tc_action.c:402:32: warning: variable 'params' set but not used [-Wunused-but-set-variable]
     402 |         struct p4tc_act_param *params[P4TC_MSGBATCH_SIZE] = { NULL };
         |                                ^~~~~~
   net/sched/p4tc/p4tc_action.c: In function 'tcf_p4_prealloc_acts':
>> net/sched/p4tc/p4tc_action.c:459:35: warning: variable 'p4act' set but not used [-Wunused-but-set-variable]
     459 |                 struct tcf_p4act *p4act;
         |                                   ^~~~~
   net/sched/p4tc/p4tc_action.c: In function '__tcf_act_put':
>> net/sched/p4tc/p4tc_action.c:1605:31: warning: variable 'tn' set but not used [-Wunused-but-set-variable]
    1605 |         struct tc_action_net *tn;
         |                               ^~


vim +/params +402 net/sched/p4tc/p4tc_action.c

   396	
   397	static int init_prealloc_params(struct p4tc_act *act,
   398					struct idr *params_idr,
   399					struct list_head *params_lst,
   400					struct netlink_ext_ack *extack)
   401	{
 > 402		struct p4tc_act_param *params[P4TC_MSGBATCH_SIZE] = { NULL };
   403		struct p4tc_act_param *param;
   404		unsigned long param_id = 0;
   405		unsigned long tmp;
   406		int i = 0;
   407	
   408		idr_for_each_entry_ul(params_idr, param, tmp, param_id) {
   409			struct p4tc_act_param *nparam;
   410	
   411			nparam = init_prealloc_param(act, params_idr, param, &param_id,
   412						     extack);
   413			if (IS_ERR(nparam))
   414				return PTR_ERR(nparam);
   415	
   416			params[i] = nparam;
   417			list_add_tail(&nparam->head, params_lst);
   418			i++;
   419		}
   420	
   421		return 0;
   422	}
   423	
   424	struct p4tc_act *p4tc_action_find_byid(struct p4tc_pipeline *pipeline,
   425					       const u32 a_id)
   426	{
   427		return idr_find(&pipeline->p_act_idr, a_id);
   428	}
   429	
   430	static void tcf_p4_prealloc_list_add(struct p4tc_act *act_tmpl,
   431					     struct tc_action **acts,
   432					     u32 num_prealloc_acts)
   433	{
   434		int i;
   435	
   436		for (i = 0; i < num_prealloc_acts; i++) {
   437			struct tcf_p4act *p4act = to_p4act(acts[i]);
   438	
   439			list_add_tail(&p4act->node, &act_tmpl->prealloc_list);
   440		}
   441	
   442		tcf_idr_insert_n(acts, num_prealloc_acts);
   443	}
   444	
   445	static int tcf_p4_prealloc_acts(struct net *net, struct p4tc_act *act,
   446					struct idr *params_idr,
   447					struct tc_action **acts,
   448					const u32 num_prealloc_acts,
   449					struct netlink_ext_ack *extack)
   450	{
   451		int err;
   452		int i;
   453	
   454		for (i = 0; i < num_prealloc_acts; i++) {
   455			u32 flags = TCA_ACT_FLAGS_PREALLOC | TCA_ACT_FLAGS_UNREFERENCED;
   456			struct tc_action *a = acts[i];
   457			struct tc_act_dyna parm = {0};
   458			struct list_head params_lst;
 > 459			struct tcf_p4act *p4act;
   460	
   461			parm.index = i + 1;
   462			parm.action = TC_ACT_PIPE;
   463	
   464			INIT_LIST_HEAD(&params_lst);
   465	
   466			err = init_prealloc_params(act, params_idr, &params_lst,
   467						   extack);
   468			if (err < 0) {
   469				free_intermediate_params_list(&params_lst);
   470				goto destroy_acts;
   471			}
   472	
   473			err = tcf_p4_dyna_template_init(net, &a, act, params_idr,
   474							&params_lst, &parm, flags,
   475							extack);
   476			free_intermediate_params_list(&params_lst);
   477			if (err < 0)
   478				goto destroy_acts;
   479	
   480			acts[i] = a;
   481			p4act = to_p4act(a);
   482		}
   483	
   484		return 0;
   485	
   486	destroy_acts:
   487		tcf_action_destroy(acts, false);
   488	
   489		return err;
   490	}
   491	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
