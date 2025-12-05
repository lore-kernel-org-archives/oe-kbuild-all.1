Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AAA3590D3
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Dec 2025 18:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764960075; cv=none; b=YDjRp5aR/ekTWWyOonEB9Ov3hfTWgenDaPopOLXl/VCMZljY1aVuLF6vqNfXxVsIU0E4ar29QKJn4FDGuCgpbKKtRi15fG+orSXCdMU3gHMpqkfwIOD91dNshMpsbnFtQ4aiGwYaEa6QMrdxqdqXdZfgMKJ6akWkhoEaQK3olPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764960075; c=relaxed/simple;
	bh=68u3rcL+u0XG1M+382xQBkT4pFAbzBCn4ZMqYA6pI5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PwgCAHC6PbTnL51nxp6Xcu6Xq1wN5lp6O0MecUmHLOAfTDfpKdoTBjBOYa8uosN4+e7slayLZ0jlVYXd6IlDymJtPW6E6JOvjbadIRwsjKFlL0E5qGN5GYpVDpKIHGk/b2HN2+VvMdvkf1yee4ZS8sWeGOkjj6f1yuWN05E2/tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aCeLZLhq; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aCeLZLhq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764960071; x=1796496071;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=68u3rcL+u0XG1M+382xQBkT4pFAbzBCn4ZMqYA6pI5Y=;
  b=aCeLZLhqxidHAYGy84FVQUfejYxqP8vErfy48Zcn4t3Yru/v6JrvKNYm
   TcU9FGQAxids62T1oxEJ30tVzfLKnbh0kVbJ3OpYHTgcDOfC85ka0UJUB
   rRjmeeEnw12hFujnCKtFZyfIbqAz8gMNfsJjTWDYcXPtf2aqa6u8h0tGB
   LsMFHD5s0UJfr8tjH6K4KM63FOuoW7Q0qUQnNnvSJFu22m9pMZ42gbzgJ
   j3wCnF3PtxkM5d8ytlIjMxXraI+C7CgPRXxTFKLNE5zQUSED5Y/yxG61x
   kl1FqU/ElnnQELUC2LiwsvyISU61fBfpZhAt90gdVNESPUWFZsK2RWTr/
   Q==;
X-CSE-ConnectionGUID: 2xjp2koQSJuzXJlyr4Fiiw==
X-CSE-MsgGUID: x/nZJ8rgTVm/XGQUGbWi7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="66959763"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="66959763"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 10:41:10 -0800
X-CSE-ConnectionGUID: V/VpBF04TKavhNwvd8xsgA==
X-CSE-MsgGUID: 6hFJVtVITG+7kC+vw4xbBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="195806776"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 05 Dec 2025 10:41:09 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRajr-00000000FN1-0zWN;
	Fri, 05 Dec 2025 18:41:07 +0000
Date: Sat, 6 Dec 2025 02:40:48 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 2/2] crypto/af_alg.c:1008: warning:
 Function parameter or member 'sock' not described in 'af_alg_tsgl_sendmsg'
Message-ID: <202512060202.754uVYpm-lkp@intel.com>
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
head:   31b356d59497695e1135b4c6ea07b6d0bd148e07
commit: c6049333520ec45698c02fa50f2c34a31aafcd89 [2/2] anolis: newfeature: crypto: ccp: Process multiple VQ commands once for SM4/SM4-CTR ccp.
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251206/202512060202.754uVYpm-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 734a912d0f025559fcf76bde9aaaeb0383c1625a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512060202.754uVYpm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512060202.754uVYpm-lkp@intel.com/

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
