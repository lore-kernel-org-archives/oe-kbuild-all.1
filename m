Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1093111BF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 13:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693489914; x=1725025914;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KDwakuho30pGNqFMJ4s04PUhZkbyFB6UMCLoGzDVdME=;
  b=FbnlABPnkLIaVgucoxmrC/r3b2TFYa/cWNovu3FYKfKLSSVGSDlmkwU/
   yrtBxGGPknvhwLlmX+GiFJi48T5Toys7WVuqEAQkcvNwx1Sf153udgIcS
   toxmWHul9CVecA8AnqxJvDpekdPzhxatwmO/l2vOAY9NRskBokNLfFZgC
   CEoOjzNorSDmjo88UBmo/UvAIoFFXKWBdhasIK8kXbz14G5UeTz5S22LO
   2c51B/NOakv89eDRgXMLjQlIzy5aBRxklJO0GVW51Ln+F0Iup2e/knscd
   eWhQduYHWx5/992WSOBcq6D4Crm1FulJ3ZoSNsC91GvdqlbcOVMpeiKfH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="374866512"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="374866512"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 06:51:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="739540714"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="739540714"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 31 Aug 2023 06:51:51 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbi5N-0000Ct-1b;
	Thu, 31 Aug 2023 13:51:49 +0000
Date: Thu, 31 Aug 2023 21:50:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 12/20] lib/maple_tree.c:4736:7:
 warning: no previous declaration for 'mas_next_slot'
Message-ID: <202308312121.lKSWKEgA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   638804ea1ce06120f440cb308fcb24ad485e7d60
commit: 84719794e06c13fd9a3fd0c547af5bf9d76f7c3b [12/20] FROMGIT: maple_tree: introduce mas_next_slot() interface
config: x86_64-randconfig-r032-20230831 (https://download.01.org/0day-ci/archive/20230831/202308312121.lKSWKEgA-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308312121.lKSWKEgA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308312121.lKSWKEgA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/maple_tree.c:4736:7: warning: no previous declaration for 'mas_next_slot' [-Wmissing-declarations]
    void *mas_next_slot(struct ma_state *mas, unsigned long max, bool empty)
          ^~~~~~~~~~~~~


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
