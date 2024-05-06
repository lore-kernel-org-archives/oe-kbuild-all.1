Received: from mail.netfilter.org (mail.netfilter.org [217.70.188.207])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 161032AF1B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 May 2024 09:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.188.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714987200; cv=none; b=VgDm8Acc21TSqLfQdTprs75j5phZXRcxS38XZnE4R+yvxRvXtsCy/U0H9TRimPl8RcLgDLzSHBShWFEvSnM2NkSENkf8XJOA6gZDuoG2pXyBtbCAl4pcK9ncuQb6letk1GiWqWrv0PNjFDVfL0UTfbq10vVkS7TmgXrvitUU4N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714987200; c=relaxed/simple;
	bh=5N9v9tPbYlj/zVVAhwt849ws8ifN3N5iUrM/ZDxK9SM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=huz2fSJqpND+XmyEyfFfIFEZyveifjQY8a4WuSxvK8iNRTp1/olvYUuq4Fad5zoTyAR2XY4OsodpeWhE7VuvKHYJCXauNUDczBjdGUWZJV+u6bTnkv+AH5ilbOWsMpJd8wgkCirlDi6El2SvF8O0YPnJM2R2V5eKcLkigYF38SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; arc=none smtp.client-ip=217.70.188.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Date: Mon, 6 May 2024 11:10:44 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Florian Westphal <fw@strlen.de>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
	Stefano Brivio <sbrivio@redhat.com>
Subject: Re: [netfilter-nf:under-review 14/18]
 net/netfilter/nft_set_pipapo.c:2122: warning: expecting prototype for
 __nft_pipapo_walk(). Prototype was for nft_pipapo_do_walk() instead
Message-ID: <ZjielNW_OUxZuj3V@calendula>
References: <202405031522.nDHvTzEz-lkp@intel.com>
 <20240503104143.GA9734@breakpoint.cc>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240503104143.GA9734@breakpoint.cc>

On Fri, May 03, 2024 at 12:41:43PM +0200, Florian Westphal wrote:
> kernel test robot <lkp@intel.com> wrote:
> > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf.git under-review
> > head:   7ab960ad3bd958ddbeabe9ab2287ac5d0a673f23
> > commit: cd491237776df450e99904b9408bfad35366a73f [14/18] netfilter: nft_set_pipapo: prepare walk function for on-demand clone
> > config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240503/202405031522.nDHvTzEz-lkp@intel.com/config)
> > compiler: sh4-linux-gcc (GCC) 13.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240503/202405031522.nDHvTzEz-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202405031522.nDHvTzEz-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> > >> net/netfilter/nft_set_pipapo.c:2122: warning: expecting prototype for __nft_pipapo_walk(). Prototype was for nft_pipapo_do_walk() instead
> 
> Sigh.  Pablo, can you squash this to
> "netfilter: nft_set_pipapo: prepare walk function for on-demand clone"?

Done!

> diff --git a/net/netfilter/nft_set_pipapo.c b/net/netfilter/nft_set_pipapo.c
> index be5c554ca4d3..1a1dcb646af5 100644
> --- a/net/netfilter/nft_set_pipapo.c
> +++ b/net/netfilter/nft_set_pipapo.c
> @@ -2100,7 +2100,7 @@ static void nft_pipapo_remove(const struct net *net, const struct nft_set *set,
>  }
>  
>  /**
> - * __nft_pipapo_walk() - Walk over elements in m
> + * nft_pipapo_do_walk() - Walk over elements in m
>   * @ctx:       nftables API context
>   * @set:       nftables API set representation
>   * @m:         matching data pointing to key mapping array
> 
