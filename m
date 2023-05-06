Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478291FD5
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 May 2023 12:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683377721; x=1714913721;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9WgP29zPFLE/3/XAsk6YeNHAd2yiauStsZ3+dhFu9pc=;
  b=MJ4Mdidh3C9w8X4e1c5aKjntB0mP4S2LBk/mXPCn7Roz1gUYuHenuZcY
   i0N8ifKRTalG1D83Y68u85S3szsIAuKjijIiQMT6kO/YEnOF3R/jEg6af
   yXTn/xKtsb2Ch8LisOnMuGdCTIs2SA3VACvjMdFAB/UD6+wGPiS7OnbAl
   GLQqk3VUaHcaUZKOmiz+7/OiSe5mBryVht5P17ItBV/LptAZiqjXI0KTQ
   1/c1s8x/zGEB81umxPzYyx9N+6sMM6SGF10RXHf491DPh7GiFYnyE7ysx
   YwV4u7DthJMbCll7URRhHhtMEcFMayI9IsjCTha51JhoQ21XO7lZKf96X
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="377462077"
X-IronPort-AV: E=Sophos;i="5.99,255,1677571200"; 
   d="scan'208";a="377462077"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2023 05:55:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="872246204"
X-IronPort-AV: E=Sophos;i="5.99,255,1677571200"; 
   d="scan'208";a="872246204"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 06 May 2023 05:55:15 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvHRT-0000JH-1N;
	Sat, 06 May 2023 12:55:15 +0000
Date: Sat, 6 May 2023 20:54:21 +0800
From: kernel test robot <lkp@intel.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 72/80] lib/maple_tree.c:4606:7: warning: no
 previous prototype for 'mas_prev_slot'
Message-ID: <202305062052.NZOXSlsE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   f96b65aa15baec616fffdb8f1d4fa3222aa56467
commit: 6a63ac4851b007cce284142f5da19ea4b31a2eee [72/80] maple_tree: introduce mas_prev_slot() interface
config: arc-randconfig-r043-20230502 (https://download.01.org/0day-ci/archive/20230506/202305062052.NZOXSlsE-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?id=6a63ac4851b007cce284142f5da19ea4b31a2eee
        git remote add akpm-mm https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git
        git fetch --no-tags akpm-mm mm-unstable
        git checkout 6a63ac4851b007cce284142f5da19ea4b31a2eee
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305062052.NZOXSlsE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/maple_tree.c:4606:7: warning: no previous prototype for 'mas_prev_slot' [-Wmissing-prototypes]
    4606 | void *mas_prev_slot(struct ma_state *mas, unsigned long min, bool empty)
         |       ^~~~~~~~~~~~~
   lib/maple_tree.c:4758:7: warning: no previous prototype for 'mas_next_slot' [-Wmissing-prototypes]
    4758 | void *mas_next_slot(struct ma_state *mas, unsigned long max, bool empty)
         |       ^~~~~~~~~~~~~


vim +/mas_prev_slot +4606 lib/maple_tree.c

  4597	
  4598	/*
  4599	 * mas_prev_slot() - Get the entry in the previous slot
  4600	 *
  4601	 * @mas: The maple state
  4602	 * @max: The minimum starting range
  4603	 *
  4604	 * Return: The entry in the previous slot which is possibly NULL
  4605	 */
> 4606	void *mas_prev_slot(struct ma_state *mas, unsigned long min, bool empty)
  4607	{
  4608		void *entry;
  4609		void __rcu **slots;
  4610		unsigned long pivot;
  4611		enum maple_type type;
  4612		unsigned long *pivots;
  4613		struct maple_node *node;
  4614		unsigned long save_point = mas->index;
  4615	
  4616	retry:
  4617		node = mas_mn(mas);
  4618		type = mte_node_type(mas->node);
  4619		pivots = ma_pivots(node, type);
  4620		if (unlikely(mas_rewalk_if_dead(mas, node, save_point)))
  4621			goto retry;
  4622	
  4623	again:
  4624		if (mas->min <= min) {
  4625			pivot = mas_safe_min(mas, pivots, mas->offset);
  4626	
  4627			if (unlikely(mas_rewalk_if_dead(mas, node, save_point)))
  4628				goto retry;
  4629	
  4630			if (pivot <= min)
  4631				return NULL;
  4632		}
  4633	
  4634		if (likely(mas->offset)) {
  4635			mas->offset--;
  4636			mas->last = mas->index - 1;
  4637			mas->index = mas_safe_min(mas, pivots, mas->offset);
  4638		} else  {
  4639			if (mas_prev_node(mas, min)) {
  4640				mas_rewalk(mas, save_point);
  4641				goto retry;
  4642			}
  4643	
  4644			if (mas_is_none(mas))
  4645				return NULL;
  4646	
  4647			mas->last = mas->max;
  4648			node = mas_mn(mas);
  4649			type = mte_node_type(mas->node);
  4650			pivots = ma_pivots(node, type);
  4651			mas->index = pivots[mas->offset - 1] + 1;
  4652		}
  4653	
  4654		slots = ma_slots(node, type);
  4655		entry = mas_slot(mas, slots, mas->offset);
  4656		if (unlikely(mas_rewalk_if_dead(mas, node, save_point)))
  4657			goto retry;
  4658	
  4659		if (likely(entry))
  4660			return entry;
  4661	
  4662		if (!empty)
  4663			goto again;
  4664	
  4665		return entry;
  4666	}
  4667	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
