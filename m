Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09313D984
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Sep 2025 05:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757482575; cv=none; b=V72Zh33T+GkmRcDg3RvZ0VNqG6uSQfg0w5pCbewsKjVOLkBqujZoAejahycV4O8i6qCo7WeO9tSYXh+GVvYfcw/OM7/PM2dyPM39AIrxvdukoK5B98af6VLl4XRk7rm61i9zv9CKOYeb9xc5nYQ+6IDbtHhxaa1mLKw6K4l1SNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757482575; c=relaxed/simple;
	bh=5/tGb29AoTR19zttNulm62dEg7qbxGYqbvexI4uRPYM=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=tuYUSetPZJRpfZ79MgPJzUTlDIdf3/TJxyWO2BdQ4zujjZpIyQWkCaIV1JWPLn4JjSkbaP0COMusVuf8LZ8KN87SWa1xwfg2vW+yMibsRRLbMaz5fUy+asIbGV5Ns2SI0IJgkX//qhvC+i0N/I2rplpiiV/G8ghbKIKMh8FV7iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=sOrIUiin; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="sOrIUiin"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDE7EC4CEF0;
	Wed, 10 Sep 2025 05:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1757482574;
	bh=5/tGb29AoTR19zttNulm62dEg7qbxGYqbvexI4uRPYM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sOrIUiing2YlYWY68MMv0n3bmumkyxurFIw2yqzdtXtypibY5ofZ0VMBH0DTAClr5
	 /efTlONBPnLPOU1Juby7jAF2YSud/YuiCdT0NHwlzFHFaar/OVsTj27V09K3nZksPH
	 UCYSgNY2UzWJhLsuNKVGthXPiRLq5F0KhgbVM1u8=
Date: Tue, 9 Sep 2025 22:36:13 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Kairui Song <kasong@tencent.com>, oe-kbuild-all@lists.linux.dev, Linux
 Memory Management List <linux-mm@kvack.org>, Chris Li <chrisl@kernel.org>
Subject: Re: [akpm-mm:mm-new 359/411] mm/swap.h:455:24: error: implicit
 declaration of function 'swp_offset'; did you mean 'bh_offset'?
Message-Id: <20250909223613.6427ab904277aabbdbe1454a@linux-foundation.org>
In-Reply-To: <202509100956.7q0VPOo2-lkp@intel.com>
References: <202509100956.7q0VPOo2-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 10 Sep 2025 09:28:50 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
> head:   f4e8f46973fe0c0f579944a37e96ba9efbe00cca
> commit: aabe1e0289084317ef7603c14132758fad3a975e [359/411] mm, swap: use the swap table for the swap cache and switch API
> config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20250910/202509100956.7q0VPOo2-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250910/202509100956.7q0VPOo2-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509100956.7q0VPOo2-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from mm/filemap.c:65:
>    mm/swap.h: In function 'folio_index':
> >> mm/swap.h:455:24: error: implicit declaration of function 'swp_offset'; did you mean 'bh_offset'? [-Wimplicit-function-declaration]
>      455 |                 return swp_offset(folio->swap);
>          |                        ^~~~~~~~~~
>          |                        bh_offset

Thanks.  I'll do this:

--- a/mm/swap.h~mm-swap-use-the-swap-table-for-the-swap-cache-and-switch-api-fix
+++ a/mm/swap.h
@@ -451,8 +451,10 @@ static inline int non_swapcache_batch(sw
  */
 static inline pgoff_t folio_index(struct folio *folio)
 {
+#ifdef CONFIG_MMU
 	if (unlikely(folio_test_swapcache(folio)))
 		return swp_offset(folio->swap);
+#endif
 	return folio->index;
 }
 
_

