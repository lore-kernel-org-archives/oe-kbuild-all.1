Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831233C0C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Dec 2024 04:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734582090; cv=none; b=QpWDexUycWawOnCupnZl1iF2kFNXZoX0Fy9XvfxbEP7V/0a7v+HDyrcM5S1ZeSh9hBM5O8+TqtqyV04PT5akWhdc2FJsTUTqMMZZCabuiGKS+Lv5jJgVV71c/bd3pMu+K/ezonXX1wXH2EY6HZtf4IV0pO30QvfU1fRUIDIryJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734582090; c=relaxed/simple;
	bh=aiJ051tnT73XnNLeYX7Vo5oxNNAN9C+CY5CZVx2nxdg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KDAgNtNWrQfpwcqgJ0sxg+nFExsHl9kVzXzWmIz+tRPMHd8rKu/cArMz2judo06dM0P+D0NaCojk/R3rQZidnGQrAE84o3oe+nBi1/qO5NLSGfTZKiFf5HbP0EhaEln9SD8kwkKa1gqXoaT5VboQ5LKh2pUcr2gdW1I1uKFXpDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D0Bqpw4Q; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D0Bqpw4Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734582089; x=1766118089;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aiJ051tnT73XnNLeYX7Vo5oxNNAN9C+CY5CZVx2nxdg=;
  b=D0Bqpw4QfR76D8dGdkGbKqcvYyWHMlzyyYtnusLH4RyiFjF7Tal8eUZI
   V+c7FE/QWagmdfo6sZHjJTOYhbsEOF+dcKLB2FjABkgdzseHUX4shkCQS
   awVsrNN5M7L1u+LpX6Igo+LD2n9og0Pjy9wLVA8D1jBI9aOGDk22dlzLg
   rEDlLTIxs5ESyfFkMnBln6NMos1xeKhN03KgroSDH3W7dDrkZifWhoyFL
   LYV+yc2KPjd23igZyI4Z2tDey1DLKQo9RZD09J7yELXoSukoOzrY+YDc5
   6klgvsqgrH9niEzVwEuTsysDYlcMxL7+y1lmoldPakUYpBfEc28BN78mz
   Q==;
X-CSE-ConnectionGUID: GWR2Sto0Sm2uu2E4e+z4yA==
X-CSE-MsgGUID: cCr/m9bHSWSAp1+z6zkbqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="34803976"
X-IronPort-AV: E=Sophos;i="6.12,246,1728975600"; 
   d="scan'208";a="34803976"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 20:21:29 -0800
X-CSE-ConnectionGUID: Vw3/xXugTMiQD1LIx8xejw==
X-CSE-MsgGUID: fLWuCEQYS1qp7ZJujsGYxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="98554279"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 18 Dec 2024 20:21:27 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tO82O-00002Z-2s;
	Thu, 19 Dec 2024 04:21:24 +0000
Date: Thu, 19 Dec 2024 12:20:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/2] net/tls/tls_sw.c:222:79: warning:
 suggest braces around empty body in an 'if' statement
Message-ID: <202412191259.lSKk9QVp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   46493cec9a6b1cb86ffee1743a1ae14d479f90cd
commit: efb52cd9204331ad36bf9c815e513f0c1adfa7d4 [1/2] ANDROID: GKI: enable CONFIG_TLS=m as a GKI module
config: x86_64-buildonly-randconfig-005-20241219 (https://download.01.org/0day-ci/archive/20241219/202412191259.lSKk9QVp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241219/202412191259.lSKk9QVp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412191259.lSKk9QVp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/tls/tls_sw.c: In function 'tls_decrypt_done':
>> net/tls/tls_sw.c:222:79: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     222 |                         TLS_INC_STATS(sock_net(sk), LINUX_MIB_TLSDECRYPTERROR);
         |                                                                               ^
   net/tls/tls_sw.c: In function 'tls_decrypt_sw':
   net/tls/tls_sw.c:1645:79: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
    1645 |                         TLS_INC_STATS(sock_net(sk), LINUX_MIB_TLSDECRYPTERROR);
         |                                                                               ^
   net/tls/tls_sw.c:1655:78: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
    1655 |                         TLS_INC_STATS(sock_net(sk), LINUX_MIB_TLSRXNOPADVIOL);
         |                                                                              ^


vim +/if +222 net/tls/tls_sw.c

130b392c6cd6b2 Dave Watson     2019-01-30  186  
8580e55aa85f50 Herbert Xu      2023-02-06  187  static void tls_decrypt_done(void *data, int err)
94524d8fc965a7 Vakul Garg      2018-08-29  188  {
8580e55aa85f50 Herbert Xu      2023-02-06  189  	struct aead_request *aead_req = data;
8d338c76f7cfe0 Herbert Xu      2023-02-06  190  	struct crypto_aead *aead = crypto_aead_reqtfm(aead_req);
94524d8fc965a7 Vakul Garg      2018-08-29  191  	struct scatterlist *sgout = aead_req->dst;
7a3dd8c8979ce4 John Fastabend  2018-09-14  192  	struct tls_sw_context_rx *ctx;
8d338c76f7cfe0 Herbert Xu      2023-02-06  193  	struct tls_decrypt_ctx *dctx;
7a3dd8c8979ce4 John Fastabend  2018-09-14  194  	struct tls_context *tls_ctx;
94524d8fc965a7 Vakul Garg      2018-08-29  195  	struct scatterlist *sg;
94524d8fc965a7 Vakul Garg      2018-08-29  196  	unsigned int pages;
6ececdc5136900 Jakub Kicinski  2022-07-14  197  	struct sock *sk;
8d338c76f7cfe0 Herbert Xu      2023-02-06  198  	int aead_size;
8d338c76f7cfe0 Herbert Xu      2023-02-06  199  
13eca403876bbe Jakub Kicinski  2024-02-06  200  	/* If requests get too backlogged crypto API returns -EBUSY and calls
13eca403876bbe Jakub Kicinski  2024-02-06  201  	 * ->complete(-EINPROGRESS) immediately followed by ->complete(0)
13eca403876bbe Jakub Kicinski  2024-02-06  202  	 * to make waiting for backlog to flush with crypto_wait_req() easier.
13eca403876bbe Jakub Kicinski  2024-02-06  203  	 * First wait converts -EBUSY -> -EINPROGRESS, and the second one
13eca403876bbe Jakub Kicinski  2024-02-06  204  	 * -EINPROGRESS -> 0.
13eca403876bbe Jakub Kicinski  2024-02-06  205  	 * We have a single struct crypto_async_request per direction, this
13eca403876bbe Jakub Kicinski  2024-02-06  206  	 * scheme doesn't help us, so just ignore the first ->complete().
13eca403876bbe Jakub Kicinski  2024-02-06  207  	 */
13eca403876bbe Jakub Kicinski  2024-02-06  208  	if (err == -EINPROGRESS)
13eca403876bbe Jakub Kicinski  2024-02-06  209  		return;
13eca403876bbe Jakub Kicinski  2024-02-06  210  
8d338c76f7cfe0 Herbert Xu      2023-02-06  211  	aead_size = sizeof(*aead_req) + crypto_aead_reqsize(aead);
8d338c76f7cfe0 Herbert Xu      2023-02-06  212  	aead_size = ALIGN(aead_size, __alignof__(*dctx));
8d338c76f7cfe0 Herbert Xu      2023-02-06  213  	dctx = (void *)((u8 *)aead_req + aead_size);
7a3dd8c8979ce4 John Fastabend  2018-09-14  214  
8d338c76f7cfe0 Herbert Xu      2023-02-06  215  	sk = dctx->sk;
6ececdc5136900 Jakub Kicinski  2022-07-14  216  	tls_ctx = tls_get_ctx(sk);
7a3dd8c8979ce4 John Fastabend  2018-09-14  217  	ctx = tls_sw_ctx_rx(tls_ctx);
94524d8fc965a7 Vakul Garg      2018-08-29  218  
94524d8fc965a7 Vakul Garg      2018-08-29  219  	/* Propagate if there was an err */
94524d8fc965a7 Vakul Garg      2018-08-29  220  	if (err) {
5c5ec66858062a Jakub Kicinski  2019-10-04  221  		if (err == -EBADMSG)
6ececdc5136900 Jakub Kicinski  2022-07-14 @222  			TLS_INC_STATS(sock_net(sk), LINUX_MIB_TLSDECRYPTERROR);
94524d8fc965a7 Vakul Garg      2018-08-29  223  		ctx->async_wait.err = err;
6ececdc5136900 Jakub Kicinski  2022-07-14  224  		tls_err_abort(sk, err);
94524d8fc965a7 Vakul Garg      2018-08-29  225  	}
94524d8fc965a7 Vakul Garg      2018-08-29  226  
692d7b5d1f9125 Vakul Garg      2019-01-16  227  	/* Free the destination pages if skb was not decrypted inplace */
d684763534b969 Sabrina Dubroca 2024-02-06  228  	if (dctx->free_sgout) {
94524d8fc965a7 Vakul Garg      2018-08-29  229  		/* Skip the first S/G entry as it points to AAD */
94524d8fc965a7 Vakul Garg      2018-08-29  230  		for_each_sg(sg_next(sgout), sg, UINT_MAX, pages) {
94524d8fc965a7 Vakul Garg      2018-08-29  231  			if (!sg)
94524d8fc965a7 Vakul Garg      2018-08-29  232  				break;
94524d8fc965a7 Vakul Garg      2018-08-29  233  			put_page(sg_page(sg));
94524d8fc965a7 Vakul Garg      2018-08-29  234  		}
692d7b5d1f9125 Vakul Garg      2019-01-16  235  	}
94524d8fc965a7 Vakul Garg      2018-08-29  236  
94524d8fc965a7 Vakul Garg      2018-08-29  237  	kfree(aead_req);
94524d8fc965a7 Vakul Garg      2018-08-29  238  
86dc27ee36f558 Jakub Kicinski  2024-02-06  239  	if (atomic_dec_and_test(&ctx->decrypt_pending))
94524d8fc965a7 Vakul Garg      2018-08-29  240  		complete(&ctx->async_wait.completion);
94524d8fc965a7 Vakul Garg      2018-08-29  241  }
94524d8fc965a7 Vakul Garg      2018-08-29  242  

:::::: The code at line 222 was first introduced by commit
:::::: 6ececdc5136900bc99ef04c60c9daeab86dbeb85 tls: rx: async: adjust record geometry immediately

:::::: TO: Jakub Kicinski <kuba@kernel.org>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
