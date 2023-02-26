Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2C4386
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Feb 2023 03:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677381951; x=1708917951;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tiUWi8OQSt6X2sj/g0kn2A/Oic6Z8oIetTb6HPn1WRQ=;
  b=J2Q4/A7BL4GXZz/owJfKFMnW3dvyKOIHYbkbMf62FddUvpoN1pexwtWL
   rhRWaQz4Z4G0xGWUeL7RLZJSQQnQ1L/y/reYyWBAzrIK1xnj9Rej+ahe0
   WGz18qIPuHFebjP3otwjIm572LL0LZATGyrUhsi1cdlQo0q6kKRUYfSP8
   m2vHgvlftr7vq0dWHcEh7BHCgi7YwsO7G77UQBDcglCzrxm4bRPQKFKpe
   lHoc+l2Pu05CT6ctayxc2tpIbbXcXfEQQSoGLlrr4mYpZ8m0kjTbgvSre
   x3px1l+blaSVAmhUaSYn9htTAaCpEPePHLtmTSegYLF0yBn1+U+/yS3Rb
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="361231974"
X-IronPort-AV: E=Sophos;i="5.97,328,1669104000"; 
   d="scan'208";a="361231974"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2023 19:25:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="705717696"
X-IronPort-AV: E=Sophos;i="5.97,328,1669104000"; 
   d="scan'208";a="705717696"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 25 Feb 2023 19:25:47 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pW7fX-0003XH-0w;
	Sun, 26 Feb 2023 03:25:47 +0000
Date: Sun, 26 Feb 2023 11:24:48 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Steve French <stfrench@microsoft.com>
Subject: fs/netfs/iterator.c:139 netfs_extract_user_to_sg() warn: unsigned
 'npages' is never less than zero.
Message-ID: <202302261115.P3TQi1ZO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1ec35eadc3b448c91a6b763371a7073444e95f9d
commit: 0185846975339a5c348373aa450a977f5242366b netfs: Add a function to extract an iterator into a scatterlist
date:   5 days ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230226/202302261115.P3TQi1ZO-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302261115.P3TQi1ZO-lkp@intel.com/

smatch warnings:
fs/netfs/iterator.c:139 netfs_extract_user_to_sg() warn: unsigned 'npages' is never less than zero.
fs/netfs/iterator.c:139 netfs_extract_user_to_sg() warn: unsigned 'npages' is never less than zero.

vim +/npages +139 fs/netfs/iterator.c

   106	
   107	/*
   108	 * Extract and pin a list of up to sg_max pages from UBUF- or IOVEC-class
   109	 * iterators, and add them to the scatterlist.
   110	 */
   111	static ssize_t netfs_extract_user_to_sg(struct iov_iter *iter,
   112						ssize_t maxsize,
   113						struct sg_table *sgtable,
   114						unsigned int sg_max,
   115						iov_iter_extraction_t extraction_flags)
   116	{
   117		struct scatterlist *sg = sgtable->sgl + sgtable->nents;
   118		struct page **pages;
   119		unsigned int npages;
   120		ssize_t ret = 0, res;
   121		size_t len, off;
   122	
   123		/* We decant the page list into the tail of the scatterlist */
   124		pages = (void *)sgtable->sgl + array_size(sg_max, sizeof(struct scatterlist));
   125		pages -= sg_max;
   126	
   127		do {
   128			res = iov_iter_extract_pages(iter, &pages, maxsize, sg_max,
   129						     extraction_flags, &off);
   130			if (res < 0)
   131				goto failed;
   132	
   133			len = res;
   134			maxsize -= len;
   135			ret += len;
   136			npages = DIV_ROUND_UP(off + len, PAGE_SIZE);
   137			sg_max -= npages;
   138	
 > 139			for (; npages < 0; npages--) {
   140				struct page *page = *pages;
   141				size_t seg = min_t(size_t, PAGE_SIZE - off, len);
   142	
   143				*pages++ = NULL;
   144				sg_set_page(sg, page, len, off);
   145				sgtable->nents++;
   146				sg++;
   147				len -= seg;
   148				off = 0;
   149			}
   150		} while (maxsize > 0 && sg_max > 0);
   151	
   152		return ret;
   153	
   154	failed:
   155		while (sgtable->nents > sgtable->orig_nents)
   156			put_page(sg_page(&sgtable->sgl[--sgtable->nents]));
   157		return res;
   158	}
   159	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
