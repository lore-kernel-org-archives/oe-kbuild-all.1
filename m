Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC8712E48
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 03:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725939956; cv=none; b=f+02+HsbNAyUAw2qIuTowv/gIG7u9bIhZUiEcg1VYqsvEdtze03dEdNPqRqf4XfycIe60lwCDyolC3DfT4D0I2ZuOQrjSChHVy3A0OQxA5LL2qediXcMhWjDHhobI0t87MLIQ9EtPCbCR6yqrwRhEqaFuV8oUC8wGDUUDlz/1wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725939956; c=relaxed/simple;
	bh=vz/S0Q7XXfSGYvPZa2EaRjYTpSRnpIfEJUSRTN8pns4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=B4QBfGmupWAjH9PYTLmPDB2Nr3lzQKOhI4kyzE0teAx4wX5NRgNYdXxq/7Ht1xbWVXoi/+oi2pixqFar+qjuN7e7+6my0NS4sHYSK1kHfS3QjzMN6+5JO3TkoiwBhVngizUiXH644FikT+dWUyW4WgPMGuCBeP4103ykRciAuv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=PItysR/0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="PItysR/0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98E08C4CEC3;
	Tue, 10 Sep 2024 03:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1725939955;
	bh=vz/S0Q7XXfSGYvPZa2EaRjYTpSRnpIfEJUSRTN8pns4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PItysR/01as958OGKY6zTbnsFo62+D96SI/DKKVApaZ3fUkxGQiYX6bsM7dvArhcd
	 /Scac+OJ+xkqtGW7qy3YvwkNg2cUCF6fDqmuU2b0YE0XyF++vo1v+QDCirwVV18iqF
	 R/Nyu5JoP9tgO42EqoVPTUa5KHqTMv5beEprD46A=
Date: Mon, 9 Sep 2024 20:45:55 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>, Huang Ying <ying.huang@intel.com>
Subject: Re: [linux-next:master 10352/10516] include/linux/mm.h:101:35:
 error: 'MAX_PHYSMEM_BITS' undeclared
Message-Id: <20240909204555.ab57c729531c83a0685cfa8e@linux-foundation.org>
In-Reply-To: <202409100913.RxkfrKU6-lkp@intel.com>
References: <202409100913.RxkfrKU6-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 10 Sep 2024 09:33:48 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   100cc857359b5d731407d1038f7e76cd0e871d94
> commit: 5f445800cbdfc4b4185d496a43dfd78df63d2265 [10352/10516] Merge branch 'mm-everything' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240910/202409100913.RxkfrKU6-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 14.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409100913.RxkfrKU6-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202409100913.RxkfrKU6-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from include/linux/ioport.h:15,
>                     from kernel/resource.c:15:
>    kernel/resource.c: In function 'gfr_start':
> >> include/linux/mm.h:101:35: error: 'MAX_PHYSMEM_BITS' undeclared (first use in this function)
>      101 | # define PHYSMEM_END    ((1ULL << MAX_PHYSMEM_BITS) - 1)
>          |                                   ^~~~~~~~~~~~~~~~
>    include/linux/minmax.h:93:38: note: in definition of macro '__cmp_once_unique'
>       93 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
>          |                                      ^

Thanks. "resource, kunit: add test case for region_intersects" is the culprit.

