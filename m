Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0247A1D54D8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Sep 2025 21:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758315861; cv=none; b=b5zFibvEl/tuuE896A2PwzyuxcRFzIwmog9sHdl3Q5d7Z9gj/ZnMdS5qOGdxR/Nf2q/lqzbaZBGdDQa+NaEuINcwrH9a8AUdA/hq3TpaN+YnCbsIhMSAU7IBWmiX9IylomJoPFUXH1jvQrVRq+a28ruiu61GHKRojeE4jfmkWFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758315861; c=relaxed/simple;
	bh=EU8zNicQ8eJr5UVkTiOVy8XXNkvx4SqxeyVDnW7wBjs=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=JptwenJMAiewWK4vwN886J80lTnnnOchxz/2BWEZko4VF27p2G//RgNtlVpiKG5ZDHBaZIyov1f1AhhlST2stOzX2aNyO54Fx4S51Qm6VCAJaDozcPw8GButJBk+5Wam479EBPKemx1Y3nmM7m7gRuqXYnBwh8jeHHEH2zS9mRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ig+49G/2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ig+49G/2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B2CBC4CEF0;
	Fri, 19 Sep 2025 21:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1758315860;
	bh=EU8zNicQ8eJr5UVkTiOVy8XXNkvx4SqxeyVDnW7wBjs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ig+49G/2yD2qUw19e4LfDCEoMIfKV9Ihzm3yO4WEMdWU9WuivIGAAXNKY9mLRW2b1
	 SxeW+GV4unTN6WxFWVXvzGnETQBqjbxrcuT5nTq0zHYYGTAHDROHMk6SsHpc7E1epB
	 W6GojnyZ0vlmbilrYbJoUlWKMmSWKKUvp5ddLL1o=
Date: Fri, 19 Sep 2025 14:04:19 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>, Mike Rapoport (Microsoft) <rppt@kernel.org>, Pratyush
 Yadav <pratyush@kernel.org>
Subject: Re: [akpm-mm:mm-everything 254/254] kernel/kexec_handover.c:970:50:
 error: passing argument 1 of 'kho_restore_page' makes integer from pointer
 without a cast
Message-Id: <20250919140419.211ec45cae8a479d1e347453@linux-foundation.org>
In-Reply-To: <202509191034.SM82Oaij-lkp@intel.com>
References: <202509191034.SM82Oaij-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 19 Sep 2025 10:37:27 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> head:   46735c0743fed990d0ed8722a131ef54006c45a3
> commit: 5369505b204b3fc65f839f7558640b6ecd675461 [254/254] foo
> config: x86_64-randconfig-071-20250919 (https://download.01.org/0day-ci/archive/20250919/202509191034.SM82Oaij-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250919/202509191034.SM82Oaij-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509191034.SM82Oaij-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    kernel/kexec_handover.c: In function 'kho_restore_vmalloc':
> >> kernel/kexec_handover.c:970:50: error: passing argument 1 of 'kho_restore_page' makes integer from pointer without a cast [-Wint-conversion]
>      970 |                                 kho_restore_page(page, 0);
>          |                                                  ^~~~
>          |                                                  |
>          |                                                  struct page *
>    kernel/kexec_handover.c:229:50: note: expected 'phys_addr_t' {aka 'long long unsigned int'} but argument is of type 'struct page *'

Added by "kho: add support for preserving vmalloc allocations".

I wonder how this happened - was the correct version sent out?

How about this?

--- a/kernel/kexec_handover.c~kho-add-support-for-preserving-vmalloc-allocations-fix
+++ a/kernel/kexec_handover.c
@@ -967,7 +967,7 @@ void *kho_restore_vmalloc(const struct k
 
 			for (int j = 0; j < (1 << order); j++) {
 				page = phys_to_page(phys);
-				kho_restore_page(page, 0);
+				kho_restore_page(phys);
 				pages[idx++] = page;
 				phys += PAGE_SIZE;
 			}
@@ -975,7 +975,7 @@ void *kho_restore_vmalloc(const struct k
 
 		page = virt_to_page(chunk);
 		chunk = KHOSER_LOAD_PTR(chunk->hdr.next);
-		kho_restore_page(page, 0);
+		kho_restore_page(page_to_phys(page));
 		__free_page(page);
 	}
 
_

