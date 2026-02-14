Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C863EBF2D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Feb 2026 12:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771072413; cv=none; b=ejgKT9Sajsxt6JpTz3M2tn4IT2taUy/7d83YFqbuVTUtenR5L4W5eG/LcouMqIb7HaBVbVUxN39RNlt4+rCz8gBoc88gHvLfoNM+AB+GDA2uCoSKYQMxZBLRxNDAOC0ijolLbpQmy5X24qPSeAk7RqMcCeZtzWa22ju7acv1SRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771072413; c=relaxed/simple;
	bh=YCR560SceZMWoFT+hZOGG3Q841yflpLrAjRNtMTNlqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OxsnThHLGgpe7vfWtvHVJj9GkXaTpOY5jsGRAzIxFenjTI3RWgPSX78tl/E8i8I/EW44SXv/2eP7zDG0PB/sJXsqSRoWrwAdHqVp3xRfZiAScYCTvzdQDGiDEQlFq5XlgHaw74WYlcsQ+Qf7YsFc+At5U1FNmeYUIPhbv09CC9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KLOyhSCl; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KLOyhSCl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771072410; x=1802608410;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YCR560SceZMWoFT+hZOGG3Q841yflpLrAjRNtMTNlqM=;
  b=KLOyhSClSm80Fmb2kwTlnT+FQ4Cb+36ldPiIYnAmW8gsSR69gqnUguxB
   9mS97LkLUaNPfTeaNKIwIANjuYMJhj5Kqe3ddM0cv7epP5O0XYUnTbg4c
   3LgIKZtPPVFhCENvusymiWnwR5dnWXnId1aDmkC/jZLOKXU8BX9SDx1C8
   7Ov5KdREJREVbjbzN0OYzsVekd7k7NO7kz2L5gAWJchUpC5hy4UBpHYyp
   7og7369dqQGrbqz6jfCkgH9DWxo8Y4OAiMwVAKr5EmeeUdsDCbRPYi/FR
   6CEUMc+BjIRe27S4nNu6eDwSCXNzS9i38FE2VBTXz8HHjaSCb+G2WUsH5
   A==;
X-CSE-ConnectionGUID: gk/rQMatTBGYP9lbh3maEQ==
X-CSE-MsgGUID: OHMOVZVHTcy/kSgpp5n3lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="82565163"
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="82565163"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2026 04:33:30 -0800
X-CSE-ConnectionGUID: avkfkb8ZTimdIY18Uz98kA==
X-CSE-MsgGUID: MweAp2/NQHGZTQH2fPfrMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="213269477"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Feb 2026 04:33:27 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrEpw-00000000wWS-0fal;
	Sat, 14 Feb 2026 12:33:24 +0000
Date: Sat, 14 Feb 2026 20:32:36 +0800
From: kernel test robot <lkp@intel.com>
To: Sumit Garg <sumit.garg@kernel.org>, op-tee@lists.trustedfirmware.org
Cc: oe-kbuild-all@lists.linux.dev, jens.wiklander@linaro.org,
	vbabka@suse.cz, akpm@linux-foundation.org, willy@infradead.org,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Sven =?iso-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>
Subject: Re: [RFT PATCH] tee: shm: Remove refcounting of kernel pages
Message-ID: <202602142012.snNfstpn-lkp@intel.com>
References: <20260213113317.1728769-1-sumit.garg@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260213113317.1728769-1-sumit.garg@kernel.org>

Hi Sumit,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.19 next-20260213]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sumit-Garg/tee-shm-Remove-refcounting-of-kernel-pages/20260213-193435
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260213113317.1728769-1-sumit.garg%40kernel.org
patch subject: [RFT PATCH] tee: shm: Remove refcounting of kernel pages
config: x86_64-randconfig-r073-20260214 (https://download.01.org/0day-ci/archive/20260214/202602142012.snNfstpn-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602142012.snNfstpn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602142012.snNfstpn-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/tee/tee_shm.c: In function 'register_shm_helper':
>> drivers/tee/tee_shm.c:475:13: error: implicit declaration of function 'iter_is_uvec'; did you mean 'iter_is_iovec'? [-Wimplicit-function-declaration]
     475 |         if (iter_is_uvec(iter))
         |             ^~~~~~~~~~~~
         |             iter_is_iovec


vim +475 drivers/tee/tee_shm.c

   399	
   400	static struct tee_shm *
   401	register_shm_helper(struct tee_context *ctx, struct iov_iter *iter, u32 flags,
   402			    int id)
   403	{
   404		struct tee_device *teedev = ctx->teedev;
   405		struct tee_shm *shm;
   406		unsigned long start, addr;
   407		size_t num_pages, off;
   408		ssize_t len;
   409		void *ret;
   410		int rc;
   411	
   412		if (!tee_device_get(teedev))
   413			return ERR_PTR(-EINVAL);
   414	
   415		if (!teedev->desc->ops->shm_register ||
   416		    !teedev->desc->ops->shm_unregister) {
   417			ret = ERR_PTR(-ENOTSUPP);
   418			goto err_dev_put;
   419		}
   420	
   421		teedev_ctx_get(ctx);
   422	
   423		shm = kzalloc(sizeof(*shm), GFP_KERNEL);
   424		if (!shm) {
   425			ret = ERR_PTR(-ENOMEM);
   426			goto err_ctx_put;
   427		}
   428	
   429		refcount_set(&shm->refcount, 1);
   430		shm->flags = flags;
   431		shm->ctx = ctx;
   432		shm->id = id;
   433		addr = untagged_addr((unsigned long)iter_iov_addr(iter));
   434		start = rounddown(addr, PAGE_SIZE);
   435		num_pages = iov_iter_npages(iter, INT_MAX);
   436		if (!num_pages) {
   437			ret = ERR_PTR(-ENOMEM);
   438			goto err_ctx_put;
   439		}
   440	
   441		shm->pages = kcalloc(num_pages, sizeof(*shm->pages), GFP_KERNEL);
   442		if (!shm->pages) {
   443			ret = ERR_PTR(-ENOMEM);
   444			goto err_free_shm;
   445		}
   446	
   447		len = iov_iter_extract_pages(iter, &shm->pages, LONG_MAX, num_pages, 0,
   448					     &off);
   449		if (unlikely(len <= 0)) {
   450			ret = len ? ERR_PTR(len) : ERR_PTR(-ENOMEM);
   451			goto err_free_shm_pages;
   452		} else if (DIV_ROUND_UP(len + off, PAGE_SIZE) != num_pages) {
   453			/*
   454			 * If we only got a few pages, update to release the
   455			 * correct amount below.
   456			 */
   457			shm->num_pages = len / PAGE_SIZE;
   458			ret = ERR_PTR(-ENOMEM);
   459			goto err_put_shm_pages;
   460		}
   461	
   462		shm->offset = off;
   463		shm->size = len;
   464		shm->num_pages = num_pages;
   465	
   466		rc = teedev->desc->ops->shm_register(ctx, shm, shm->pages,
   467						     shm->num_pages, start);
   468		if (rc) {
   469			ret = ERR_PTR(rc);
   470			goto err_put_shm_pages;
   471		}
   472	
   473		return shm;
   474	err_put_shm_pages:
 > 475		if (iter_is_uvec(iter))
   476			unpin_user_pages(shm->pages, shm->num_pages);
   477	err_free_shm_pages:
   478		kfree(shm->pages);
   479	err_free_shm:
   480		kfree(shm);
   481	err_ctx_put:
   482		teedev_ctx_put(ctx);
   483	err_dev_put:
   484		tee_device_put(teedev);
   485		return ret;
   486	}
   487	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
