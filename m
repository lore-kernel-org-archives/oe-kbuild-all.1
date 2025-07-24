Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354FB26D4E7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Jul 2025 11:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753355965; cv=none; b=WsQHF/mjhhQq26sZcZrIB0fV9rcp17LSDki93Iumm8tsp/Jk8AcrUZVPDP+SOqx43nenVx3rmiRrPiJfWQgX9yRffIHzHA74xIsfuNeAGSl5C1mC9h80JJoWqF7ZIjxDYvRQjxpLjB6Cp8kD6MBRIu7u2p3eW74N3nIHAK22bHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753355965; c=relaxed/simple;
	bh=DV3ihtIiClS3siN/pff5Hg+zdBPgqA/i1GCXck2lxyA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fOXixrPWP50TLfBWIU0CHiclPv0IqB+31Vx4YL5u258BHST1YXO5X41mzhdtZlg0PLw4yNSLtn/o/Nyz1NXgk/l6sjI9dE/voj3mHxOrj8CfdJmoqQ3Qg6ZcpY7LvMTmd5QCDbR4uAfXjeuAmELieA6SHKvKyR6fp8ChOP9GFG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EiC0e/c3; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EiC0e/c3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753355963; x=1784891963;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DV3ihtIiClS3siN/pff5Hg+zdBPgqA/i1GCXck2lxyA=;
  b=EiC0e/c3KwL/YgVX7BeZyPPC1AaIMVeyVpePivMqZKYK0tURv9TFRqGO
   JEp6GK/R3x1vHs3p0ulVNdXJdSyrrcgMi/cdFSv/e+0r9KJVTM7D2C/Ic
   DPc+gYLEDVG53OB+pFBfOXBslqC4l/sRgV7y3Moujosef9ggPyjtHZlbd
   /v7sMXyKBvghLhvsYBKzciwj5Oh7lF28/CGAQLs+0nDLVlPINvqlSdAGa
   J6UbpW9165DIqhhjOfei4VmJP2+9iy1ON7ecayU/AoUSIRitLLNB30aOz
   p/sM28x2u7GpDfi1GxVl6b4+Zm2C2lSRcicMua1Jal5g7RrLAy9JlFsRD
   g==;
X-CSE-ConnectionGUID: 1Eq4wresRu2i4P8ISfJHGg==
X-CSE-MsgGUID: rFNE35zmRlygY76ed38YUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55538423"
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; 
   d="scan'208";a="55538423"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2025 04:19:17 -0700
X-CSE-ConnectionGUID: aUlSSqHTQ/eGavIT3YZNZg==
X-CSE-MsgGUID: iofqJ4J+QXCRyG8s+oBiBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; 
   d="scan'208";a="164429290"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 Jul 2025 04:19:14 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uetyi-000KN5-1L;
	Thu, 24 Jul 2025 11:19:12 +0000
Date: Thu, 24 Jul 2025 19:18:57 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/9] crypto/af_alg.c:1008: warning:
 Function parameter or member 'sock' not described in 'af_alg_tsgl_sendmsg'
Message-ID: <202507241933.oQ3SUPTL-lkp@intel.com>
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
head:   71a37bdc5fbed5d912815ad0c6fe9eb17136b81f
commit: c6049333520ec45698c02fa50f2c34a31aafcd89 [0/9] anolis: newfeature: crypto: ccp: Process multiple VQ commands once for SM4/SM4-CTR ccp.
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250724/202507241933.oQ3SUPTL-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250724/202507241933.oQ3SUPTL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507241933.oQ3SUPTL-lkp@intel.com/

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
