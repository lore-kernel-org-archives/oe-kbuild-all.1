Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDF48F76
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Sep 2023 07:51:43 +0000 (UTC)
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1qmUlB-00038V-Cm; Sat, 30 Sep 2023 09:51:33 +0200
Date: Sat, 30 Sep 2023 09:51:33 +0200
From: Florian Westphal <fw@strlen.de>
To: kernel test robot <lkp@intel.com>
Cc: Florian Westphal <fw@strlen.de>, netdev@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev, steffen.klassert@secunet.com,
	herbert@gondor.apana.org.au,
	kernel test robot <oliver.sang@intel.com>
Subject: Re: [PATCH ipsec-next v2 1/3] xfrm: pass struct net to
 xfrm_decode_session wrappers
Message-ID: <20230930075133.GA23327@breakpoint.cc>
References: <20230929125848.5445-2-fw@strlen.de>
 <202309300634.DBomJJ9W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202309300634.DBomJJ9W-lkp@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

kernel test robot <lkp@intel.com> wrote:
> Hi Florian,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on klassert-ipsec-next/master]
> [also build test WARNING on klassert-ipsec/master netfilter-nf/main linus/master v6.6-rc3 next-20230929]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Florian-Westphal/xfrm-pass-struct-net-to-xfrm_decode_session-wrappers/20230929-210047
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/klassert/ipsec-next.git master
> patch link:    https://lore.kernel.org/r/20230929125848.5445-2-fw%40strlen.de
> patch subject: [PATCH ipsec-next v2 1/3] xfrm: pass struct net to xfrm_decode_session wrappers
> config: microblaze-defconfig (https://download.01.org/0day-ci/archive/20230930/202309300634.DBomJJ9W-lkp@intel.com/config)
> compiler: microblaze-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230930/202309300634.DBomJJ9W-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202309300634.DBomJJ9W-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    net/ipv4/icmp.c: In function 'icmp_route_lookup':
>    net/ipv4/icmp.c:520:43: error: passing argument 1 of 'xfrm_decode_session_reverse' from incompatible pointer type [-Werror=incompatible-pointer-types]
>      520 |         err = xfrm_decode_session_reverse(net, skb_in, flowi4_to_flowi(&fl4_dec), AF_INET);
>          |                                           ^~~

I forgot to adjust the CONFIG_XFRM=n stub function, will ifx this up in v3.
