Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D672E375AC3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 May 2026 14:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778424030; cv=none; b=Q5FYcOTLGPYkvLaHsQO8p1kapo7rmf4axNnoyB8S/zWj0o8ZAcqLePnTpbb9z/DgQcTsq3lQmWUQZhleIqWRBVDtudTgN1h6hZQxfwtWj+nVtdXqyycAry3SMrwDXn/beub7oCikXu8g5R8yq4Ynxr22zQR5QNeAu0jDTchyzxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778424030; c=relaxed/simple;
	bh=y87I96QE93GiADFY7WvYraVi23PnJC98njwJS4WIUj8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Bp7BeE7c5xCf9MgcQjBgL7ggHvyRDjL04qDd5VjuH+wM5qJK6bRBxZ1sG76ec4vZNkOe1DbO7ULhodbXuN2sSKxYIpdC6HGSlrK08hnpjPs3FvvWitiAZi+h5hXdrYGPWb6AsrmKslzB+964yqvkFsobhsnHCcPkeL48xefDjco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XIm+v2Bq; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XIm+v2Bq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778424029; x=1809960029;
  h=date:from:to:cc:subject:message-id;
  bh=y87I96QE93GiADFY7WvYraVi23PnJC98njwJS4WIUj8=;
  b=XIm+v2Bq75boX/VQpIJD7ackDl8wk/+xfoDbGA97Be82VH/jHdRBLaZf
   yitVb7bo+7Tbz+mipCoECoJDALfkSdFLc/WrDcLqm5v6Ho2O0C09MjWoG
   2PHGs3p6H7ELpIPVXu5UD3i23wiBniQ4COPWcOcLCY+kvy2HnNjd5Q/Yw
   D18ex0EXtzMKeo9xDF0iusY2MIF3Z4Jp0eXXSO21HW+yu/MG+UNCgdXhW
   wA4Gcd546jRTLE10K413mraMtMqM8JOlUjIh3uP9oAGALyDzQyl7RaIWZ
   APPv4DGCSB16BT9hifiYtR+xqzl8YAkiQbmxwBl8tgwWKRkpZlGHwMa4p
   g==;
X-CSE-ConnectionGUID: 2MdZJmgjQh2zvoofiTt11A==
X-CSE-MsgGUID: +AAJBbpWSZCXnZgB9emBEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="90030346"
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="90030346"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2026 07:40:26 -0700
X-CSE-ConnectionGUID: dBUQ/ofKTDSjx7UgoWZPag==
X-CSE-MsgGUID: xRDrOim3QQ2w9jjDnw69uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="267593739"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 May 2026 07:40:23 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wM5KP-000000002JV-2L1N;
	Sun, 10 May 2026 14:40:21 +0000
Date: Sun, 10 May 2026 22:40:07 +0800
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Shyam Prasad N <sprasad@microsoft.com>
Subject: [samba-ksmbd:for-next 4/4] fs/smb/client/smb2pdu.c:5595:22:
 warning: variable 'total_len' set but not used
Message-ID: <202605102210.PDoRL7sB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.samba.org/ksmbd.git for-next
head:   8c24bfe7980824c3a1f4f5bf598a4b307f22084d
commit: 8c24bfe7980824c3a1f4f5bf598a4b307f22084d [4/4] cifs: optimize readdir for larger directories
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260510/202605102210.PDoRL7sB-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605102210.PDoRL7sB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605102210.PDoRL7sB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/smb/client/smb2pdu.c: In function 'SMB2_query_directory_large':
>> fs/smb/client/smb2pdu.c:5595:22: warning: variable 'total_len' set but not used [-Wunused-but-set-variable]
    5595 |         unsigned int total_len;
         |                      ^~~~~~~~~


vim +/total_len +5595 fs/smb/client/smb2pdu.c

  5580	
  5581	/*
  5582	 * QueryDirectory with large buffer and multi-credit support.
  5583	 * Uses async infrastructure but waits for completion synchronously.
  5584	 */
  5585	int
  5586	SMB2_query_directory_large(struct cifs_query_dir_io *qd_io, unsigned int buf_size)
  5587	{
  5588		int rc, flags = 0;
  5589		char *buf;
  5590		struct smb2_hdr *shdr;
  5591		struct smb_rqst rqst = { .rq_iov = &qd_io->iov[0],
  5592					 .rq_nvec = SMB2_QUERY_DIRECTORY_IOV_SIZE };
  5593		struct TCP_Server_Info *server = qd_io->server;
  5594		struct cifs_tcon *tcon = qd_io->tcon;
> 5595		unsigned int total_len;
  5596		int credit_request;
  5597	
  5598		cifs_dbg(FYI, "%s: buf_size=%u\n", __func__, buf_size);
  5599	
  5600		/* Cap buffer size to avoid kmalloc failures for very large allocations.
  5601		 * SMB2_MAX_QD_DATABUF_SIZE is a safe limit that stays well below typical
  5602		 * kmalloc constraints while still allowing large directory listings.
  5603		 */
  5604		if (buf_size > SMB2_MAX_QD_DATABUF_SIZE)
  5605			buf_size = SMB2_MAX_QD_DATABUF_SIZE;
  5606	
  5607		/* Allocate response buffer. Since we'll build a combined header+data buffer,
  5608		 * we need space for both. We'll request a slightly smaller OutputBufferLength
  5609		 * from the server to ensure the total response fits.
  5610		 */
  5611		qd_io->combined_iov.iov_base = kmalloc(buf_size, GFP_KERNEL);
  5612		if (!qd_io->combined_iov.iov_base)
  5613			return -ENOMEM;
  5614		/* Store total capacity in iov_len; updated to actual data length by receive handler */
  5615		qd_io->combined_iov.iov_len = buf_size;
  5616	
  5617		/* Initialize completion */
  5618		init_completion(&qd_io->done);
  5619	
  5620		/* Request less data from server to leave room for the response header.
  5621		 * Use MAX_CIFS_SMALL_BUFFER_SIZE as a safety margin.
  5622		 */
  5623		rc = SMB2_query_directory_init(qd_io->xid, tcon, server,
  5624					       &rqst, qd_io->persistent_fid,
  5625					       qd_io->volatile_fid, qd_io->index,
  5626					       qd_io->srch_inf->info_level,
  5627					       buf_size - MAX_CIFS_SMALL_BUFFER_SIZE);
  5628		if (rc) {
  5629			kfree(qd_io->combined_iov.iov_base);
  5630			qd_io->combined_iov.iov_base = NULL;
  5631			return rc;
  5632		}
  5633	
  5634		if (smb3_encryption_required(tcon))
  5635			flags |= CIFS_TRANSFORM_REQ;
  5636	
  5637		buf = rqst.rq_iov[0].iov_base;
  5638		total_len = rqst.rq_iov[0].iov_len;
  5639	
  5640		shdr = (struct smb2_hdr *)buf;
  5641	
  5642		if (qd_io->replay) {
  5643			/* Back-off before retry */
  5644			if (qd_io->cur_sleep)
  5645				msleep(qd_io->cur_sleep);
  5646			smb2_set_replay(server, &rqst);
  5647		}
  5648	
  5649		/* Set credit charge based on buffer size */
  5650		if (qd_io->credits.value > 0) {
  5651			shdr->CreditCharge = cpu_to_le16(DIV_ROUND_UP(buf_size,
  5652							SMB2_MAX_BUFFER_SIZE));
  5653			credit_request = le16_to_cpu(shdr->CreditCharge) + 8;
  5654			if (server->credits >= server->max_credits)
  5655				shdr->CreditRequest = cpu_to_le16(0);
  5656			else
  5657				shdr->CreditRequest = cpu_to_le16(
  5658					min_t(int, server->max_credits -
  5659							server->credits, credit_request));
  5660	
  5661			flags |= CIFS_HAS_CREDITS;
  5662		}
  5663	
  5664		rc = cifs_call_async(server, &rqst,
  5665				     cifs_query_dir_receive, smb2_query_dir_callback,
  5666				     smb2_query_dir_handle_data, qd_io, flags,
  5667				     &qd_io->credits);
  5668		if (rc) {
  5669			cifs_stats_fail_inc(tcon, SMB2_QUERY_DIRECTORY_HE);
  5670			trace_smb3_query_dir_err(qd_io->xid, qd_io->persistent_fid,
  5671						 tcon->tid, tcon->ses->Suid,
  5672						 qd_io->index, 0, rc);
  5673			kfree(qd_io->combined_iov.iov_base);
  5674			qd_io->combined_iov.iov_base = NULL;
  5675		}
  5676	
  5677		/* Free request buffer immediately after async call */
  5678		cifs_small_buf_release(buf);
  5679	
  5680		if (rc)
  5681			return rc;
  5682	
  5683		/* Wait for the async operation to complete */
  5684		wait_for_completion(&qd_io->done);
  5685		return qd_io->result;
  5686	}
  5687	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
