Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7715164F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Sep 2023 06:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695278055; x=1726814055;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zpj9rCtkDsOE75wy4jV14pANq/ybbOxOQl+yuWwhqGE=;
  b=Erf8MiyLBwYjBeljxngn0dLqppP7XYOX0NP2hRBnifL2YfGDG8hrQ5Oi
   oIm0e8mhFIwF503qf3Pb1Rorizbi/faQBfhTD5TklTae1hapU6L/0YP6Z
   LeCHN0G01psYCmb3l/akKGt0cXpkyl4Iwd1AdHbaV2dxlwoG6TZjON9MP
   uq/MSflVX6zIMMCso8VgQLUHHiW2rD9IGXqTPs2QNd3PKcZ6pWu2A5st/
   B1MzBhEKqgIplC5qo6JuPWTlV9g+uZabSiGB+UL3jLkR65bIyysdm6WUw
   ik39JwHrPcxW46DJxhuwzB+OAad7trKSt5kM9tnxzmgGg2ya4gAwbxY/8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="360684678"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="360684678"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 23:33:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="837199624"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="837199624"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 20 Sep 2023 23:33:10 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjDFL-0009ek-1h;
	Thu, 21 Sep 2023 06:33:07 +0000
Date: Thu, 21 Sep 2023 14:33:05 +0800
From: kernel test robot <lkp@intel.com>
To: Dhaval Shah <dhaval.r.shah@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 748/1365] crypto/algif_aead.c:71:
 undefined reference to `af_alg_sendmsg'
Message-ID: <202309211457.lKi3SzlX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dhaval,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   008e6788f5aa09862307822bfc396c926dc0dbac
commit: 31fd98d28e97477718d4cc332f4a86014f4b11d9 [748/1365] crypto: xilinx: select AES GCM fallback and userspace kernel config
config: i386-buildonly-randconfig-004-20230921 (https://download.01.org/0day-ci/archive/20230921/202309211457.lKi3SzlX-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230921/202309211457.lKi3SzlX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309211457.lKi3SzlX-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: crypto/algif_aead.o: in function `aead_sendmsg':
>> crypto/algif_aead.c:71: undefined reference to `af_alg_sendmsg'
   ld: crypto/algif_aead.o: in function `aead_sock_destruct':
>> crypto/algif_aead.c:529: undefined reference to `af_alg_pull_tsgl'
>> ld: crypto/algif_aead.c:530: undefined reference to `sock_kzfree_s'
>> ld: crypto/algif_aead.c:531: undefined reference to `sock_kfree_s'
>> ld: crypto/algif_aead.c:532: undefined reference to `af_alg_release_parent'
   ld: crypto/algif_aead.o: in function `aead_accept_parent_nokey':
>> crypto/algif_aead.c:544: undefined reference to `sock_kmalloc'
>> ld: crypto/algif_aead.c:549: undefined reference to `sock_kmalloc'
   ld: crypto/algif_aead.c:551: undefined reference to `sock_kfree_s'
   ld: crypto/algif_aead.o: in function `_aead_recvmsg':
>> crypto/algif_aead.c:110: undefined reference to `af_alg_wait_for_data'
>> ld: crypto/algif_aead.c:153: undefined reference to `af_alg_alloc_areq'
>> ld: crypto/algif_aead.c:159: undefined reference to `af_alg_get_rsgl'
>> ld: crypto/algif_aead.c:230: undefined reference to `af_alg_pull_tsgl'
>> ld: crypto/algif_aead.c:250: undefined reference to `af_alg_count_tsgl'
   ld: crypto/algif_aead.c:254: undefined reference to `sock_kmalloc'
   ld: crypto/algif_aead.c:264: undefined reference to `af_alg_pull_tsgl'
   ld: crypto/algif_aead.o: in function `aead_request_set_callback':
>> include/crypto/aead.h:470: undefined reference to `af_alg_async_cb'
   ld: crypto/algif_aead.o: in function `sock_put':
>> include/net/sock.h:1987: undefined reference to `sk_free'
   ld: crypto/algif_aead.o: in function `_aead_recvmsg':
>> crypto/algif_aead.c:318: undefined reference to `af_alg_free_resources'
   ld: crypto/algif_aead.o: in function `lock_sock':
>> include/net/sock.h:1721: undefined reference to `lock_sock_nested'
   ld: crypto/algif_aead.o: in function `aead_recvmsg':
>> crypto/algif_aead.c:351: undefined reference to `af_alg_wmem_wakeup'
>> ld: crypto/algif_aead.c:352: undefined reference to `release_sock'
   ld: crypto/algif_aead.o: in function `lock_sock':
>> include/net/sock.h:1721: undefined reference to `lock_sock_nested'
   ld: crypto/algif_aead.o: in function `aead_check_key':
>> crypto/algif_aead.c:394: undefined reference to `lock_sock_nested'
   ld: crypto/algif_aead.c:404: undefined reference to `release_sock'
   ld: crypto/algif_aead.c:406: undefined reference to `release_sock'
   ld: crypto/algif_aead.o: in function `aead_sendpage_nokey':
   crypto/algif_aead.c:432: undefined reference to `af_alg_sendpage'
   ld: crypto/algif_aead.o:(.data+0x8): undefined reference to `af_alg_release'
   ld: crypto/algif_aead.o:(.data+0xc): undefined reference to `sock_no_bind'
   ld: crypto/algif_aead.o:(.data+0x10): undefined reference to `sock_no_connect'
   ld: crypto/algif_aead.o:(.data+0x14): undefined reference to `sock_no_socketpair'
   ld: crypto/algif_aead.o:(.data+0x18): undefined reference to `sock_no_accept'
   ld: crypto/algif_aead.o:(.data+0x1c): undefined reference to `sock_no_getname'
   ld: crypto/algif_aead.o:(.data+0x20): undefined reference to `af_alg_poll'
   ld: crypto/algif_aead.o:(.data+0x24): undefined reference to `sock_no_ioctl'
   ld: crypto/algif_aead.o:(.data+0x2c): undefined reference to `sock_no_listen'
   ld: crypto/algif_aead.o:(.data+0x30): undefined reference to `sock_no_shutdown'
   ld: crypto/algif_aead.o:(.data+0x48): undefined reference to `sock_no_mmap'
   ld: crypto/algif_aead.o:(.data+0x88): undefined reference to `af_alg_release'
   ld: crypto/algif_aead.o:(.data+0x8c): undefined reference to `sock_no_bind'
   ld: crypto/algif_aead.o:(.data+0x90): undefined reference to `sock_no_connect'
   ld: crypto/algif_aead.o:(.data+0x94): undefined reference to `sock_no_socketpair'
   ld: crypto/algif_aead.o:(.data+0x98): undefined reference to `sock_no_accept'
   ld: crypto/algif_aead.o:(.data+0x9c): undefined reference to `sock_no_getname'
   ld: crypto/algif_aead.o:(.data+0xa0): undefined reference to `af_alg_poll'
   ld: crypto/algif_aead.o:(.data+0xa4): undefined reference to `sock_no_ioctl'
   ld: crypto/algif_aead.o:(.data+0xac): undefined reference to `sock_no_listen'
   ld: crypto/algif_aead.o:(.data+0xb0): undefined reference to `sock_no_shutdown'
   ld: crypto/algif_aead.o:(.data+0xc8): undefined reference to `sock_no_mmap'
   ld: crypto/algif_aead.o:(.data+0xcc): undefined reference to `af_alg_sendpage'
   ld: crypto/algif_aead.o: in function `algif_aead_exit':
   crypto/algif_aead.c:597: undefined reference to `af_alg_unregister_type'
   ld: crypto/algif_aead.o: in function `algif_aead_init':
   crypto/algif_aead.c:592: undefined reference to `af_alg_register_type'

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
d887c52d6ae43a Stephan Mueller  2017-06-25  116  	 * Data length provided by caller via sendmsg/sendpage that has not
d887c52d6ae43a Stephan Mueller  2017-06-25  117  	 * yet been processed.
400c40cf78da00 Stephan Mueller  2015-02-28  118  	 */
400c40cf78da00 Stephan Mueller  2015-02-28  119  	used = ctx->used;
400c40cf78da00 Stephan Mueller  2015-02-28  120  
400c40cf78da00 Stephan Mueller  2015-02-28  121  	/*
400c40cf78da00 Stephan Mueller  2015-02-28  122  	 * Make sure sufficient data is present -- note, the same check is
4eb57bcd4c6230 Randy Dunlap     2020-07-30  123  	 * also present in sendmsg/sendpage. The checks in sendpage/sendmsg
400c40cf78da00 Stephan Mueller  2015-02-28  124  	 * shall provide an information to the data sender that something is
400c40cf78da00 Stephan Mueller  2015-02-28  125  	 * wrong, but they are irrelevant to maintain the kernel integrity.
400c40cf78da00 Stephan Mueller  2015-02-28  126  	 * We need this check here too in case user space decides to not honor
400c40cf78da00 Stephan Mueller  2015-02-28  127  	 * the error message in sendmsg/sendpage and still call recvmsg. This
400c40cf78da00 Stephan Mueller  2015-02-28  128  	 * check here protects the kernel integrity.
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
8e1fa89aa8bc28 Stephan Mueller  2017-11-10  213  	rsgl_src = areq->first_rsgl.sgl.sg;
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
72548b093ee38a Stephan Mueller  2017-07-30  227  					   areq->first_rsgl.sgl.sg, processed);
72548b093ee38a Stephan Mueller  2017-07-30  228  		if (err)
72548b093ee38a Stephan Mueller  2017-07-30  229  			goto free;
2d97591ef43d05 Stephan Mueller  2017-08-02 @230  		af_alg_pull_tsgl(sk, processed, NULL, 0);
72548b093ee38a Stephan Mueller  2017-07-30  231  	} else {
72548b093ee38a Stephan Mueller  2017-07-30  232  		/*
72548b093ee38a Stephan Mueller  2017-07-30  233  		 * Decryption operation - To achieve an in-place cipher
72548b093ee38a Stephan Mueller  2017-07-30  234  		 * operation, the following  SGL structure is used:
72548b093ee38a Stephan Mueller  2017-07-30  235  		 *
72548b093ee38a Stephan Mueller  2017-07-30  236  		 * TX SGL: AAD || CT || Tag
72548b093ee38a Stephan Mueller  2017-07-30  237  		 *	    |	   |	 ^
72548b093ee38a Stephan Mueller  2017-07-30  238  		 *	    | copy |	 | Create SGL link.
72548b093ee38a Stephan Mueller  2017-07-30  239  		 *	    v	   v	 |
72548b093ee38a Stephan Mueller  2017-07-30  240  		 * RX SGL: AAD || CT ----+
72548b093ee38a Stephan Mueller  2017-07-30  241  		 */
72548b093ee38a Stephan Mueller  2017-07-30  242  
72548b093ee38a Stephan Mueller  2017-07-30  243  		 /* Copy AAD || CT to RX SGL buffer for in-place operation. */
8e1fa89aa8bc28 Stephan Mueller  2017-11-10  244  		err = crypto_aead_copy_sgl(null_tfm, tsgl_src,
72548b093ee38a Stephan Mueller  2017-07-30  245  					   areq->first_rsgl.sgl.sg, outlen);
72548b093ee38a Stephan Mueller  2017-07-30  246  		if (err)
72548b093ee38a Stephan Mueller  2017-07-30  247  			goto free;
72548b093ee38a Stephan Mueller  2017-07-30  248  
72548b093ee38a Stephan Mueller  2017-07-30  249  		/* Create TX SGL for tag and chain it to RX SGL. */
2d97591ef43d05 Stephan Mueller  2017-08-02 @250  		areq->tsgl_entries = af_alg_count_tsgl(sk, processed,
72548b093ee38a Stephan Mueller  2017-07-30  251  						       processed - as);
d887c52d6ae43a Stephan Mueller  2017-06-25  252  		if (!areq->tsgl_entries)
d887c52d6ae43a Stephan Mueller  2017-06-25  253  			areq->tsgl_entries = 1;
76e43e37a40785 Kees Cook        2018-06-12  254  		areq->tsgl = sock_kmalloc(sk, array_size(sizeof(*areq->tsgl),
76e43e37a40785 Kees Cook        2018-06-12  255  							 areq->tsgl_entries),
d887c52d6ae43a Stephan Mueller  2017-06-25  256  					  GFP_KERNEL);
d887c52d6ae43a Stephan Mueller  2017-06-25  257  		if (!areq->tsgl) {
d887c52d6ae43a Stephan Mueller  2017-06-25  258  			err = -ENOMEM;
d887c52d6ae43a Stephan Mueller  2017-06-25  259  			goto free;
d887c52d6ae43a Stephan Mueller  2017-06-25  260  		}
d887c52d6ae43a Stephan Mueller  2017-06-25  261  		sg_init_table(areq->tsgl, areq->tsgl_entries);
72548b093ee38a Stephan Mueller  2017-07-30  262  
72548b093ee38a Stephan Mueller  2017-07-30  263  		/* Release TX SGL, except for tag data and reassign tag data. */
2d97591ef43d05 Stephan Mueller  2017-08-02  264  		af_alg_pull_tsgl(sk, processed, areq->tsgl, processed - as);
72548b093ee38a Stephan Mueller  2017-07-30  265  
72548b093ee38a Stephan Mueller  2017-07-30  266  		/* chain the areq TX SGL holding the tag with RX SGL */
2d97591ef43d05 Stephan Mueller  2017-08-02  267  		if (usedpages) {
72548b093ee38a Stephan Mueller  2017-07-30  268  			/* RX SGL present */
2d97591ef43d05 Stephan Mueller  2017-08-02  269  			struct af_alg_sgl *sgl_prev = &areq->last_rsgl->sgl;
72548b093ee38a Stephan Mueller  2017-07-30  270  
72548b093ee38a Stephan Mueller  2017-07-30  271  			sg_unmark_end(sgl_prev->sg + sgl_prev->npages - 1);
72548b093ee38a Stephan Mueller  2017-07-30  272  			sg_chain(sgl_prev->sg, sgl_prev->npages + 1,
72548b093ee38a Stephan Mueller  2017-07-30  273  				 areq->tsgl);
72548b093ee38a Stephan Mueller  2017-07-30  274  		} else
72548b093ee38a Stephan Mueller  2017-07-30  275  			/* no RX SGL present (e.g. authentication only) */
8e1fa89aa8bc28 Stephan Mueller  2017-11-10  276  			rsgl_src = areq->tsgl;
72548b093ee38a Stephan Mueller  2017-07-30  277  	}
d887c52d6ae43a Stephan Mueller  2017-06-25  278  
d887c52d6ae43a Stephan Mueller  2017-06-25  279  	/* Initialize the crypto operation */
8e1fa89aa8bc28 Stephan Mueller  2017-11-10  280  	aead_request_set_crypt(&areq->cra_u.aead_req, rsgl_src,
d887c52d6ae43a Stephan Mueller  2017-06-25  281  			       areq->first_rsgl.sgl.sg, used, ctx->iv);
2d97591ef43d05 Stephan Mueller  2017-08-02  282  	aead_request_set_ad(&areq->cra_u.aead_req, ctx->aead_assoclen);
2d97591ef43d05 Stephan Mueller  2017-08-02  283  	aead_request_set_tfm(&areq->cra_u.aead_req, tfm);
400c40cf78da00 Stephan Mueller  2015-02-28  284  
d887c52d6ae43a Stephan Mueller  2017-06-25  285  	if (msg->msg_iocb && !is_sync_kiocb(msg->msg_iocb)) {
d887c52d6ae43a Stephan Mueller  2017-06-25  286  		/* AIO operation */
7d2c3f54e6f646 Stephan Mueller  2017-11-10  287  		sock_hold(sk);
d887c52d6ae43a Stephan Mueller  2017-06-25  288  		areq->iocb = msg->msg_iocb;
d53c5135792319 Stephan Mueller  2017-12-08  289  
d53c5135792319 Stephan Mueller  2017-12-08  290  		/* Remember output size that will be generated. */
d53c5135792319 Stephan Mueller  2017-12-08  291  		areq->outlen = outlen;
d53c5135792319 Stephan Mueller  2017-12-08  292  
2d97591ef43d05 Stephan Mueller  2017-08-02  293  		aead_request_set_callback(&areq->cra_u.aead_req,
cbdad1f246dd98 Herbert Xu       2020-07-31  294  					  CRYPTO_TFM_REQ_MAY_SLEEP,
2d97591ef43d05 Stephan Mueller  2017-08-02  295  					  af_alg_async_cb, areq);
2d97591ef43d05 Stephan Mueller  2017-08-02  296  		err = ctx->enc ? crypto_aead_encrypt(&areq->cra_u.aead_req) :
2d97591ef43d05 Stephan Mueller  2017-08-02  297  				 crypto_aead_decrypt(&areq->cra_u.aead_req);
7d2c3f54e6f646 Stephan Mueller  2017-11-10  298  
7d2c3f54e6f646 Stephan Mueller  2017-11-10  299  		/* AIO operation in progress */
cbdad1f246dd98 Herbert Xu       2020-07-31  300  		if (err == -EINPROGRESS)
7d2c3f54e6f646 Stephan Mueller  2017-11-10  301  			return -EIOCBQUEUED;
7d2c3f54e6f646 Stephan Mueller  2017-11-10  302  
7d2c3f54e6f646 Stephan Mueller  2017-11-10  303  		sock_put(sk);
d887c52d6ae43a Stephan Mueller  2017-06-25  304  	} else {
d887c52d6ae43a Stephan Mueller  2017-06-25  305  		/* Synchronous operation */
2d97591ef43d05 Stephan Mueller  2017-08-02  306  		aead_request_set_callback(&areq->cra_u.aead_req,
cbdad1f246dd98 Herbert Xu       2020-07-31  307  					  CRYPTO_TFM_REQ_MAY_SLEEP |
d887c52d6ae43a Stephan Mueller  2017-06-25  308  					  CRYPTO_TFM_REQ_MAY_BACKLOG,
2c3f8b162106a7 Gilad Ben-Yossef 2017-10-18  309  					  crypto_req_done, &ctx->wait);
2c3f8b162106a7 Gilad Ben-Yossef 2017-10-18  310  		err = crypto_wait_req(ctx->enc ?
2d97591ef43d05 Stephan Mueller  2017-08-02  311  				crypto_aead_encrypt(&areq->cra_u.aead_req) :
2d97591ef43d05 Stephan Mueller  2017-08-02  312  				crypto_aead_decrypt(&areq->cra_u.aead_req),
2c3f8b162106a7 Gilad Ben-Yossef 2017-10-18  313  				&ctx->wait);
400c40cf78da00 Stephan Mueller  2015-02-28  314  	}
400c40cf78da00 Stephan Mueller  2015-02-28  315  
d887c52d6ae43a Stephan Mueller  2017-06-25  316  
d887c52d6ae43a Stephan Mueller  2017-06-25  317  free:
7d2c3f54e6f646 Stephan Mueller  2017-11-10  318  	af_alg_free_resources(areq);
400c40cf78da00 Stephan Mueller  2015-02-28  319  
400c40cf78da00 Stephan Mueller  2015-02-28  320  	return err ? err : outlen;
400c40cf78da00 Stephan Mueller  2015-02-28  321  }
400c40cf78da00 Stephan Mueller  2015-02-28  322  

:::::: The code at line 71 was first introduced by commit
:::::: 2d97591ef43d0587be22ad1b0d758d6df4999a0b crypto: af_alg - consolidation of duplicate code

:::::: TO: Stephan Mueller <smueller@chronox.de>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
