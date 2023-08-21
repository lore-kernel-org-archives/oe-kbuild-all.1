Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [213.95.27.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B424A3B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Aug 2023 11:46:50 +0000 (UTC)
Received: from [78.30.34.192] (port=46156 helo=gnumonks.org)
	by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <pablo@gnumonks.org>)
	id 1qY3Mk-00DVUG-TZ; Mon, 21 Aug 2023 13:46:42 +0200
Date: Mon, 21 Aug 2023 13:46:37 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH nf] netfilter: nf_tables: GC transaction race with abort
 path
Message-ID: <ZONOnd6e5feLmbTF@calendula>
References: <20230817231352.8412-1-pablo@netfilter.org>
 <202308211920.N6b62UHQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202308211920.N6b62UHQ-lkp@intel.com>
X-Spam-Score: -1.9 (-)

Hi,

On Mon, Aug 21, 2023 at 07:28:13PM +0800, kernel test robot wrote:
> Hi Pablo,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on nf/master]

nf.git tree has no master branch, but it has a main branch.

https://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf.git/log/?h=main

This report does not say what tree is beind used but it still looks
like this is the wrong tree.

> url:    https://github.com/intel-lab-lkp/linux/commits/Pablo-Neira-Ayuso/netfilter-nf_tables-GC-transaction-race-with-abort-path/20230818-071545
> base:    master
> patch link:    https://lore.kernel.org/r/20230817231352.8412-1-pablo%40netfilter.org
> patch subject: [PATCH nf] netfilter: nf_tables: GC transaction race with abort path
> config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20230821/202308211920.N6b62UHQ-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20230821/202308211920.N6b62UHQ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308211920.N6b62UHQ-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    net/netfilter/nf_tables_api.c: In function 'nf_tables_abort':
> >> net/netfilter/nf_tables_api.c:9132:18: error: implicit declaration of function 'nft_gc_seq_begin' [-Werror=implicit-function-declaration]
>     9132 |         gc_seq = nft_gc_seq_begin(nft_net);
>          |                  ^~~~~~~~~~~~~~~~
> >> net/netfilter/nf_tables_api.c:9134:9: error: implicit declaration of function 'nft_gc_seq_end'; did you mean 'nft_get_set_elem'? [-Werror=implicit-function-declaration]
>     9134 |         nft_gc_seq_end(nft_net, gc_seq);
>          |         ^~~~~~~~~~~~~~
>          |         nft_get_set_elem
>    cc1: some warnings being treated as errors
> 
> 
> vim +/nft_gc_seq_begin +9132 net/netfilter/nf_tables_api.c
> 
>   9124	
>   9125	static int nf_tables_abort(struct net *net, struct sk_buff *skb,
>   9126				   enum nfnl_abort_action action)
>   9127	{
>   9128		struct nftables_pernet *nft_net = nft_pernet(net);
>   9129		unsigned int gc_seq;
>   9130		int ret;
>   9131	
> > 9132		gc_seq = nft_gc_seq_begin(nft_net);
>   9133		ret = __nf_tables_abort(net, action);
> > 9134		nft_gc_seq_end(nft_net, gc_seq);
>   9135		mutex_unlock(&nft_net->commit_mutex);
>   9136	
>   9137		return ret;
>   9138	}
>   9139	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
