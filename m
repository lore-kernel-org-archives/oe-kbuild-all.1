Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC9A18B00
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Sep 2023 19:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695326329; x=1726862329;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+RTRLzB1Dr5e4SQrWLBCyieKIbQ2/IXNIAy29W+054w=;
  b=PkhqpmLUWkjwoCAiIlQ44eaLI7t0x8ASBTbUCy2m1pPY1n0DuThw8BL2
   0xzujT0uxcr6C16Ispi8doxj1pk0ZifsbyfMqUlHw9awpQVrR0ROyGk4l
   xiqSpT67z9+FNWKBxNr3wU5RqYGp4jok/noHzVVs0gTvxGA/63552fKBA
   ni2JNCAyDKAkECOU834d3JQrm2EbJd+Q7tRB1cgxzrl2xxpruqN52Ajmf
   GaHh4R+b1l4lyc9MfazZ2i7Mu8mSQkJ0h/OUaM8utI4KjjfAK2VVuo/zP
   XOmuFl3vHFtDLileuUGVyMlEau02OKwh01m4T7ykpchOBxMFeM8SOMqDj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="377937532"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; 
   d="scan'208";a="377937532"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 12:58:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="837425619"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; 
   d="scan'208";a="837425619"
Received: from lkp-server02.sh.intel.com (HELO b77866e22201) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Sep 2023 12:58:46 -0700
Received: from kbuild by b77866e22201 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjPor-0000L3-2d;
	Thu, 21 Sep 2023 19:58:38 +0000
Date: Fri, 22 Sep 2023 03:58:10 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/4] tracing: add __print_sym() to replace
 __print_symbolic()
Message-ID: <202309220315.Vr7w4UEw-lkp@intel.com>
References: <20230921105129.cd040deee13e.I9bd2617499f0d170df58471bc51379742190f92d@changeid>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230921105129.cd040deee13e.I9bd2617499f0d170df58471bc51379742190f92d@changeid>

Hi Johannes,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on mcgrof/modules-next]
[also build test ERROR on arnd-asm-generic/master net/main net-next/main linus/master horms-ipvs/master v6.6-rc2 next-20230921]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Johannes-Berg/tracing-add-__print_sym-to-replace-__print_symbolic/20230922-013527
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git modules-next
patch link:    https://lore.kernel.org/r/20230921105129.cd040deee13e.I9bd2617499f0d170df58471bc51379742190f92d%40changeid
patch subject: [RFC PATCH 1/4] tracing: add __print_sym() to replace __print_symbolic()
config: loongarch-randconfig-002-20230922 (https://download.01.org/0day-ci/archive/20230922/202309220315.Vr7w4UEw-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230922/202309220315.Vr7w4UEw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309220315.Vr7w4UEw-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/trace/trace_events.c: In function 'show_sym_list':
>> kernel/trace/trace_events.c:1580:31: error: invalid use of undefined type 'struct module'
    1580 |                 sym_defs = mod->trace_sym_defs;
         |                               ^~
   kernel/trace/trace_events.c:1581:33: error: invalid use of undefined type 'struct module'
    1581 |                 n_sym_defs = mod->num_trace_sym_defs;
         |                                 ^~
   kernel/trace/trace_events.c: At top level:
   kernel/trace/trace_events.c:2222:37: warning: 'ftrace_event_id_fops' defined but not used [-Wunused-const-variable=]
    2222 | static const struct file_operations ftrace_event_id_fops = {
         |                                     ^~~~~~~~~~~~~~~~~~~~


vim +1580 kernel/trace/trace_events.c

  1570	
  1571	static void show_sym_list(struct seq_file *m, struct trace_event_call *call,
  1572				  const char *name)
  1573	{
  1574		struct trace_sym_def **sym_defs;
  1575		unsigned int n_sym_defs, i;
  1576	
  1577		if (call->module) {
  1578			struct module *mod = call->module;
  1579	
> 1580			sym_defs = mod->trace_sym_defs;
  1581			n_sym_defs = mod->num_trace_sym_defs;
  1582		} else {
  1583			sym_defs = __start_ftrace_sym_defs;
  1584			n_sym_defs = __stop_ftrace_sym_defs - __start_ftrace_sym_defs;
  1585		}
  1586	
  1587		for (i = 0; i < n_sym_defs; i++) {
  1588			if (!sym_defs[i])
  1589				continue;
  1590			if (sym_defs[i]->system != call->class->system)
  1591				continue;
  1592			if (strncmp(name, sym_defs[i]->symbol_id,
  1593				    strlen(sym_defs[i]->symbol_id)))
  1594				continue;
  1595			if (sym_defs[i]->show)
  1596				sym_defs[i]->show(m);
  1597			break;
  1598		}
  1599	}
  1600	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
