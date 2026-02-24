Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4975F2C11E3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Feb 2026 18:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771958848; cv=none; b=uqTfiYSFPTuCZwzyK4VEPfl9OR9M78NzcSz9nyqJxCRkqEyAg8lRH59box5mRvrVfTNpTURu0Db4uvA/1HPOBLSpCVYGo9rf90h91U+ViVL94gpr661Vnn+58RHJdKKs7J5D0Rqkmlg9nBtX4ngknYMmy05TTk+PYZ80jIL1U7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771958848; c=relaxed/simple;
	bh=actsr+bBxfzCj6H6w71i/mGXt5y66yY7aSENLDOupoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CTmEFz4kKLwyL9hrnVjrzfm0saKWC593Y4l1Z+fbBjJBGpsv5gWuLbPkVwhAucVX4M87nirINHtlDjbHmIuyh9TILqg0CKoDlmMtopVXzhlFpxmTwLHb5aPqGmGLXib3iDd9WaByBk7K7ekE+gXMpmY/GtdRqT+0pVNez+yuAmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I1gao+sT; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I1gao+sT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771958846; x=1803494846;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=actsr+bBxfzCj6H6w71i/mGXt5y66yY7aSENLDOupoA=;
  b=I1gao+sTrJfSR/fz6lhA+WrnNpiastZCVS59ek/fxyYvBycOna7jFXja
   3dT/NPIgcRF3bnSvrySMOvB+kbKaDliDTUt0BnYf2kq5QR2zLVKtVWv/N
   56TZJcTZuQdOJkCQEy3pZwOsYzOlGmfXGjmYQTfdMTk1ar18dP57fOB//
   J4y72cz4/ooyzPWJ8hNQ7C+yGtTZegbIz4YRQPwk1iVmlCf4/efzaGzLs
   p502K1kjgXKMX31ERIlCwHfMJ39siMWcmWgqQxV+1NrRDIoNWLnGCF09w
   HmR1pVpnzZZEHxeNkWUBh+L2650L6FuSHI2hMXobpJx3OY+6g6Adk2net
   Q==;
X-CSE-ConnectionGUID: AdTWDTygQ/SJ722twFnAZQ==
X-CSE-MsgGUID: 4MQoqfk0QdG+ysMfuBFLLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="72194221"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="72194221"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 10:47:25 -0800
X-CSE-ConnectionGUID: 2fNVkZlMTAeR/FPtAQQybw==
X-CSE-MsgGUID: f3TrLqaYT86iaVmnKxYQtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="253738807"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 24 Feb 2026 10:47:24 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuxRI-000000002M1-3GXn;
	Tue, 24 Feb 2026 18:47:20 +0000
Date: Wed, 25 Feb 2026 02:42:55 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org
Cc: oe-kbuild-all@lists.linux.dev, vbabka@suse.cz, harry.yoo@oracle.com,
	00107082@163.com, cl@gentwo.org, rientjes@google.com,
	roman.gushchin@linux.dev, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH 1/1] mm/slab: mark alloc tags empty for sheafs allocated
 with __GFP_NO_OBJ_EXT
Message-ID: <202602250249.E8I3P4Ig-lkp@intel.com>
References: <20260224165250.1322946-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224165250.1322946-1-surenb@google.com>

Hi Suren,

kernel test robot noticed the following build errors:

[auto build test ERROR on 7dff99b354601dd01829e1511711846e04340a69]

url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan/mm-slab-mark-alloc-tags-empty-for-sheafs-allocated-with-__GFP_NO_OBJ_EXT/20260225-005422
base:   7dff99b354601dd01829e1511711846e04340a69
patch link:    https://lore.kernel.org/r/20260224165250.1322946-1-surenb%40google.com
patch subject: [PATCH 1/1] mm/slab: mark alloc tags empty for sheafs allocated with __GFP_NO_OBJ_EXT
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260225/202602250249.E8I3P4Ig-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260225/202602250249.E8I3P4Ig-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602250249.E8I3P4Ig-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/slub.c: In function 'free_empty_sheaf':
>> mm/slub.c:2787:17: error: implicit declaration of function 'mark_objexts_empty' [-Werror=implicit-function-declaration]
    2787 |                 mark_objexts_empty(sheaf);
         |                 ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/mark_objexts_empty +2787 mm/slub.c

  2783	
  2784	static void free_empty_sheaf(struct kmem_cache *s, struct slab_sheaf *sheaf)
  2785	{
  2786		if (s->flags & SLAB_KMALLOC)
> 2787			mark_objexts_empty(sheaf);
  2788	
  2789		kfree(sheaf);
  2790	
  2791		stat(s, SHEAF_FREE);
  2792	}
  2793	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
