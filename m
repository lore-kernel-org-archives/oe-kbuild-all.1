Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419451E3DCF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Nov 2024 01:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731547797; cv=none; b=MwI2LcUdIlijZ3n0BCp022hgh9Sw14T57mWIcyDLfMf1fcSOqRMSYp8gcUlRgbCG7IuOHAoB41KieXaPQthmZjL10crqRfyK27Scg0fcuwBM2yzqlZeWA/Jhc8zYE9IsaZ04ETpgt0oczFsaLvNVV1SwCdg55Swr3qiF6H9BkqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731547797; c=relaxed/simple;
	bh=WgsVOWJCyil2uWXX8XBAE1GzISBtQeGgqP5BmlubFfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fsNKfPcJiLX0esJ/tKaFfQxVETFkUM3bspxZ2IECT0VQaNTjp+NzD1lVdxXuadu09pBjvTBo/kBeGd7WsNLdRfUdATm7nHRT4Lzi2tDxg0So8aCb1rCF+VQRVQ1WpDC2qUAZzHlf2UuFgQLdyT01lOZxrPSxxvuSCFmCTRV2Qrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fjuMpYvX; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fjuMpYvX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731547796; x=1763083796;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WgsVOWJCyil2uWXX8XBAE1GzISBtQeGgqP5BmlubFfM=;
  b=fjuMpYvXSj65YSX+jzIGO52FdIggJE5ogF0SKh807RGcP81IkUa0qS07
   FdGAw3DQieD5w7ozl/KebSL/ovY3hY+GeRY0cAiUgctnsN9LX2TwXxyCN
   bMdMwyw+SynW2VihhjrEEvuWPdlR9R9zDUfCjDG2jQxkyxbd5pT+RcXpE
   We21hSb0Y++OjW1fxzAxaE7yafOaJM4yK3oEjzvfvPaRDDHiPiQho3MIk
   2L+9z3/bHjig3BNTNB6ezeV2wpeKIOWeVntAZ0NpyfB3HXY601Adxd9It
   KHFi8+MAHZ3aYhGkp81/Y66w/V2mp4xZj229hotTXoJRottPUniM0GwBM
   g==;
X-CSE-ConnectionGUID: NzLrziHXRo+LyoiXMcSqrA==
X-CSE-MsgGUID: 89A2p0cWQzy3JD+KeP7R/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31239756"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31239756"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 17:29:54 -0800
X-CSE-ConnectionGUID: WCzboegvRzGce8+dZWy1Nw==
X-CSE-MsgGUID: hrz7GM3bTUiM3XnMor00dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="88468719"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Nov 2024 17:29:52 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBOg9-00012L-2f;
	Thu, 14 Nov 2024 01:29:49 +0000
Date: Thu, 14 Nov 2024 09:29:41 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
	intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev,
	Michal Wajdeczko <michal.wajdeczko@intel.com>,
	Matthew Wilcox <willy@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] iov_iter: Provide copy_iomem_to|from_iter()
Message-ID: <202411140935.iEbIWcpc-lkp@intel.com>
References: <20241112200454.2211-2-michal.wajdeczko@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112200454.2211-2-michal.wajdeczko@intel.com>

Hi Michal,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on brauner-vfs/vfs.all akpm-mm/mm-nonmm-unstable linus/master v6.12-rc7 next-20241113]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Michal-Wajdeczko/iov_iter-Provide-copy_iomem_to-from_iter/20241113-080831
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20241112200454.2211-2-michal.wajdeczko%40intel.com
patch subject: [PATCH v2 1/4] iov_iter: Provide copy_iomem_to|from_iter()
config: x86_64-randconfig-123-20241113 (https://download.01.org/0day-ci/archive/20241114/202411140935.iEbIWcpc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241114/202411140935.iEbIWcpc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411140935.iEbIWcpc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/iov_iter.c:373:47: sparse: sparse: cast removes address space '__iomem' of expression
   lib/iov_iter.c:386:47: sparse: sparse: cast removes address space '__iomem' of expression
>> lib/iov_iter.c:349:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem * @@     got void * @@
   lib/iov_iter.c:349:33: sparse:     expected void const volatile [noderef] __iomem *
   lib/iov_iter.c:349:33: sparse:     got void *
   lib/iov_iter.c:330:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem * @@     got void * @@
   lib/iov_iter.c:330:37: sparse:     expected void const volatile [noderef] __iomem *
   lib/iov_iter.c:330:37: sparse:     got void *
>> lib/iov_iter.c:362:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem * @@     got void *to @@
   lib/iov_iter.c:362:21: sparse:     expected void volatile [noderef] __iomem *
   lib/iov_iter.c:362:21: sparse:     got void *to
>> lib/iov_iter.c:338:24: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem * @@     got void * @@
   lib/iov_iter.c:338:24: sparse:     expected void volatile [noderef] __iomem *
   lib/iov_iter.c:338:24: sparse:     got void *

vim +/__iomem +373 lib/iov_iter.c

   333	
   334	static __always_inline
   335	size_t memcpy_iomem_from_iter(void *iter_from, size_t progress, size_t len,
   336				      void *to, void *priv2)
   337	{
 > 338		memcpy_toio(to + progress, iter_from, len);
   339		return 0;
   340	}
   341	
   342	static __always_inline
   343	size_t copy_iomem_to_user_iter(void __user *iter_to, size_t progress,
   344				       size_t len, void *from, void *priv2)
   345	{
   346		unsigned char buf[SMP_CACHE_BYTES];
   347		size_t chunk = min(len, sizeof(buf));
   348	
 > 349		memcpy_fromio(buf, from + progress, chunk);
   350		chunk -= copy_to_user_iter(iter_to, progress, chunk, buf, priv2);
   351		return len - chunk;
   352	}
   353	
   354	static __always_inline
   355	size_t copy_iomem_from_user_iter(void __user *iter_from, size_t progress,
   356					 size_t len, void *to, void *priv2)
   357	{
   358		unsigned char buf[SMP_CACHE_BYTES];
   359		size_t chunk = min(len, sizeof(buf));
   360	
   361		chunk -= copy_from_user_iter(iter_from, progress, chunk, buf, priv2);
 > 362		memcpy_toio(to, buf, chunk);
   363		return len - chunk;
   364	}
   365	
   366	size_t copy_iomem_to_iter(const void __iomem *from, size_t bytes, struct iov_iter *i)
   367	{
   368		if (WARN_ON_ONCE(i->data_source))
   369			return 0;
   370		if (user_backed_iter(i))
   371			might_fault();
   372	
 > 373		return iterate_and_advance(i, bytes, (void *)from,
   374					   copy_iomem_to_user_iter,
   375					   memcpy_iomem_to_iter);
   376	}
   377	EXPORT_SYMBOL(copy_iomem_to_iter);
   378	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
