Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4706B29CE3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 13:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R2AdAoHH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697723475; x=1729259475;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dJqc+YmQwqGKmniNn8zypvhT7ZdrL/jLt6B9gTGCN/M=;
  b=R2AdAoHHQRFqB3lF8nBNl8jNv3TfOvf0t7j6+DRB5Vbnx4ZiDSW0BdCr
   BQzGxzIZk5/sunp9a9q9DKINaHHlwz7/piqY62RNeA0MYewDX21UaHJ5+
   g847vQFy1ydMUF6MbIZahsoK/cojZBmX+cdhxEEM9Vya37gnCNDF+fiNs
   ZE0lM2c18UeG0a4tCYXseeFuW/0097JwfHBqptA7Ot+QVRtis+kMsU40V
   YohQr0pLv1UPeEYHcT9A1K8MC0cF5Yxy90Y84fPZeIa+xFBmk8rAnuk1v
   pHKxrlAsY86YvrbhKfzMIpbCkRO233/LIdD5bwoMBjNj28LN2tEulKldV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="390144123"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="390144123"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 06:48:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="750514353"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="750514353"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 19 Oct 2023 06:48:12 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtTNh-00029k-2r;
	Thu, 19 Oct 2023 13:48:09 +0000
Date: Thu, 19 Oct 2023 21:48:04 +0800
From: kernel test robot <lkp@intel.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 5/7] tun: Support BPF_PROG_TYPE_VNET_HASH
Message-ID: <202310192125.2vHcdkTd-lkp@intel.com>
References: <20231015141644.260646-6-akihiko.odaki@daynix.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231015141644.260646-6-akihiko.odaki@daynix.com>

Hi Akihiko,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]
[also build test ERROR on bpf/master mst-vhost/linux-next linus/master v6.6-rc6]
[cannot apply to next-20231019]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Akihiko-Odaki/bpf-Introduce-BPF_PROG_TYPE_VNET_HASH/20231017-132222
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20231015141644.260646-6-akihiko.odaki%40daynix.com
patch subject: [RFC PATCH v2 5/7] tun: Support BPF_PROG_TYPE_VNET_HASH
config: um-defconfig (https://download.01.org/0day-ci/archive/20231019/202310192125.2vHcdkTd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231019/202310192125.2vHcdkTd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310192125.2vHcdkTd-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/tun.c: In function 'tun_ebpf_select_queue':
>> drivers/net/tun.c:564:31: error: implicit declaration of function 'skb_ext_add'; did you mean 'skb_ext_del'? [-Werror=implicit-function-declaration]
     564 |                         ext = skb_ext_add(skb, SKB_EXT_TUN_VNET_HASH);
         |                               ^~~~~~~~~~~
         |                               skb_ext_del
>> drivers/net/tun.c:564:48: error: 'SKB_EXT_TUN_VNET_HASH' undeclared (first use in this function)
     564 |                         ext = skb_ext_add(skb, SKB_EXT_TUN_VNET_HASH);
         |                                                ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/tun.c:564:48: note: each undeclared identifier is reported only once for each function it appears in
   drivers/net/tun.c: In function 'tun_put_user':
>> drivers/net/tun.c:2152:39: error: implicit declaration of function 'skb_ext_find'; did you mean 'skb_ext_copy'? [-Werror=implicit-function-declaration]
    2152 |                         vnet_hash_p = skb_ext_find(skb, SKB_EXT_TUN_VNET_HASH);
         |                                       ^~~~~~~~~~~~
         |                                       skb_ext_copy
   drivers/net/tun.c:2152:57: error: 'SKB_EXT_TUN_VNET_HASH' undeclared (first use in this function)
    2152 |                         vnet_hash_p = skb_ext_find(skb, SKB_EXT_TUN_VNET_HASH);
         |                                                         ^~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +564 drivers/net/tun.c

   543	
   544	static u16 tun_ebpf_select_queue(struct tun_struct *tun, struct sk_buff *skb)
   545	{
   546		struct bpf_skb_vnet_hash_end *cb = (struct bpf_skb_vnet_hash_end *)skb->cb;
   547		struct tun_vnet_hash *ext;
   548		struct tun_prog *prog;
   549		u32 numqueues;
   550		u16 queue = 0;
   551	
   552		BUILD_BUG_ON(sizeof(*cb) > sizeof(skb->cb));
   553	
   554		numqueues = READ_ONCE(tun->numqueues);
   555		if (!numqueues)
   556			return 0;
   557	
   558		prog = rcu_dereference(tun->steering_prog);
   559		if (prog) {
   560			if (prog->prog->type == BPF_PROG_TYPE_VNET_HASH) {
   561				memset(skb->cb, 0, sizeof(*cb) - sizeof(struct qdisc_skb_cb));
   562				bpf_prog_run_clear_cb(prog->prog, skb);
   563	
 > 564				ext = skb_ext_add(skb, SKB_EXT_TUN_VNET_HASH);
   565				if (ext) {
   566					ext->value = cb->hash_value;
   567					ext->report = cb->hash_report;
   568				}
   569	
   570				queue = cb->rss_queue;
   571			} else {
   572				queue = bpf_prog_run_clear_cb(prog->prog, skb);
   573			}
   574		}
   575	
   576		return queue % numqueues;
   577	}
   578	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
