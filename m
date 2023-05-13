Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0447E1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 May 2023 00:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683937622; x=1715473622;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2YzsfGj++epDydqFsrrfvsbxOmruEb1HHB+oauMolik=;
  b=GgG59xd3td0nyxc0PonczfWVh71K1jVeSPJxYd1IvLRdzXmG85WiUAc9
   7S5HbNcqVY6xe1oxuk0Upm2PzsmLK9UGVGCmBtqhaS3daoaIQK8ezxmBG
   V4WfV3vbDiMHyj9IIpWjlTNFTUSebtrFmo+UZJL7xNE4cbzqqfMxQEvPl
   4JDoVrCZnOLawgzXtX66lb+zidQuBQNNsRmaLFBfzOxHmdgN1Y76Q9im/
   iPfJ+ih+dJHI/SKPGD3GvJTKQEvhkOj4uLuPCKBl5rCaPclnx/UGDJ7d7
   jGeiZ+MadNo1CSA/jrlU3iZOCDxf8dzo8SbaPoUxGfJR1RtBh4GqZVFW5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="437245931"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="437245931"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 17:27:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="824529267"
X-IronPort-AV: E=Sophos;i="5.99,271,1677571200"; 
   d="scan'208";a="824529267"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 12 May 2023 17:27:00 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxd6B-0005CC-19;
	Sat, 13 May 2023 00:26:59 +0000
Date: Sat, 13 May 2023 08:26:38 +0800
From: kernel test robot <lkp@intel.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 1000/2056] lib/maple_tree.c:4707:7: warning: no
 previous prototype for 'mas_next_slot'
Message-ID: <202305130809.SJnM01fL-lkp@intel.com>
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
commit: ad3a8f2de4cbf6063beaf3671ef25f268b325a88 [1000/2056] maple_tree: introduce mas_next_slot() interface
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20230513/202305130809.SJnM01fL-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=ad3a8f2de4cbf6063beaf3671ef25f268b325a88
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout ad3a8f2de4cbf6063beaf3671ef25f268b325a88
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305130809.SJnM01fL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/maple_tree.c:4707:7: warning: no previous prototype for 'mas_next_slot' [-Wmissing-prototypes]
    4707 | void *mas_next_slot(struct ma_state *mas, unsigned long max, bool empty)
         |       ^~~~~~~~~~~~~


vim +/mas_next_slot +4707 lib/maple_tree.c

  4697	
  4698	/*
  4699	 * mas_next_slot() - Get the entry in the next slot
  4700	 *
  4701	 * @mas: The maple state
  4702	 * @max: The maximum starting range
  4703	 * @empty: Can be empty
  4704	 *
  4705	 * Return: The entry in the next slot which is possibly NULL
  4706	 */
> 4707	void *mas_next_slot(struct ma_state *mas, unsigned long max, bool empty)
  4708	{
  4709		void __rcu **slots;
  4710		unsigned long *pivots;
  4711		unsigned long pivot;
  4712		enum maple_type type;
  4713		struct maple_node *node;
  4714		unsigned char data_end;
  4715		unsigned long save_point = mas->last;
  4716		void *entry;
  4717	
  4718	retry:
  4719		node = mas_mn(mas);
  4720		type = mte_node_type(mas->node);
  4721		pivots = ma_pivots(node, type);
  4722		data_end = ma_data_end(node, type, pivots, mas->max);
  4723		if (unlikely(mas_rewalk_if_dead(mas, node, save_point)))
  4724			goto retry;
  4725	
  4726	again:
  4727		if (mas->max >= max) {
  4728			if (likely(mas->offset < data_end))
  4729				pivot = pivots[mas->offset];
  4730			else
  4731				return NULL; /* must be mas->max */
  4732	
  4733			if (unlikely(mas_rewalk_if_dead(mas, node, save_point)))
  4734				goto retry;
  4735	
  4736			if (pivot >= max)
  4737				return NULL;
  4738		}
  4739	
  4740		if (likely(mas->offset < data_end)) {
  4741			mas->index = pivots[mas->offset] + 1;
  4742			mas->offset++;
  4743			if (likely(mas->offset < data_end))
  4744				mas->last = pivots[mas->offset];
  4745			else
  4746				mas->last = mas->max;
  4747		} else  {
  4748			if (mas_next_node(mas, node, max)) {
  4749				mas_rewalk(mas, save_point);
  4750				goto retry;
  4751			}
  4752	
  4753			if (mas_is_none(mas))
  4754				return NULL;
  4755	
  4756			mas->offset = 0;
  4757			mas->index = mas->min;
  4758			node = mas_mn(mas);
  4759			type = mte_node_type(mas->node);
  4760			pivots = ma_pivots(node, type);
  4761			mas->last = pivots[0];
  4762		}
  4763	
  4764		slots = ma_slots(node, type);
  4765		entry = mt_slot(mas->tree, slots, mas->offset);
  4766		if (unlikely(mas_rewalk_if_dead(mas, node, save_point)))
  4767			goto retry;
  4768	
  4769		if (entry)
  4770			return entry;
  4771	
  4772		if (!empty) {
  4773			if (!mas->offset)
  4774				data_end = 2;
  4775			goto again;
  4776		}
  4777	
  4778		return entry;
  4779	}
  4780	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
