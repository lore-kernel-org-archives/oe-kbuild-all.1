Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4412D9492
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Mar 2026 14:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773672308; cv=none; b=eaAZMojs79JvnEgL0Wo3EP4sePh1cEKJlBV94s2VGjv7aa4X/FdkrrsfK6sx84rRKf2hl+NgV3HC1h2ZYq5wRRlBTegl8iVEYvDsaZ/bWjKbvCiWpQ4Scvr8r5lWBn0ltRKSTwdFo8KjEfnZmvNCvEEWhGnQ4bp3jheLTu7fPho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773672308; c=relaxed/simple;
	bh=On303YtFpKBMUZ4MRvTB68bR7sjIVS6WfsRTgzfhCsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cTiNaxl+QQxJ6iaVKMYp0tRknt2HTJWTxjEAmZlWsZBqFcYyqkV0i1ys11Cm1CLeppV81RLTIaerwS8pL9XOvdbj9jv9xYRxIWwlg46fSuQd+KETqiStYym3rnJ0PP2kr6oaNl91uHDxaP2LK9bYx0YZCbbY1rfVdiQwvUMtTFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m98+rPVN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m98+rPVN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0D42C19421;
	Mon, 16 Mar 2026 14:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773672307;
	bh=On303YtFpKBMUZ4MRvTB68bR7sjIVS6WfsRTgzfhCsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m98+rPVNWPyA4LsxuXpx05R0957zElnKEOCzSZ9hI+vDsIC1nRBb29YuOy0892pXl
	 tX88Qfei/mdYNhf3xUuvWSapuU++AGrnIQ32aZ10gMMhU8+VU4sXV6OzWMJUpJsAdP
	 Kz7hRQKW6tmDczIkeswb4DM3kiW0+LPnAvI/LwU5Qcj/UPw4IyZsP7Shnxp53FFuhA
	 8iufgBBsVY0x17OAQWgatGGok2a7VOjn8giT0UOU6BZBKK3Toq6luGPrRq2JYzRYtP
	 kCVfMQjAtAKU2uNxwAkRb7XzBY1fJpSMwJFqAiw5KElqwWWurLkIz1jzfsP2vU4tgv
	 v3ZeUF4lEbs4A==
Date: Mon, 16 Mar 2026 14:44:58 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	oe-kbuild-all@lists.linux.dev, Linux Memory Management List <linux-mm@kvack.org>, 
	Jonathan Corbet <corbet@lwn.net>, Clemens Ladisch <clemens@ladisch.de>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"K . Y . Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Bodo Stroesser <bostroesser@gmail.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, 
	David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	David Hildenbrand <david@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH 01/15] mm: various small mmap_prepare cleanups
Message-ID: <9242b643-da61-4891-801e-6d2092bc68c7@lucifer.local>
References: <56372fe273f775b26675a04652c1229e14680741.1773346620.git.ljs@kernel.org>
 <202603130825.eFqVjdWW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202603130825.eFqVjdWW-lkp@intel.com>

On Fri, Mar 13, 2026 at 09:00:33AM +0100, kernel test robot wrote:
> Hi Lorenzo,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on next-20260311]
> [cannot apply to akpm-mm/mm-everything char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus brauner-vfs/vfs.all linus/master v7.0-rc3 v7.0-rc2 v7.0-rc1 v6.16-rc1]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Stoakes-Oracle/mm-various-small-mmap_prepare-cleanups/20260313-113314
> base:   next-20260311
> patch link:    https://lore.kernel.org/r/56372fe273f775b26675a04652c1229e14680741.1773346620.git.ljs%40kernel.org
> patch subject: [PATCH 01/15] mm: various small mmap_prepare cleanups
> config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260313/202603130825.eFqVjdWW-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260313/202603130825.eFqVjdWW-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603130825.eFqVjdWW-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    mm/util.c: In function 'mmap_action_prepare':
> >> mm/util.c:1360:1: warning: control reaches end of non-void function [-Wreturn-type]
>     1360 | }
>          | ^

Ack yeah, seems compilers vary in how they handle this :) will fix on respin.

>
>
> vim +1360 mm/util.c
>
> ac0a3fc9c07df7 Lorenzo Stoakes          2025-10-20  1338
> ac0a3fc9c07df7 Lorenzo Stoakes          2025-10-20  1339  #ifdef CONFIG_MMU
> ac0a3fc9c07df7 Lorenzo Stoakes          2025-10-20  1340  /**
> ac0a3fc9c07df7 Lorenzo Stoakes          2025-10-20  1341   * mmap_action_prepare - Perform preparatory setup for an VMA descriptor
> ac0a3fc9c07df7 Lorenzo Stoakes          2025-10-20  1342   * action which need to be performed.
> ac0a3fc9c07df7 Lorenzo Stoakes          2025-10-20  1343   * @desc: The VMA descriptor to prepare for @action.
> ac0a3fc9c07df7 Lorenzo Stoakes          2025-10-20  1344   * @action: The action to perform.
> 732e4e2690c96d Lorenzo Stoakes (Oracle  2026-03-12  1345)  *
> 732e4e2690c96d Lorenzo Stoakes (Oracle  2026-03-12  1346)  * Returns: 0 on success, otherwise error.
> ac0a3fc9c07df7 Lorenzo Stoakes          2025-10-20  1347   */
> 732e4e2690c96d Lorenzo Stoakes (Oracle  2026-03-12  1348) int mmap_action_prepare(struct vm_area_desc *desc,
> 732e4e2690c96d Lorenzo Stoakes (Oracle  2026-03-12  1349) 			struct mmap_action *action)
> 732e4e2690c96d Lorenzo Stoakes (Oracle  2026-03-12  1350)
> ac0a3fc9c07df7 Lorenzo Stoakes          2025-10-20  1351  {
> ac0a3fc9c07df7 Lorenzo Stoakes          2025-10-20  1352  	switch (action->type) {
> ac0a3fc9c07df7 Lorenzo Stoakes          2025-10-20  1353  	case MMAP_NOTHING:
> 732e4e2690c96d Lorenzo Stoakes (Oracle  2026-03-12  1354) 		return 0;
> ac0a3fc9c07df7 Lorenzo Stoakes          2025-10-20  1355  	case MMAP_REMAP_PFN:
> 732e4e2690c96d Lorenzo Stoakes (Oracle  2026-03-12  1356) 		return remap_pfn_range_prepare(desc, action);
> ac0a3fc9c07df7 Lorenzo Stoakes          2025-10-20  1357  	case MMAP_IO_REMAP_PFN:
> 732e4e2690c96d Lorenzo Stoakes (Oracle  2026-03-12  1358) 		return io_remap_pfn_range_prepare(desc, action);
> ac0a3fc9c07df7 Lorenzo Stoakes          2025-10-20  1359  	}
> ac0a3fc9c07df7 Lorenzo Stoakes          2025-10-20 @1360  }
> ac0a3fc9c07df7 Lorenzo Stoakes          2025-10-20  1361  EXPORT_SYMBOL(mmap_action_prepare);
> ac0a3fc9c07df7 Lorenzo Stoakes          2025-10-20  1362
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
