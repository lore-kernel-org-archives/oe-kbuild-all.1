Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BF2EA1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Nov 2023 00:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RfruSh0c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699661654; x=1731197654;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/YkhVMjEEHBKiWGvdNqeH926fdcV6F3r6G4nfPEFOVI=;
  b=RfruSh0cvuif6YfQ3Dz9omJ26+vGIyt/g9E7jpIhwNFc88QjEqxcUomp
   Wl9AvqGWVrOXcorq+ilxErCaGdd+CAsO5XlY82q7hVxLmpfOencG7vs3b
   Sq5OLXDADsglO/77EcafCoArecas1BiZvApEnVYRz+qO/hren/by44EJB
   EChADi4+jkMRK2kTfRN9sRDnNoHy7d288JIGxrrIOPTN867KHDSX34DTL
   8kJKRQBS3oyWqerP8s6E3DwOWYS654yRVuYIAv2aZ6MVBr+ks5mhUOcaC
   2wM7zx856mETKYpMWTIBghQ673+J08mCdFWd/kgvrimPgVfh7Cy4FXF9L
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="421340166"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="421340166"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 16:14:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="713744731"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="713744731"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 10 Nov 2023 16:14:13 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1bda-000A4I-1Y;
	Sat, 11 Nov 2023 00:14:10 +0000
Date: Sat, 11 Nov 2023 08:13:37 +0800
From: kernel test robot <lkp@intel.com>
To: Victor Nogueira <victor@mojatatu.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net-next RFC v5 1/4] net/sched: act_mirred: Separate
 mirror and redirect into two distinct functions
Message-ID: <202311110831.UxXQMpbG-lkp@intel.com>
References: <20231110214618.1883611-2-victor@mojatatu.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231110214618.1883611-2-victor@mojatatu.com>

Hi Victor,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Victor-Nogueira/net-sched-act_mirred-Separate-mirror-and-redirect-into-two-distinct-functions/20231111-054809
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231110214618.1883611-2-victor%40mojatatu.com
patch subject: [PATCH net-next RFC v5 1/4] net/sched: act_mirred: Separate mirror and redirect into two distinct functions
config: arc-randconfig-001-20231111 (https://download.01.org/0day-ci/archive/20231111/202311110831.UxXQMpbG-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311110831.UxXQMpbG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311110831.UxXQMpbG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/net/pkt_cls.h:8,
                    from drivers/net/netdevsim/netdev.c:23:
   include/net/act_api.h: In function 'tcf_mirred_forward':
   include/net/act_api.h:303:23: error: implicit declaration of function 'tcf_dev_queue_xmit'; did you mean 'dev_queue_xmit'? [-Werror=implicit-function-declaration]
     303 |                 err = tcf_dev_queue_xmit(skb, dev_queue_xmit);
         |                       ^~~~~~~~~~~~~~~~~~
         |                       dev_queue_xmit
   include/net/act_api.h: In function 'tcf_redirect_act':
>> include/net/act_api.h:371:36: error: 'struct sk_buff' has no member named 'tc_at_ingress'
     371 |         skb_set_redirected(skb, skb->tc_at_ingress);
         |                                    ^~
   cc1: some warnings being treated as errors


vim +371 include/net/act_api.h

   366	
   367	static inline int
   368	tcf_redirect_act(struct sk_buff *skb,
   369			 bool nested_call, bool want_ingress)
   370	{
 > 371		skb_set_redirected(skb, skb->tc_at_ingress);
   372	
   373		return tcf_mirred_forward(want_ingress, nested_call, skb);
   374	}
   375	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
