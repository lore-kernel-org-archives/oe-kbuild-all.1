Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5CCA3D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Aug 2023 02:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=F7RzwaKG6buu9OiZR8ZrGhtiHVRDJiWkbb9OMJVWSKc=; b=IEUM+Lv/E9htRb58ZrTC/MyWyK
	CLPEzysFvKihV5lRe+eRFG50Lfi+czsiBsJHmUEb7mkmJs5h4BdWs0VnjQMrwHKHuaWKy+4cS6Kq5
	hVVY7DzZ/bBnGxJi++Kt9Fc8lFJn7R+IPDDmU/7ig0oBnGqfXRmbeHC+bgJ4MkblJxFBTjLPlz1FG
	uKQ/U4KtgjZKbryXjav8Hv3PL1jQ48wiPU7bjW95gFGM7nUjzBwYWCg89DfyFlLvK7cdbjep4yF3a
	6LOFj6fDUC0aIYyCYXPBTfwpuooujPanfM80+e0JLTeE/Aw0gFgp7qmdrunX3kqO4Kl3b6a9vuZlB
	6hZIVveA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qR22t-00CUtF-P8; Wed, 02 Aug 2023 02:57:07 +0000
Date: Wed, 2 Aug 2023 03:57:07 +0100
From: Matthew Wilcox <willy@infradead.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [willy-pagecache:set_ptes 17/38]
 include/linux/compiler_types.h:397:45: error: call to
 '__compiletime_assert_324' declared with attribute error: BUILD_BUG_ON
 failed: IS_ENABLED(CONFIG_32BIT) && (PFN_PTE_SHIFT > PAGE_SHIFT)
Message-ID: <ZMnGA5eSK0IAd+nY@casper.infradead.org>
References: <202308020639.6w2tXRgF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202308020639.6w2tXRgF-lkp@intel.com>

On Wed, Aug 02, 2023 at 06:19:45AM +0800, kernel test robot wrote:
> tree:   git://git.infradead.org/users/willy/pagecache set_ptes
> head:   9729c95a6d57a4f9d63c098dcfc27f1f1a5e8e03
> commit: 054d8702c85880f10feb56c20afdac75f103c075 [17/38] mips: Implement the new page table range API
> config: mips-randconfig-r011-20230801 (https://download.01.org/0day-ci/archive/20230802/202308020639.6w2tXRgF-lkp@intel.com/config)
> compiler: mips-linux-gcc (GCC) 12.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20230802/202308020639.6w2tXRgF-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308020639.6w2tXRgF-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    arch/mips/mm/init.c:60:6: warning: no previous prototype for 'setup_zero_pages' [-Wmissing-prototypes]
>       60 | void setup_zero_pages(void)
>          |      ^~~~~~~~~~~~~~~~
>    In file included from <command-line>:
>    arch/mips/mm/init.c: In function 'mem_init':
> >> include/linux/compiler_types.h:397:45: error: call to '__compiletime_assert_324' declared with attribute error: BUILD_BUG_ON failed: IS_ENABLED(CONFIG_32BIT) && (PFN_PTE_SHIFT > PAGE_SHIFT)

I don't think this is a new problem; it's just changed spelling.

-       BUILD_BUG_ON(IS_ENABLED(CONFIG_32BIT) && (_PFN_SHIFT > PAGE_SHIFT));
+       BUILD_BUG_ON(IS_ENABLED(CONFIG_32BIT) && (PFN_PTE_SHIFT > PAGE_SHIFT));

so I don't intend to fix this.
