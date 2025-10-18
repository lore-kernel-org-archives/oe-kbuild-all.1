Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37165209F5A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Oct 2025 03:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760759693; cv=none; b=P6ibJYFLWMk39SRcrIQuxMinVjdRL1Wc8/uYVzF/6EwGceQrDO4JQtkXfgEKRPNb2Bd0OQvp9ve4vQh75qLu1IJptusN/MuIC7wfPjOmZasHvjchEVmu9aRNRSguyvZN+qs3p4Iv41wFQ1um0DzqVHCbcZcYYgVwFJg2AX0z5PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760759693; c=relaxed/simple;
	bh=okI3RpJTLrRj1PrupblKZE/45kDzmQjlxy+SRy5hI2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gi6QCjPFkyN4slgmWjTXk72xO0EViJyJVBGCYbQQ+8mu/E/7TnnxhyR9oxSRp+HOLWSN3+uzy5mMc0n1Qcwe9aGPcEr6Q3Il36elXDn0mCMzGdeV53cVp9AdPVOQhlYyy+ksPzrjknuslXookLriLmot2jWxYSFxti83g3lg8eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GONf33gn; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GONf33gn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760759692; x=1792295692;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=okI3RpJTLrRj1PrupblKZE/45kDzmQjlxy+SRy5hI2c=;
  b=GONf33gn6eaT5u85cbaW1mGsYvRAjGamtH1z4t96483fMUWi1nFYSxMs
   PdwUYhCXxuFSvllIURoIDnzAzt7vxf2864byBT73usWjwXmCtJnGlwKKI
   7fl1N9xgs/tsHn+f9JMP/o7uLMext6Tb0RdsyMVsan3xlsbXdwdspf1nw
   Jnnf/2srbd1H1NDo5C9IEXAl9rBL6VptAHx+BCi08Dp7bMgFmEfF9MNAo
   D9jSFMW1HYLvfmQaS3Y2yANqGu10NmuyaBoqCJ16HR+t1nMT2a0LAKgG0
   VqfpXTDk7ajnX7CRaJSnRm0C+BxCge491DrZBW/bnDTCDfd+1UXocZ/Bc
   g==;
X-CSE-ConnectionGUID: Ua3wEbVhQW23kLJpYr0/vg==
X-CSE-MsgGUID: 0md3+zT2Q4ypX4uEfBQCvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="85594952"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="85594952"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 20:54:51 -0700
X-CSE-ConnectionGUID: lfkJnemmRKGrlC6HZMrttw==
X-CSE-MsgGUID: kKFSxIhlRyyzUPXhaFL+Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="182703077"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 17 Oct 2025 20:54:49 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9y1m-00082V-1y;
	Sat, 18 Oct 2025 03:54:46 +0000
Date: Sat, 18 Oct 2025 11:54:28 +0800
From: kernel test robot <lkp@intel.com>
To: Kiryl Shutsemau <kirill@shutemov.name>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	LKML <linux-kernel@vger.kernel.org>, linux-fsdevel@vger.kernel.org,
	Kiryl Shutsemau <kas@kernel.org>
Subject: Re: [PATCH] mm/filemap: Implement fast short reads
Message-ID: <202510181107.YiEpGvU3-lkp@intel.com>
References: <20251017141536.577466-1-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017141536.577466-1-kirill@shutemov.name>

Hi Kiryl,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Kiryl-Shutsemau/mm-filemap-Implement-fast-short-reads/20251017-221655
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20251017141536.577466-1-kirill%40shutemov.name
patch subject: [PATCH] mm/filemap: Implement fast short reads
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20251018/202510181107.YiEpGvU3-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251018/202510181107.YiEpGvU3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510181107.YiEpGvU3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/filemap.c: In function 'filemap_read_fast':
>> mm/filemap.c:2787:1: warning: the frame size of 1048 bytes is larger than 1024 bytes [-Wframe-larger-than=]
    2787 | }
         | ^


vim +2787 mm/filemap.c

  2752	
  2753	static noinline bool filemap_read_fast(struct kiocb *iocb, struct iov_iter *iter,
  2754					       ssize_t *already_read)
  2755	{
  2756		struct address_space *mapping = iocb->ki_filp->f_mapping;
  2757		struct file_ra_state *ra = &iocb->ki_filp->f_ra;
  2758		char buffer[FAST_READ_BUF_SIZE];
  2759		size_t count;
  2760	
  2761		if (ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE)
  2762			return false;
  2763	
  2764		if (iov_iter_count(iter) > sizeof(buffer))
  2765			return false;
  2766	
  2767		count = iov_iter_count(iter);
  2768	
  2769		/* Let's see if we can just do the read under RCU */
  2770		rcu_read_lock();
  2771		count = filemap_read_fast_rcu(mapping, iocb->ki_pos, buffer, count);
  2772		rcu_read_unlock();
  2773	
  2774		if (!count)
  2775			return false;
  2776	
  2777		count = copy_to_iter(buffer, count, iter);
  2778		if (unlikely(!count))
  2779			return false;
  2780	
  2781		iocb->ki_pos += count;
  2782		ra->prev_pos = iocb->ki_pos;
  2783		file_accessed(iocb->ki_filp);
  2784		*already_read += count;
  2785	
  2786		return !iov_iter_count(iter);
> 2787	}
  2788	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
