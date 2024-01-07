Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D79C1171A
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Jan 2024 03:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N2Ev9oMY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704599459; x=1736135459;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KRKPLPnFv4jzH7oeggR6wXMnOYLydSE6fs05zQ0CEdk=;
  b=N2Ev9oMYPlATKx9LfiVosi39nf3YfYEm9F42N0yfDCHpXhI3XTuGz6St
   lcZztKiC4FFC0A8eC25dKLcbxz0BjoPNCqmRF5E/uhjUqMfv3/I1QAJJn
   5XBrzubsy9SMoWdBigr7/MDV2Dj8lqq4RjeLVVwuT8lQ0cPjuw3kiIAsx
   s4z9eawAl/SyTJzdrsweI1Dk00JrtP7Dab8DkU1SQunvCTgs1YiJV6byg
   jKut1AC2XXhal9wSbZC/5vWrDLVG6BZ/5kTYiWordS/IvJP8y5cDotzg/
   kDNH9x+OJDGsaZrKMOX6dtp5w3r+wGCa2zRJBhm+INBzHkWwqn6Vw20Qh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10945"; a="388153134"
X-IronPort-AV: E=Sophos;i="6.04,338,1695711600"; 
   d="scan'208";a="388153134"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2024 19:50:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10945"; a="871561639"
X-IronPort-AV: E=Sophos;i="6.04,338,1695711600"; 
   d="scan'208";a="871561639"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 06 Jan 2024 19:50:48 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rMKBS-0003Lp-0G;
	Sun, 07 Jan 2024 03:50:46 +0000
Date: Sun, 7 Jan 2024 11:50:28 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-lib 41/50] fs/cachefiles/io.c:552
 __cachefiles_prepare_write() warn: unsigned 'pos' is never less than zero.
Message-ID: <202401071152.DbKqMQMu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-lib
head:   807c6d09cc99cbdf9933edfadcbaa8f0b856848d
commit: 7097c96411d22a1b3f6370dfd7eb2e3b7b83ff98 [41/50] cachefiles: Fix __cachefiles_prepare_write()
config: x86_64-randconfig-161-20240105 (https://download.01.org/0day-ci/archive/20240107/202401071152.DbKqMQMu-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401071152.DbKqMQMu-lkp@intel.com/

New smatch warnings:
fs/cachefiles/io.c:552 __cachefiles_prepare_write() warn: unsigned 'pos' is never less than zero.

Old smatch warnings:
fs/cachefiles/io.c:573 __cachefiles_prepare_write() warn: unsigned 'pos' is never less than zero.

vim +/pos +552 fs/cachefiles/io.c

8669247524c73e Jingbo Xu     2022-11-24  515  
047487c947e8b9 David Howells 2021-10-21  516  /*
047487c947e8b9 David Howells 2021-10-21  517   * Prepare for a write to occur.
047487c947e8b9 David Howells 2021-10-21  518   */
a06fac1599c179 Jeffle Xu     2022-04-25  519  int __cachefiles_prepare_write(struct cachefiles_object *object,
a06fac1599c179 Jeffle Xu     2022-04-25  520  			       struct file *file,
e0ace6ca98bef0 David Howells 2023-11-22  521  			       loff_t *_start, size_t *_len, size_t upper_len,
047487c947e8b9 David Howells 2021-10-21  522  			       bool no_space_allocated_yet)
047487c947e8b9 David Howells 2021-10-21  523  {
047487c947e8b9 David Howells 2021-10-21  524  	struct cachefiles_cache *cache = object->volume->cache;
7097c96411d22a David Howells 2024-01-02  525  	unsigned long long start = *_start, pos;
7097c96411d22a David Howells 2024-01-02  526  	size_t len = *_len;
047487c947e8b9 David Howells 2021-10-21  527  	int ret;
047487c947e8b9 David Howells 2021-10-21  528  
047487c947e8b9 David Howells 2021-10-21  529  	/* Round to DIO size */
7097c96411d22a David Howells 2024-01-02  530  	start = round_down(*_start, PAGE_SIZE);
7097c96411d22a David Howells 2024-01-02  531  	if (start != *_start) {
7097c96411d22a David Howells 2024-01-02  532  		kleave(" = -ENOBUFS [down]");
7097c96411d22a David Howells 2024-01-02  533  		return -ENOBUFS;
7097c96411d22a David Howells 2024-01-02  534  	}
7097c96411d22a David Howells 2024-01-02  535  	if (*_len > upper_len) {
7097c96411d22a David Howells 2024-01-02  536  		kleave(" = -ENOBUFS [up]");
e0ace6ca98bef0 David Howells 2023-11-22  537  		return -ENOBUFS;
7097c96411d22a David Howells 2024-01-02  538  	}
7097c96411d22a David Howells 2024-01-02  539  
7097c96411d22a David Howells 2024-01-02  540  	*_len = round_up(len, PAGE_SIZE);
047487c947e8b9 David Howells 2021-10-21  541  
047487c947e8b9 David Howells 2021-10-21  542  	/* We need to work out whether there's sufficient disk space to perform
047487c947e8b9 David Howells 2021-10-21  543  	 * the write - but we can skip that check if we have space already
047487c947e8b9 David Howells 2021-10-21  544  	 * allocated.
047487c947e8b9 David Howells 2021-10-21  545  	 */
047487c947e8b9 David Howells 2021-10-21  546  	if (no_space_allocated_yet)
047487c947e8b9 David Howells 2021-10-21  547  		goto check_space;
047487c947e8b9 David Howells 2021-10-21  548  
047487c947e8b9 David Howells 2021-10-21  549  	pos = cachefiles_inject_read_error();
047487c947e8b9 David Howells 2021-10-21  550  	if (pos == 0)
7097c96411d22a David Howells 2024-01-02  551  		pos = vfs_llseek(file, start, SEEK_DATA);
047487c947e8b9 David Howells 2021-10-21 @552  	if (pos < 0 && pos >= (loff_t)-MAX_ERRNO) {
047487c947e8b9 David Howells 2021-10-21  553  		if (pos == -ENXIO)
047487c947e8b9 David Howells 2021-10-21  554  			goto check_space; /* Unallocated tail */
047487c947e8b9 David Howells 2021-10-21  555  		trace_cachefiles_io_error(object, file_inode(file), pos,
047487c947e8b9 David Howells 2021-10-21  556  					  cachefiles_trace_seek_error);
047487c947e8b9 David Howells 2021-10-21  557  		return pos;
047487c947e8b9 David Howells 2021-10-21  558  	}
7097c96411d22a David Howells 2024-01-02  559  	if (pos >= start + *_len)
047487c947e8b9 David Howells 2021-10-21  560  		goto check_space; /* Unallocated region */
047487c947e8b9 David Howells 2021-10-21  561  
047487c947e8b9 David Howells 2021-10-21  562  	/* We have a block that's at least partially filled - if we're low on
047487c947e8b9 David Howells 2021-10-21  563  	 * space, we need to see if it's fully allocated.  If it's not, we may
047487c947e8b9 David Howells 2021-10-21  564  	 * want to cull it.
047487c947e8b9 David Howells 2021-10-21  565  	 */
3929eca769b5a2 David Howells 2021-10-21  566  	if (cachefiles_has_space(cache, 0, *_len / PAGE_SIZE,
3929eca769b5a2 David Howells 2021-10-21  567  				 cachefiles_has_space_check) == 0)
047487c947e8b9 David Howells 2021-10-21  568  		return 0; /* Enough space to simply overwrite the whole block */
047487c947e8b9 David Howells 2021-10-21  569  
047487c947e8b9 David Howells 2021-10-21  570  	pos = cachefiles_inject_read_error();
047487c947e8b9 David Howells 2021-10-21  571  	if (pos == 0)
7097c96411d22a David Howells 2024-01-02  572  		pos = vfs_llseek(file, start, SEEK_HOLE);
047487c947e8b9 David Howells 2021-10-21  573  	if (pos < 0 && pos >= (loff_t)-MAX_ERRNO) {
047487c947e8b9 David Howells 2021-10-21  574  		trace_cachefiles_io_error(object, file_inode(file), pos,
047487c947e8b9 David Howells 2021-10-21  575  					  cachefiles_trace_seek_error);
047487c947e8b9 David Howells 2021-10-21  576  		return pos;
047487c947e8b9 David Howells 2021-10-21  577  	}
7097c96411d22a David Howells 2024-01-02  578  	if (pos >= start + *_len)
047487c947e8b9 David Howells 2021-10-21  579  		return 0; /* Fully allocated */
047487c947e8b9 David Howells 2021-10-21  580  
047487c947e8b9 David Howells 2021-10-21  581  	/* Partially allocated, but insufficient space: cull. */
3929eca769b5a2 David Howells 2021-10-21  582  	fscache_count_no_write_space();
047487c947e8b9 David Howells 2021-10-21  583  	ret = cachefiles_inject_remove_error();
047487c947e8b9 David Howells 2021-10-21  584  	if (ret == 0)
047487c947e8b9 David Howells 2021-10-21  585  		ret = vfs_fallocate(file, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE,
7097c96411d22a David Howells 2024-01-02  586  				    start, *_len);
047487c947e8b9 David Howells 2021-10-21  587  	if (ret < 0) {
047487c947e8b9 David Howells 2021-10-21  588  		trace_cachefiles_io_error(object, file_inode(file), ret,
047487c947e8b9 David Howells 2021-10-21  589  					  cachefiles_trace_fallocate_error);
047487c947e8b9 David Howells 2021-10-21  590  		cachefiles_io_error_obj(object,
047487c947e8b9 David Howells 2021-10-21  591  					"CacheFiles: fallocate failed (%d)\n", ret);
047487c947e8b9 David Howells 2021-10-21  592  		ret = -EIO;
047487c947e8b9 David Howells 2021-10-21  593  	}
047487c947e8b9 David Howells 2021-10-21  594  
047487c947e8b9 David Howells 2021-10-21  595  	return ret;
047487c947e8b9 David Howells 2021-10-21  596  
047487c947e8b9 David Howells 2021-10-21  597  check_space:
3929eca769b5a2 David Howells 2021-10-21  598  	return cachefiles_has_space(cache, 0, *_len / PAGE_SIZE,
3929eca769b5a2 David Howells 2021-10-21  599  				    cachefiles_has_space_for_write);
047487c947e8b9 David Howells 2021-10-21  600  }
047487c947e8b9 David Howells 2021-10-21  601  

:::::: The code at line 552 was first introduced by commit
:::::: 047487c947e8b96b94579c3a33207bd4e266b4c6 cachefiles: Implement the I/O routines

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
