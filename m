Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6622524C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Aug 2023 11:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692617323; x=1724153323;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0FUhx0uTZZns4Qt1FA3BbJTrGhdUEKp609H5TysmZek=;
  b=hhcN++n7+x2P5pDEibLTtGpeJbn/Cggu1Flki8tIckiK6iEfboEPfoiX
   AxZT9/92RBncZ2/65fJMbExlRO+PO5xi24UEIJ7zCpxm/NnyxEbh1xfBf
   5N8CjiGOE395XBHJNvSKJa/evQxongFsQ61ogLZjvNsGu9dZuyzeoJURd
   R+r+YU6U1044iBvGujKLd8/SiZ64kw5SDxgV7Xl666MKBnwWGzUEKB/vC
   LafAmqJKZ3K6coVE66znGbaT1xvBHSK4z4KKn3uVXxLo+RMaK2rt3HtsH
   ydyOMjb3DSGOtPjwCmMjaDxzNA1ficmcp7TuJo62/KDmgh1SQanVl6B0T
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="363724170"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="363724170"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 04:28:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="738865889"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="738865889"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 21 Aug 2023 04:28:41 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qY35N-0000Rg-0U;
	Mon, 21 Aug 2023 11:28:41 +0000
Date: Mon, 21 Aug 2023 19:28:13 +0800
From: kernel test robot <lkp@intel.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH nf] netfilter: nf_tables: GC transaction race with abort
 path
Message-ID: <202308211920.N6b62UHQ-lkp@intel.com>
References: <20230817231352.8412-1-pablo@netfilter.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230817231352.8412-1-pablo@netfilter.org>

Hi Pablo,

kernel test robot noticed the following build errors:

[auto build test ERROR on nf/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Pablo-Neira-Ayuso/netfilter-nf_tables-GC-transaction-race-with-abort-path/20230818-071545
base:    master
patch link:    https://lore.kernel.org/r/20230817231352.8412-1-pablo%40netfilter.org
patch subject: [PATCH nf] netfilter: nf_tables: GC transaction race with abort path
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20230821/202308211920.N6b62UHQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230821/202308211920.N6b62UHQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308211920.N6b62UHQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/netfilter/nf_tables_api.c: In function 'nf_tables_abort':
>> net/netfilter/nf_tables_api.c:9132:18: error: implicit declaration of function 'nft_gc_seq_begin' [-Werror=implicit-function-declaration]
    9132 |         gc_seq = nft_gc_seq_begin(nft_net);
         |                  ^~~~~~~~~~~~~~~~
>> net/netfilter/nf_tables_api.c:9134:9: error: implicit declaration of function 'nft_gc_seq_end'; did you mean 'nft_get_set_elem'? [-Werror=implicit-function-declaration]
    9134 |         nft_gc_seq_end(nft_net, gc_seq);
         |         ^~~~~~~~~~~~~~
         |         nft_get_set_elem
   cc1: some warnings being treated as errors


vim +/nft_gc_seq_begin +9132 net/netfilter/nf_tables_api.c

  9124	
  9125	static int nf_tables_abort(struct net *net, struct sk_buff *skb,
  9126				   enum nfnl_abort_action action)
  9127	{
  9128		struct nftables_pernet *nft_net = nft_pernet(net);
  9129		unsigned int gc_seq;
  9130		int ret;
  9131	
> 9132		gc_seq = nft_gc_seq_begin(nft_net);
  9133		ret = __nf_tables_abort(net, action);
> 9134		nft_gc_seq_end(nft_net, gc_seq);
  9135		mutex_unlock(&nft_net->commit_mutex);
  9136	
  9137		return ret;
  9138	}
  9139	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
