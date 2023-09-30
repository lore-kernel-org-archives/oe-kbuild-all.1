Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1723B678
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Sep 2023 19:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696101545; x=1727637545;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vUkZitv+tphvLDVkhkUgjrlXFiWYvEaDTITg/q4papE=;
  b=fyOfa/mhEiRMT+H963Fz2fFeFNwQqQrN7DAiJ+aT1BBT13ONCTu8TgCG
   O1DFrN0UgQX6llOzs2RYAmBBiUtqMPXaHQue6xTDgnWrjFHqHoCvxh8q5
   PlyRFjGk+HGUVSZF6XVHwvt/e8oHvlPnoS0ClpdYVg9lv1zkC4RTv0TNC
   zqpA+/+IKTpknkVVkjrjzv0byr8DDwt+4OqekQNsd38nXxFGmcQqx7gEV
   OKyajW223sgNBHxboL3O2NtXPLb06OBWbNoYgRJ1Yp3pXd9Hne51KRDkI
   7fwtHY0Ermz6V0X/r8MJMBazaKLS7nKOmwpRNPOd0i79gnWAomSdv8dUv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="367524917"
X-IronPort-AV: E=Sophos;i="6.03,190,1694761200"; 
   d="scan'208";a="367524917"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2023 12:19:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="840593607"
X-IronPort-AV: E=Sophos;i="6.03,190,1694761200"; 
   d="scan'208";a="840593607"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 30 Sep 2023 12:19:03 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmfUT-0004Nv-1a;
	Sat, 30 Sep 2023 19:19:01 +0000
Date: Sun, 1 Oct 2023 03:18:56 +0800
From: kernel test robot <lkp@intel.com>
To: Jamal Hadi Salim <jhs@mojatatu.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v6 net-next 12/17] p4tc: add table create, update,
 delete, get, flush and dump
Message-ID: <202310010336.cxSi8VZc-lkp@intel.com>
References: <20230930143542.101000-13-jhs@mojatatu.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230930143542.101000-13-jhs@mojatatu.com>

Hi Jamal,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jamal-Hadi-Salim/net-sched-act_api-Introduce-dynamic-actions-list/20230930-231804
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230930143542.101000-13-jhs%40mojatatu.com
patch subject: [PATCH RFC v6 net-next 12/17] p4tc: add table create, update, delete, get, flush and dump
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20231001/202310010336.cxSi8VZc-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231001/202310010336.cxSi8VZc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310010336.cxSi8VZc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/sched/p4tc/p4tc_table.c: In function 'p4tc_table_act_init':
>> net/sched/p4tc/p4tc_table.c:756:51: warning: variable 'p_name' set but not used [-Wunused-but-set-variable]
     756 |                 char *act_name_clone, *act_name, *p_name;
         |                                                   ^~~~~~


vim +/p_name +756 net/sched/p4tc/p4tc_table.c

   736	
   737	static struct p4tc_table_act *p4tc_table_act_init(struct nlattr *nla,
   738							  struct p4tc_pipeline *pipeline,
   739							  struct netlink_ext_ack *extack)
   740	{
   741		struct nlattr *tb[P4TC_TABLE_ACT_MAX + 1];
   742		struct p4tc_table_act *table_act;
   743		int ret;
   744	
   745		ret = nla_parse_nested(tb, P4TC_TABLE_ACT_MAX, nla,
   746				       p4tc_acts_list_policy, extack);
   747		if (ret < 0)
   748			return ERR_PTR(ret);
   749	
   750		table_act = kzalloc(sizeof(*table_act), GFP_KERNEL);
   751		if (unlikely(!table_act))
   752			return ERR_PTR(-ENOMEM);
   753	
   754		if (tb[P4TC_TABLE_ACT_NAME]) {
   755			const char *actname = nla_data(tb[P4TC_TABLE_ACT_NAME]);
 > 756			char *act_name_clone, *act_name, *p_name;
   757			struct p4tc_act *act;
   758	
   759			act_name_clone = act_name = kstrdup(actname, GFP_KERNEL);
   760			if (unlikely(!act_name)) {
   761				ret = -ENOMEM;
   762				goto free_table_act;
   763			}
   764	
   765			p_name = strsep(&act_name, "/");
   766			act = p4tc_action_find_get(pipeline, act_name, 0, extack);
   767			kfree(act_name_clone);
   768			if (IS_ERR(act)) {
   769				ret = PTR_ERR(act);
   770				goto free_table_act;
   771			}
   772	
   773			table_act->ops = &act->ops;
   774		} else {
   775			NL_SET_ERR_MSG(extack,
   776				       "Must specify allowed table action name");
   777			ret = -EINVAL;
   778			goto free_table_act;
   779		}
   780	
   781		if (tb[P4TC_TABLE_ACT_FLAGS]) {
   782			u8 *flags = nla_data(tb[P4TC_TABLE_ACT_FLAGS]);
   783	
   784			table_act->flags = *flags;
   785		}
   786	
   787		return table_act;
   788	
   789	free_table_act:
   790		kfree(table_act);
   791		return ERR_PTR(ret);
   792	}
   793	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
