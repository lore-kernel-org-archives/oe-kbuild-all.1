Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889277ED
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Aug 2023 05:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693200015; x=1724736015;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ZIFzK/X1nhD6KUrdCwhykqKym1A1teP2AZ/Vewk+W1E=;
  b=hmE3B7YLq7WnuAORhddQLwbPUKAgVmguxNK67r7TGXYZERKi/NCEMhTY
   J1f7Z8/23GSDYp3sWfOvtkDc1fEeROqFi+l3CfqL0z7vB4qLIqvo2BfLh
   SO7u0TKqEyeME1kzuAl8BKZHRNg427iHWGf9dpLRkD7JZggtCfxGrEPK0
   OY/6yJIFdGL6ZIDVup71FlcigVL2xWa5yZRM97oYHdBJTDgR4ZxdHTlds
   EEp5v1g49WeHefCQjC2a/MxhVDfq5an8mTDdxQM6EGv5trGXtM8BUjvGB
   S4oTA4wpB18w1qDcCqxXrnZulGzym28ZKdx1D+mxJwfetzhCPXu5wRuc5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="373903098"
X-IronPort-AV: E=Sophos;i="6.02,206,1688454000"; 
   d="scan'208";a="373903098"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 22:20:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="881790891"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 27 Aug 2023 22:20:17 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaUfI-0007ab-10;
	Mon, 28 Aug 2023 05:19:53 +0000
Date: Mon, 28 Aug 2023 13:19:19 +0800
From: kernel test robot <lkp@intel.com>
To: Li zeming <zeming@nfschina.com>, tj@kernel.org, jiangshanlai@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Li zeming <zeming@nfschina.com>
Subject: Re: [PATCH] kernel/workqueue: =?utf-8?Q?Re?=
 =?utf-8?B?bW92ZSB1bm5lY2Vzc2FyeSDigJgw4oCZ?= values from hash
Message-ID: <202308281313.YHarxg3i-lkp@intel.com>
References: <20230829181755.3204-1-zeming@nfschina.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230829181755.3204-1-zeming@nfschina.com>

Hi Li,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tj-wq/for-next]
[also build test WARNING on linus/master v6.5 next-20230825]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Li-zeming/kernel-workqueue-Remove-unnecessary-0-values-from-hash/20230828-095048
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-next
patch link:    https://lore.kernel.org/r/20230829181755.3204-1-zeming%40nfschina.com
patch subject: [PATCH] kernel/workqueue: Remove unnecessary ‘0’ values from hash
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20230828/202308281313.YHarxg3i-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230828/202308281313.YHarxg3i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308281313.YHarxg3i-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/workqueue.c: In function 'wqattrs_hash':
>> kernel/workqueue.c:3777:7: warning: 'hash' is used uninitialized in this function [-Wuninitialized]
     hash = jhash_1word(attrs->nice, hash);
     ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/hash +3777 kernel/workqueue.c

5de7a03cac1476 Tejun Heo           2023-08-07  3771  
6ba94429c8e7b8 Frederic Weisbecker 2015-04-02  3772  /* hash value of the content of @attr */
6ba94429c8e7b8 Frederic Weisbecker 2015-04-02  3773  static u32 wqattrs_hash(const struct workqueue_attrs *attrs)
226223ab3c4118 Tejun Heo           2013-03-12  3774  {
dd46423224bbdf Li zeming           2023-08-30  3775  	u32 hash;
226223ab3c4118 Tejun Heo           2013-03-12  3776  
6ba94429c8e7b8 Frederic Weisbecker 2015-04-02 @3777  	hash = jhash_1word(attrs->nice, hash);
6ba94429c8e7b8 Frederic Weisbecker 2015-04-02  3778  	hash = jhash(cpumask_bits(attrs->cpumask),
6ba94429c8e7b8 Frederic Weisbecker 2015-04-02  3779  		     BITS_TO_LONGS(nr_cpumask_bits) * sizeof(long), hash);
9546b29e4a6ad6 Tejun Heo           2023-08-07  3780  	hash = jhash(cpumask_bits(attrs->__pod_cpumask),
9546b29e4a6ad6 Tejun Heo           2023-08-07  3781  		     BITS_TO_LONGS(nr_cpumask_bits) * sizeof(long), hash);
8639ecebc9b179 Tejun Heo           2023-08-07  3782  	hash = jhash_1word(attrs->affn_strict, hash);
6ba94429c8e7b8 Frederic Weisbecker 2015-04-02  3783  	return hash;
d55262c4d16475 Tejun Heo           2013-04-01  3784  }
226223ab3c4118 Tejun Heo           2013-03-12  3785  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
