Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39FE7C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Jun 2023 00:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686098907; x=1717634907;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nMxghYRrSoBob90vg7n0oPmyqylV8ely9NtRm+fnOM0=;
  b=mVEGFLkff9KU1eUuXZCsObtxwSDL8X3/iGwD7g6+kzsGFA0xa3yAsE5Y
   5djAQgDR+Pu4lMgSAEbHSjdeDAGZQcd/9e3s4N/7DNX6TUBWOeOPS55W9
   k+FJ8FOWb0wtQ2O96k/nV4SKpNWUETiMyHb8E9htFYi1VSbcMw4yy7ZH4
   v9cU+ju1D8tcG2d233TfaMR+UT4LpGkDtpxgP+vkcuUpH2wuxWaW5288Z
   dBGKMRmViAphQKIgXAuf21vWp55MPbv7eMjIXejPD8a2F3n4LiIl0DjPA
   JzYHlBpx6E8rdlGQrQ/QV/etO6jMoMyBfkoMRfCPos0L/MJUUu/wEaSNL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="336465529"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; 
   d="scan'208";a="336465529"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 17:48:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="779174392"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; 
   d="scan'208";a="779174392"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 06 Jun 2023 17:48:24 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6hLb-0005wD-0n;
	Wed, 07 Jun 2023 00:48:23 +0000
Date: Wed, 7 Jun 2023 08:47:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 12/20] lib/maple_tree.c:4736:7:
 warning: no previous prototype for function 'mas_next_slot'
Message-ID: <202306070853.y6DuHInX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   2de1ee6dd822857daaad9793259eb0a8478ee584
commit: 84719794e06c13fd9a3fd0c547af5bf9d76f7c3b [12/20] FROMGIT: maple_tree: introduce mas_next_slot() interface
config: i386-randconfig-i011-20230606 (https://download.01.org/0day-ci/archive/20230607/202306070853.y6DuHInX-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android14-6.1
        git checkout 84719794e06c13fd9a3fd0c547af5bf9d76f7c3b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306070853.y6DuHInX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/maple_tree.c:4736:7: warning: no previous prototype for function 'mas_next_slot' [-Wmissing-prototypes]
   void *mas_next_slot(struct ma_state *mas, unsigned long max, bool empty)
         ^
   lib/maple_tree.c:4736:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void *mas_next_slot(struct ma_state *mas, unsigned long max, bool empty)
   ^
   static 
   lib/maple_tree.c:325:20: warning: unused function 'mte_set_full' [-Wunused-function]
   static inline void mte_set_full(const struct maple_enode *node)
                      ^
   lib/maple_tree.c:330:20: warning: unused function 'mte_clear_full' [-Wunused-function]
   static inline void mte_clear_full(const struct maple_enode *node)
                      ^
   3 warnings generated.


vim +/mas_next_slot +4736 lib/maple_tree.c

  4726	
  4727	/*
  4728	 * mas_next_slot() - Get the entry in the next slot
  4729	 *
  4730	 * @mas: The maple state
  4731	 * @max: The maximum starting range
  4732	 * @empty: Can be empty
  4733	 *
  4734	 * Return: The entry in the next slot which is possibly NULL
  4735	 */
> 4736	void *mas_next_slot(struct ma_state *mas, unsigned long max, bool empty)
  4737	{
  4738		void __rcu **slots;
  4739		unsigned long *pivots;
  4740		unsigned long pivot;
  4741		enum maple_type type;
  4742		struct maple_node *node;
  4743		unsigned char data_end;
  4744		unsigned long save_point = mas->last;
  4745		void *entry;
  4746	
  4747	retry:
  4748		node = mas_mn(mas);
  4749		type = mte_node_type(mas->node);
  4750		pivots = ma_pivots(node, type);
  4751		data_end = ma_data_end(node, type, pivots, mas->max);
  4752		if (unlikely(mas_rewalk_if_dead(mas, node, save_point)))
  4753			goto retry;
  4754	
  4755	again:
  4756		if (mas->max >= max) {
  4757			if (likely(mas->offset < data_end))
  4758				pivot = pivots[mas->offset];
  4759			else
  4760				return NULL; /* must be mas->max */
  4761	
  4762			if (unlikely(mas_rewalk_if_dead(mas, node, save_point)))
  4763				goto retry;
  4764	
  4765			if (pivot >= max)
  4766				return NULL;
  4767		}
  4768	
  4769		if (likely(mas->offset < data_end)) {
  4770			mas->index = pivots[mas->offset] + 1;
  4771			mas->offset++;
  4772			if (likely(mas->offset < data_end))
  4773				mas->last = pivots[mas->offset];
  4774			else
  4775				mas->last = mas->max;
  4776		} else  {
  4777			if (mas_next_node(mas, node, max)) {
  4778				mas_rewalk(mas, save_point);
  4779				goto retry;
  4780			}
  4781	
  4782			if (mas_is_none(mas))
  4783				return NULL;
  4784	
  4785			mas->offset = 0;
  4786			mas->index = mas->min;
  4787			node = mas_mn(mas);
  4788			type = mte_node_type(mas->node);
  4789			pivots = ma_pivots(node, type);
  4790			mas->last = pivots[0];
  4791		}
  4792	
  4793		slots = ma_slots(node, type);
  4794		entry = mt_slot(mas->tree, slots, mas->offset);
  4795		if (unlikely(mas_rewalk_if_dead(mas, node, save_point)))
  4796			goto retry;
  4797	
  4798		if (entry)
  4799			return entry;
  4800	
  4801		if (!empty) {
  4802			if (!mas->offset)
  4803				data_end = 2;
  4804			goto again;
  4805		}
  4806	
  4807		return entry;
  4808	}
  4809	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
