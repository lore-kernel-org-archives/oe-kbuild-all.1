Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF525D524
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Mar 2023 21:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677793296; x=1709329296;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ad7taOLjW5vmSJHowkLhdUsOn+49d2Su1hg+PUyv/BQ=;
  b=a0HApp50biPTNujeGj79l+5+lyruTyBd7cR3wCttN/HNm4Hkh/EH2csd
   KAfwnPUQ4YU42JILV1NyBaUUnYdzsO5iqPWlrJ0Os63Pi3K8QV3VwvFCe
   rrPzJH7zDqXsUrPp/puV6IOmcMu84L/eDAl5b30vSQOmRPP54L09g8gUH
   3XDjaJHm9fhAD/8fa/IMKD9ot9J4P7642JSKz/jV3mhemI4QfSpDIcDTZ
   3V3fqMFFmKreekHthNbYQGCcieUVFvbFEtmbbof0bJhcMaPRrCB0tzwbi
   gOLAeYJQ4m1WsrfJEtV3nWdd+Hp0HIrbA0bEnHd49FaBE1sgLLjxi1ZJM
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="318682918"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; 
   d="scan'208";a="318682918"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 13:41:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="677389144"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; 
   d="scan'208";a="677389144"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 02 Mar 2023 13:41:35 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXqgA-0000u6-15;
	Thu, 02 Mar 2023 21:41:34 +0000
Date: Fri, 3 Mar 2023 05:41:13 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] tracing/hist: add modulus operator
Message-ID: <202303030527.tCXUA4Xo-lkp@intel.com>
References: <20230302171755.1821653-3-mark.rutland@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302171755.1821653-3-mark.rutland@arm.com>

Hi Mark,

I love your patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on rostedt-trace/for-next v6.2 next-20230302]
[cannot apply to rostedt-trace/for-next-urgent]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mark-Rutland/tracing-hist-simplify-contains_operator/20230303-012033
patch link:    https://lore.kernel.org/r/20230302171755.1821653-3-mark.rutland%40arm.com
patch subject: [PATCH 2/2] tracing/hist: add modulus operator
config: i386-randconfig-a016 (https://download.01.org/0day-ci/archive/20230303/202303030527.tCXUA4Xo-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/a2602e97de77834320fed5f928662f154f72d7ce
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mark-Rutland/tracing-hist-simplify-contains_operator/20230303-012033
        git checkout a2602e97de77834320fed5f928662f154f72d7ce
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303030527.tCXUA4Xo-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/trace/trace_events_hist.o: in function `hist_field_mod':
>> kernel/trace/trace_events_hist.c:454: undefined reference to `__umoddi3'


vim +454 kernel/trace/trace_events_hist.c

   441	
   442	static u64 hist_field_mod(struct hist_field *hist_field,
   443				  struct tracing_map_elt *elt,
   444				  struct trace_buffer *buffer,
   445				  struct ring_buffer_event *rbe,
   446				  void *event)
   447	{
   448		struct hist_field *operand1 = hist_field->operands[0];
   449		struct hist_field *operand2 = hist_field->operands[1];
   450	
   451		u64 val1 = hist_fn_call(operand1, elt, buffer, rbe, event);
   452		u64 val2 = hist_fn_call(operand2, elt, buffer, rbe, event);
   453	
 > 454		return val1 % val2;
   455	}
   456	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
