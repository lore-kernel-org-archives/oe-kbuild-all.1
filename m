Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14EF41A0703
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jun 2025 07:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750317089; cv=none; b=N1AI6Jzh3Scwcf6cm+kdrNY9oiOMK5q4zdstOYIz7ohcDttsSj16Zrts2RDk/QKE+rbSE3GWVLjKCV8sudndySxu4QHjYaIrZnMtwtQoddkXmFjZeVaF9EIg2DCNtgs8M7BgVEExOYzw+5xwb69kHMdAR7hh3nfIsvzVFBqVEJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750317089; c=relaxed/simple;
	bh=hNKD+SLnXkfbDmWjS+F6TPR2PtnNHuXquIKrcz2spiA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ggwUrlPS3A8B8Fb1Ttbel1PoTYf/DC40JEVEElWzuputHyZM4iCnYGY++TOAtBL5nAjQceTlHotUOzGQRNIGNgOcEEkVjKGaHOc8tvHdNY2PFevt+csbNSUrL01aItrJT80QpQiVCJWmbnG4yFIscITwV4qva2qWEbjeiXAK1TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JowROZD7; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JowROZD7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750317087; x=1781853087;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hNKD+SLnXkfbDmWjS+F6TPR2PtnNHuXquIKrcz2spiA=;
  b=JowROZD7qCLsVnoDpQpJsAGoydvmg1qQNp2x41q7/5crasLhQ/R8G8K6
   bYCP+/wx0HxMRN4XJpOIFo4hmAAkbkRVuSFl9u9LKwGmybVDZHRAJ9Y9X
   3NNYpjh/eirivdolCM+dChEr68z5zmOq38P06p30AUW1BAEH7xA1hRxf5
   V1kWR+Qpt6kjUU8+SfyEtkeg3WSlfxymdp1/PEDGiBnnkfJIR9htO/8Jt
   YpjZO/ZMeDqr2lX6tWJFBCeCGVr5wSaSxP3Ws3Nmf2ihLlghRek1rH6P5
   HEV4ptSY6RByT9TRTB8bvzCkDNyiwUFoYhOG2x7k4m60dzTXK+daRuV1S
   g==;
X-CSE-ConnectionGUID: TmACo+r+TiqGY4v9TvNQIg==
X-CSE-MsgGUID: oAn0x6RATMqYvRrqfLdkoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52481475"
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="scan'208";a="52481475"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 00:11:26 -0700
X-CSE-ConnectionGUID: ivnK+BaLSNOFE2fCE0jTKw==
X-CSE-MsgGUID: TRlQKYWZSgaufh96xnMiKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="scan'208";a="156289447"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 19 Jun 2025 00:11:25 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uS9Qh-000KUk-0a;
	Thu, 19 Jun 2025 07:11:23 +0000
Date: Thu, 19 Jun 2025 15:10:29 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/1] crypto/af_alg.c:1008: warning:
 Function parameter or member 'sock' not described in 'af_alg_tsgl_sendmsg'
Message-ID: <202506191522.KTkfT9lz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yabin,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   72ad9fd00b32380d70b2ad46ae6dfbf606f42a02
commit: c6049333520ec45698c02fa50f2c34a31aafcd89 [0/1] anolis: newfeature: crypto: ccp: Process multiple VQ commands once for SM4/SM4-CTR ccp.
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250619/202506191522.KTkfT9lz-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250619/202506191522.KTkfT9lz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506191522.KTkfT9lz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   crypto/af_alg.c:520: warning: Function parameter or member 'sk' not described in 'af_alg_alloc_tsgl'
   crypto/af_alg.c:561: warning: Function parameter or member 'sk' not described in 'af_alg_count_tsgl'
   crypto/af_alg.c:561: warning: Function parameter or member 'bytes' not described in 'af_alg_count_tsgl'
   crypto/af_alg.c:561: warning: Function parameter or member 'offset' not described in 'af_alg_count_tsgl'
   crypto/af_alg.c:618: warning: Function parameter or member 'sk' not described in 'af_alg_pull_tsgl'
   crypto/af_alg.c:618: warning: Function parameter or member 'used' not described in 'af_alg_pull_tsgl'
   crypto/af_alg.c:618: warning: Function parameter or member 'dst' not described in 'af_alg_pull_tsgl'
   crypto/af_alg.c:618: warning: Function parameter or member 'dst_offset' not described in 'af_alg_pull_tsgl'
   crypto/af_alg.c:685: warning: Function parameter or member 'areq' not described in 'af_alg_free_areq_sgls'
   crypto/af_alg.c:722: warning: Function parameter or member 'sk' not described in 'af_alg_wait_for_wmem'
   crypto/af_alg.c:722: warning: Function parameter or member 'flags' not described in 'af_alg_wait_for_wmem'
   crypto/af_alg.c:753: warning: Function parameter or member 'sk' not described in 'af_alg_wmem_wakeup'
   crypto/af_alg.c:779: warning: Function parameter or member 'sk' not described in 'af_alg_wait_for_data'
   crypto/af_alg.c:779: warning: Function parameter or member 'flags' not described in 'af_alg_wait_for_data'
   crypto/af_alg.c:779: warning: Function parameter or member 'min' not described in 'af_alg_wait_for_data'
   crypto/af_alg.c:818: warning: Function parameter or member 'sk' not described in 'af_alg_data_wakeup'
   crypto/af_alg.c:854: warning: Function parameter or member 'sock' not described in 'af_alg_sendmsg'
   crypto/af_alg.c:854: warning: Function parameter or member 'msg' not described in 'af_alg_sendmsg'
   crypto/af_alg.c:854: warning: Function parameter or member 'size' not described in 'af_alg_sendmsg'
   crypto/af_alg.c:854: warning: Function parameter or member 'ivsize' not described in 'af_alg_sendmsg'
>> crypto/af_alg.c:1008: warning: Function parameter or member 'sock' not described in 'af_alg_tsgl_sendmsg'
>> crypto/af_alg.c:1008: warning: Function parameter or member 'msg' not described in 'af_alg_tsgl_sendmsg'
>> crypto/af_alg.c:1008: warning: Function parameter or member 'size' not described in 'af_alg_tsgl_sendmsg'
>> crypto/af_alg.c:1008: warning: Function parameter or member 'ivsize' not described in 'af_alg_tsgl_sendmsg'
   crypto/af_alg.c:1127: warning: Function parameter or member 'sock' not described in 'af_alg_sendpage'
   crypto/af_alg.c:1127: warning: Function parameter or member 'page' not described in 'af_alg_sendpage'
   crypto/af_alg.c:1127: warning: Function parameter or member 'offset' not described in 'af_alg_sendpage'
   crypto/af_alg.c:1127: warning: Function parameter or member 'size' not described in 'af_alg_sendpage'
   crypto/af_alg.c:1127: warning: Function parameter or member 'flags' not described in 'af_alg_sendpage'
   crypto/af_alg.c:1182: warning: Function parameter or member 'areq' not described in 'af_alg_free_resources'
   crypto/af_alg.c:1200: warning: Function parameter or member '_req' not described in 'af_alg_async_cb'
   crypto/af_alg.c:1200: warning: Function parameter or member 'err' not described in 'af_alg_async_cb'
   crypto/af_alg.c:1221: warning: Function parameter or member 'file' not described in 'af_alg_poll'
   crypto/af_alg.c:1221: warning: Function parameter or member 'sock' not described in 'af_alg_poll'
   crypto/af_alg.c:1221: warning: Function parameter or member 'wait' not described in 'af_alg_poll'
   crypto/af_alg.c:1249: warning: Function parameter or member 'sk' not described in 'af_alg_alloc_areq'
   crypto/af_alg.c:1249: warning: Function parameter or member 'areqlen' not described in 'af_alg_alloc_areq'
   crypto/af_alg.c:1281: warning: Function parameter or member 'sk' not described in 'af_alg_get_rsgl'
   crypto/af_alg.c:1281: warning: Function parameter or member 'msg' not described in 'af_alg_get_rsgl'
   crypto/af_alg.c:1281: warning: Function parameter or member 'flags' not described in 'af_alg_get_rsgl'
   crypto/af_alg.c:1281: warning: Function parameter or member 'areq' not described in 'af_alg_get_rsgl'
   crypto/af_alg.c:1281: warning: Function parameter or member 'maxsize' not described in 'af_alg_get_rsgl'
   crypto/af_alg.c:1281: warning: Function parameter or member 'outlen' not described in 'af_alg_get_rsgl'


vim +1008 crypto/af_alg.c

   999	
  1000	/**
  1001	 * af_alg_sgl_sendmsg - implementation of sendmsg system call handler
  1002	 *
  1003	 * will create the TX SGL for the input data from the crypto operation
  1004	 *
  1005	 */
  1006	int af_alg_tsgl_sendmsg(struct socket *sock, struct msghdr *msg, size_t size,
  1007			   unsigned int ivsize)
> 1008	{
  1009		struct sock *sk = sock->sk;
  1010		struct alg_sock *ask = alg_sk(sk);
  1011		struct af_alg_ctx *ctx = ask->private;
  1012		struct af_alg_tsgl *sgl;
  1013		struct af_alg_control con = {};
  1014		long copied = 0;
  1015		int op = 0;
  1016		bool init = 0;
  1017		int err = 0;
  1018	
  1019		if (msg->msg_controllen) {
  1020			err = af_alg_cmsg_send(msg, &con);
  1021			if (err)
  1022				return err;
  1023	
  1024			init = 1;
  1025			switch (con.op) {
  1026			case ALG_OP_VERIFY:
  1027			case ALG_OP_SIGN:
  1028			case ALG_OP_ENCRYPT:
  1029			case ALG_OP_DECRYPT:
  1030				op = con.op;
  1031				break;
  1032			default:
  1033				return -EINVAL;
  1034			}
  1035	
  1036			if (con.iv && con.iv->ivlen != ivsize)
  1037				return -EINVAL;
  1038		}
  1039	
  1040		lock_sock(sk);
  1041		if (!ctx->more && ctx->used) {
  1042			err = -EINVAL;
  1043			goto unlock;
  1044		}
  1045	
  1046		ctx->init = true;
  1047		if (init) {
  1048			ctx->op = op;
  1049			if (con.iv)
  1050				memcpy(ctx->iv, con.iv->iv, ivsize);
  1051	
  1052			ctx->aead_assoclen = con.aead_assoclen;
  1053		}
  1054	
  1055		while (size) {
  1056			struct scatterlist *sg;
  1057			size_t len = size;
  1058			size_t plen;
  1059	
  1060			err = af_alg_alloc_tsgl(sk);
  1061			if (err)
  1062				goto unlock;
  1063	
  1064			sgl = list_entry(ctx->tsgl_list.prev, struct af_alg_tsgl,
  1065					 list);
  1066			sg = sgl->sg;
  1067			if (sgl->cur)
  1068				sg_unmark_end(sg + sgl->cur - 1);
  1069	
  1070			do {
  1071				unsigned int i = sgl->cur;
  1072				struct page *page;
  1073				ssize_t n;
  1074				size_t off;
  1075	
  1076				plen = min_t(size_t, len, PAGE_SIZE);
  1077	
  1078				/* -1: max size, 1: page number */
  1079				n = iov_iter_get_pages(&msg->msg_iter, &page,
  1080					-1, 1, &off);
  1081				if (n < 0 || n > plen) {
  1082					err = -EFAULT;
  1083					goto unlock;
  1084				}
  1085				sg_assign_page(sg + i, page);
  1086				if (!sg_page(sg + i)) {
  1087					err = -ENOMEM;
  1088					goto unlock;
  1089				}
  1090				iov_iter_advance(&msg->msg_iter, n);
  1091	
  1092				plen = n;
  1093				sg[i].length = plen;
  1094				sg[i].offset = off;
  1095				len -= plen;
  1096				ctx->used += plen;
  1097				copied += plen;
  1098				size -= plen;
  1099				sgl->cur++;
  1100			} while (len && sgl->cur < MAX_SGL_ENTS);
  1101	
  1102			if (!size)
  1103				sg_mark_end(sg + sgl->cur - 1);
  1104	
  1105			ctx->merge = plen & (PAGE_SIZE - 1);
  1106		}
  1107	
  1108		err = 0;
  1109	
  1110		ctx->more = msg->msg_flags & MSG_MORE;
  1111	
  1112	unlock:
  1113		af_alg_data_wakeup(sk);
  1114		release_sock(sk);
  1115	
  1116		return copied ?: err;
  1117	}
  1118	EXPORT_SYMBOL_GPL(af_alg_tsgl_sendmsg);
  1119	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
