Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AB218042
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 18:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692987893; x=1724523893;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RBjmbcP/48Z/9RDJfjhXfkwKSBxaNq5tG2haEM+tDS4=;
  b=cpZvcwJ35HlFLPObae4qo2NMIjF40/4ogsWteQl1Q5hTB+iZ8KL03Lay
   Wc+2YGV8zZU5HUEViGdxtxxeDeP6pUX/6vG7HiGqddD7hRv8dg5loU38Q
   DXMHCmHI2jVMhhccwSONLLvQSJBM4kXbNh+wvZfpjdDpLvcvJ+Ik6b9ch
   t1QZ8MbpR0sYPUuvwXYpIekKj0wT01qkGJpPf83qmsWu0UrXOtTN9Wxlo
   HM7jAbglIUUM+QN62OlTnu1lePzgi7BeEcm9r+vd24hRkZ/6fIt9JQHMv
   14bb1min4nX8nJfXQvqSIdC+hhguZ0eMMqYHFZH/nMkPhGNUZxsQP+EnN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="377513192"
X-IronPort-AV: E=Sophos;i="6.02,201,1688454000"; 
   d="scan'208";a="377513192"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 11:24:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="772569384"
X-IronPort-AV: E=Sophos;i="6.02,201,1688454000"; 
   d="scan'208";a="772569384"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 25 Aug 2023 11:24:49 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZbUG-0003tL-0Y;
	Fri, 25 Aug 2023 18:24:48 +0000
Date: Sat, 26 Aug 2023 02:24:37 +0800
From: kernel test robot <lkp@intel.com>
To: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
Cc: oe-kbuild-all@lists.linux.dev, azkali <a.ffcc7@gmail.com>,
	Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
	Adam Jiang <chaoj@nvidia.com>, CTCaer <ctcaer@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] misc: bm92txx: Add driver for the ROHM BM92Txx
Message-ID: <202308260240.OBZU72Ht-lkp@intel.com>
References: <20230824153059.212244-3-linkmauve@linkmauve.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230824153059.212244-3-linkmauve@linkmauve.fr>

Hi Emmanuel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus robh/for-next linus/master v6.5-rc7 next-20230825]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Emmanuel-Gil-Peyrot/dt-bindings-misc-rohm-bm92txx-Add-BM92Txx-support/20230824-233354
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20230824153059.212244-3-linkmauve%40linkmauve.fr
patch subject: [PATCH 2/2] misc: bm92txx: Add driver for the ROHM BM92Txx
config: csky-randconfig-r036-20230826 (https://download.01.org/0day-ci/archive/20230826/202308260240.OBZU72Ht-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308260240.OBZU72Ht-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308260240.OBZU72Ht-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/misc/bm92txx.c: In function 'bm92t_remove':
>> drivers/misc/bm92txx.c:1800:28: warning: unused variable 'info' [-Wunused-variable]
    1800 |         struct bm92t_info *info = i2c_get_clientdata(client);
         |                            ^~~~
   drivers/misc/bm92txx.c: At top level:
>> drivers/misc/bm92txx.c:1179:13: warning: 'bm92t_usbhub_dp_sleep' defined but not used [-Wunused-function]
    1179 | static void bm92t_usbhub_dp_sleep(struct bm92t_info *info, bool sleep)
         |             ^~~~~~~~~~~~~~~~~~~~~


vim +/info +1800 drivers/misc/bm92txx.c

  1797	
  1798	static void bm92t_remove(struct i2c_client *client)
  1799	{
> 1800		struct bm92t_info *info = i2c_get_clientdata(client);
  1801	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
