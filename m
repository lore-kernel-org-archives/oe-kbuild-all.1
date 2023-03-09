Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD90C807
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Mar 2023 07:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678346221; x=1709882221;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qyB27+A/6jryhJBE3UAm43De2h+NbyfyCe38eaeTBNA=;
  b=NNFvxXQp4N1vNTVceopXS5mgiIMZF/KWJS03BXMXoZ9Y1F3Shp8IrVfU
   xTN7YMYsoVatAbL0tyS7JY+nyf/QnUmSSa3pS6Wt0gqk3gqs0K71JEiah
   VvGR1xizdzZQUHGn/vdv2yH2OzZmKEzE/ZXKfHL2iQahW11e7zZ7ssXx+
   2xNZMw5qoco0Xdt2ItUJy3iAnd2vtWYA5MrpNaWRUDvAfU7ku/kMiZURS
   WIc2fZQgChA8sy8+6nGMvjsoWK6ikQHQW1NVWW2f2VRw57i8m5KHGqVaJ
   M7GLfLWOm/rfNZvsfCny2tWFOitRdrfNc7EKOFXCsR8l83FjNEH0YUuK7
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="324694728"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="324694728"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 23:16:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="627251162"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="627251162"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 08 Mar 2023 23:16:14 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paAVZ-0002k1-1J;
	Thu, 09 Mar 2023 07:16:13 +0000
Date: Thu, 9 Mar 2023 15:15:45 +0800
From: kernel test robot <lkp@intel.com>
To: Anjali Kulkarni <anjali.k.kulkarni@oracle.com>, davem@davemloft.net
Cc: oe-kbuild-all@lists.linux.dev, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, zbr@ioremap.net, brauner@kernel.org,
	johannes@sipsolutions.net, ecree.xilinx@gmail.com, leon@kernel.org,
	keescook@chromium.org, socketcan@hartkopp.net, petrm@nvidia.com,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	anjali.k.kulkarni@oracle.com
Subject: Re: [PATCH 2/5] connector/cn_proc: Add filtering to fix some bugs
Message-ID: <202303091536.tx7dCAzn-lkp@intel.com>
References: <20230309031953.2350213-3-anjali.k.kulkarni@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230309031953.2350213-3-anjali.k.kulkarni@oracle.com>

Hi Anjali,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]
[also build test WARNING on net/master vfs-idmapping/for-next linus/master v6.3-rc1 next-20230309]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anjali-Kulkarni/netlink-Reverse-the-patch-which-removed-filtering/20230309-112151
patch link:    https://lore.kernel.org/r/20230309031953.2350213-3-anjali.k.kulkarni%40oracle.com
patch subject: [PATCH 2/5] connector/cn_proc: Add filtering to fix some bugs
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230309/202303091536.tx7dCAzn-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/b27e8d125480d07c95a71e8ef2f0b38d890138cd
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Anjali-Kulkarni/netlink-Reverse-the-patch-which-removed-filtering/20230309-112151
        git checkout b27e8d125480d07c95a71e8ef2f0b38d890138cd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303091536.tx7dCAzn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/connector/cn_proc.c:51:5: warning: no previous prototype for 'cn_filter' [-Wmissing-prototypes]
      51 | int cn_filter(struct sock *dsk, struct sk_buff *skb, void *data)
         |     ^~~~~~~~~


vim +/cn_filter +51 drivers/connector/cn_proc.c

    50	
  > 51	int cn_filter(struct sock *dsk, struct sk_buff *skb, void *data)
    52	{
    53		enum proc_cn_mcast_op mc_op;
    54	
    55		if (!dsk)
    56			return 0;
    57	
    58		mc_op = ((struct proc_input *)(dsk->sk_user_data))->mcast_op;
    59	
    60		if (mc_op == PROC_CN_MCAST_IGNORE)
    61			return 1;
    62	
    63		return 0;
    64	}
    65	EXPORT_SYMBOL_GPL(cn_filter);
    66	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
