Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78962DDBF
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Aug 2023 10:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691489880; x=1723025880;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kJCDgp5sRmlWoO/VG7oNBaGSk6kyXjxy6z+c89DOgxk=;
  b=OTqPUzNsiNeWDNU57mVmTM756tuQYD0omQKOLg4RyWfjSkx2bgciWIB/
   IyftxQU8776H43z2NKxhmB+3FanEfRU0Phb8c3dBY/T63fZE3TUrEz5+8
   rcEDg9ILkqF7710nYK0zXNWltGk3Ol3T5KyXCuPWjCRVY++PScEq31KH9
   PAfqX1QG+5jk63uJYQR08R4Dm+tJv2CxSDYE29JO2UKaCH0hEmH/rNTnW
   KAQxExzGCGn0lSSeue1XygH4PcUkL57YF7j85f42+11MKkmL2zAdp77yg
   qJ3GXcHwF5n7u72yDKJi0tfb0HPqX0BbvMyykw70i6FYJ+L1b/4zIol+N
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="351084471"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="351084471"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 03:17:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="977798345"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="977798345"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 08 Aug 2023 03:17:55 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTJml-0005Hm-0D;
	Tue, 08 Aug 2023 10:17:55 +0000
Date: Tue, 8 Aug 2023 18:17:44 +0800
From: kernel test robot <lkp@intel.com>
To: "GONG, Ruiqi" <gongruiqi@huaweicloud.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	Florian Westphal <fw@strlen.de>, Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org, netdev@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	Wang Weiyang <wangweiyang2@huawei.com>,
	Xiu Jianfeng <xiujianfeng@huawei.com>, gongruiqi@huaweicloud.com
Subject: Re: [PATCH] netfilter: ebtables: fix fortify warnings
Message-ID: <202308081840.VN5BvVWf-lkp@intel.com>
References: <20230808014821.241688-1-gongruiqi@huaweicloud.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230808014821.241688-1-gongruiqi@huaweicloud.com>

Hi Ruiqi,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on horms-ipvs/master v6.5-rc5 next-20230808]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/GONG-Ruiqi/netfilter-ebtables-fix-fortify-warnings/20230808-095125
base:   linus/master
patch link:    https://lore.kernel.org/r/20230808014821.241688-1-gongruiqi%40huaweicloud.com
patch subject: [PATCH] netfilter: ebtables: fix fortify warnings
config: i386-randconfig-r011-20230808 (https://download.01.org/0day-ci/archive/20230808/202308081840.VN5BvVWf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230808/202308081840.VN5BvVWf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308081840.VN5BvVWf-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/linux/netfilter_bridge/ebtables.h:185:9: error: expected specifier-qualifier-list before 'struct_group'
     185 |         struct_group(offsets,
         |         ^~~~~~~~~~~~
   ./usr/include/linux/netfilter_bridge/ebtables.h: In function 'ebt_get_target':
>> ./usr/include/linux/netfilter_bridge/ebtables.h:199:57: error: 'struct ebt_entry' has no member named 'target_offset'
     199 |         return (struct ebt_entry_target *)((char *)e + e->target_offset);
         |                                                         ^~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
