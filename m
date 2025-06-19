Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35E230E83B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jun 2025 22:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750373382; cv=none; b=aNMFd/Z7+ltqYzGx9+3fUdKouGOIxWHFmKEGinFqD6uxk1otWzgwvSBPhLhT1vK+aG0S1BgUoqkdWTwXT9c4x7A/xWJpDpkL6fZXu00AHw5aYqgEubmNMYMiaFmQG3GZQYRLK43Xln5jGXf/doe/gLV3c4Xq5j41KOpLlE40/bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750373382; c=relaxed/simple;
	bh=dyfYqiLC870NTbX+V5uXpeSb1PjrJtBeRbsYyigGTXU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=DhU68Hf40cZEex2J2lM+NQxUTPTtzpQ2j6ncSUamwFLZRFM2O3vv76lYJ5gZCiTjeDvFUjZCXWjC9ivZF6dbThl1Z6pC3bxKxwKES3Q+j6oueWU2ewOCaFznUScjOlxufhY8kRSXnokkXKuI0LqibsUx8mJCBXsBL1eNzVP4PBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=VcxJXrWw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="VcxJXrWw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24181C4CEEA;
	Thu, 19 Jun 2025 22:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1750373382;
	bh=dyfYqiLC870NTbX+V5uXpeSb1PjrJtBeRbsYyigGTXU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VcxJXrWwqzC3H+qm5Ap5WZzu7LKlFV4hRwu7HmIgoGULuxK2fxgc7p4aN9PfHo9tD
	 xj8obrrJyACnbzRRNVARcP+ABw07K99gb2zcuTkW1F8+nLVqAARbjWKCbM6vHeI9wV
	 zRdueqKOXZCItetlemWlK8w0Uk0LPsc7lFyWCCJg=
Date: Thu, 19 Jun 2025 15:49:41 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Alistair Popple <apopple@nvidia.com>, oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>, =?ISO-8859-1?Q?Bj=F6rn?=
 =?ISO-8859-1?Q?_T=F6pel?= <bjorn@rivosinc.com>, Jason Gunthorpe
 <jgg@nvidia.com>
Subject: Re: [akpm-mm:mm-new 158/177]
 arch/riscv/include/asm/pgtable.h:934:24: error: implicit declaration of
 function 'pte_mkdevmap'; did you mean 'pud_mkdevmap'?
Message-Id: <20250619154941.5c8a626fe08e33d723dad740@linux-foundation.org>
In-Reply-To: <202506191536.2hMhapuP-lkp@intel.com>
References: <202506191536.2hMhapuP-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 19 Jun 2025 16:03:23 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
> head:   98743cca1551b038cdec987961c609f2fb0beb83
> commit: 8aed601c58980f1f7cd45d5373e739f87d22d028 [158/177] mm: remove devmap related functions and page table bits
> config: riscv-randconfig-r132-20250619 (https://download.01.org/0day-ci/archive/20250619/202506191536.2hMhapuP-lkp@intel.com/config)
> compiler: riscv64-linux-gcc (GCC) 15.1.0
> reproduce: (https://download.01.org/0day-ci/archive/20250619/202506191536.2hMhapuP-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506191536.2hMhapuP-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from include/linux/pgtable.h:6,
>                     from include/linux/mm.h:31,
>                     from arch/riscv/kernel/asm-offsets.c:8:
>    arch/riscv/include/asm/pgtable.h: In function 'pud_mkdevmap':
> >> arch/riscv/include/asm/pgtable.h:934:24: error: implicit declaration of function 'pte_mkdevmap'; did you mean 'pud_mkdevmap'? [-Wimplicit-function-declaration]
>      934 |         return pte_pud(pte_mkdevmap(pud_pte(pud)));
>          |                        ^~~~~~~~~~~~
>          |                        pud_mkdevmap

Thanks.  This series is looking a little battle scarred, so I'll drop
this version.

TODOs which I have accumulated are:

https://lkml.kernel.org/r/bf855ce0-d0ba-4bd6-bfc1-8be2fdbdfe70@redhat.com
https://lkml.kernel.org/r/6afc2e67-3ecb-41a5-9c8f-00ecd64f035a@redhat.com
https://lkml.kernel.org/r/5vxfjvgl5qu6n5qzru62mmk6saudeslt5f6fu4luhuezf6lh2p@dhz65hzro27h
https://lkml.kernel.org/r/31bdbfcf-bbfa-46b7-a427-806d42d88cec@redhat.com

