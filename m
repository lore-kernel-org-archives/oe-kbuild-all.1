Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C1A2D5C68
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 09:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782121748; cv=none; b=WPHqAeioug70rjb7X40rEz/Wc914UPDMiGfyGwFOSisIQrgF/+a5WheejkHbGluR7rdRXn5Oj8ZRI2ZyYwG9tvX51/im3lmb1LrT4ogmLGS262BSr6i+oXoo98pTd3P1R/ewQOMH+g13RoJcWC6ocQhSt88J7pBhb4ipiofenmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782121748; c=relaxed/simple;
	bh=qt9c9TAeYVLH0493Mx1WtzeGU2SivrGYxPP5vJRYM6c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=T2sLAlb6+rguhZaTSJc0ZTIqy+1zDiUL0i9Z+b7d7dTFaEO6b5Meig1vyIgkzzqzX3wqzC7a+O1fxaLfsweH8iGBnL7K+GTAr8XAMaffFKt+VRfE6M1s2t02QVrZD5QGOVHs3orqnzR1tXeHLG/benN5/rhSNNB0auF8XHUjDZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rq2gByfN; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rq2gByfN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782121747; x=1813657747;
  h=date:from:to:cc:subject:message-id;
  bh=qt9c9TAeYVLH0493Mx1WtzeGU2SivrGYxPP5vJRYM6c=;
  b=Rq2gByfNZv3XjKYhJ/ww4d7V7hlvfA0O721hsbRLdvFcWdEbacmJPLhB
   PKRRWsGp/uYJUwqGHH+7YyuDCFhi/m1HgeZud4n6eEPauwXzxMKwy2dCG
   E8nF3dV08Wy2RiTcKr8IQ/PqTlnBFIHRTRPU9QtjbVro3LG6BrVZGd0LC
   nY4EM0qWhWA0ducZNVYT1hDb/qLlqfVjWjMpFig5JBrRrOu4hpOn6Dml7
   XKw40d7abIZvoB2WCZsz2/dyIQf971pjgKBshLowwZgSUZ1TeQf4d+AQZ
   fwoDAdP+RegBH9ScolJJobVWIpTm5QmOdg9v4nszfEhQpgrL23GF2jP4R
   A==;
X-CSE-ConnectionGUID: DF79FEm8QG2ye1J5DTVn4w==
X-CSE-MsgGUID: Scyr2YEdSfa2WspU/6DzRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="70361586"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="70361586"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 02:49:06 -0700
X-CSE-ConnectionGUID: we6YrXPBTYiluvBbojihAg==
X-CSE-MsgGUID: pWf8ubyPS7uC46bc9/zngA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="245036742"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 22 Jun 2026 02:49:04 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbbH4-000000000ut-0Dx3;
	Mon, 22 Jun 2026 09:49:02 +0000
Date: Mon, 22 Jun 2026 17:48:11 +0800
From: kernel test robot <lkp@intel.com>
To: Shyam Prasad N <sprasad@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, Steve French <stfrench@microsoft.com>
Subject: [linux-next:master 14529/14705]
 fs/smb/client/smb2pdu.c:5638:22: warning: variable 'total_len' set but not
 used
Message-ID: <202606221709.MVKL3qy5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3ce97bd3c4f18608335e709c24d6a40e7036cab8
commit: a83536312b4a62a2beefaab8ecb1e4a524e7f578 [14529/14705] cifs: optimize readdir for larger directories
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260622/202606221709.MVKL3qy5-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260622/202606221709.MVKL3qy5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606221709.MVKL3qy5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/smb/client/smb2pdu.c: In function 'SMB2_query_directory_large':
>> fs/smb/client/smb2pdu.c:5638:22: warning: variable 'total_len' set but not used [-Wunused-but-set-variable]
    5638 |         unsigned int total_len;
         |                      ^~~~~~~~~


vim +/total_len +5638 fs/smb/client/smb2pdu.c

  5623	
  5624	/*
  5625	 * QueryDirectory with large buffer and multi-credit support.
  5626	 * Uses async infrastructure but waits for completion synchronously.
  5627	 */
  5628	int
  5629	SMB2_query_directory_large(struct cifs_query_dir_io *qd_io, unsigned int buf_size)
  5630	{
  5631		int rc, flags = 0;
  5632		char *buf;
  5633		struct smb2_hdr *shdr;
  5634		struct smb_rqst rqst = { .rq_iov = &qd_io->iov[0],
  5635					 .rq_nvec = SMB2_QUERY_DIRECTORY_IOV_SIZE };
  5636		struct TCP_Server_Info *server = qd_io->server;
  5637		struct cifs_tcon *tcon = qd_io->tcon;
> 5638		unsigned int total_len;
  5639		int credit_request;
  5640	
  5641		cifs_dbg(FYI, "%s: buf_size=%u\n", __func__, buf_size);
  5642	
  5643		/* Note: buf_size should already be capped to SMB2_MAX_QD_DATABUF_SIZE by caller
  5644		 * before credit reservation to ensure accurate credit accounting.
  5645		 * This is a safety check; should be unreached in normal flow.
  5646		 */
  5647		if (WARN_ON(buf_size > SMB2_MAX_QD_DATABUF_SIZE)) {
  5648			cifs_dbg(VFS, "%s: ERROR: buf_size=%u exceeds max %u - caller should cap before credits\n",
  5649				 __func__, buf_size, SMB2_MAX_QD_DATABUF_SIZE);
  5650			return -EINVAL;
  5651		}
  5652	
  5653		/* Allocate response buffer. Since we'll build a combined header+data buffer,
  5654		 * we need space for both. We'll request a slightly smaller OutputBufferLength
  5655		 * from the server to ensure the total response fits.
  5656		 */
  5657		qd_io->combined_iov.iov_base = kmalloc(buf_size, GFP_KERNEL);
  5658		if (!qd_io->combined_iov.iov_base)
  5659			return -ENOMEM;
  5660		/* Store total capacity in iov_len; updated to actual data length by receive handler */
  5661		qd_io->combined_iov.iov_len = buf_size;
  5662	
  5663		/* Initialize completion */
  5664		init_completion(&qd_io->done);
  5665	
  5666		/* Request less data from server to leave room for the response header.
  5667		 * Use MAX_CIFS_SMALL_BUFFER_SIZE as a safety margin.
  5668		 */
  5669		rc = SMB2_query_directory_init(qd_io->xid, tcon, server,
  5670					       &rqst, qd_io->persistent_fid,
  5671					       qd_io->volatile_fid, qd_io->index,
  5672					       qd_io->srch_inf->info_level,
  5673					       buf_size - MAX_CIFS_SMALL_BUFFER_SIZE);
  5674		if (rc) {
  5675			kfree(qd_io->combined_iov.iov_base);
  5676			qd_io->combined_iov.iov_base = NULL;
  5677			return rc;
  5678		}
  5679	
  5680		if (smb3_encryption_required(tcon))
  5681			flags |= CIFS_TRANSFORM_REQ;
  5682	
  5683		buf = rqst.rq_iov[0].iov_base;
  5684		total_len = rqst.rq_iov[0].iov_len;
  5685	
  5686		shdr = (struct smb2_hdr *)buf;
  5687	
  5688		if (qd_io->replay) {
  5689			/* Back-off before retry */
  5690			if (qd_io->cur_sleep)
  5691				msleep(qd_io->cur_sleep);
  5692			smb2_set_replay(server, &rqst);
  5693		}
  5694	
  5695		/* Set credit charge based on buffer size */
  5696		if (qd_io->credits.value > 0) {
  5697			shdr->CreditCharge = cpu_to_le16(DIV_ROUND_UP(buf_size,
  5698							SMB2_MAX_BUFFER_SIZE));
  5699			credit_request = le16_to_cpu(shdr->CreditCharge) + 8;
  5700			if (server->credits >= server->max_credits)
  5701				shdr->CreditRequest = cpu_to_le16(0);
  5702			else
  5703				shdr->CreditRequest = cpu_to_le16(
  5704					min_t(int, server->max_credits -
  5705							server->credits, credit_request));
  5706	
  5707			flags |= CIFS_HAS_CREDITS;
  5708		}
  5709	
  5710		rc = cifs_call_async(server, &rqst,
  5711				     cifs_query_dir_receive, smb2_query_dir_callback,
  5712				     smb2_query_dir_handle_data, qd_io, flags,
  5713				     &qd_io->credits);
  5714		if (rc) {
  5715			cifs_stats_fail_inc(tcon, SMB2_QUERY_DIRECTORY_HE);
  5716			trace_smb3_query_dir_err(qd_io->xid, qd_io->persistent_fid,
  5717						 tcon->tid, tcon->ses->Suid,
  5718						 qd_io->index, 0, rc);
  5719			kfree(qd_io->combined_iov.iov_base);
  5720			qd_io->combined_iov.iov_base = NULL;
  5721		}
  5722	
  5723		/* Free request buffer immediately after async call */
  5724		cifs_small_buf_release(buf);
  5725	
  5726		if (rc)
  5727			return rc;
  5728	
  5729		/* Wait for the async operation to complete */
  5730		wait_for_completion(&qd_io->done);
  5731		return qd_io->result;
  5732	}
  5733	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
