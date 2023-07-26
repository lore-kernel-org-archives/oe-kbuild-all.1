Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9790F19886
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jul 2023 19:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690399092; x=1721935092;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4bdip+eBQTzqqq5/e1vXiknfCQTkj2UGM6Yq8X004Q4=;
  b=EZ4YZbcuXXdZTuTtoMAesZ4Cym52a5LJ0uqnIEQAL9HETjh/2n21vIxj
   2gOsWdexPxG+lLIcX4LKnyhEYo727y1huFkSfCbsw4+wB/sogxPVTiD40
   Fv3PxSE78nfz/fNzpSFKaZf21Sk/MmAs0CPm4NSUkL69eOserOhN5Yrrt
   PSx4VaOkyNcQn+u+0R8cb2YgtJFuKFHkatfdUdO2kYoixoNTrtgmDGaZa
   1xv12jEdClWl0wc4F6AZmQVAuKrUICGtsbdBO5CYAtthbro7KRWfYspbw
   72fcyCDltOoQIH43TJF/BUVktyuGdCiMKWibJJX2Wqi9kGQSbaiTWF/mS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="368130173"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="368130173"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 12:18:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="840376095"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="840376095"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 26 Jul 2023 12:18:06 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOk1N-0001EF-1E;
	Wed, 26 Jul 2023 19:18:05 +0000
Date: Thu, 27 Jul 2023 03:17:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/fprobe-event-ext 7/11]
 kernel/trace/trace_probe.c:647:16: warning: returning 'void *' from a
 function with return type 'int' makes integer from pointer without a cast
Message-ID: <202307270306.TFqCF7Vv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fprobe-event-ext
head:   e4bb6f2230fbe828dad040af0befb139a5a5733b
commit: 33d45869bbad8c03d268d0634be77d860bbbc611 [7/11] tracing/probes: Support BTF field access from $retval
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230727/202307270306.TFqCF7Vv-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307270306.TFqCF7Vv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307270306.TFqCF7Vv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/trace/trace_probe.c: In function 'query_btf_context':
>> kernel/trace/trace_probe.c:647:16: warning: returning 'void *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
     647 |         return ERR_PTR(-EOPNOTSUPP);
         |                ^~~~~~~~~~~~~~~~~~~~


vim +647 kernel/trace/trace_probe.c

b576e09701c7d04 Masami Hiramatsu (Google  2023-06-06  644) 
33d45869bbad8c0 Masami Hiramatsu (Google  2023-07-17  645) static int query_btf_context(struct traceprobe_parse_context *ctx)
18b1e870a496717 Masami Hiramatsu (Google  2023-06-06  646) {
18b1e870a496717 Masami Hiramatsu (Google  2023-06-06 @647) 	return ERR_PTR(-EOPNOTSUPP);
18b1e870a496717 Masami Hiramatsu (Google  2023-06-06  648) }
18b1e870a496717 Masami Hiramatsu (Google  2023-06-06  649) 

:::::: The code at line 647 was first introduced by commit
:::::: 18b1e870a49671745c31434b18bcfdd6f20cb6a1 tracing/probes: Add $arg* meta argument for all function args

:::::: TO: Masami Hiramatsu (Google) <mhiramat@kernel.org>
:::::: CC: Masami Hiramatsu (Google) <mhiramat@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
