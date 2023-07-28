Received: from mgamail.intel.com (unknown [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3400011CA1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jul 2023 10:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690539911; x=1722075911;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FHhAQ5yaoJu37V4pkZLaRGGe/SPrF6miFUOBHYfatY4=;
  b=JarJHnGaiBjidTDJSNnsLzh1gw5ltGOL+Xa8DYTnC6tmueiKK9P4mGyV
   TtkYTwsgrqDmjxuDTc4s2IQC8WfmXFKdBqz9tn5IKPgrmiofMxrg7ztGa
   aCj7n6XW4qIXb1o1z2+cZ8tTH5ELMpZfybndLNpNaJ3lCC6srZxfk21OY
   cCFuAiN7zKGb6j1zIzgqQCeruIP8O/gr+EstOgKf5RH+M/nMh6e7aQz6A
   5FKXqmlOuMA8Hs82anP91kCiy9W9mC28UpO7RQE4A4e+EGocS9V7WIN0b
   UYb9gLbu1/PKogCMfnMP2usUnRoBb+AoZHKSwktapGAAa/skgwRfWbM3H
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="432375491"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; 
   d="scan'208";a="432375491"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 03:25:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="677494352"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; 
   d="scan'208";a="677494352"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 28 Jul 2023 03:25:09 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPKei-00035p-2u;
	Fri, 28 Jul 2023 10:25:08 +0000
Date: Fri, 28 Jul 2023 18:25:07 +0800
From: kernel test robot <lkp@intel.com>
To: Geliang Tang <geliang.tang@suse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC bpf-next v6] bpf: Force to MPTCP
Message-ID: <202307281834.rCNg0Rwb-lkp@intel.com>
References: <c0647d0d3c7158b96dec4604ba317df311c5012d.1690531142.git.geliang.tang@suse.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0647d0d3c7158b96dec4604ba317df311c5012d.1690531142.git.geliang.tang@suse.com>

Hi Geliang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Geliang-Tang/bpf-Force-to-MPTCP/20230728-160441
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/c0647d0d3c7158b96dec4604ba317df311c5012d.1690531142.git.geliang.tang%40suse.com
patch subject: [RFC bpf-next v6] bpf: Force to MPTCP
config: arc-randconfig-r026-20230727 (https://download.01.org/0day-ci/archive/20230728/202307281834.rCNg0Rwb-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230728/202307281834.rCNg0Rwb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307281834.rCNg0Rwb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/socket.c:1647:14: warning: no previous prototype for 'update_socket_protocol' [-Wmissing-prototypes]
    1647 | noinline int update_socket_protocol(int family, int type, int protocol)
         |              ^~~~~~~~~~~~~~~~~~~~~~


vim +/update_socket_protocol +1647 net/socket.c

  1646	
> 1647	noinline int update_socket_protocol(int family, int type, int protocol)
  1648	{
  1649		return protocol;
  1650	}
  1651	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
