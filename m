Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32E77E8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 May 2023 02:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683945903; x=1715481903;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CWANKOlRohDEpksHUNN0DPLkPCaXRTvdfAbevacFo5k=;
  b=JBXo3Lzk27zOh7ukQOijhpiPz5CKaSEHXo+OlrXHlD+ffSyIrFtnB1Ug
   yPRsf4Bduc0jsH3T6E+123JHlqm7Pec3vVBzKeke5kAUVqInTsEeSnbM2
   XmrGIpYskzGpGyM5GAhkWyo58B49XzbSkyBWJvN4HxgrGJfOp5vC2mdoE
   6gNZq0KTXDhiIBhewxJJBmHgBW/dPPekhYSvtfpOxHJVzP2lfYs+cdtv2
   ZkiOswZcp3hb/M6wHhS+cReWD35QWbXreY/osXQ+iHMFDNoPCUtQZFSly
   kGuKQCSGcDooFv3gV0PnTeopsHv+yS9AlzAeFxvAJs5xVJLKOr0naiYrl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="414299493"
X-IronPort-AV: E=Sophos;i="5.99,271,1677571200"; 
   d="scan'208";a="414299493"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 19:45:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="733254541"
X-IronPort-AV: E=Sophos;i="5.99,271,1677571200"; 
   d="scan'208";a="733254541"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 12 May 2023 19:45:01 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxfFl-0005G8-09;
	Sat, 13 May 2023 02:45:01 +0000
Date: Sat, 13 May 2023 10:44:19 +0800
From: kernel test robot <lkp@intel.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 1003/2056] lib/maple_tree.c:4606:7: warning: no
 previous prototype for 'mas_prev_slot'
Message-ID: <202305131049.J7dKieVZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e922ba281a8d84f640d8c8e18a385d032c19e185
commit: 0d785405fe36734d6861274187bf504db4229719 [1003/2056] maple_tree: introduce mas_prev_slot() interface
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20230513/202305131049.J7dKieVZ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=0d785405fe36734d6861274187bf504db4229719
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 0d785405fe36734d6861274187bf504db4229719
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305131049.J7dKieVZ-lkp@intel.com/

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
