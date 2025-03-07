Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51BE1A841E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Mar 2025 10:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741344877; cv=none; b=R+YHdJSS0FNLi4h5opm6hshIgKHmOQ5mN9TL/HWdbuf5bOUSsLoA5AuYY0qoPimGjFhXnVCCxMJzqWRj1WvQKZZzMothyb9hydvP5mClAO3nk+mdc/Bj1rMxXT8HDU9C0XLkqWHoed39PES8Az9o0GSTIX5uXdqrEfco8UIPEaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741344877; c=relaxed/simple;
	bh=kdxsL/VEF38k0Qhlo+fJceXX+aDyGF2/MbB6sANxSvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CoHS93m3umWW+sBzmPrSRmY1/eFzBeROA0LZT8ZLIoDfhe3a3YK4JM8Lc+giQy8jKdhNjZWpgIHYNQVjMu6bYiD5D6aRJ1r0YVwFVYYRbPEHhnj0IYpozYdt5kgCtFPZWwRNStv+YikJxCYI9PKpzKm32pFtL/GuKFawPQSQFvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fu5bf2pz; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fu5bf2pz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741344876; x=1772880876;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kdxsL/VEF38k0Qhlo+fJceXX+aDyGF2/MbB6sANxSvI=;
  b=Fu5bf2pzZ0Lhgu2g+BGY78fW5UIQ31mfiF7MTdtSU5dnihma6YadWNkY
   giNSVtbM2X6Oa/12vk6fE5N7K/xt4edTIijXxhKiB9tG3HHiB6l1M8jmX
   9yJpWHTQe/m6Eyg1ysFvOVy90snq1xtJTsw0ILObW1Fnjj9S2rQ0a0Cy0
   veZ9bGrZ/dtYb5Odn1IbgEPszf81TJ1ZZqBg+lQkwZZzfSDZGAQ9CbOGD
   mKXjAnD/beBSGBr6UzHrYQQdI+DeQDBgpY7b72RT7scr+QsqT9Gqkp2yf
   azvO12FV7xdql7kbe1OHTTobkRBV/i2/S270tJm4LEo0OiV01ug/OnFgq
   A==;
X-CSE-ConnectionGUID: TZbX+7zOQxCCVAgWYKJ2/w==
X-CSE-MsgGUID: PNrz0G/GRQ21mAFJET2F5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="52596005"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="52596005"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 02:54:35 -0800
X-CSE-ConnectionGUID: bQSnjr4uT8ivGtu7KSdARQ==
X-CSE-MsgGUID: 2pZLyKrfSNq+yTH3sBXO5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="124514406"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 07 Mar 2025 02:54:34 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqVLc-0000L1-0F;
	Fri, 07 Mar 2025 10:54:32 +0000
Date: Fri, 7 Mar 2025 18:53:37 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 3/4] nfsd: add some stub tracepoints around key vfs
 functions
Message-ID: <202503071834.Qj8kjbdh-lkp@intel.com>
References: <20250306-nfsd-tracepoints-v1-3-4405bf41b95f@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306-nfsd-tracepoints-v1-3-4405bf41b95f@kernel.org>

Hi Jeff,

kernel test robot noticed the following build errors:

[auto build test ERROR on 7dc86d35a5f8a7ac24b53792c704b101e5041842]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeff-Layton/nfsd-add-commit-start-done-tracepoints-around-nfsd_commit/20250306-204120
base:   7dc86d35a5f8a7ac24b53792c704b101e5041842
patch link:    https://lore.kernel.org/r/20250306-nfsd-tracepoints-v1-3-4405bf41b95f%40kernel.org
patch subject: [PATCH 3/4] nfsd: add some stub tracepoints around key vfs functions
config: csky-randconfig-001-20250307 (https://download.01.org/0day-ci/archive/20250307/202503071834.Qj8kjbdh-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250307/202503071834.Qj8kjbdh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503071834.Qj8kjbdh-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/nfsd/nfsproc.c: In function 'nfsd_proc_getattr':
>> fs/nfsd/nfsproc.c:57:9: error: implicit declaration of function 'trace_nfsd_getattr' [-Wimplicit-function-declaration]
      57 |         trace_nfsd_getattr(rqstp, &argp->fh);
         |         ^~~~~~~~~~~~~~~~~~


vim +/trace_nfsd_getattr +57 fs/nfsd/nfsproc.c

    46	
    47	/*
    48	 * Get a file's attributes
    49	 * N.B. After this call resp->fh needs an fh_put
    50	 */
    51	static __be32
    52	nfsd_proc_getattr(struct svc_rqst *rqstp)
    53	{
    54		struct nfsd_fhandle *argp = rqstp->rq_argp;
    55		struct nfsd_attrstat *resp = rqstp->rq_resp;
    56	
  > 57		trace_nfsd_getattr(rqstp, &argp->fh);
    58	
    59		dprintk("nfsd: GETATTR  %s\n", SVCFH_fmt(&argp->fh));
    60	
    61		fh_copy(&resp->fh, &argp->fh);
    62		resp->status = fh_verify(rqstp, &resp->fh, 0,
    63					 NFSD_MAY_NOP | NFSD_MAY_BYPASS_GSS_ON_ROOT);
    64		if (resp->status != nfs_ok)
    65			goto out;
    66		resp->status = fh_getattr(&resp->fh, &resp->stat);
    67	out:
    68		resp->status = nfsd_map_status(resp->status);
    69		return rpc_success;
    70	}
    71	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
