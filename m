Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688D32F6186
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 15:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765466232; cv=none; b=dMbvUV3R9G72vojuXpz+TWL9pOLIsmjHpmT1zA8SFyuJoCBsb824SF42kVHKsT/fmXIP1NoA6KdtNACyuFYj1hkOJiDdrljat5rKAyQ0CRpvVX3y4HzI6HLV6kfynbMCH7a7ssjWSNDX5KmA32N6dT4OcZnMcHKEJ/mLJcsZdS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765466232; c=relaxed/simple;
	bh=u26xq0YLyKX/dv3tG22CsfneEDUbIAzSN/EYMxYKzp4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lMBSYWmqMe+fYKiAXQvFTCacfI9JM5lH6o38BWOkN2Ne7RU+VpmHuej+VLdPliu+4czqONnhUInTHSBgpGCa2MubOSix6hBLHW3PB7kNNZuVMXuqjXAV1Be6wLNhfWET9anAYaEY3IKULcijSRBRaDGAwZAU8ce5kj403QwSWlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SgBkIAuH; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SgBkIAuH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765466230; x=1797002230;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u26xq0YLyKX/dv3tG22CsfneEDUbIAzSN/EYMxYKzp4=;
  b=SgBkIAuH+mEMAAzEx9GrbZWPBChTYR96Agq+3LZkTASfMCZIqoZnMogW
   iUatKvFWWHV6QW7JvgTaHmK2D0DK1p3KKsyrrDIFVMCPuT9kJ2jHZIFlz
   MQ61qJIasIlLMtufct5p8+NsbBZVRjoD7hi5UIopYHDst20TlltcR9I+C
   6v4WKfg290BXsUbI/KMSyFRBlsK7PvuZ9wpaK7Qy8f24fDNZKlssnSyEW
   +aBjwbFiR3Kvf8dVIXVFPRyEWxaCUVI49uFWOWfhLNAKleDTc/TmsNl8Z
   AXId/A3gp+7VszcckFfFSewUGhrPSGKoL0+q+mBhRMhDSnKf0OJmiCt31
   w==;
X-CSE-ConnectionGUID: b0PHqtgXSlS3Oi1eIhS0pQ==
X-CSE-MsgGUID: 8YQ/gsyeT1GhggNyDFR+ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="71297272"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="71297272"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 07:17:09 -0800
X-CSE-ConnectionGUID: OFzHKCXlTpq/tWvRmWs27w==
X-CSE-MsgGUID: i08ptXPnQZyajJYF1sbtsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="196594125"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Dec 2025 07:17:08 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTiPi-000000004oD-1ODk;
	Thu, 11 Dec 2025 15:17:06 +0000
Date: Thu, 11 Dec 2025 23:17:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-10 1/1] net/tls/tls_sw.c:222:58:
 warning: suggest braces around empty body in an 'if' statement
Message-ID: <202512112356.khlD3NVV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Pengtao,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-10
head:   3e3c7bca8549a532ba83b4d8e1a732e1cc234d20
commit: efb52cd9204331ad36bf9c815e513f0c1adfa7d4 [1/1] ANDROID: GKI: enable CONFIG_TLS=m as a GKI module
config: arm-randconfig-001-20251211 (https://download.01.org/0day-ci/archive/20251211/202512112356.khlD3NVV-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512112356.khlD3NVV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512112356.khlD3NVV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/tls/tls_sw.c: In function 'tls_decrypt_done':
>> net/tls/tls_sw.c:222:58: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
       TLS_INC_STATS(sock_net(sk), LINUX_MIB_TLSDECRYPTERROR);
                                                             ^
   net/tls/tls_sw.c: In function 'tls_decrypt_sw':
   net/tls/tls_sw.c:1645:58: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
       TLS_INC_STATS(sock_net(sk), LINUX_MIB_TLSDECRYPTERROR);
                                                             ^
   net/tls/tls_sw.c:1655:57: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
       TLS_INC_STATS(sock_net(sk), LINUX_MIB_TLSRXNOPADVIOL);
                                                            ^


vim +/if +222 net/tls/tls_sw.c

130b392c6cd6b2a Dave Watson     2019-01-30  186  
8580e55aa85f500 Herbert Xu      2023-02-06  187  static void tls_decrypt_done(void *data, int err)
94524d8fc965a7a Vakul Garg      2018-08-29  188  {
8580e55aa85f500 Herbert Xu      2023-02-06  189  	struct aead_request *aead_req = data;
8d338c76f7cfe0e Herbert Xu      2023-02-06  190  	struct crypto_aead *aead = crypto_aead_reqtfm(aead_req);
94524d8fc965a7a Vakul Garg      2018-08-29  191  	struct scatterlist *sgout = aead_req->dst;
7a3dd8c8979ce48 John Fastabend  2018-09-14  192  	struct tls_sw_context_rx *ctx;
8d338c76f7cfe0e Herbert Xu      2023-02-06  193  	struct tls_decrypt_ctx *dctx;
7a3dd8c8979ce48 John Fastabend  2018-09-14  194  	struct tls_context *tls_ctx;
94524d8fc965a7a Vakul Garg      2018-08-29  195  	struct scatterlist *sg;
94524d8fc965a7a Vakul Garg      2018-08-29  196  	unsigned int pages;
6ececdc5136900b Jakub Kicinski  2022-07-14  197  	struct sock *sk;
8d338c76f7cfe0e Herbert Xu      2023-02-06  198  	int aead_size;
8d338c76f7cfe0e Herbert Xu      2023-02-06  199  
13eca403876bbea Jakub Kicinski  2024-02-06  200  	/* If requests get too backlogged crypto API returns -EBUSY and calls
13eca403876bbea Jakub Kicinski  2024-02-06  201  	 * ->complete(-EINPROGRESS) immediately followed by ->complete(0)
13eca403876bbea Jakub Kicinski  2024-02-06  202  	 * to make waiting for backlog to flush with crypto_wait_req() easier.
13eca403876bbea Jakub Kicinski  2024-02-06  203  	 * First wait converts -EBUSY -> -EINPROGRESS, and the second one
13eca403876bbea Jakub Kicinski  2024-02-06  204  	 * -EINPROGRESS -> 0.
13eca403876bbea Jakub Kicinski  2024-02-06  205  	 * We have a single struct crypto_async_request per direction, this
13eca403876bbea Jakub Kicinski  2024-02-06  206  	 * scheme doesn't help us, so just ignore the first ->complete().
13eca403876bbea Jakub Kicinski  2024-02-06  207  	 */
13eca403876bbea Jakub Kicinski  2024-02-06  208  	if (err == -EINPROGRESS)
13eca403876bbea Jakub Kicinski  2024-02-06  209  		return;
13eca403876bbea Jakub Kicinski  2024-02-06  210  
8d338c76f7cfe0e Herbert Xu      2023-02-06  211  	aead_size = sizeof(*aead_req) + crypto_aead_reqsize(aead);
8d338c76f7cfe0e Herbert Xu      2023-02-06  212  	aead_size = ALIGN(aead_size, __alignof__(*dctx));
8d338c76f7cfe0e Herbert Xu      2023-02-06  213  	dctx = (void *)((u8 *)aead_req + aead_size);
7a3dd8c8979ce48 John Fastabend  2018-09-14  214  
8d338c76f7cfe0e Herbert Xu      2023-02-06  215  	sk = dctx->sk;
6ececdc5136900b Jakub Kicinski  2022-07-14  216  	tls_ctx = tls_get_ctx(sk);
7a3dd8c8979ce48 John Fastabend  2018-09-14  217  	ctx = tls_sw_ctx_rx(tls_ctx);
94524d8fc965a7a Vakul Garg      2018-08-29  218  
94524d8fc965a7a Vakul Garg      2018-08-29  219  	/* Propagate if there was an err */
94524d8fc965a7a Vakul Garg      2018-08-29  220  	if (err) {
5c5ec66858062a8 Jakub Kicinski  2019-10-04  221  		if (err == -EBADMSG)
6ececdc5136900b Jakub Kicinski  2022-07-14 @222  			TLS_INC_STATS(sock_net(sk), LINUX_MIB_TLSDECRYPTERROR);
94524d8fc965a7a Vakul Garg      2018-08-29  223  		ctx->async_wait.err = err;
6ececdc5136900b Jakub Kicinski  2022-07-14  224  		tls_err_abort(sk, err);
94524d8fc965a7a Vakul Garg      2018-08-29  225  	}
94524d8fc965a7a Vakul Garg      2018-08-29  226  
692d7b5d1f9125a Vakul Garg      2019-01-16  227  	/* Free the destination pages if skb was not decrypted inplace */
d684763534b969c Sabrina Dubroca 2024-02-06  228  	if (dctx->free_sgout) {
94524d8fc965a7a Vakul Garg      2018-08-29  229  		/* Skip the first S/G entry as it points to AAD */
94524d8fc965a7a Vakul Garg      2018-08-29  230  		for_each_sg(sg_next(sgout), sg, UINT_MAX, pages) {
94524d8fc965a7a Vakul Garg      2018-08-29  231  			if (!sg)
94524d8fc965a7a Vakul Garg      2018-08-29  232  				break;
94524d8fc965a7a Vakul Garg      2018-08-29  233  			put_page(sg_page(sg));
94524d8fc965a7a Vakul Garg      2018-08-29  234  		}
692d7b5d1f9125a Vakul Garg      2019-01-16  235  	}
94524d8fc965a7a Vakul Garg      2018-08-29  236  
94524d8fc965a7a Vakul Garg      2018-08-29  237  	kfree(aead_req);
94524d8fc965a7a Vakul Garg      2018-08-29  238  
86dc27ee36f558f Jakub Kicinski  2024-02-06  239  	if (atomic_dec_and_test(&ctx->decrypt_pending))
94524d8fc965a7a Vakul Garg      2018-08-29  240  		complete(&ctx->async_wait.completion);
94524d8fc965a7a Vakul Garg      2018-08-29  241  }
94524d8fc965a7a Vakul Garg      2018-08-29  242  

:::::: The code at line 222 was first introduced by commit
:::::: 6ececdc5136900bc99ef04c60c9daeab86dbeb85 tls: rx: async: adjust record geometry immediately

:::::: TO: Jakub Kicinski <kuba@kernel.org>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
