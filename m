Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E774922EED
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jun 2024 19:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718911074; cv=none; b=cwnhwz7gM2hG8vsFzY9lEdoZhIbwe6koLYemg0ZlnXpLSNOtlEoLjEz/KMudwIW1z151sithG33SKl9ew6htUDO9Msos3yHI56/uyiygkFhXEpqV10yAaQVf4Q0GHBAjbsAwCeIMBIlxcTWXbqBN7QTSp7E9GqxBat8sKHpH4g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718911074; c=relaxed/simple;
	bh=fjIKQBZ8aS574U980p1psHIQnmOidZjhtzKkLeN6lsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hp+wFO4TbBkzvJtemkkkuP5OrZJRgWH6qkJOpM24iGw+/t5ejd1aC7LTD2fvv0h//QAeO8m72JpweHQ7ymQgFEOiUR2UuHk1MJ8ZA9VlxGLHQG5dpQqbWc0hUQuK0uUcY+BP1JYS1kWzv7TsxjYkJsKaQ5NkmNbZLBbE6uGm+OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZCe/4yrI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZCe/4yrI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 696E1C2BD10;
	Thu, 20 Jun 2024 19:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718911073;
	bh=fjIKQBZ8aS574U980p1psHIQnmOidZjhtzKkLeN6lsU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZCe/4yrI2e/WItKv2hviNSg2i7gX0ehFVvslZUhThMWsbPlUs4u+4PLM1Zap86xKb
	 6XNd6MDwD9qzb2DVQzX+VV24PesCIra1LMvxWsHFzR4c20GzTDR4VsJKvi5PVUMeUi
	 o4FGAs+Q12mUHPGln9n4X4nNmsJVEulvnECmMt3PUNaeyQovdKaTsvZ7d1uQ4C8sgx
	 WgmazKll9Sp/1jDx+vRYeQNTRjKMXsIYszOH//LwRIi2PtXOTDdSwsHkab5NxOouL0
	 geJX1zOzcyDl6NyMyAEht0HwEy/lPzzg4VHuzkGhgDeIT8AVBBP32yeW4AYqmPpvd8
	 2d+M17ByKDl4Q==
Date: Thu, 20 Jun 2024 12:17:52 -0700
From: Kees Cook <kees@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [kees:dev/next-20240618/kmem_buckets-v5 3/6] mm/util.c:614:
 warning: Excess function parameter 'size' description in '__kvmalloc_node'
Message-ID: <202406201216.314524B29@keescook>
References: <202406201631.5E0Dfzma-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202406201631.5E0Dfzma-lkp@intel.com>

On Thu, Jun 20, 2024 at 02:17:50PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git dev/next-20240618/kmem_buckets-v5
> head:   c823e15736071e9b694fc62be0c80cbda6a4e344
> commit: c69b01349ace4e0a92fc0f019668cd696776bbce [3/6] mm/slab: Introduce kvmalloc_buckets_node() that can take kmem_buckets argument
> config: m68k-randconfig-r081-20240620 (https://download.01.org/0day-ci/archive/20240620/202406201631.5E0Dfzma-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240620/202406201631.5E0Dfzma-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406201631.5E0Dfzma-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> mm/util.c:614: warning: Excess function parameter 'size' description in '__kvmalloc_node'

Ah yes, the argument macro was confusing kern-doc. I've squashed this
fix for v6:

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 95a59ac78f82..2791f8195203 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1729,6 +1729,7 @@ sub dump_function($$) {
     $prototype =~ s/__printf\s*\(\s*\d*\s*,\s*\d*\s*\) +//;
     $prototype =~ s/__(?:re)?alloc_size\s*\(\s*\d+\s*(?:,\s*\d+\s*)?\) +//;
     $prototype =~ s/__diagnose_as\s*\(\s*\S+\s*(?:,\s*\d+\s*)*\) +//;
+    $prototype =~ s/DECL_BUCKET_PARAMS\s*\(\s*(\S+)\s*,\s*(\S+)\s*\)/$1, $2/;
     my $define = $prototype =~ s/^#\s*define\s+//; #ak added
     $prototype =~ s/__attribute_const__ +//;
     $prototype =~ s/__attribute__\s*\(\(

Thanks!

-Kees

-- 
Kees Cook
