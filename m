Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1432812FB1B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 14:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727447071; cv=none; b=UXe36f8VZp+VYL+s6FUjJ6H68RlDmX4I9/HlwrOUxEssfbHhyzHC8tEpatIqYeJkhSeVz3kj1hjQqh32jdht8B0qJXtDwhVZsKPIl9hu2OmXUenG7L8H7/xX8MKR7D4dqY5tnQAw3dlm/KECILaOK+8eXjzOmAluRdJLOgoyvwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727447071; c=relaxed/simple;
	bh=tFQIeSpP7Of36ziq4i21h+3JO+yxjRvMnhUhNmQzoYE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=goIeRJWrQUmIoS5K+cMFa+613y5VSu/0wLsZqp+5iabsa2aFwpshXhlyJGM3OmZZ8ngIiBmp1ejdW1D1XDiZgm8aqXIra6oPN5qpfF0W/DnG/KvtFcZwrPPGDQOzH7/AytTnAVwFwfnOcu8P97pmr8CET2HAiVhlDYAVhYOukyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EOY1IrLt; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EOY1IrLt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727447069; x=1758983069;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tFQIeSpP7Of36ziq4i21h+3JO+yxjRvMnhUhNmQzoYE=;
  b=EOY1IrLtOBYmPQ8UH3yKoB8Lg6lr2UrBkI1g6ACRkdrmXe6fJcMvSfpo
   uVnAK2vGF5fHavVC7JxjHyFlc3cV+ehMeKrmB1rZ+IbQRAVdonZjM4j+5
   pGuS20FaY2NR2Io8VgswYPBog7RfOQk2O3+JuvZ1xLWPaga8tZLeXdyYW
   q3hNMWxCJvmujUwXYISj1cfXuJm0eZdhx8RAZfCmp87XfyWEZQYW6Ip/f
   3XQiOAaTnRzv/jv1cGVejkzfXF8eLUpHmVAFlC/kLU0/9S0EwnGNqHK3A
   h49xRgeNz+F4bW2Neeer6Elr6c8GE2Opw9Cy5v5WuRcH31CfD/JtqMpOk
   g==;
X-CSE-ConnectionGUID: 46BAnnFSQTOgdiE/SCwtrw==
X-CSE-MsgGUID: DPHPDMcnSNeS0gxQoVpupg==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26464797"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="26464797"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 07:24:28 -0700
X-CSE-ConnectionGUID: fSxNBlKDRTuYSqFG4O8yeg==
X-CSE-MsgGUID: p9YkkCXlTu2xjmDKueqfGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="103357544"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 Sep 2024 07:24:25 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suBtP-000ME4-0h;
	Fri, 27 Sep 2024 14:24:23 +0000
Date: Fri, 27 Sep 2024 22:23:39 +0800
From: kernel test robot <lkp@intel.com>
To: Dhaval Shah <dhaval.r.shah@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS_2024.1_update 615/1001]
 crypto/algif_aead.c:71:undefined reference to `af_alg_sendmsg'
Message-ID: <202409272245.w7aTHfRF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS_2024.1_update
head:   5365c13a86998da06d845c918f849b30b8735538
commit: d8acda0778f572993e1eb7f22487ff20113ab13c [615/1001] crypto: xilinx: select AES GCM fallback and userspace kernel config
config: s390-randconfig-001-20240927 (https://download.01.org/0day-ci/archive/20240927/202409272245.w7aTHfRF-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409272245.w7aTHfRF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409272245.w7aTHfRF-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: crypto/algif_aead.o: in function `aead_sendmsg':
>> crypto/algif_aead.c:71:(.text+0x1b2): undefined reference to `af_alg_sendmsg'
   s390-linux-ld: crypto/algif_aead.o: in function `aead_sock_destruct':
>> crypto/algif_aead.c:517:(.text+0x29a): undefined reference to `af_alg_pull_tsgl'
>> s390-linux-ld: crypto/algif_aead.c:518:(.text+0x2b8): undefined reference to `sock_kzfree_s'
>> s390-linux-ld: crypto/algif_aead.c:519:(.text+0x2d6): undefined reference to `sock_kfree_s'
>> s390-linux-ld: crypto/algif_aead.c:520:(.text+0x2e0): undefined reference to `af_alg_release_parent'
   s390-linux-ld: crypto/algif_aead.o: in function `aead_accept_parent_nokey':
>> crypto/algif_aead.c:532:(.text+0x34a): undefined reference to `sock_kmalloc'
>> s390-linux-ld: crypto/algif_aead.c:537:(.text+0x36c): undefined reference to `sock_kmalloc'
   s390-linux-ld: crypto/algif_aead.c:539:(.text+0x398): undefined reference to `sock_kfree_s'
   s390-linux-ld: crypto/algif_aead.o: in function `lock_sock':
>> include/net/sock.h:1720:(.text+0x600): undefined reference to `lock_sock_nested'
   s390-linux-ld: crypto/algif_aead.o: in function `aead_check_key':
>> crypto/algif_aead.c:395:(.text+0x638): undefined reference to `lock_sock_nested'
>> s390-linux-ld: crypto/algif_aead.c:405:(.text+0x688): undefined reference to `release_sock'
   s390-linux-ld: crypto/algif_aead.c:407:(.text+0x692): undefined reference to `release_sock'
   s390-linux-ld: crypto/algif_aead.o: in function `_aead_recvmsg':
>> crypto/algif_aead.c:110:(.text+0x812): undefined reference to `af_alg_wait_for_data'
>> s390-linux-ld: crypto/algif_aead.c:153:(.text+0x9ba): undefined reference to `af_alg_alloc_areq'
>> s390-linux-ld: crypto/algif_aead.c:159:(.text+0x9f2): undefined reference to `af_alg_get_rsgl'
>> s390-linux-ld: crypto/algif_aead.c:231:(.text+0xbb4): undefined reference to `af_alg_pull_tsgl'
>> s390-linux-ld: crypto/algif_aead.c:252:(.text+0xbf8): undefined reference to `af_alg_count_tsgl'
   s390-linux-ld: crypto/algif_aead.c:256:(.text+0xc46): undefined reference to `sock_kmalloc'
   s390-linux-ld: crypto/algif_aead.c:266:(.text+0xca0): undefined reference to `af_alg_pull_tsgl'
   s390-linux-ld: crypto/algif_aead.o: in function `aead_request_set_callback':
>> include/crypto/aead.h:492:(.text+0xf1a): undefined reference to `af_alg_async_cb'
   s390-linux-ld: crypto/algif_aead.o: in function `sock_put':
>> include/net/sock.h:1989:(.text+0xfb0): undefined reference to `sk_free'
   s390-linux-ld: crypto/algif_aead.o: in function `_aead_recvmsg':
>> crypto/algif_aead.c:320:(.text+0x10a6): undefined reference to `af_alg_free_resources'
   s390-linux-ld: crypto/algif_aead.o: in function `lock_sock':
   include/net/sock.h:1720:(.text+0x1158): undefined reference to `lock_sock_nested'
   s390-linux-ld: crypto/algif_aead.o: in function `aead_recvmsg':
>> crypto/algif_aead.c:353:(.text+0x11ce): undefined reference to `af_alg_wmem_wakeup'
   s390-linux-ld: crypto/algif_aead.c:354:(.text+0x11d8): undefined reference to `release_sock'
   s390-linux-ld: crypto/algif_aead.o: in function `algif_aead_exit':
>> crypto/algif_aead.c:585:(.exit.text+0x1e): undefined reference to `af_alg_unregister_type'
   s390-linux-ld: crypto/algif_aead.o: in function `algif_aead_init':
   crypto/algif_aead.c:580:(.init.text+0x1e): undefined reference to `af_alg_register_type'
   s390-linux-ld: crypto/algif_aead.o:(.data.rel+0x10): undefined reference to `af_alg_release'
   s390-linux-ld: crypto/algif_aead.o:(.data.rel+0x18): undefined reference to `sock_no_bind'
   s390-linux-ld: crypto/algif_aead.o:(.data.rel+0x20): undefined reference to `sock_no_connect'
   s390-linux-ld: crypto/algif_aead.o:(.data.rel+0x28): undefined reference to `sock_no_socketpair'
   s390-linux-ld: crypto/algif_aead.o:(.data.rel+0x30): undefined reference to `sock_no_accept'
   s390-linux-ld: crypto/algif_aead.o:(.data.rel+0x38): undefined reference to `sock_no_getname'
   s390-linux-ld: crypto/algif_aead.o:(.data.rel+0x40): undefined reference to `af_alg_poll'
   s390-linux-ld: crypto/algif_aead.o:(.data.rel+0x48): undefined reference to `sock_no_ioctl'
   s390-linux-ld: crypto/algif_aead.o:(.data.rel+0x58): undefined reference to `sock_no_listen'
   s390-linux-ld: crypto/algif_aead.o:(.data.rel+0x60): undefined reference to `sock_no_shutdown'
   s390-linux-ld: crypto/algif_aead.o:(.data.rel+0x90): undefined reference to `sock_no_mmap'
   s390-linux-ld: crypto/algif_aead.o:(.data.rel+0xe8): undefined reference to `af_alg_release'
   s390-linux-ld: crypto/algif_aead.o:(.data.rel+0xf0): undefined reference to `sock_no_bind'
   s390-linux-ld: crypto/algif_aead.o:(.data.rel+0xf8): undefined reference to `sock_no_connect'
   s390-linux-ld: crypto/algif_aead.o:(.data.rel+0x100): undefined reference to `sock_no_socketpair'
   s390-linux-ld: crypto/algif_aead.o:(.data.rel+0x108): undefined reference to `sock_no_accept'
   s390-linux-ld: crypto/algif_aead.o:(.data.rel+0x110): undefined reference to `sock_no_getname'
   s390-linux-ld: crypto/algif_aead.o:(.data.rel+0x118): undefined reference to `af_alg_poll'
   s390-linux-ld: crypto/algif_aead.o:(.data.rel+0x120): undefined reference to `sock_no_ioctl'
   s390-linux-ld: crypto/algif_aead.o:(.data.rel+0x130): undefined reference to `sock_no_listen'
   s390-linux-ld: crypto/algif_aead.o:(.data.rel+0x138): undefined reference to `sock_no_shutdown'
   s390-linux-ld: crypto/algif_aead.o:(.data.rel+0x168): undefined reference to `sock_no_mmap'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CRYPTO_USER_API_AEAD
   Depends on [n]: CRYPTO [=y] && NET [=n]
   Selected by [y]:
   - CRYPTO_DEV_ZYNQMP_AES [=y] && CRYPTO [=y] && CRYPTO_HW [=y] && (ZYNQMP_FIRMWARE [=n] || COMPILE_TEST [=y])


vim +71 crypto/algif_aead.c

400c40cf78da00 Stephan Mueller  2015-02-28   60  
eccd02f32a2c25 Linus Torvalds   2015-04-15   61  static int aead_sendmsg(struct socket *sock, struct msghdr *msg, size_t size)
400c40cf78da00 Stephan Mueller  2015-02-28   62  {
400c40cf78da00 Stephan Mueller  2015-02-28   63  	struct sock *sk = sock->sk;
400c40cf78da00 Stephan Mueller  2015-02-28   64  	struct alg_sock *ask = alg_sk(sk);
d887c52d6ae43a Stephan Mueller  2017-06-25   65  	struct sock *psk = ask->parent;
d887c52d6ae43a Stephan Mueller  2017-06-25   66  	struct alg_sock *pask = alg_sk(psk);
d887c52d6ae43a Stephan Mueller  2017-06-25   67  	struct aead_tfm *aeadc = pask->private;
d887c52d6ae43a Stephan Mueller  2017-06-25   68  	struct crypto_aead *tfm = aeadc->aead;
d887c52d6ae43a Stephan Mueller  2017-06-25   69  	unsigned int ivsize = crypto_aead_ivsize(tfm);
400c40cf78da00 Stephan Mueller  2015-02-28   70  
2d97591ef43d05 Stephan Mueller  2017-08-02  @71  	return af_alg_sendmsg(sock, msg, size, ivsize);
83094e5e9e49f8 Tadeusz Struk    2016-03-11   72  }
83094e5e9e49f8 Tadeusz Struk    2016-03-11   73  
8d605398425843 Kees Cook        2018-09-18   74  static int crypto_aead_copy_sgl(struct crypto_sync_skcipher *null_tfm,
72548b093ee38a Stephan Mueller  2017-07-30   75  				struct scatterlist *src,
72548b093ee38a Stephan Mueller  2017-07-30   76  				struct scatterlist *dst, unsigned int len)
72548b093ee38a Stephan Mueller  2017-07-30   77  {
8d605398425843 Kees Cook        2018-09-18   78  	SYNC_SKCIPHER_REQUEST_ON_STACK(skreq, null_tfm);
72548b093ee38a Stephan Mueller  2017-07-30   79  
8d605398425843 Kees Cook        2018-09-18   80  	skcipher_request_set_sync_tfm(skreq, null_tfm);
cbdad1f246dd98 Herbert Xu       2020-07-31   81  	skcipher_request_set_callback(skreq, CRYPTO_TFM_REQ_MAY_SLEEP,
72548b093ee38a Stephan Mueller  2017-07-30   82  				      NULL, NULL);
72548b093ee38a Stephan Mueller  2017-07-30   83  	skcipher_request_set_crypt(skreq, src, dst, len, NULL);
72548b093ee38a Stephan Mueller  2017-07-30   84  
72548b093ee38a Stephan Mueller  2017-07-30   85  	return crypto_skcipher_encrypt(skreq);
72548b093ee38a Stephan Mueller  2017-07-30   86  }
72548b093ee38a Stephan Mueller  2017-07-30   87  
d887c52d6ae43a Stephan Mueller  2017-06-25   88  static int _aead_recvmsg(struct socket *sock, struct msghdr *msg,
d887c52d6ae43a Stephan Mueller  2017-06-25   89  			 size_t ignored, int flags)
400c40cf78da00 Stephan Mueller  2015-02-28   90  {
400c40cf78da00 Stephan Mueller  2015-02-28   91  	struct sock *sk = sock->sk;
400c40cf78da00 Stephan Mueller  2015-02-28   92  	struct alg_sock *ask = alg_sk(sk);
d887c52d6ae43a Stephan Mueller  2017-06-25   93  	struct sock *psk = ask->parent;
d887c52d6ae43a Stephan Mueller  2017-06-25   94  	struct alg_sock *pask = alg_sk(psk);
2d97591ef43d05 Stephan Mueller  2017-08-02   95  	struct af_alg_ctx *ctx = ask->private;
d887c52d6ae43a Stephan Mueller  2017-06-25   96  	struct aead_tfm *aeadc = pask->private;
d887c52d6ae43a Stephan Mueller  2017-06-25   97  	struct crypto_aead *tfm = aeadc->aead;
8d605398425843 Kees Cook        2018-09-18   98  	struct crypto_sync_skcipher *null_tfm = aeadc->null_tfm;
8e1fa89aa8bc28 Stephan Mueller  2017-11-10   99  	unsigned int i, as = crypto_aead_authsize(tfm);
2d97591ef43d05 Stephan Mueller  2017-08-02  100  	struct af_alg_async_req *areq;
8e1fa89aa8bc28 Stephan Mueller  2017-11-10  101  	struct af_alg_tsgl *tsgl, *tmp;
8e1fa89aa8bc28 Stephan Mueller  2017-11-10  102  	struct scatterlist *rsgl_src, *tsgl_src = NULL;
d887c52d6ae43a Stephan Mueller  2017-06-25  103  	int err = 0;
d887c52d6ae43a Stephan Mueller  2017-06-25  104  	size_t used = 0;		/* [in]  TX bufs to be en/decrypted */
d887c52d6ae43a Stephan Mueller  2017-06-25  105  	size_t outlen = 0;		/* [out] RX bufs produced by kernel */
d887c52d6ae43a Stephan Mueller  2017-06-25  106  	size_t usedpages = 0;		/* [in]  RX bufs to be used from user */
d887c52d6ae43a Stephan Mueller  2017-06-25  107  	size_t processed = 0;		/* [in]  TX bufs to be consumed */
400c40cf78da00 Stephan Mueller  2015-02-28  108  
f3c802a1f30013 Herbert Xu       2020-05-30  109  	if (!ctx->init || ctx->more) {
f3c802a1f30013 Herbert Xu       2020-05-30 @110  		err = af_alg_wait_for_data(sk, flags, 0);
11edb555966ed2 Stephan Mueller  2017-11-29  111  		if (err)
11edb555966ed2 Stephan Mueller  2017-11-29  112  			return err;
11edb555966ed2 Stephan Mueller  2017-11-29  113  	}
11edb555966ed2 Stephan Mueller  2017-11-29  114  
400c40cf78da00 Stephan Mueller  2015-02-28  115  	/*
bf63e250c4b1f2 David Howells    2023-06-06  116  	 * Data length provided by caller via sendmsg that has not yet been
bf63e250c4b1f2 David Howells    2023-06-06  117  	 * processed.
400c40cf78da00 Stephan Mueller  2015-02-28  118  	 */
400c40cf78da00 Stephan Mueller  2015-02-28  119  	used = ctx->used;
400c40cf78da00 Stephan Mueller  2015-02-28  120  
400c40cf78da00 Stephan Mueller  2015-02-28  121  	/*
bf63e250c4b1f2 David Howells    2023-06-06  122  	 * Make sure sufficient data is present -- note, the same check is also
bf63e250c4b1f2 David Howells    2023-06-06  123  	 * present in sendmsg. The checks in sendmsg shall provide an
bf63e250c4b1f2 David Howells    2023-06-06  124  	 * information to the data sender that something is wrong, but they are
bf63e250c4b1f2 David Howells    2023-06-06  125  	 * irrelevant to maintain the kernel integrity.  We need this check
bf63e250c4b1f2 David Howells    2023-06-06  126  	 * here too in case user space decides to not honor the error message
bf63e250c4b1f2 David Howells    2023-06-06  127  	 * in sendmsg and still call recvmsg. This check here protects the
bf63e250c4b1f2 David Howells    2023-06-06  128  	 * kernel integrity.
400c40cf78da00 Stephan Mueller  2015-02-28  129  	 */
d887c52d6ae43a Stephan Mueller  2017-06-25  130  	if (!aead_sufficient_data(sk))
d887c52d6ae43a Stephan Mueller  2017-06-25  131  		return -EINVAL;
400c40cf78da00 Stephan Mueller  2015-02-28  132  
0c1e16cd1ec419 Stephan Mueller  2016-12-05  133  	/*
0c1e16cd1ec419 Stephan Mueller  2016-12-05  134  	 * Calculate the minimum output buffer size holding the result of the
0c1e16cd1ec419 Stephan Mueller  2016-12-05  135  	 * cipher operation. When encrypting data, the receiving buffer is
0c1e16cd1ec419 Stephan Mueller  2016-12-05  136  	 * larger by the tag length compared to the input buffer as the
0c1e16cd1ec419 Stephan Mueller  2016-12-05  137  	 * encryption operation generates the tag. For decryption, the input
0c1e16cd1ec419 Stephan Mueller  2016-12-05  138  	 * buffer provides the tag which is consumed resulting in only the
0c1e16cd1ec419 Stephan Mueller  2016-12-05  139  	 * plaintext without a buffer for the tag returned to the caller.
0c1e16cd1ec419 Stephan Mueller  2016-12-05  140  	 */
0c1e16cd1ec419 Stephan Mueller  2016-12-05  141  	if (ctx->enc)
0c1e16cd1ec419 Stephan Mueller  2016-12-05  142  		outlen = used + as;
0c1e16cd1ec419 Stephan Mueller  2016-12-05  143  	else
0c1e16cd1ec419 Stephan Mueller  2016-12-05  144  		outlen = used - as;
19fa77522e45e3 Herbert Xu       2015-05-27  145  
400c40cf78da00 Stephan Mueller  2015-02-28  146  	/*
400c40cf78da00 Stephan Mueller  2015-02-28  147  	 * The cipher operation input data is reduced by the associated data
400c40cf78da00 Stephan Mueller  2015-02-28  148  	 * length as this data is processed separately later on.
400c40cf78da00 Stephan Mueller  2015-02-28  149  	 */
0c1e16cd1ec419 Stephan Mueller  2016-12-05  150  	used -= ctx->aead_assoclen;
400c40cf78da00 Stephan Mueller  2015-02-28  151  
d887c52d6ae43a Stephan Mueller  2017-06-25  152  	/* Allocate cipher request for current operation. */
2d97591ef43d05 Stephan Mueller  2017-08-02 @153  	areq = af_alg_alloc_areq(sk, sizeof(struct af_alg_async_req) +
2d97591ef43d05 Stephan Mueller  2017-08-02  154  				     crypto_aead_reqsize(tfm));
2d97591ef43d05 Stephan Mueller  2017-08-02  155  	if (IS_ERR(areq))
2d97591ef43d05 Stephan Mueller  2017-08-02  156  		return PTR_ERR(areq);
d887c52d6ae43a Stephan Mueller  2017-06-25  157  
d887c52d6ae43a Stephan Mueller  2017-06-25  158  	/* convert iovecs of output buffers into RX SGL */
2d97591ef43d05 Stephan Mueller  2017-08-02 @159  	err = af_alg_get_rsgl(sk, msg, flags, areq, outlen, &usedpages);
d887c52d6ae43a Stephan Mueller  2017-06-25  160  	if (err)
d887c52d6ae43a Stephan Mueller  2017-06-25  161  		goto free;
400c40cf78da00 Stephan Mueller  2015-02-28  162  
d887c52d6ae43a Stephan Mueller  2017-06-25  163  	/*
d887c52d6ae43a Stephan Mueller  2017-06-25  164  	 * Ensure output buffer is sufficiently large. If the caller provides
d887c52d6ae43a Stephan Mueller  2017-06-25  165  	 * less buffer space, only use the relative required input size. This
d887c52d6ae43a Stephan Mueller  2017-06-25  166  	 * allows AIO operation where the caller sent all data to be processed
d887c52d6ae43a Stephan Mueller  2017-06-25  167  	 * and the AIO operation performs the operation on the different chunks
d887c52d6ae43a Stephan Mueller  2017-06-25  168  	 * of the input data.
d887c52d6ae43a Stephan Mueller  2017-06-25  169  	 */
0c1e16cd1ec419 Stephan Mueller  2016-12-05  170  	if (usedpages < outlen) {
d887c52d6ae43a Stephan Mueller  2017-06-25  171  		size_t less = outlen - usedpages;
d887c52d6ae43a Stephan Mueller  2017-06-25  172  
d887c52d6ae43a Stephan Mueller  2017-06-25  173  		if (used < less) {
0c1e16cd1ec419 Stephan Mueller  2016-12-05  174  			err = -EINVAL;
d887c52d6ae43a Stephan Mueller  2017-06-25  175  			goto free;
d887c52d6ae43a Stephan Mueller  2017-06-25  176  		}
d887c52d6ae43a Stephan Mueller  2017-06-25  177  		used -= less;
d887c52d6ae43a Stephan Mueller  2017-06-25  178  		outlen -= less;
0c1e16cd1ec419 Stephan Mueller  2016-12-05  179  	}
400c40cf78da00 Stephan Mueller  2015-02-28  180  
72548b093ee38a Stephan Mueller  2017-07-30  181  	processed = used + ctx->aead_assoclen;
8e1fa89aa8bc28 Stephan Mueller  2017-11-10  182  	list_for_each_entry_safe(tsgl, tmp, &ctx->tsgl_list, list) {
8e1fa89aa8bc28 Stephan Mueller  2017-11-10  183  		for (i = 0; i < tsgl->cur; i++) {
8e1fa89aa8bc28 Stephan Mueller  2017-11-10  184  			struct scatterlist *process_sg = tsgl->sg + i;
8e1fa89aa8bc28 Stephan Mueller  2017-11-10  185  
8e1fa89aa8bc28 Stephan Mueller  2017-11-10  186  			if (!(process_sg->length) || !sg_page(process_sg))
8e1fa89aa8bc28 Stephan Mueller  2017-11-10  187  				continue;
8e1fa89aa8bc28 Stephan Mueller  2017-11-10  188  			tsgl_src = process_sg;
8e1fa89aa8bc28 Stephan Mueller  2017-11-10  189  			break;
8e1fa89aa8bc28 Stephan Mueller  2017-11-10  190  		}
8e1fa89aa8bc28 Stephan Mueller  2017-11-10  191  		if (tsgl_src)
8e1fa89aa8bc28 Stephan Mueller  2017-11-10  192  			break;
8e1fa89aa8bc28 Stephan Mueller  2017-11-10  193  	}
8e1fa89aa8bc28 Stephan Mueller  2017-11-10  194  	if (processed && !tsgl_src) {
8e1fa89aa8bc28 Stephan Mueller  2017-11-10  195  		err = -EFAULT;
8e1fa89aa8bc28 Stephan Mueller  2017-11-10  196  		goto free;
8e1fa89aa8bc28 Stephan Mueller  2017-11-10  197  	}
72548b093ee38a Stephan Mueller  2017-07-30  198  
d887c52d6ae43a Stephan Mueller  2017-06-25  199  	/*
72548b093ee38a Stephan Mueller  2017-07-30  200  	 * Copy of AAD from source to destination
72548b093ee38a Stephan Mueller  2017-07-30  201  	 *
72548b093ee38a Stephan Mueller  2017-07-30  202  	 * The AAD is copied to the destination buffer without change. Even
72548b093ee38a Stephan Mueller  2017-07-30  203  	 * when user space uses an in-place cipher operation, the kernel
72548b093ee38a Stephan Mueller  2017-07-30  204  	 * will copy the data as it does not see whether such in-place operation
72548b093ee38a Stephan Mueller  2017-07-30  205  	 * is initiated.
72548b093ee38a Stephan Mueller  2017-07-30  206  	 *
72548b093ee38a Stephan Mueller  2017-07-30  207  	 * To ensure efficiency, the following implementation ensure that the
72548b093ee38a Stephan Mueller  2017-07-30  208  	 * ciphers are invoked to perform a crypto operation in-place. This
72548b093ee38a Stephan Mueller  2017-07-30  209  	 * is achieved by memory management specified as follows.
d887c52d6ae43a Stephan Mueller  2017-06-25  210  	 */
72548b093ee38a Stephan Mueller  2017-07-30  211  
72548b093ee38a Stephan Mueller  2017-07-30  212  	/* Use the RX SGL as source (and destination) for crypto op. */
c1abe6f570aff4 David Howells    2023-06-06  213  	rsgl_src = areq->first_rsgl.sgl.sgt.sgl;
72548b093ee38a Stephan Mueller  2017-07-30  214  
72548b093ee38a Stephan Mueller  2017-07-30  215  	if (ctx->enc) {
72548b093ee38a Stephan Mueller  2017-07-30  216  		/*
72548b093ee38a Stephan Mueller  2017-07-30  217  		 * Encryption operation - The in-place cipher operation is
72548b093ee38a Stephan Mueller  2017-07-30  218  		 * achieved by the following operation:
72548b093ee38a Stephan Mueller  2017-07-30  219  		 *
75d11e75357c1c Stephan Mueller  2017-08-09  220  		 * TX SGL: AAD || PT
72548b093ee38a Stephan Mueller  2017-07-30  221  		 *	    |	   |
72548b093ee38a Stephan Mueller  2017-07-30  222  		 *	    | copy |
72548b093ee38a Stephan Mueller  2017-07-30  223  		 *	    v	   v
75d11e75357c1c Stephan Mueller  2017-08-09  224  		 * RX SGL: AAD || PT || Tag
72548b093ee38a Stephan Mueller  2017-07-30  225  		 */
8e1fa89aa8bc28 Stephan Mueller  2017-11-10  226  		err = crypto_aead_copy_sgl(null_tfm, tsgl_src,
c1abe6f570aff4 David Howells    2023-06-06  227  					   areq->first_rsgl.sgl.sgt.sgl,
c1abe6f570aff4 David Howells    2023-06-06  228  					   processed);
72548b093ee38a Stephan Mueller  2017-07-30  229  		if (err)
72548b093ee38a Stephan Mueller  2017-07-30  230  			goto free;
2d97591ef43d05 Stephan Mueller  2017-08-02 @231  		af_alg_pull_tsgl(sk, processed, NULL, 0);
72548b093ee38a Stephan Mueller  2017-07-30  232  	} else {
72548b093ee38a Stephan Mueller  2017-07-30  233  		/*
72548b093ee38a Stephan Mueller  2017-07-30  234  		 * Decryption operation - To achieve an in-place cipher
72548b093ee38a Stephan Mueller  2017-07-30  235  		 * operation, the following  SGL structure is used:
72548b093ee38a Stephan Mueller  2017-07-30  236  		 *
72548b093ee38a Stephan Mueller  2017-07-30  237  		 * TX SGL: AAD || CT || Tag
72548b093ee38a Stephan Mueller  2017-07-30  238  		 *	    |	   |	 ^
72548b093ee38a Stephan Mueller  2017-07-30  239  		 *	    | copy |	 | Create SGL link.
72548b093ee38a Stephan Mueller  2017-07-30  240  		 *	    v	   v	 |
72548b093ee38a Stephan Mueller  2017-07-30  241  		 * RX SGL: AAD || CT ----+
72548b093ee38a Stephan Mueller  2017-07-30  242  		 */
72548b093ee38a Stephan Mueller  2017-07-30  243  
72548b093ee38a Stephan Mueller  2017-07-30  244  		 /* Copy AAD || CT to RX SGL buffer for in-place operation. */
8e1fa89aa8bc28 Stephan Mueller  2017-11-10  245  		err = crypto_aead_copy_sgl(null_tfm, tsgl_src,
c1abe6f570aff4 David Howells    2023-06-06  246  					   areq->first_rsgl.sgl.sgt.sgl,
c1abe6f570aff4 David Howells    2023-06-06  247  					   outlen);
72548b093ee38a Stephan Mueller  2017-07-30  248  		if (err)
72548b093ee38a Stephan Mueller  2017-07-30  249  			goto free;
72548b093ee38a Stephan Mueller  2017-07-30  250  
72548b093ee38a Stephan Mueller  2017-07-30  251  		/* Create TX SGL for tag and chain it to RX SGL. */
2d97591ef43d05 Stephan Mueller  2017-08-02 @252  		areq->tsgl_entries = af_alg_count_tsgl(sk, processed,
72548b093ee38a Stephan Mueller  2017-07-30  253  						       processed - as);
d887c52d6ae43a Stephan Mueller  2017-06-25  254  		if (!areq->tsgl_entries)
d887c52d6ae43a Stephan Mueller  2017-06-25  255  			areq->tsgl_entries = 1;
76e43e37a40785 Kees Cook        2018-06-12  256  		areq->tsgl = sock_kmalloc(sk, array_size(sizeof(*areq->tsgl),
76e43e37a40785 Kees Cook        2018-06-12  257  							 areq->tsgl_entries),
d887c52d6ae43a Stephan Mueller  2017-06-25  258  					  GFP_KERNEL);
d887c52d6ae43a Stephan Mueller  2017-06-25  259  		if (!areq->tsgl) {
d887c52d6ae43a Stephan Mueller  2017-06-25  260  			err = -ENOMEM;
d887c52d6ae43a Stephan Mueller  2017-06-25  261  			goto free;
d887c52d6ae43a Stephan Mueller  2017-06-25  262  		}
d887c52d6ae43a Stephan Mueller  2017-06-25  263  		sg_init_table(areq->tsgl, areq->tsgl_entries);
72548b093ee38a Stephan Mueller  2017-07-30  264  
72548b093ee38a Stephan Mueller  2017-07-30  265  		/* Release TX SGL, except for tag data and reassign tag data. */
2d97591ef43d05 Stephan Mueller  2017-08-02  266  		af_alg_pull_tsgl(sk, processed, areq->tsgl, processed - as);
72548b093ee38a Stephan Mueller  2017-07-30  267  
72548b093ee38a Stephan Mueller  2017-07-30  268  		/* chain the areq TX SGL holding the tag with RX SGL */
2d97591ef43d05 Stephan Mueller  2017-08-02  269  		if (usedpages) {
72548b093ee38a Stephan Mueller  2017-07-30  270  			/* RX SGL present */
2d97591ef43d05 Stephan Mueller  2017-08-02  271  			struct af_alg_sgl *sgl_prev = &areq->last_rsgl->sgl;
c1abe6f570aff4 David Howells    2023-06-06  272  			struct scatterlist *sg = sgl_prev->sgt.sgl;
72548b093ee38a Stephan Mueller  2017-07-30  273  
c1abe6f570aff4 David Howells    2023-06-06  274  			sg_unmark_end(sg + sgl_prev->sgt.nents - 1);
c1abe6f570aff4 David Howells    2023-06-06  275  			sg_chain(sg, sgl_prev->sgt.nents + 1, areq->tsgl);
72548b093ee38a Stephan Mueller  2017-07-30  276  		} else
72548b093ee38a Stephan Mueller  2017-07-30  277  			/* no RX SGL present (e.g. authentication only) */
8e1fa89aa8bc28 Stephan Mueller  2017-11-10  278  			rsgl_src = areq->tsgl;
72548b093ee38a Stephan Mueller  2017-07-30  279  	}
d887c52d6ae43a Stephan Mueller  2017-06-25  280  
d887c52d6ae43a Stephan Mueller  2017-06-25  281  	/* Initialize the crypto operation */
8e1fa89aa8bc28 Stephan Mueller  2017-11-10  282  	aead_request_set_crypt(&areq->cra_u.aead_req, rsgl_src,
c1abe6f570aff4 David Howells    2023-06-06  283  			       areq->first_rsgl.sgl.sgt.sgl, used, ctx->iv);
2d97591ef43d05 Stephan Mueller  2017-08-02  284  	aead_request_set_ad(&areq->cra_u.aead_req, ctx->aead_assoclen);
2d97591ef43d05 Stephan Mueller  2017-08-02  285  	aead_request_set_tfm(&areq->cra_u.aead_req, tfm);
400c40cf78da00 Stephan Mueller  2015-02-28  286  
d887c52d6ae43a Stephan Mueller  2017-06-25  287  	if (msg->msg_iocb && !is_sync_kiocb(msg->msg_iocb)) {
d887c52d6ae43a Stephan Mueller  2017-06-25  288  		/* AIO operation */
7d2c3f54e6f646 Stephan Mueller  2017-11-10  289  		sock_hold(sk);
d887c52d6ae43a Stephan Mueller  2017-06-25  290  		areq->iocb = msg->msg_iocb;
d53c5135792319 Stephan Mueller  2017-12-08  291  
d53c5135792319 Stephan Mueller  2017-12-08  292  		/* Remember output size that will be generated. */
d53c5135792319 Stephan Mueller  2017-12-08  293  		areq->outlen = outlen;
d53c5135792319 Stephan Mueller  2017-12-08  294  
2d97591ef43d05 Stephan Mueller  2017-08-02  295  		aead_request_set_callback(&areq->cra_u.aead_req,
cbdad1f246dd98 Herbert Xu       2020-07-31  296  					  CRYPTO_TFM_REQ_MAY_SLEEP,
2d97591ef43d05 Stephan Mueller  2017-08-02  297  					  af_alg_async_cb, areq);
2d97591ef43d05 Stephan Mueller  2017-08-02  298  		err = ctx->enc ? crypto_aead_encrypt(&areq->cra_u.aead_req) :
2d97591ef43d05 Stephan Mueller  2017-08-02  299  				 crypto_aead_decrypt(&areq->cra_u.aead_req);
7d2c3f54e6f646 Stephan Mueller  2017-11-10  300  
7d2c3f54e6f646 Stephan Mueller  2017-11-10  301  		/* AIO operation in progress */
cbdad1f246dd98 Herbert Xu       2020-07-31  302  		if (err == -EINPROGRESS)
7d2c3f54e6f646 Stephan Mueller  2017-11-10  303  			return -EIOCBQUEUED;
7d2c3f54e6f646 Stephan Mueller  2017-11-10  304  
7d2c3f54e6f646 Stephan Mueller  2017-11-10  305  		sock_put(sk);
d887c52d6ae43a Stephan Mueller  2017-06-25  306  	} else {
d887c52d6ae43a Stephan Mueller  2017-06-25  307  		/* Synchronous operation */
2d97591ef43d05 Stephan Mueller  2017-08-02  308  		aead_request_set_callback(&areq->cra_u.aead_req,
cbdad1f246dd98 Herbert Xu       2020-07-31  309  					  CRYPTO_TFM_REQ_MAY_SLEEP |
d887c52d6ae43a Stephan Mueller  2017-06-25  310  					  CRYPTO_TFM_REQ_MAY_BACKLOG,
2c3f8b162106a7 Gilad Ben-Yossef 2017-10-18  311  					  crypto_req_done, &ctx->wait);
2c3f8b162106a7 Gilad Ben-Yossef 2017-10-18  312  		err = crypto_wait_req(ctx->enc ?
2d97591ef43d05 Stephan Mueller  2017-08-02  313  				crypto_aead_encrypt(&areq->cra_u.aead_req) :
2d97591ef43d05 Stephan Mueller  2017-08-02  314  				crypto_aead_decrypt(&areq->cra_u.aead_req),
2c3f8b162106a7 Gilad Ben-Yossef 2017-10-18  315  				&ctx->wait);
400c40cf78da00 Stephan Mueller  2015-02-28  316  	}
400c40cf78da00 Stephan Mueller  2015-02-28  317  
d887c52d6ae43a Stephan Mueller  2017-06-25  318  
d887c52d6ae43a Stephan Mueller  2017-06-25  319  free:
7d2c3f54e6f646 Stephan Mueller  2017-11-10  320  	af_alg_free_resources(areq);
400c40cf78da00 Stephan Mueller  2015-02-28  321  
400c40cf78da00 Stephan Mueller  2015-02-28  322  	return err ? err : outlen;
400c40cf78da00 Stephan Mueller  2015-02-28  323  }
400c40cf78da00 Stephan Mueller  2015-02-28  324  

:::::: The code at line 71 was first introduced by commit
:::::: 2d97591ef43d0587be22ad1b0d758d6df4999a0b crypto: af_alg - consolidation of duplicate code

:::::: TO: Stephan Mueller <smueller@chronox.de>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
