Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBFB3D6CCF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 08:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774342546; cv=none; b=bZEuEgDqFaKJuIKGtAvnWE7BAXaKF6nVgUqm8/5V1bUYCnwrI8PjXvVo9CRUrUtfpczVoinmlNzLBdgEtDkBIvjyzc0Mas9qevea73o+dJyRJsK899namYlljnRhPa1t8lUOUDCIUM9vsH3W7Yv0nIwfRGJM5ANe76/arl2i+Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774342546; c=relaxed/simple;
	bh=tYCCNgsvwxF8wN6GjMjlOwoecJduvroGO7JJtsGl+9s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UGX1w3hYehqz6r3DCoBXwvUHDO7m0d6D1uOXMK8RFM5n1DU5kxjePYpfe8HFa4hpkNXUaizhWhRaiWVxhhqRClaatJ9wISeg/btYjL7wdHJuSX5oxyQajjmawOj0YJ5Wzs+sdSMvgmv82Gfhh5sjJzTcFh+DNDaGEkPOacAFPls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PD+P0hN2; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PD+P0hN2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774342545; x=1805878545;
  h=date:from:to:cc:subject:message-id;
  bh=tYCCNgsvwxF8wN6GjMjlOwoecJduvroGO7JJtsGl+9s=;
  b=PD+P0hN24U+WK5D88l7WysFzGabM+29SpFe5x/ciFx3htiG5ggDk81kF
   YaCB8LLPDkauvah6SHY4nTeMxDPiovkegTmnxs/4tPQDU1XeYGzuRwDpQ
   TOuEKeedhRTNFMHEoT08UhhxWbHvN8L+h6q4Zc7P5idtl4aigzMGzLwYl
   hgh+1x4Rs76eGdG725haziUbiXksAvAiPRJNdinYtpBlBF6bSp8BOAuZk
   l0Y1cenbTvcjpvm3EA2BlIS0ctEhaiECStkcGfN087y8CHD/nY4EOqd3r
   at7UTfe0v4pE/FJokDvSnX8HEyCan2o2NfWQR6cQkABDse5hKkTs4AQ59
   A==;
X-CSE-ConnectionGUID: q9H9V+FMRa+/QusezoH7RA==
X-CSE-MsgGUID: 5tqDBCAvTsO6E3dKH2XBCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="86427419"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="86427419"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 01:55:45 -0700
X-CSE-ConnectionGUID: 9B8RrfqAR2y2YlPIU4LZDQ==
X-CSE-MsgGUID: RIBP/1uzSkeQRvvPJgPyyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="228775311"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 24 Mar 2026 01:55:43 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4xY4-000000004H2-2wGu;
	Tue, 24 Mar 2026 08:55:40 +0000
Date: Tue, 24 Mar 2026 16:55:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 3/3] net/tls/tls_sw.c:222:79:
 warning: suggest braces around empty body in an 'if' statement
Message-ID: <202603241655.0WsUuwrN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Pengtao,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   3a8949cdc45bfeb1a68ac0e70e90909c13d3910e
commit: efb52cd9204331ad36bf9c815e513f0c1adfa7d4 [3/3] ANDROID: GKI: enable CONFIG_TLS=m as a GKI module
config: arm64-randconfig-001-20260324 (https://download.01.org/0day-ci/archive/20260324/202603241655.0WsUuwrN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603241655.0WsUuwrN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603241655.0WsUuwrN-lkp@intel.com/

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
