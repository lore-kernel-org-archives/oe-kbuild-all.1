Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F905D268
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Feb 2024 08:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708850285; cv=none; b=gvjl7HqR2xiXU3dESgYsp103iueXUIzZ7lH0BUikj0RURJUSP1iK9ZUV/+AanNw7YdgZTcgW6tR57ETVPhK1+oTnk+XAQFiRjoOgQBm+9odSmLYtEw2yoPKKYvw/zG1QzMdUce7Q8KSu0x1mliYgt39FYrbGCacRLY8kb0QG1MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708850285; c=relaxed/simple;
	bh=8byukRpzLiyQv2a3d9k0TepElpm0FK2ebz6UQzOPSG0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KoekrDB90isplyk14IjRDGSKKMVZft2AXizjyZ1wnQrAQHuHbwIUsRP/k4iWAWk2JllY6DE/DpjWUNyNKAUuHo4aummjeTt7HTBq1EOFtvL8EbnGM3nWWiN2CL2D67+IkRQC+ZI8/4xAo2E5ILPIrrqSPKPGOsDRPDJ+6EkFhVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=egJM2o2r; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="egJM2o2r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708850283; x=1740386283;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8byukRpzLiyQv2a3d9k0TepElpm0FK2ebz6UQzOPSG0=;
  b=egJM2o2rX1cr2poKraImJf+SmvOtCDYTfDMoyEbfdwQeFO3x3mHv/L2a
   kEYo959sNlMuEPbxxGMgZVUHaCwcwvp6XaGMT/QNki1R/XISak6T+abdG
   nGB6XXWfxXs3yzXhtTHxI2w7+emI58s94w07a6c5YpseCzjDf6mVq7LKS
   rKvDciHwcYtFDKt+Axq4QtWy+XT61yXOCSAQ+WjTQBvT/x1Dy92VGdXu+
   sSNmMMrOxnkd7DJawT3Vm0gDAp1Pan9hWohSJUJZGanBwP4d0soDrMKuh
   R4d8FDQDfj5n6xHkHsw3y1IjwMbXCOz/ln5apQNMWThpzAxMuJKrVI4r6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10994"; a="6960471"
X-IronPort-AV: E=Sophos;i="6.06,183,1705392000"; 
   d="scan'208";a="6960471"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2024 00:38:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,183,1705392000"; 
   d="scan'208";a="6339423"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 25 Feb 2024 00:38:01 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1reA1G-0009QG-1V;
	Sun, 25 Feb 2024 08:37:58 +0000
Date: Sun, 25 Feb 2024 16:37:02 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 17/36] lib/kfifo.c:612:1: error: unterminated
 argument list invoking macro "min"
Message-ID: <202402251602.O3ioAcfF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   e82f2321b99bd2f2be296a5b11b13e4f93ccff16
commit: 645f6bd2ca34618d51230ba60cc508b26131a814 [17/36] kfifo: add kfifo_out_linear{,_ptr}()
config: i386-buildonly-randconfig-002-20240225 (https://download.01.org/0day-ci/archive/20240225/202402251602.O3ioAcfF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240225/202402251602.O3ioAcfF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402251602.O3ioAcfF-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   lib/kfifo.c: In function '__kfifo_out_linear_r':
>> lib/kfifo.c:612:1: error: unterminated argument list invoking macro "min"
     612 | 
         | ^
>> lib/kfifo.c:500:16: error: 'min' undeclared (first use in this function)
     500 |         return min(n, __kfifo_peek_n(fifo, recsize);
         |                ^~~
   lib/kfifo.c:500:16: note: each undeclared identifier is reported only once for each function it appears in
>> lib/kfifo.c:500:19: error: expected ';' at end of input
     500 |         return min(n, __kfifo_peek_n(fifo, recsize);
         |                   ^
         |                   ;
   ......
>> lib/kfifo.c:500:9: error: expected declaration or statement at end of input
     500 |         return min(n, __kfifo_peek_n(fifo, recsize);
         |         ^~~~~~
>> lib/kfifo.c:613: warning: control reaches end of non-void function [-Wreturn-type]


vim +/min +612 lib/kfifo.c

a121f24accac16 kernel/kfifo.c Stefani Seibold   2009-12-21  490  
645f6bd2ca3461 lib/kfifo.c    Jiri Slaby (SUSE  2024-02-23  491) unsigned int __kfifo_out_linear_r(struct __kfifo *fifo,
645f6bd2ca3461 lib/kfifo.c    Jiri Slaby (SUSE  2024-02-23  492) 		unsigned int *tail, unsigned int n, size_t recsize)
645f6bd2ca3461 lib/kfifo.c    Jiri Slaby (SUSE  2024-02-23  493) {
645f6bd2ca3461 lib/kfifo.c    Jiri Slaby (SUSE  2024-02-23  494) 	if (fifo->in == fifo->out)
645f6bd2ca3461 lib/kfifo.c    Jiri Slaby (SUSE  2024-02-23  495) 		return 0;
645f6bd2ca3461 lib/kfifo.c    Jiri Slaby (SUSE  2024-02-23  496) 
645f6bd2ca3461 lib/kfifo.c    Jiri Slaby (SUSE  2024-02-23  497) 	if (tail)
645f6bd2ca3461 lib/kfifo.c    Jiri Slaby (SUSE  2024-02-23  498) 		*tail = fifo->out + recsize;
645f6bd2ca3461 lib/kfifo.c    Jiri Slaby (SUSE  2024-02-23  499) 
645f6bd2ca3461 lib/kfifo.c    Jiri Slaby (SUSE  2024-02-23 @500) 	return min(n, __kfifo_peek_n(fifo, recsize);
645f6bd2ca3461 lib/kfifo.c    Jiri Slaby (SUSE  2024-02-23  501) }
645f6bd2ca3461 lib/kfifo.c    Jiri Slaby (SUSE  2024-02-23  502) EXPORT_SYMBOL(__kfifo_out_linear_r);
645f6bd2ca3461 lib/kfifo.c    Jiri Slaby (SUSE  2024-02-23  503) 
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  504  unsigned int __kfifo_out_r(struct __kfifo *fifo, void *buf,
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  505  		unsigned int len, size_t recsize)
86d48803136038 kernel/kfifo.c Stefani Seibold   2009-12-21  506  {
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  507  	unsigned int n;
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  508  
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  509  	if (fifo->in == fifo->out)
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  510  		return 0;
a121f24accac16 kernel/kfifo.c Stefani Seibold   2009-12-21  511  
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  512  	len = kfifo_out_copy_r(fifo, buf, len, recsize, &n);
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  513  	fifo->out += n + recsize;
86d48803136038 kernel/kfifo.c Stefani Seibold   2009-12-21  514  	return len;
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  515  }
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  516  EXPORT_SYMBOL(__kfifo_out_r);
a121f24accac16 kernel/kfifo.c Stefani Seibold   2009-12-21  517  
b35de43b310408 kernel/kfifo.c Andrea Righi      2010-08-19  518  void __kfifo_skip_r(struct __kfifo *fifo, size_t recsize)
b35de43b310408 kernel/kfifo.c Andrea Righi      2010-08-19  519  {
b35de43b310408 kernel/kfifo.c Andrea Righi      2010-08-19  520  	unsigned int n;
b35de43b310408 kernel/kfifo.c Andrea Righi      2010-08-19  521  
b35de43b310408 kernel/kfifo.c Andrea Righi      2010-08-19  522  	n = __kfifo_peek_n(fifo, recsize);
b35de43b310408 kernel/kfifo.c Andrea Righi      2010-08-19  523  	fifo->out += n + recsize;
b35de43b310408 kernel/kfifo.c Andrea Righi      2010-08-19  524  }
b35de43b310408 kernel/kfifo.c Andrea Righi      2010-08-19  525  EXPORT_SYMBOL(__kfifo_skip_r);
b35de43b310408 kernel/kfifo.c Andrea Righi      2010-08-19  526  
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  527  int __kfifo_from_user_r(struct __kfifo *fifo, const void __user *from,
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  528  	unsigned long len, unsigned int *copied, size_t recsize)
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  529  {
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  530  	unsigned long ret;
a121f24accac16 kernel/kfifo.c Stefani Seibold   2009-12-21  531  
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  532  	len = __kfifo_max_r(len, recsize);
a121f24accac16 kernel/kfifo.c Stefani Seibold   2009-12-21  533  
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  534  	if (len + recsize > kfifo_unused(fifo)) {
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  535  		*copied = 0;
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  536  		return 0;
86d48803136038 kernel/kfifo.c Stefani Seibold   2009-12-21  537  	}
a121f24accac16 kernel/kfifo.c Stefani Seibold   2009-12-21  538  
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  539  	__kfifo_poke_n(fifo, len, recsize);
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  540  
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  541  	ret = kfifo_copy_from_user(fifo, from, len, fifo->in + recsize, copied);
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  542  	if (unlikely(ret)) {
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  543  		*copied = 0;
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  544  		return -EFAULT;
a121f24accac16 kernel/kfifo.c Stefani Seibold   2009-12-21  545  	}
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  546  	fifo->in += len + recsize;
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  547  	return 0;
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  548  }
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  549  EXPORT_SYMBOL(__kfifo_from_user_r);
a121f24accac16 kernel/kfifo.c Stefani Seibold   2009-12-21  550  
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  551  int __kfifo_to_user_r(struct __kfifo *fifo, void __user *to,
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  552  	unsigned long len, unsigned int *copied, size_t recsize)
86d48803136038 kernel/kfifo.c Stefani Seibold   2009-12-21  553  {
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  554  	unsigned long ret;
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  555  	unsigned int n;
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  556  
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  557  	if (fifo->in == fifo->out) {
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  558  		*copied = 0;
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  559  		return 0;
86d48803136038 kernel/kfifo.c Stefani Seibold   2009-12-21  560  	}
86d48803136038 kernel/kfifo.c Stefani Seibold   2009-12-21  561  
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  562  	n = __kfifo_peek_n(fifo, recsize);
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  563  	if (len > n)
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  564  		len = n;
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  565  
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  566  	ret = kfifo_copy_to_user(fifo, to, len, fifo->out + recsize, copied);
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  567  	if (unlikely(ret)) {
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  568  		*copied = 0;
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  569  		return -EFAULT;
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  570  	}
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  571  	fifo->out += n + recsize;
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  572  	return 0;
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  573  }
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  574  EXPORT_SYMBOL(__kfifo_to_user_r);
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  575  
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  576  unsigned int __kfifo_dma_in_prepare_r(struct __kfifo *fifo,
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  577  	struct scatterlist *sgl, int nents, unsigned int len, size_t recsize)
86d48803136038 kernel/kfifo.c Stefani Seibold   2009-12-21  578  {
89b3ac63013e64 lib/kfifo.c    Himangi Saraogi   2014-08-08  579  	BUG_ON(!nents);
86d48803136038 kernel/kfifo.c Stefani Seibold   2009-12-21  580  
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  581  	len = __kfifo_max_r(len, recsize);
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  582  
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  583  	if (len + recsize > kfifo_unused(fifo))
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  584  		return 0;
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  585  
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  586  	return setup_sgl(fifo, sgl, nents, len, fifo->in + recsize);
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  587  }
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  588  EXPORT_SYMBOL(__kfifo_dma_in_prepare_r);
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  589  
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  590  void __kfifo_dma_in_finish_r(struct __kfifo *fifo,
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  591  	unsigned int len, size_t recsize)
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  592  {
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  593  	len = __kfifo_max_r(len, recsize);
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  594  	__kfifo_poke_n(fifo, len, recsize);
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  595  	fifo->in += len + recsize;
86d48803136038 kernel/kfifo.c Stefani Seibold   2009-12-21  596  }
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  597  EXPORT_SYMBOL(__kfifo_dma_in_finish_r);
86d48803136038 kernel/kfifo.c Stefani Seibold   2009-12-21  598  
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  599  unsigned int __kfifo_dma_out_prepare_r(struct __kfifo *fifo,
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  600  	struct scatterlist *sgl, int nents, unsigned int len, size_t recsize)
86d48803136038 kernel/kfifo.c Stefani Seibold   2009-12-21  601  {
89b3ac63013e64 lib/kfifo.c    Himangi Saraogi   2014-08-08  602  	BUG_ON(!nents);
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  603  
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  604  	len = __kfifo_max_r(len, recsize);
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  605  
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  606  	if (len + recsize > fifo->in - fifo->out)
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  607  		return 0;
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  608  
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  609  	return setup_sgl(fifo, sgl, nents, len, fifo->out + recsize);
86d48803136038 kernel/kfifo.c Stefani Seibold   2009-12-21  610  }
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10  611  EXPORT_SYMBOL(__kfifo_dma_out_prepare_r);
2e956fb320568c kernel/kfifo.c Stefani Seibold   2010-08-10 @612  

:::::: The code at line 612 was first introduced by commit
:::::: 2e956fb320568cc70861761483e2f0e2db75fd66 kfifo: replace the old non generic API

:::::: TO: Stefani Seibold <stefani@seibold.net>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
