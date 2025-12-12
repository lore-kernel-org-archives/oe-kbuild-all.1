Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D6F264F9C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 04:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765514185; cv=none; b=hy7Mpyz/AV6SohWGVw3eVV5r0Dk0/ihYOs23idpo0S/29ojIB0pWmfh5Daz0XbE12hr9sC0H9VHRVaSl14cV1KuoJ4vX9uwgKX/T/86mYau5C+ko21nr1DW+2bHKjYGcpXvkB9pdlIJ2f6AJWTmuqO8I74Ro69bNJYYoAhexr9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765514185; c=relaxed/simple;
	bh=O2j7LkXo0uQaJapLzLuZ0mH6OeEKfYF9tT662PsKxLw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cy+kmsD97v1O5MXp+YBwA7coUjT3jIe5vKZ/dDby4b/G5KO4oiSqBLfmPRI5sRBpaClLQcwPQTSdaLnDfLKD12yl3MfnaWBqrooj60ocYzLjqVycL7R+wAxqIgf/RXYENXq7ZeRsVuzeW8visPnlErdZGGkTWuSWGXqdMqJWCyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fpRNw5Kz; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fpRNw5Kz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765514183; x=1797050183;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O2j7LkXo0uQaJapLzLuZ0mH6OeEKfYF9tT662PsKxLw=;
  b=fpRNw5Kzfl3TnnWjdaC7prHmhaw1k5m9JlxY/E0jdH9kE+G7OAwu0E+Q
   8E2FQZZ5W/DGrbaeT/mqXQZCKEn27hDjA+XG1jYkEHSt2qi2P+FKTEfjK
   +zYATVxr5XzCAzChnTaN5n/JZkHQVGWQe3nhjZ2PpGgwGg+nYiRXyNYRt
   AmrUpakM8axXLT3qF7957TmuZAbiEXaQRtK00PWWBbW4ktSucF0ABKeEW
   5WS22pTX/vzC1smRDekru5qZabn7vO0WTHx+FF3Xvb9GnBjjCfk9PLydB
   qTrKb5KcO4QhNvFCZ17frjK1am6JwXk7iFiMWugiDMvBEacXoMFUgRo3+
   w==;
X-CSE-ConnectionGUID: fyyMvSmBQWmk5w1Bj7ogRw==
X-CSE-MsgGUID: 9RK5TK0mQKedCMHBeiJV0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="84913487"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="84913487"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 20:36:23 -0800
X-CSE-ConnectionGUID: mnQNfr06Sgq6aK2HR0wXag==
X-CSE-MsgGUID: qogqVqUhQK63Ft7aFRLVKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="196747727"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Dec 2025 20:36:22 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTut9-000000005VR-3SJx;
	Fri, 12 Dec 2025 04:36:19 +0000
Date: Fri, 12 Dec 2025 12:36:08 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Baokun Li <libaokun1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3406/3406] fs/cachefiles/rdwr.c:860:6: warning:
 no previous prototype for function 'cachefiles_readpages_work_func'
Message-ID: <202512121252.aKzusfWQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jingbo,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   58f07869576fac9de85244333864fb34fb7df411
commit: 33ba25cc4869bab81ad31784e7bbb25e5da2a2ad [3406/3406] anolis: fscache,cachefiles: add fscache_prepare_read() helper
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251212/202512121252.aKzusfWQ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6ec8c4351cfc1d0627d1633b02ea787bd29c77d8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121252.aKzusfWQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121252.aKzusfWQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/cachefiles/rdwr.c:860:6: warning: no previous prototype for function 'cachefiles_readpages_work_func' [-Wmissing-prototypes]
     860 | void cachefiles_readpages_work_func(struct work_struct *work)
         |      ^
   fs/cachefiles/rdwr.c:860:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     860 | void cachefiles_readpages_work_func(struct work_struct *work)
         | ^
         | static 
   1 warning generated.


vim +/cachefiles_readpages_work_func +860 fs/cachefiles/rdwr.c

   859	
 > 860	void cachefiles_readpages_work_func(struct work_struct *work)
   861	{
   862		struct cachefiles_kiocb *ki = container_of(work, struct cachefiles_kiocb, work);
   863		int ret;
   864	
   865		ret = vfs_iocb_iter_read(ki->iocb.ki_filp, &ki->iocb, &ki->iter);
   866		/* complete the request if there's any progress or error occurred */
   867		if (ret != -EIOCBQUEUED) {
   868			struct fscache_retrieval *op = ki->op;
   869			unsigned int nr_pages = atomic_read(&op->n_pages);
   870			unsigned int done_pages = 0;
   871			int i, error;
   872	
   873			if (ret > 0)
   874				done_pages = ret / PAGE_SIZE;
   875	
   876			for (i = 0; i < nr_pages; i++) {
   877				error = i < done_pages ? 0 : -EIO;
   878				fscache_end_io(op, ki->bvs[i].bv_page, error);
   879			}
   880	
   881			fscache_retrieval_complete(op, nr_pages);
   882			fscache_put_retrieval(op);
   883			kfree(ki);
   884		}
   885	}
   886	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
