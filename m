Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221AA37701B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 May 2026 14:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778683717; cv=none; b=uOwh48NpWlk5tzrG/kaDxjZLsp1NmlPNzMCT9J5fHGNjEu2tdxfDoMFeB2CeiRzoSH6gnWcjC9IYztexn4gFcETISm9f0B/nRcIP/cT6I9J03iQz/hQry8ykVhFMG+fB8hebD783bvMMxdCpK1WSShqwMyw34c9C6WD0FsDFBpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778683717; c=relaxed/simple;
	bh=aR7C+YkpD0CevX4d8fP+lVU9ZUEY4d5i6/TUggVooaI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SYPMuyZWCKTtbflqUOk4+Le70ZNds68ol9UxUeQhfxJyDJgGVbGS+4hOrW5liLRMevKjQ2e6wQ2E5th/Zh2BH3TLJuXToTwGN+02H1z9gDIUNYjhUMUHmwAXD8h+fRx14DfJN8CY5FHTjM3kieaNjJIYZrB0kF/2WrmX7P4ff9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QwdccKl8; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QwdccKl8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778683716; x=1810219716;
  h=date:from:to:cc:subject:message-id;
  bh=aR7C+YkpD0CevX4d8fP+lVU9ZUEY4d5i6/TUggVooaI=;
  b=QwdccKl8F4JlF2nvyUF1KiF7shK1YWQaJUhBDLbvU4A24WFlii/1Ad6j
   cgsRrWDk2Qlxte4eva8ofsaY/WilW9iLLleRA3g78U+RuTKRe40N/pFGy
   yX4euyLi2YQERLDjBkyS2qAkeOPZ5ZNi284hDW5ArkDs+RiioKtiexGn9
   J5bTRd5c16Fj3TYCXblscBScjt5Flu0zlA1gfwjSolzLOnNtuO5EGWN5M
   0LvPBULGMjphTlC0zg3pW0OvDuDaL2oHNvR9VKlr40dhvPaJpNUl7SeBL
   oMKfOz3G4XOb/ggQDAnAd642rN93AvkNXbGPM3tyh556aLCFynZg4G91c
   g==;
X-CSE-ConnectionGUID: Zn+12hblR167NZNlcTHlBA==
X-CSE-MsgGUID: smJQMQr8T5WZlQQwXmiWfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="90996529"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="90996529"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 07:48:36 -0700
X-CSE-ConnectionGUID: siwpKPJmTrmuV9mJk6B8IQ==
X-CSE-MsgGUID: HRg8fJexQKaDsOoKvdTkiw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 May 2026 07:48:34 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNAsx-000000004Gr-3Zoz;
	Wed, 13 May 2026 14:48:31 +0000
Date: Wed, 13 May 2026 22:48:01 +0800
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Shyam Prasad N <sprasad@microsoft.com>
Subject: [samba-ksmbd:for-next 4/24] fs/smb/client/smb2ops.c:5402:51:
 sparse: sparse: restricted __le16 degrades to integer
Message-ID: <202605132200.PjNnjNNp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.samba.org/ksmbd.git for-next
head:   9e4492e632c17c6bdfec94b27aac69f9ffaf84dc
commit: cfaef19d4d4c78c90eaa71367a5402855a716416 [4/24] cifs: optimize readdir for larger directories
config: sparc64-randconfig-r132-20260513 (https://download.01.org/0day-ci/archive/20260513/202605132200.PjNnjNNp-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605132200.PjNnjNNp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605132200.PjNnjNNp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/smb/client/smb2ops.c:5402:51: sparse: sparse: restricted __le16 degrades to integer
   fs/smb/client/smb2ops.c:5405:58: sparse: sparse: restricted __le16 degrades to integer
   fs/smb/client/smb2ops.c:5557:51: sparse: sparse: restricted __le16 degrades to integer
   fs/smb/client/smb2ops.c:5560:58: sparse: sparse: restricted __le16 degrades to integer

vim +5402 fs/smb/client/smb2ops.c

  5365	
  5366	
  5367	static void smb2_decrypt_offload(struct work_struct *work)
  5368	{
  5369		struct smb2_decrypt_work *dw = container_of(work,
  5370					struct smb2_decrypt_work, decrypt);
  5371		int rc;
  5372		struct mid_q_entry *mid;
  5373		struct iov_iter iter;
  5374		struct smb2_hdr *shdr;
  5375		unsigned int read_rsp_size = dw->server->vals->read_rsp_size;
  5376	
  5377		/* decrypt read_rsp_size in buf + remainder in folio_queue */
  5378		iov_iter_folio_queue(&iter, ITER_DEST, dw->buffer, 0, 0, dw->len);
  5379		rc = decrypt_raw_data(dw->server, dw->buf, read_rsp_size, &iter, true);
  5380		if (rc) {
  5381			cifs_dbg(VFS, "error decrypting rc=%d\n", rc);
  5382			goto free_pages;
  5383		}
  5384	
  5385		dw->server->lstrp = jiffies;
  5386	
  5387		shdr = (struct smb2_hdr *)(dw->buf + sizeof(struct smb2_transform_hdr));
  5388	
  5389		/*
  5390		 * buf now contains read_rsp_size bytes after transform_hdr.
  5391		 * folio_queue contains (total_len - read_rsp_size) bytes.
  5392		 * The handle functions will determine where data actually starts based on data_offset.
  5393		 */
  5394	
  5395		mid = smb2_find_dequeue_mid(dw->server, dw->buf);
  5396		if (mid == NULL)
  5397			cifs_dbg(FYI, "mid not found\n");
  5398		else {
  5399			mid->decrypted = true;
  5400	
  5401			/* Handle based on command type */
> 5402			if (le16_to_cpu(shdr->Command) == SMB2_READ) {
  5403				rc = handle_read_data(dw->server, mid, dw->buf, read_rsp_size,
  5404						      dw->buffer, dw->len, true);
  5405			} else if (le16_to_cpu(shdr->Command) == SMB2_QUERY_DIRECTORY) {
  5406				rc = handle_query_dir_data(dw->server, mid, dw->buf, read_rsp_size,
  5407							   dw->buffer, dw->len, true);
  5408			} else {
  5409				cifs_dbg(VFS, "Unexpected command %u in decrypt offload\n",
  5410					 le16_to_cpu(shdr->Command));
  5411				rc = -EOPNOTSUPP;
  5412			}
  5413	
  5414			if (rc >= 0) {
  5415	#ifdef CONFIG_CIFS_STATS2
  5416				mid->when_received = jiffies;
  5417	#endif
  5418				if (dw->server->ops->is_network_name_deleted)
  5419					dw->server->ops->is_network_name_deleted(dw->buf,
  5420										 dw->server);
  5421	
  5422				mid_execute_callback(dw->server, mid);
  5423			} else {
  5424				spin_lock(&dw->server->srv_lock);
  5425				if (dw->server->tcpStatus == CifsNeedReconnect) {
  5426					spin_lock(&dw->server->mid_queue_lock);
  5427					mid->mid_state = MID_RETRY_NEEDED;
  5428					spin_unlock(&dw->server->mid_queue_lock);
  5429					spin_unlock(&dw->server->srv_lock);
  5430					mid_execute_callback(dw->server, mid);
  5431				} else {
  5432					spin_lock(&dw->server->mid_queue_lock);
  5433					mid->mid_state = MID_REQUEST_SUBMITTED;
  5434					mid->deleted_from_q = false;
  5435					list_add_tail(&mid->qhead,
  5436						&dw->server->pending_mid_q);
  5437					spin_unlock(&dw->server->mid_queue_lock);
  5438					spin_unlock(&dw->server->srv_lock);
  5439				}
  5440			}
  5441			release_mid(dw->server, mid);
  5442		}
  5443	
  5444	free_pages:
  5445		netfs_free_folioq_buffer(dw->buffer);
  5446		cifs_small_buf_release(dw->buf);
  5447		kfree(dw);
  5448	}
  5449	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
