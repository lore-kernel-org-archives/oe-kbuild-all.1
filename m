Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4ECD24DCEF
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Jul 2025 10:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751452611; cv=none; b=QgwwZSwscNIGAILr/EhKPX68ChMHdAFAFThAlTEvxP3Ql8yJhbke8oqodqNiUKbkK9Pm77jj6bUoNPOgaIymP4CP+sNOhcD9giN9JvYhveKAjpPMGxTHZHo8jIIg5RXIR4f+8ekXEac/hfCEg7FN++SGVHOKg2uNsznSv/U+spM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751452611; c=relaxed/simple;
	bh=M0QJBfogdpbriYj9SbT+4MPYPUvHFAf2j9jZj8WEt+0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pVbBoPsJTfW1FLpGCt9QEfU0LnPrMXZOhAVnsizXbn6YQA0vB4OlIa88eHjA9Y8cMXTxCkewU4mf3f0HpUL946suQmt4fAVInHvyZz6zrZClsPcq7yahN7AFSjJ0o4Oa9uZf5ByasRlGims961e+fIqUnYDjTYYO7v4sSZIgGAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y81AOm7Y; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y81AOm7Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751452609; x=1782988609;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M0QJBfogdpbriYj9SbT+4MPYPUvHFAf2j9jZj8WEt+0=;
  b=Y81AOm7Y9wKhcmN3Js267TLlVQBNrcGlrWqfgcBGFj4IIi7tLxGfQJhW
   14E7lpVSFQ9JzwwYYqhDT+Enk86OD1qM1ku9CE2KI5lxf3X1z9cXAKFgk
   m78DXz6XQ2JXRR/zxtw4BgA4vNL6G8Jkwr6J5q6Cqd+Bctz3CeccDaCXO
   0afsgekvXKAqR/Nodh7Bs4InjuSPKhgZvCZeLddO2QGlQ7goh5VlHDO9s
   ZOunRWLFRrMIkShSsgY2C+Zb54zWLmlf7kT05Ce2D9GX926KR1+N8otog
   hHditCRhb9t1p9vLaGntlA9mz3U1oNMVhZTJf+Zd4aFJXr7Q996z1lhlj
   g==;
X-CSE-ConnectionGUID: GictegpPS+2jyuU2wSpR6g==
X-CSE-MsgGUID: ElSXeyUtQyCac6AeSxbi5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53670925"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="53670925"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 03:36:48 -0700
X-CSE-ConnectionGUID: 08fGr5hDR2C/IwHs5zR9gw==
X-CSE-MsgGUID: tVjCjXHjR5C8wBqLkidtyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="153440177"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by orviesa010.jf.intel.com with ESMTP; 02 Jul 2025 03:36:47 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWupY-0000HF-1N;
	Wed, 02 Jul 2025 10:36:44 +0000
Date: Wed, 2 Jul 2025 12:36:21 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1605/1605] net/sctp/chunk.c:198:25:
 warning: data argument not used by format string
Message-ID: <202507021205.lTZLbTRm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   d96cd567c8d8d584405abe92c2576bf58202fa6e
commit: 05834253a093f4e6d9cc31f380de304b540a548e [1605/1605] sctp: frag_point sanity check
config: x86_64-buildonly-randconfig-2002-20250501 (https://download.01.org/0day-ci/archive/20250702/202507021205.lTZLbTRm-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507021205.lTZLbTRm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507021205.lTZLbTRm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/sctp/chunk.c:198:25: warning: data argument not used by format string [-Wformat-extra-args]
     197 |                 pr_warn_ratelimited("%s: asoc:%p frag_point is zero, forcing max_data to default minimum (%Zu)",
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     198 |                                     __func__, asoc, max_data);
         |                                     ~~~~~~~~~~~~~~~~^~~~~~~~~
   include/linux/printk.h:485:49: note: expanded from macro 'pr_warn_ratelimited'
     485 |         printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/printk.h:469:17: note: expanded from macro 'printk_ratelimited'
     469 |                 printk(fmt, ##__VA_ARGS__);                             \
         |                        ~~~    ^
   1 warning generated.


vim +198 net/sctp/chunk.c

   156	
   157	
   158	/* A data chunk can have a maximum payload of (2^16 - 20).  Break
   159	 * down any such message into smaller chunks.  Opportunistically, fragment
   160	 * the chunks down to the current MTU constraints.  We may get refragmented
   161	 * later if the PMTU changes, but it is _much better_ to fragment immediately
   162	 * with a reasonable guess than always doing our fragmentation on the
   163	 * soft-interrupt.
   164	 */
   165	struct sctp_datamsg *sctp_datamsg_from_user(struct sctp_association *asoc,
   166						    struct sctp_sndrcvinfo *sinfo,
   167						    struct iov_iter *from)
   168	{
   169		size_t len, first_len, max_data, remaining;
   170		size_t msg_len = iov_iter_count(from);
   171		struct sctp_shared_key *shkey = NULL;
   172		struct list_head *pos, *temp;
   173		struct sctp_chunk *chunk;
   174		struct sctp_datamsg *msg;
   175		int err;
   176	
   177		msg = sctp_datamsg_new(GFP_KERNEL);
   178		if (!msg)
   179			return ERR_PTR(-ENOMEM);
   180	
   181		/* Note: Calculate this outside of the loop, so that all fragments
   182		 * have the same expiration.
   183		 */
   184		if (asoc->peer.prsctp_capable && sinfo->sinfo_timetolive &&
   185		    (SCTP_PR_TTL_ENABLED(sinfo->sinfo_flags) ||
   186		     !SCTP_PR_POLICY(sinfo->sinfo_flags)))
   187			msg->expires_at = jiffies +
   188					  msecs_to_jiffies(sinfo->sinfo_timetolive);
   189	
   190		/* This is the biggest possible DATA chunk that can fit into
   191		 * the packet
   192		 */
   193		max_data = asoc->frag_point;
   194		if (unlikely(!max_data)) {
   195			max_data = sctp_min_frag_point(sctp_sk(asoc->base.sk),
   196						       sctp_datachk_len(&asoc->stream));
   197			pr_warn_ratelimited("%s: asoc:%p frag_point is zero, forcing max_data to default minimum (%Zu)",
 > 198					    __func__, asoc, max_data);
   199		}
   200	
   201		/* If the the peer requested that we authenticate DATA chunks
   202		 * we need to account for bundling of the AUTH chunks along with
   203		 * DATA.
   204		 */
   205		if (sctp_auth_send_cid(SCTP_CID_DATA, asoc)) {
   206			struct sctp_hmac *hmac_desc = sctp_auth_asoc_get_hmac(asoc);
   207	
   208			if (hmac_desc)
   209				max_data -= SCTP_PAD4(sizeof(struct sctp_auth_chunk) +
   210						      hmac_desc->hmac_len);
   211	
   212			if (sinfo->sinfo_tsn &&
   213			    sinfo->sinfo_ssn != asoc->active_key_id) {
   214				shkey = sctp_auth_get_shkey(asoc, sinfo->sinfo_ssn);
   215				if (!shkey) {
   216					err = -EINVAL;
   217					goto errout;
   218				}
   219			} else {
   220				shkey = asoc->shkey;
   221			}
   222		}
   223	
   224		/* Set first_len and then account for possible bundles on first frag */
   225		first_len = max_data;
   226	
   227		/* Check to see if we have a pending SACK and try to let it be bundled
   228		 * with this message.  Do this if we don't have any data queued already.
   229		 * To check that, look at out_qlen and retransmit list.
   230		 * NOTE: we will not reduce to account for SACK, if the message would
   231		 * not have been fragmented.
   232		 */
   233		if (timer_pending(&asoc->timers[SCTP_EVENT_TIMEOUT_SACK]) &&
   234		    asoc->outqueue.out_qlen == 0 &&
   235		    list_empty(&asoc->outqueue.retransmit) &&
   236		    msg_len > max_data)
   237			first_len -= SCTP_PAD4(sizeof(struct sctp_sack_chunk));
   238	
   239		/* Encourage Cookie-ECHO bundling. */
   240		if (asoc->state < SCTP_STATE_COOKIE_ECHOED)
   241			first_len -= SCTP_ARBITRARY_COOKIE_ECHO_LEN;
   242	
   243		/* Account for a different sized first fragment */
   244		if (msg_len >= first_len) {
   245			msg->can_delay = 0;
   246			if (msg_len > first_len)
   247				SCTP_INC_STATS(sock_net(asoc->base.sk),
   248					       SCTP_MIB_FRAGUSRMSGS);
   249		} else {
   250			/* Which may be the only one... */
   251			first_len = msg_len;
   252		}
   253	
   254		/* Create chunks for all DATA chunks. */
   255		for (remaining = msg_len; remaining; remaining -= len) {
   256			u8 frag = SCTP_DATA_MIDDLE_FRAG;
   257	
   258			if (remaining == msg_len) {
   259				/* First frag, which may also be the last */
   260				frag |= SCTP_DATA_FIRST_FRAG;
   261				len = first_len;
   262			} else {
   263				/* Middle frags */
   264				len = max_data;
   265			}
   266	
   267			if (len >= remaining) {
   268				/* Last frag, which may also be the first */
   269				len = remaining;
   270				frag |= SCTP_DATA_LAST_FRAG;
   271	
   272				/* The application requests to set the I-bit of the
   273				 * last DATA chunk of a user message when providing
   274				 * the user message to the SCTP implementation.
   275				 */
   276				if ((sinfo->sinfo_flags & SCTP_EOF) ||
   277				    (sinfo->sinfo_flags & SCTP_SACK_IMMEDIATELY))
   278					frag |= SCTP_DATA_SACK_IMM;
   279			}
   280	
   281			chunk = asoc->stream.si->make_datafrag(asoc, sinfo, len, frag,
   282							       GFP_KERNEL);
   283			if (!chunk) {
   284				err = -ENOMEM;
   285				goto errout;
   286			}
   287	
   288			err = sctp_user_addto_chunk(chunk, len, from);
   289			if (err < 0)
   290				goto errout_chunk_free;
   291	
   292			chunk->shkey = shkey;
   293	
   294			/* Put the chunk->skb back into the form expected by send.  */
   295			__skb_pull(chunk->skb, (__u8 *)chunk->chunk_hdr -
   296					       chunk->skb->data);
   297	
   298			sctp_datamsg_assign(msg, chunk);
   299			list_add_tail(&chunk->frag_list, &msg->chunks);
   300		}
   301	
   302		return msg;
   303	
   304	errout_chunk_free:
   305		sctp_chunk_free(chunk);
   306	
   307	errout:
   308		list_for_each_safe(pos, temp, &msg->chunks) {
   309			list_del_init(pos);
   310			chunk = list_entry(pos, struct sctp_chunk, frag_list);
   311			sctp_chunk_free(chunk);
   312		}
   313		sctp_datamsg_put(msg);
   314	
   315		return ERR_PTR(err);
   316	}
   317	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
