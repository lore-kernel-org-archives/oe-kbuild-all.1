Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5617C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jun 2023 05:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686893711; x=1718429711;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TyK8+H9dqUpQcAHCN+ORuMih7pzixCzRslZeLeUaT4Y=;
  b=dqVgVHeeP4TdPrvwo7Ja5aQDBT0618a1gHrCuM0b/ObkoJ0mU2Pz5OSR
   K3VeMQ+/9I+WER1+em4lOpls64+/KjTy7mhfQ+bV/4RjGVBlOly37TfH/
   i1+uPCnrA+ItBe8hUUpQROecs/ZDFQTgHCH0WjZ22Ii4I/e5l/bAqUlYQ
   JyCSYPXL4E8OENikrD6Lk2hXuUUxmbf9XfI0+f+v4GKedIE+N7zk6vIJi
   VfmVp1V8+BYkFXI87JMFUDNuz0RLKEBt93nOlCgdKQZO92m3J8C+W5zhm
   cgfX5QS4A3jk8Urf7XcW1tyNKtp9xUGTjofPW9T/1t9qPeOHyJgopEjOG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="338738393"
X-IronPort-AV: E=Sophos;i="6.00,246,1681196400"; 
   d="scan'208";a="338738393"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 22:35:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="959483137"
X-IronPort-AV: E=Sophos;i="6.00,246,1681196400"; 
   d="scan'208";a="959483137"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 15 Jun 2023 22:35:09 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qA272-0000qO-2n;
	Fri, 16 Jun 2023 05:35:08 +0000
Date: Fri, 16 Jun 2023 13:34:36 +0800
From: kernel test robot <lkp@intel.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [netfilter-nf:testing 12/15] net/netfilter/nft_set_pipapo.c:1986:21:
 sparse: sparse: incompatible types in comparison expression (different
 address spaces):
Message-ID: <202306161328.wvAdanEy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf.git testing
head:   d175f9c98df2af0aea1077c8a55091d9a49c94d0
commit: 975680a5c24db55f73ba3aeea34f1caa733a768f [12/15] netfilter: nft_set_pipapo: .walk does not deal with generations
config: xtensa-randconfig-s032-20230615 (https://download.01.org/0day-ci/archive/20230616/202306161328.wvAdanEy-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.3.0
reproduce:
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf.git/commit/?id=975680a5c24db55f73ba3aeea34f1caa733a768f
        git remote add netfilter-nf git://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf.git
        git fetch --no-tags netfilter-nf testing
        git checkout 975680a5c24db55f73ba3aeea34f1caa733a768f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=xtensa olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=xtensa SHELL=/bin/bash net/netfilter/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306161328.wvAdanEy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/netfilter/nft_set_pipapo.c: note: in included file (through arch/xtensa/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/xtensa/include/asm/processor.h:103:2: sparse: sparse: Unsupported xtensa ABI
   arch/xtensa/include/asm/processor.h:133:2: sparse: sparse: Unsupported Xtensa ABI
>> net/netfilter/nft_set_pipapo.c:1986:21: sparse: sparse: incompatible types in comparison expression (different address spaces):
>> net/netfilter/nft_set_pipapo.c:1986:21: sparse:    struct nft_pipapo_match [noderef] __rcu *
>> net/netfilter/nft_set_pipapo.c:1986:21: sparse:    struct nft_pipapo_match *

vim +1986 net/netfilter/nft_set_pipapo.c

  1962	
  1963	/**
  1964	 * nft_pipapo_walk() - Walk over elements
  1965	 * @ctx:	nftables API context
  1966	 * @set:	nftables API set representation
  1967	 * @iter:	Iterator
  1968	 *
  1969	 * As elements are referenced in the mapping array for the last field, directly
  1970	 * scan that array: there's no need to follow rule mappings from the first
  1971	 * field.
  1972	 */
  1973	static void nft_pipapo_walk(const struct nft_ctx *ctx, struct nft_set *set,
  1974				    struct nft_set_iter *iter)
  1975	{
  1976		struct nft_pipapo *priv = nft_set_priv(set);
  1977		struct net *net = read_pnet(&set->net);
  1978		struct nft_pipapo_match *m;
  1979		struct nft_pipapo_field *f;
  1980		int i, r;
  1981	
  1982		rcu_read_lock();
  1983		if (iter->genmask == nft_genmask_cur(net))
  1984			m = rcu_dereference(priv->match);
  1985		else
> 1986			m = rcu_dereference(priv->clone);
  1987	
  1988		if (unlikely(!m))
  1989			goto out;
  1990	
  1991		for (i = 0, f = m->f; i < m->field_count - 1; i++, f++)
  1992			;
  1993	
  1994		for (r = 0; r < f->rules; r++) {
  1995			struct nft_pipapo_elem *e;
  1996			struct nft_set_elem elem;
  1997	
  1998			if (r < f->rules - 1 && f->mt[r + 1].e == f->mt[r].e)
  1999				continue;
  2000	
  2001			if (iter->count < iter->skip)
  2002				goto cont;
  2003	
  2004			e = f->mt[r].e;
  2005			if (nft_set_elem_expired(&e->ext))
  2006				goto cont;
  2007	
  2008			elem.priv = e;
  2009	
  2010			iter->err = iter->fn(ctx, set, iter, &elem);
  2011			if (iter->err < 0)
  2012				goto out;
  2013	
  2014	cont:
  2015			iter->count++;
  2016		}
  2017	
  2018	out:
  2019		rcu_read_unlock();
  2020	}
  2021	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
