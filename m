Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8505F24166D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Oct 2025 07:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760684753; cv=none; b=eWA6sBNZqzk7Qn0Q91RGJF0b7pZYsdJZD1gRN4FEPvH590ikNBpCfmo+p3rO0bUfopHgD9Z48RKwt+ky+t8dfLoWBxvbQHGK1g21BiTbE4O7s6T/QPCOfB2SqxM3EhZKEA3Zch8dgWD2V4zb6aq3vdZX7nyCVsi+86/b0BYyil4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760684753; c=relaxed/simple;
	bh=C8SmcyaMRymiEVcS3jfzjWAG+pE+A1lXxs1eW7YN7JA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t3YwkXussoMTjk9utfkPaD1hwe4ErFF86euWhrIlmr/I/HxiddoianGx1SmdytHyXEQ5Jz7aeS3+K4SiKzgWfjfxBiDbnqi/KSLI1I/HdnC1fMJLb6ew4MEkeWRmNySkjrWAwpta5FypQhayoqNyo4upSX2eXHycIgiN5LwjX+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bn6I5x9k; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bn6I5x9k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760684750; x=1792220750;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C8SmcyaMRymiEVcS3jfzjWAG+pE+A1lXxs1eW7YN7JA=;
  b=Bn6I5x9kPtbA05hDtVweRI70YRFwHAZL2GhhumkI9nGkiOACSD+UZPai
   JJGPkFzOjx+LdJiPJ8c4S6Kyrs2Kfv2R2TBZfZxm7Yq5Jhvfu7JEq6/sk
   7uzVJqQxyAY6iG1SvK8mqeE1/RlzILBYbTEjSwDR6353Hs86q7bjAbz4/
   wJciuos6DWIPIB+B2CE2WpUyyGagIeWkmKUxkAm0rxSkX3Tqqsq3AoqBH
   kCwSZ0ZAWvwIUgn+mez3i1r7OEYRKKMI/ofP4D8sr2OU0YLq5/0VEAvIL
   6dgJU9VGetilb88yRCl3dBjBgauYM0TRWZ/hpbha8N7MQBrGUhzEhgSG2
   Q==;
X-CSE-ConnectionGUID: 9Vd1Jmk0R2y16mOIc2b79g==
X-CSE-MsgGUID: 0d3gpZWjQ0isfA3TFo3GSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="73563161"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="73563161"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 00:05:49 -0700
X-CSE-ConnectionGUID: ovSKhT3lQ/KyahZBAHTztw==
X-CSE-MsgGUID: 0z9rnfrnRw6NtC5NFW11CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="186689899"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 17 Oct 2025 00:05:49 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9eWO-0005eh-27;
	Fri, 17 Oct 2025 07:05:15 +0000
Date: Fri, 17 Oct 2025 15:02:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 1/1] crypto/af_alg.c:1038:21:
 warning: overflow in conversion from 'int' to 'unsigned char:1' changes
 value from 'flags & 32768' to '0'
Message-ID: <202510171437.JHIO6Zep-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   3522ea727e6ecd3b88462771ccb692ae7577b332
commit: 3522ea727e6ecd3b88462771ccb692ae7577b332 [1/1] UPSTREAM: crypto: af_alg - Disallow concurrent writes in af_alg_sendmsg
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20251017/202510171437.JHIO6Zep-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251017/202510171437.JHIO6Zep-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510171437.JHIO6Zep-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/crypto/if_alg.h:17,
                    from crypto/af_alg.c:11:
   include/net/sock.h: In function '__dst_negative_advice':
   include/net/sock.h:2125:35: warning: cast between incompatible function types from 'struct dst_entry * (*)(struct dst_entry *)' to 'void (*)(struct sock *, struct dst_entry *)' [-Wcast-function-type]
    2125 |                 negative_advice = (android_dst_ops_negative_advice_new_t)dst->ops->negative_advice;
         |                                   ^
   crypto/af_alg.c: In function 'af_alg_sendpage':
>> crypto/af_alg.c:1038:21: warning: overflow in conversion from 'int' to 'unsigned char:1' changes value from 'flags & 32768' to '0' [-Woverflow]
    1038 |         ctx->more = flags & MSG_MORE;
         |                     ^~~~~


vim +1038 crypto/af_alg.c

2d97591ef43d05 Stephan Mueller 2017-08-02   984  
2d97591ef43d05 Stephan Mueller 2017-08-02   985  /**
2d97591ef43d05 Stephan Mueller 2017-08-02   986   * af_alg_sendpage - sendpage system call handler
b2a4411aca29ab Randy Dunlap    2021-04-11   987   * @sock: socket of connection to user space to write to
b2a4411aca29ab Randy Dunlap    2021-04-11   988   * @page: data to send
b2a4411aca29ab Randy Dunlap    2021-04-11   989   * @offset: offset into page to begin sending
b2a4411aca29ab Randy Dunlap    2021-04-11   990   * @size: length of data
b2a4411aca29ab Randy Dunlap    2021-04-11   991   * @flags: message send/receive flags
2d97591ef43d05 Stephan Mueller 2017-08-02   992   *
2d97591ef43d05 Stephan Mueller 2017-08-02   993   * This is a generic implementation of sendpage to fill ctx->tsgl_list.
2d97591ef43d05 Stephan Mueller 2017-08-02   994   */
2d97591ef43d05 Stephan Mueller 2017-08-02   995  ssize_t af_alg_sendpage(struct socket *sock, struct page *page,
2d97591ef43d05 Stephan Mueller 2017-08-02   996  			int offset, size_t size, int flags)
2d97591ef43d05 Stephan Mueller 2017-08-02   997  {
2d97591ef43d05 Stephan Mueller 2017-08-02   998  	struct sock *sk = sock->sk;
2d97591ef43d05 Stephan Mueller 2017-08-02   999  	struct alg_sock *ask = alg_sk(sk);
2d97591ef43d05 Stephan Mueller 2017-08-02  1000  	struct af_alg_ctx *ctx = ask->private;
2d97591ef43d05 Stephan Mueller 2017-08-02  1001  	struct af_alg_tsgl *sgl;
2d97591ef43d05 Stephan Mueller 2017-08-02  1002  	int err = -EINVAL;
2d97591ef43d05 Stephan Mueller 2017-08-02  1003  
2d97591ef43d05 Stephan Mueller 2017-08-02  1004  	if (flags & MSG_SENDPAGE_NOTLAST)
2d97591ef43d05 Stephan Mueller 2017-08-02  1005  		flags |= MSG_MORE;
2d97591ef43d05 Stephan Mueller 2017-08-02  1006  
2d97591ef43d05 Stephan Mueller 2017-08-02  1007  	lock_sock(sk);
2d97591ef43d05 Stephan Mueller 2017-08-02  1008  	if (!ctx->more && ctx->used)
2d97591ef43d05 Stephan Mueller 2017-08-02  1009  		goto unlock;
2d97591ef43d05 Stephan Mueller 2017-08-02  1010  
2d97591ef43d05 Stephan Mueller 2017-08-02  1011  	if (!size)
2d97591ef43d05 Stephan Mueller 2017-08-02  1012  		goto done;
2d97591ef43d05 Stephan Mueller 2017-08-02  1013  
2d97591ef43d05 Stephan Mueller 2017-08-02  1014  	if (!af_alg_writable(sk)) {
2d97591ef43d05 Stephan Mueller 2017-08-02  1015  		err = af_alg_wait_for_wmem(sk, flags);
2d97591ef43d05 Stephan Mueller 2017-08-02  1016  		if (err)
2d97591ef43d05 Stephan Mueller 2017-08-02  1017  			goto unlock;
2d97591ef43d05 Stephan Mueller 2017-08-02  1018  	}
2d97591ef43d05 Stephan Mueller 2017-08-02  1019  
2d97591ef43d05 Stephan Mueller 2017-08-02  1020  	err = af_alg_alloc_tsgl(sk);
2d97591ef43d05 Stephan Mueller 2017-08-02  1021  	if (err)
2d97591ef43d05 Stephan Mueller 2017-08-02  1022  		goto unlock;
2d97591ef43d05 Stephan Mueller 2017-08-02  1023  
2d97591ef43d05 Stephan Mueller 2017-08-02  1024  	ctx->merge = 0;
2d97591ef43d05 Stephan Mueller 2017-08-02  1025  	sgl = list_entry(ctx->tsgl_list.prev, struct af_alg_tsgl, list);
2d97591ef43d05 Stephan Mueller 2017-08-02  1026  
2d97591ef43d05 Stephan Mueller 2017-08-02  1027  	if (sgl->cur)
2d97591ef43d05 Stephan Mueller 2017-08-02  1028  		sg_unmark_end(sgl->sg + sgl->cur - 1);
2d97591ef43d05 Stephan Mueller 2017-08-02  1029  
2d97591ef43d05 Stephan Mueller 2017-08-02  1030  	sg_mark_end(sgl->sg + sgl->cur);
2d97591ef43d05 Stephan Mueller 2017-08-02  1031  
2d97591ef43d05 Stephan Mueller 2017-08-02  1032  	get_page(page);
2d97591ef43d05 Stephan Mueller 2017-08-02  1033  	sg_set_page(sgl->sg + sgl->cur, page, size, offset);
2d97591ef43d05 Stephan Mueller 2017-08-02  1034  	sgl->cur++;
2d97591ef43d05 Stephan Mueller 2017-08-02  1035  	ctx->used += size;
2d97591ef43d05 Stephan Mueller 2017-08-02  1036  
2d97591ef43d05 Stephan Mueller 2017-08-02  1037  done:
2d97591ef43d05 Stephan Mueller 2017-08-02 @1038  	ctx->more = flags & MSG_MORE;
2d97591ef43d05 Stephan Mueller 2017-08-02  1039  
2d97591ef43d05 Stephan Mueller 2017-08-02  1040  unlock:
2d97591ef43d05 Stephan Mueller 2017-08-02  1041  	af_alg_data_wakeup(sk);
2d97591ef43d05 Stephan Mueller 2017-08-02  1042  	release_sock(sk);
2d97591ef43d05 Stephan Mueller 2017-08-02  1043  
2d97591ef43d05 Stephan Mueller 2017-08-02  1044  	return err ?: size;
2d97591ef43d05 Stephan Mueller 2017-08-02  1045  }
2d97591ef43d05 Stephan Mueller 2017-08-02  1046  EXPORT_SYMBOL_GPL(af_alg_sendpage);
2d97591ef43d05 Stephan Mueller 2017-08-02  1047  

:::::: The code at line 1038 was first introduced by commit
:::::: 2d97591ef43d0587be22ad1b0d758d6df4999a0b crypto: af_alg - consolidation of duplicate code

:::::: TO: Stephan Mueller <smueller@chronox.de>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
