Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [213.95.27.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF2C125CC
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 10:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gnumonks.org
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [78.30.35.151] (port=36732 helo=gnumonks.org)
	by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <pablo@gnumonks.org>)
	id 1qyql9-00EApA-Ix; Fri, 03 Nov 2023 10:46:39 +0100
Date: Fri, 3 Nov 2023 10:46:34 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: kernel test robot <lkp@intel.com>
Cc: Florian Westphal <fw@strlen.de>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org
Subject: Re: net/netfilter/nft_set_rbtree.c:636:33: warning: variable
 'nft_net' set but not used
Message-ID: <ZUTBegMOO36wC4mH@calendula>
References: <202311031627.Kx0hfrUu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202311031627.Kx0hfrUu-lkp@intel.com>
X-Spam-Score: -1.9 (-)

On Fri, Nov 03, 2023 at 04:40:55PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   8f6f76a6a29f36d2f3e4510d0bde5046672f6924
> commit: 7d259f021aaa78904b6c836d975e8e00d83a182a netfilter: nft_set_rbtree: prefer sync gc to async worker
> date:   10 days ago
> config: s390-defconfig (https://download.01.org/0day-ci/archive/20231103/202311031627.Kx0hfrUu-lkp@intel.com/config)
> compiler: s390-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311031627.Kx0hfrUu-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202311031627.Kx0hfrUu-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    net/netfilter/nft_set_rbtree.c: In function 'nft_rbtree_gc':
> >> net/netfilter/nft_set_rbtree.c:636:33: warning: variable 'nft_net' set but not used [-Wunused-but-set-variable]
>      636 |         struct nftables_pernet *nft_net;
>          |                                 ^~~~~~~

Fix is here.

It is missing Fixes: tag though.

https://patchwork.ozlabs.org/project/netfilter-devel/patch/20231101013351.55902-1-yang.lee@linux.alibaba.com/
