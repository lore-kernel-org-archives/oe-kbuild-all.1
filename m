Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A488F70
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jan 2023 22:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674597685; x=1706133685;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RMZrsu1O/g7Hwwv150bA8d+4SeI0TkTRK0MB03kA8cc=;
  b=Ia/wnlGap9gxi6Mu2paRBNHWyO3lPrj49npnZtbQ2M55fyoPoT0F0OvD
   5WGlBoEXRSP2hvE3roM1dXY4uAf5QrnTNZyIiG/Te6bd86McjzBU3baZx
   jI7RZu5VuTBTyOrDO8N4yhKrUCqe1tW4IQBMgxZMrJnAn/4NupQ7xor0R
   zfAYqa5EAQbYIwk65k9HDi6TwbYC9EObzmxEt3vTuRIZMfs2wEiGSkNdc
   02ux0E5/hjqDtpD5zuPcT4pK7oDbGEupcz6QDra+W+8+FHVNY/FeiDsXr
   NS2rSt6w6hkdi8n5qZ3m7QbxJsEsp8F/W+t5GlpwYaAsKtlFPqbirWvsI
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="328502927"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; 
   d="scan'208";a="328502927"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 14:01:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="991038889"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; 
   d="scan'208";a="991038889"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 24 Jan 2023 14:01:23 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKRM2-0006oU-1R;
	Tue, 24 Jan 2023 22:01:22 +0000
Date: Wed, 25 Jan 2023 06:00:48 +0800
From: kernel test robot <lkp@intel.com>
To: Jamal Hadi Salim <jhs@mojatatu.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net-next RFC 19/20] p4tc: add dynamic action commands
Message-ID: <202301250536.nFEvUVtD-lkp@intel.com>
References: <20230124170510.316970-19-jhs@mojatatu.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230124170510.316970-19-jhs@mojatatu.com>

Hi Jamal,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Jamal-Hadi-Salim/net-sched-act_api-increase-action-kind-string-length/20230125-010934
patch link:    https://lore.kernel.org/r/20230124170510.316970-19-jhs%40mojatatu.com
patch subject: [PATCH net-next RFC 19/20] p4tc: add dynamic action commands
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230125/202301250536.nFEvUVtD-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/1d6867b1ff1071fd75e3a89182da0c18c110e2da
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jamal-Hadi-Salim/net-sched-act_api-increase-action-kind-string-length/20230125-010934
        git checkout 1d6867b1ff1071fd75e3a89182da0c18c110e2da
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash net/sched/p4tc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   net/sched/p4tc/p4tc_cmds.c:429:5: warning: no previous prototype for 'validate_dev_operand' [-Wmissing-prototypes]
     429 | int validate_dev_operand(struct net *net, struct p4tc_cmd_operand *kopnd,
         |     ^~~~~~~~~~~~~~~~~~~~
   net/sched/p4tc/p4tc_cmds.c:1389:5: warning: no previous prototype for 'validate_ACT' [-Wmissing-prototypes]
    1389 | int validate_ACT(struct net *net, struct p4tc_act *act,
         |     ^~~~~~~~~~~~
   net/sched/p4tc/p4tc_cmds.c: In function 'validate_ACT':
   net/sched/p4tc/p4tc_cmds.c:1395:38: warning: variable 'B' set but not used [-Wunused-but-set-variable]
    1395 |         struct p4tc_cmd_operand *A, *B;
         |                                      ^
   net/sched/p4tc/p4tc_cmds.c: At top level:
   net/sched/p4tc/p4tc_cmds.c:1517:5: warning: no previous prototype for 'validate_SET' [-Wmissing-prototypes]
    1517 | int validate_SET(struct net *net, struct p4tc_act *act,
         |     ^~~~~~~~~~~~
   net/sched/p4tc/p4tc_cmds.c:1609:5: warning: no previous prototype for 'validate_PRINT' [-Wmissing-prototypes]
    1609 | int validate_PRINT(struct net *net, struct p4tc_act *act,
         |     ^~~~~~~~~~~~~~
   net/sched/p4tc/p4tc_cmds.c:1632:5: warning: no previous prototype for 'validate_TBLAPP' [-Wmissing-prototypes]
    1632 | int validate_TBLAPP(struct net *net, struct p4tc_act *act,
         |     ^~~~~~~~~~~~~~~
   net/sched/p4tc/p4tc_cmds.c:1659:5: warning: no previous prototype for 'validate_SNDPORTEGR' [-Wmissing-prototypes]
    1659 | int validate_SNDPORTEGR(struct net *net, struct p4tc_act *act,
         |     ^~~~~~~~~~~~~~~~~~~
   net/sched/p4tc/p4tc_cmds.c:1682:5: warning: no previous prototype for 'validate_BINARITH' [-Wmissing-prototypes]
    1682 | int validate_BINARITH(struct net *net, struct p4tc_act *act,
         |     ^~~~~~~~~~~~~~~~~
   net/sched/p4tc/p4tc_cmds.c:1716:5: warning: no previous prototype for 'validate_CONCAT' [-Wmissing-prototypes]
    1716 | int validate_CONCAT(struct net *net, struct p4tc_act *act,
         |     ^~~~~~~~~~~~~~~
   net/sched/p4tc/p4tc_cmds.c:1739:5: warning: no previous prototype for 'validate_JUMP' [-Wmissing-prototypes]
    1739 | int validate_JUMP(struct net *net, struct p4tc_act *act,
         |     ^~~~~~~~~~~~~
   net/sched/p4tc/p4tc_cmds.c:1775:5: warning: no previous prototype for 'validate_LABEL' [-Wmissing-prototypes]
    1775 | int validate_LABEL(struct net *net, struct p4tc_act *act,
         |     ^~~~~~~~~~~~~~
   net/sched/p4tc/p4tc_cmds.c:2034:5: warning: no previous prototype for 'validate_BRN' [-Wmissing-prototypes]
    2034 | int validate_BRN(struct net *net, struct p4tc_act *act,
         |     ^~~~~~~~~~~~
   net/sched/p4tc/p4tc_cmds.c: In function 'p4tc_cmds_copy_ops':
   net/sched/p4tc/p4tc_cmds.c:2746:43: warning: variable 'head' set but not used [-Wunused-but-set-variable]
    2746 |                         struct list_head *head;
         |                                           ^~~~
   net/sched/p4tc/p4tc_cmds.c: In function 'p4tc_cmd_PRINT':
>> net/sched/p4tc/p4tc_cmds.c:3136:1: warning: the frame size of 1088 bytes is larger than 1024 bytes [-Wframe-larger-than=]
    3136 | }
         | ^


vim +3136 net/sched/p4tc/p4tc_cmds.c

  3004	
  3005	static int p4tc_cmd_PRINT(struct sk_buff *skb, struct p4tc_cmd_operate *op,
  3006				  struct tcf_p4act *cmd, struct tcf_result *res)
  3007	{
  3008		struct p4tc_cmd_operand *A = GET_OPA(&op->operands_list);
  3009		u64 readval[BITS_TO_U64(P4T_MAX_BITSZ)] = { 0 };
  3010		struct net *net = dev_net(skb->dev);
  3011		char name[(TEMPLATENAMSZ * 4)];
  3012		struct p4tc_type *val_t;
  3013		void *val;
  3014	
  3015		A = GET_OPA(&op->operands_list);
  3016		val = A->fetch(skb, A, cmd, res);
  3017		val_t = A->oper_datatype;
  3018	
  3019		if (!val)
  3020			return TC_ACT_OK;
  3021	
  3022		p4tc_reg_lock(A, NULL, NULL);
  3023		if (val_t->ops->host_read)
  3024			val_t->ops->host_read(val_t, A->oper_mask_shift, val, &readval);
  3025		else
  3026			memcpy(&readval, val, BITS_TO_BYTES(A->oper_bitsize));
  3027		/* This is a debug function, so performance is not a priority */
  3028		if (A->oper_type == P4TC_OPER_META) {
  3029			struct p4tc_pipeline *pipeline = NULL;
  3030			char *path = (char *)A->print_prefix;
  3031			struct p4tc_metadata *meta;
  3032	
  3033			pipeline = tcf_pipeline_find_byid(net, A->pipeid);
  3034			meta = tcf_meta_find_byid(pipeline, A->immedv);
  3035	
  3036			if (path)
  3037				snprintf(name,
  3038					 (TEMPLATENAMSZ << 1) +
  3039						 P4TC_CMD_MAX_OPER_PATH_LEN,
  3040					 "%s %s.%s", path, pipeline->common.name,
  3041					 meta->common.name);
  3042			else
  3043				snprintf(name, TEMPLATENAMSZ << 1, "%s.%s",
  3044					 pipeline->common.name, meta->common.name);
  3045	
  3046			val_t->ops->print(net, val_t, name, &readval);
  3047		} else if (A->oper_type == P4TC_OPER_HDRFIELD) {
  3048			char *path = (char *)A->print_prefix;
  3049			struct p4tc_hdrfield *hdrfield;
  3050			struct p4tc_pipeline *pipeline;
  3051			struct p4tc_parser *parser;
  3052	
  3053			pipeline = tcf_pipeline_find_byid(net, A->pipeid);
  3054			parser = tcf_parser_find_byid(pipeline, A->immedv);
  3055			hdrfield = tcf_hdrfield_find_byid(parser, A->immedv2);
  3056	
  3057			if (path)
  3058				snprintf(name, TEMPLATENAMSZ * 4,
  3059					 "%s hdrfield.%s.%s.%s", path,
  3060					 pipeline->common.name, parser->parser_name,
  3061					 hdrfield->common.name);
  3062			else
  3063				snprintf(name, TEMPLATENAMSZ * 4, "hdrfield.%s.%s.%s",
  3064					 pipeline->common.name, parser->parser_name,
  3065					 hdrfield->common.name);
  3066	
  3067			val_t->ops->print(net, val_t, name, &readval);
  3068		} else if (A->oper_type == P4TC_OPER_KEY) {
  3069			char *path = (char *)A->print_prefix;
  3070			struct p4tc_table *table;
  3071			struct p4tc_pipeline *pipeline;
  3072	
  3073			pipeline = tcf_pipeline_find_byid(net, A->pipeid);
  3074			table = tcf_table_find_byid(pipeline, A->immedv);
  3075			if (path)
  3076				snprintf(name, TEMPLATENAMSZ * 3, "%s key.%s.%s.%u",
  3077					 path, pipeline->common.name,
  3078					 table->common.name, A->immedv2);
  3079			else
  3080				snprintf(name, TEMPLATENAMSZ * 3, "key.%s.%s.%u",
  3081					 pipeline->common.name, table->common.name,
  3082					 A->immedv2);
  3083			val_t->ops->print(net, val_t, name, &readval);
  3084		} else if (A->oper_type == P4TC_OPER_PARAM) {
  3085			char *path = (char *)A->print_prefix;
  3086	
  3087			if (path)
  3088				snprintf(name, TEMPLATENAMSZ * 2, "%s param", path);
  3089			else
  3090				strcpy(name, "param");
  3091	
  3092			val_t->ops->print(net, val_t, "param", &readval);
  3093		} else if (A->oper_type == P4TC_OPER_RES) {
  3094			char *path = (char *)A->print_prefix;
  3095	
  3096			if (A->immedv == P4TC_CMDS_RESULTS_HIT) {
  3097				if (path)
  3098					snprintf(name, TEMPLATENAMSZ * 2, "%s res.hit",
  3099						 path);
  3100				else
  3101					strcpy(name, "res.hit");
  3102	
  3103			} else if (A->immedv == P4TC_CMDS_RESULTS_MISS) {
  3104				if (path)
  3105					snprintf(name, TEMPLATENAMSZ * 2, "%s res.miss",
  3106						 path);
  3107				else
  3108					strcpy(name, "res.miss");
  3109			}
  3110	
  3111			val_t->ops->print(net, val_t, name, &readval);
  3112		} else if (A->oper_type == P4TC_OPER_REG) {
  3113			char *path = (char *)A->print_prefix;
  3114			struct p4tc_pipeline *pipeline;
  3115			struct p4tc_register *reg;
  3116	
  3117			pipeline = tcf_pipeline_find_byid(net, A->pipeid);
  3118			reg = tcf_register_find_byid(pipeline, A->immedv);
  3119			if (path)
  3120				snprintf(name, TEMPLATENAMSZ * 2,
  3121					 "%s register.%s.%s[%u]", path,
  3122					 pipeline->common.name, reg->common.name,
  3123					 A->immedv2);
  3124			else
  3125				snprintf(name, TEMPLATENAMSZ * 2, "register.%s.%s[%u]",
  3126					 pipeline->common.name, reg->common.name,
  3127					 A->immedv2);
  3128	
  3129			val_t->ops->print(net, val_t, name, &readval);
  3130		} else {
  3131			pr_info("Unsupported operand for print\n");
  3132		}
  3133		p4tc_reg_unlock(A, NULL, NULL);
  3134	
  3135		return op->ctl1;
> 3136	}
  3137	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
