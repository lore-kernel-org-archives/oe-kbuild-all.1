Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A71ED511
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Nov 2023 08:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iJU7hdmx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700295547; x=1731831547;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tBGWz2txPwjjGh0cfihvuxR0mnKrMRiG/mzHTORLKik=;
  b=iJU7hdmxll6dxnfrOcTZWIIcTo2MOIYcpCVL+lTcfdIAeG5uIk5qbHev
   IxijCoE3Ok2o793eQez0/2JBHxi9AJNE+XxCIvu9R5Vj9wUz7tXgpunZ6
   k1fePwy4ZX/3kxcAGFQ/T/KeChUHKkz/5+OMzpXGEHVXDd4AasR1rEJhs
   vVuLr1T7FcBpvROxWAXTo1O+9m6UxeOGl3h3yjVrF4tpf0GCj0KDazaMQ
   jVO/RDt+nU437liiRV9lSrCe2WU5jqybMm5cQw18nVLSTjgF1asIWmB+H
   guAbHj3gY4kBxkQfXv5gIiXE5XfCQUFHMp7upIOHQY28J7QIAkXhM4mQo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="455711806"
X-IronPort-AV: E=Sophos;i="6.04,207,1695711600"; 
   d="scan'208";a="455711806"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2023 00:19:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="883356229"
X-IronPort-AV: E=Sophos;i="6.04,207,1695711600"; 
   d="scan'208";a="883356229"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 18 Nov 2023 00:19:05 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4GXf-0003gl-1E;
	Sat, 18 Nov 2023 08:19:03 +0000
Date: Sat, 18 Nov 2023 16:18:51 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-lib 30/51] include/linux/fscache.h:597: undefined
 reference to `__fscache_clear_page_bits'
Message-ID: <202311181652.Odqv1plg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-lib
head:   63aa4c69f32c9443f9e93ca8cbbdd692c5970119
commit: 1e16f3e3eb1f420959b3399abce55fa1d4776429 [30/51] netfs: Provide a writepages implementation
config: x86_64-randconfig-073-20231118 (https://download.01.org/0day-ci/archive/20231118/202311181652.Odqv1plg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231118/202311181652.Odqv1plg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311181652.Odqv1plg-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/netfs/buffered_write.o: in function `fscache_clear_page_bits':
>> include/linux/fscache.h:597: undefined reference to `__fscache_clear_page_bits'
   ld: fs/afs/file.o:(.rodata+0x220): undefined reference to `fscache_begin_cache_operation'


vim +597 include/linux/fscache.h

9af1c6c3089b29 David Howells 2021-10-20  581  
b6e16652d6c0e4 David Howells 2021-10-20  582  /**
b6e16652d6c0e4 David Howells 2021-10-20  583   * fscache_clear_page_bits - Clear the PG_fscache bits from a set of pages
b6e16652d6c0e4 David Howells 2021-10-20  584   * @mapping: The netfs inode to use as the source
b6e16652d6c0e4 David Howells 2021-10-20  585   * @start: The start position in @mapping
b6e16652d6c0e4 David Howells 2021-10-20  586   * @len: The amount of data to unlock
b6e16652d6c0e4 David Howells 2021-10-20  587   * @caching: If PG_fscache has been set
b6e16652d6c0e4 David Howells 2021-10-20  588   *
b6e16652d6c0e4 David Howells 2021-10-20  589   * Clear the PG_fscache flag from a sequence of pages and wake up anyone who's
b6e16652d6c0e4 David Howells 2021-10-20  590   * waiting.
b6e16652d6c0e4 David Howells 2021-10-20  591   */
2c547f299827c1 Yue Hu        2022-04-06  592  static inline void fscache_clear_page_bits(struct address_space *mapping,
b6e16652d6c0e4 David Howells 2021-10-20  593  					   loff_t start, size_t len,
b6e16652d6c0e4 David Howells 2021-10-20  594  					   bool caching)
b6e16652d6c0e4 David Howells 2021-10-20  595  {
b6e16652d6c0e4 David Howells 2021-10-20  596  	if (caching)
b6e16652d6c0e4 David Howells 2021-10-20 @597  		__fscache_clear_page_bits(mapping, start, len);
b6e16652d6c0e4 David Howells 2021-10-20  598  }
b6e16652d6c0e4 David Howells 2021-10-20  599  

:::::: The code at line 597 was first introduced by commit
:::::: b6e16652d6c0e4f9e9b120f66966ec153f0623fc fscache: Implement higher-level write I/O interface

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
