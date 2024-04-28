Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D4B73171
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Apr 2024 17:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714326704; cv=none; b=G8pDWZo82/EzjBJrTKGG93nKsRFB43PbTxNmt+cdnZvG41xH8VaRBN4Mcj7aE/Zg+IvnI5zltdwg8Kyj1Z4ECLE+5Fmk4yYAtZ628WVnMkiBkAtmmhndMXKRm/d+Wxgnoqqa+yZG5sqjECXOOvqGfpC/P17HoEgD5gxYKotGJUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714326704; c=relaxed/simple;
	bh=FLmIkKPk5hzJ3j8hz7j/pysR/T6hNmRWH4uuIatUx2I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qrP24UhvFsDVtiOhYmDOFj3NUUJDL6LcxoCQT3h/xUdgERlqINAskB4KAGX4Oljvv43eZTcBpqcby+foA7RXlRbbEN6nrPmCf/H2ruXMkxrqbjfu5jwvyN5Uyl3B0+BzGfmtKDevkjKIy+senprxl1yWsupIXe1i7jUfGczIRiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f7wFLULX; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f7wFLULX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714326702; x=1745862702;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FLmIkKPk5hzJ3j8hz7j/pysR/T6hNmRWH4uuIatUx2I=;
  b=f7wFLULXhEUavYxj8Otrm7bJEdW8tkfs2YMhs9iWvuoAVMmQ1Zql8+pM
   XnRCVysu+bNk8zlRRpIEQ3h13M/wKFzj4jbrZ3a2qFyE+6vvSQQ5bq+n8
   lWXjr7zcdyJBJh2KzF+KuitYndJfR2xJBptfPYpjLKYOLVRBHzGr/Jlei
   AFi6oMLy12KG+DNhl+1x2YkD5ikfIHFMMO8T4mabVrJ47R8K5uqPq+amq
   7/9ZBYwGXOetwvjRMM243nnXjzQx8/aCghzg1Zx7fLkUt0vKH0ps4bp0b
   nUdE8dBvPLUC5jpq7Oab2/wcHMhmB1ALEAQhI3yibXE0GFEJkIQ6L7OgL
   w==;
X-CSE-ConnectionGUID: HU7Kj8wIRlyrs/l3iXtOrg==
X-CSE-MsgGUID: zPJSoq4ZSX2UBA0fP0qUmg==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="20678841"
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="20678841"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 10:51:40 -0700
X-CSE-ConnectionGUID: MIAFMMW1Qh2bUH7qJH5RwQ==
X-CSE-MsgGUID: h0sDPPVNQXeOWEZMgZSbkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="25877187"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 28 Apr 2024 10:51:39 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s18gb-0006XI-0N;
	Sun, 28 Apr 2024 17:51:37 +0000
Date: Mon, 29 Apr 2024 01:50:41 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:page_frag_cache_v3 14/16] net/sched/em_meta.c:593:50:
 warning: passing argument 1 of 'page_frag_cache_page_offset' discards
 'const' qualifier from pointer target type
Message-ID: <202404290155.OnljDQEa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git page_frag_cache_v3
head:   245e8a4d98fee0307884585dbeb3dbb7ee1bf8fa
commit: 49d60804ba15895c09e4b47eb20fdc8b56ed6878 [14/16] net: replace page_frag with page_frag_cache
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240429/202404290155.OnljDQEa-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240429/202404290155.OnljDQEa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404290155.OnljDQEa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/sched/em_meta.c: In function 'meta_int_sk_sendmsg_off':
>> net/sched/em_meta.c:593:50: warning: passing argument 1 of 'page_frag_cache_page_offset' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     593 |         dst->value = page_frag_cache_page_offset(&sk->sk_frag);
         |                                                  ^~~~~~~~~~~~
   In file included from include/linux/skbuff.h:34,
                    from net/sched/em_meta.c:64:
   include/linux/page_frag_cache.h:41:80: note: expected 'struct page_frag_cache *' but argument is of type 'const struct page_frag_cache *'
      41 | static inline unsigned int page_frag_cache_page_offset(struct page_frag_cache *nc)
         |                                                        ~~~~~~~~~~~~~~~~~~~~~~~~^~


vim +593 net/sched/em_meta.c

   584	
   585	META_COLLECTOR(int_sk_sendmsg_off)
   586	{
   587		const struct sock *sk = skb_to_full_sk(skb);
   588	
   589		if (!sk) {
   590			*err = -1;
   591			return;
   592		}
 > 593		dst->value = page_frag_cache_page_offset(&sk->sk_frag);
   594	}
   595	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
