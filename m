Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D800E3F20E8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Mar 2026 16:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773849623; cv=none; b=tcoZGBANB3hujopxM3GkZsQ/e8oEZBjm10eSKZpi80zrRIV/ZeH4Runuv8IFndKgRfli2c4c9IOkwnUaRD9MxrwGA6qNsFmwlHWPdIcuQFgVkShMluAk2CwNsofF2uYyTxGa39vQySgHd6boohwEbbVmZ4N08STwZkite6r7e7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773849623; c=relaxed/simple;
	bh=2B9gnNG79QnDg+JKSNA2//Hw+h9B3J5lDwNnj8zmy1I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aYAOGiG3dnPk9gMbnwW1DF6aM5gWZwEWoNLRPlu0DWVqUAEIHmLStin8xemp1cMHmfLg+zSY6pxrnMzJbOVH1wCmKuTzMz3gaimQymazxjAMjel3CuZbIpJonA7uqVeI1sNgQj11vX1hKiAexUlBVjXbEz3mICljV/k3BSlD57k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bsr/JrEp; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bsr/JrEp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773849617; x=1805385617;
  h=date:from:to:cc:subject:message-id;
  bh=2B9gnNG79QnDg+JKSNA2//Hw+h9B3J5lDwNnj8zmy1I=;
  b=bsr/JrEpxaZQmS3pDDOAJchiScG+SZarIxcdqXxJPiKiCX/zID2Mvfk/
   r6n5PQ5HOK0qEki951x/2C/oP9q7OXo5LVDaJL4yrnRS0mHoQH7iOwfY2
   tb5YZxboFtDF5wn4KKo1GJxHGhZyWMBvvRTm9I7efV439OnpoxaOJsy38
   54ogDDY77bQ5V/Jxnmh+I8+1Jl8zEUEbZO7UM/YnbcY8DCOe8DvAhKQmc
   G9lw6pSMAS65FdGCvzkwnxNIDiNyV00cimzC1nJ1C5ljkC75eF+X9Mdc+
   hn3w1bjdmD84AWk8TWJ4aYGutVVxJPbVF43YnGoxRuz8RxzmPoZCQYmTh
   Q==;
X-CSE-ConnectionGUID: GNnny6IvTYGh6ptGb/5GAw==
X-CSE-MsgGUID: qKifnhwhQxK8r+2kwyVCVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="78767627"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="78767627"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 09:00:10 -0700
X-CSE-ConnectionGUID: jM0fTtwrSWqrBH4ziJxCHA==
X-CSE-MsgGUID: PMY9wsW/QeKfKIrJm26LIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="218679423"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Mar 2026 09:00:08 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2tJV-0000000034f-3d8m;
	Wed, 18 Mar 2026 16:00:05 +0000
Date: Wed, 18 Mar 2026 23:59:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:main-16k-gs-shusky-5.15 30/30]
 fs/ksmbd/smb2pdu.c:5736: warning: Function parameter or member 'req' not
 described in 'smb2_set_info_file'
Message-ID: <202603182323.lLWyoaVp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Namjae,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common main-16k-gs-shusky-5.15
head:   56450c9b33422201c8d3b751d691f356c16ea142
commit: 9496e268e3af78a92778bf635488a8ec2dca8996 [30/30] ksmbd: add request buffer validation in smb2_set_info
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260318/202603182323.lLWyoaVp-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603182323.lLWyoaVp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603182323.lLWyoaVp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/ksmbd/smb2pdu.c:645: warning: Function parameter or member 'local_nls' not described in 'smb2_get_name'
   fs/ksmbd/smb2pdu.c:645: warning: Excess function parameter 'nls_table' description in 'smb2_get_name'
   fs/ksmbd/smb2pdu.c:3321: warning: Excess function parameter 'user_ns' description in 'smb2_populate_readdir_entry'
>> fs/ksmbd/smb2pdu.c:5736: warning: Function parameter or member 'req' not described in 'smb2_set_info_file'
>> fs/ksmbd/smb2pdu.c:5736: warning: Excess function parameter 'info_class' description in 'smb2_set_info_file'


vim +5736 fs/ksmbd/smb2pdu.c

e2f34481b24db2 fs/cifsd/smb2pdu.c Namjae Jeon  2021-03-16  5722  
e2f34481b24db2 fs/cifsd/smb2pdu.c Namjae Jeon  2021-03-16  5723  /**
e2f34481b24db2 fs/cifsd/smb2pdu.c Namjae Jeon  2021-03-16  5724   * smb2_set_info_file() - handler for smb2 set info command
e2f34481b24db2 fs/cifsd/smb2pdu.c Namjae Jeon  2021-03-16  5725   * @work:	smb work containing set info command buffer
95fa1ce947d60b fs/cifsd/smb2pdu.c Hyunchul Lee 2021-03-21  5726   * @fp:		ksmbd_file pointer
95fa1ce947d60b fs/cifsd/smb2pdu.c Hyunchul Lee 2021-03-21  5727   * @info_class:	smb2 set info class
95fa1ce947d60b fs/cifsd/smb2pdu.c Hyunchul Lee 2021-03-21  5728   * @share:	ksmbd_share_config pointer
e2f34481b24db2 fs/cifsd/smb2pdu.c Namjae Jeon  2021-03-16  5729   *
e2f34481b24db2 fs/cifsd/smb2pdu.c Namjae Jeon  2021-03-16  5730   * Return:	0 on success, otherwise error
e2f34481b24db2 fs/cifsd/smb2pdu.c Namjae Jeon  2021-03-16  5731   * TODO: need to implement an error handling for STATUS_INFO_LENGTH_MISMATCH
e2f34481b24db2 fs/cifsd/smb2pdu.c Namjae Jeon  2021-03-16  5732   */
64b39f4a2fd293 fs/cifsd/smb2pdu.c Namjae Jeon  2021-03-30  5733  static int smb2_set_info_file(struct ksmbd_work *work, struct ksmbd_file *fp,
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5734  			      struct smb2_set_info_req *req,
070fb21e5912b6 fs/cifsd/smb2pdu.c Namjae Jeon  2021-05-26  5735  			      struct ksmbd_share_config *share)
e2f34481b24db2 fs/cifsd/smb2pdu.c Namjae Jeon  2021-03-16 @5736  {
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5737  	unsigned int buf_len = le32_to_cpu(req->BufferLength);
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5738  
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5739  	switch (req->FileInfoClass) {
e2f34481b24db2 fs/cifsd/smb2pdu.c Namjae Jeon  2021-03-16  5740  	case FILE_BASIC_INFORMATION:
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5741  	{
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5742  		if (buf_len < sizeof(struct smb2_file_basic_info))
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5743  			return -EINVAL;
e2f34481b24db2 fs/cifsd/smb2pdu.c Namjae Jeon  2021-03-16  5744  
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5745  		return set_file_basic_info(fp, (struct smb2_file_basic_info *)req->Buffer, share);
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5746  	}
e2f34481b24db2 fs/cifsd/smb2pdu.c Namjae Jeon  2021-03-16  5747  	case FILE_ALLOCATION_INFORMATION:
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5748  	{
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5749  		if (buf_len < sizeof(struct smb2_file_alloc_info))
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5750  			return -EINVAL;
e2f34481b24db2 fs/cifsd/smb2pdu.c Namjae Jeon  2021-03-16  5751  
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5752  		return set_file_allocation_info(work, fp,
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5753  						(struct smb2_file_alloc_info *)req->Buffer);
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5754  	}
e2f34481b24db2 fs/cifsd/smb2pdu.c Namjae Jeon  2021-03-16  5755  	case FILE_END_OF_FILE_INFORMATION:
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5756  	{
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5757  		if (buf_len < sizeof(struct smb2_file_eof_info))
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5758  			return -EINVAL;
e2f34481b24db2 fs/cifsd/smb2pdu.c Namjae Jeon  2021-03-16  5759  
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5760  		return set_end_of_file_info(work, fp,
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5761  					    (struct smb2_file_eof_info *)req->Buffer);
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5762  	}
e2f34481b24db2 fs/cifsd/smb2pdu.c Namjae Jeon  2021-03-16  5763  	case FILE_RENAME_INFORMATION:
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5764  	{
64b39f4a2fd293 fs/cifsd/smb2pdu.c Namjae Jeon  2021-03-30  5765  		if (!test_tree_conn_flag(work->tcon, KSMBD_TREE_CONN_FLAG_WRITABLE)) {
e2f34481b24db2 fs/cifsd/smb2pdu.c Namjae Jeon  2021-03-16  5766  			ksmbd_debug(SMB,
e2f34481b24db2 fs/cifsd/smb2pdu.c Namjae Jeon  2021-03-16  5767  				    "User does not have write permission\n");
e2f34481b24db2 fs/cifsd/smb2pdu.c Namjae Jeon  2021-03-16  5768  			return -EACCES;
e2f34481b24db2 fs/cifsd/smb2pdu.c Namjae Jeon  2021-03-16  5769  		}
e2f34481b24db2 fs/cifsd/smb2pdu.c Namjae Jeon  2021-03-16  5770  
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5771  		if (buf_len < sizeof(struct smb2_file_rename_info))
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5772  			return -EINVAL;
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5773  
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5774  		return set_rename_info(work, fp,
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5775  				       (struct smb2_file_rename_info *)req->Buffer,
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5776  				       buf_len);
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5777  	}
e2f34481b24db2 fs/cifsd/smb2pdu.c Namjae Jeon  2021-03-16  5778  	case FILE_LINK_INFORMATION:
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5779  	{
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5780  		if (buf_len < sizeof(struct smb2_file_link_info))
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5781  			return -EINVAL;
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5782  
e2f34481b24db2 fs/cifsd/smb2pdu.c Namjae Jeon  2021-03-16  5783  		return smb2_create_link(work, work->tcon->share_conf,
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5784  					(struct smb2_file_link_info *)req->Buffer,
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5785  					buf_len, fp->filp,
e2f34481b24db2 fs/cifsd/smb2pdu.c Namjae Jeon  2021-03-16  5786  					work->sess->conn->local_nls);
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5787  	}
e2f34481b24db2 fs/cifsd/smb2pdu.c Namjae Jeon  2021-03-16  5788  	case FILE_DISPOSITION_INFORMATION:
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5789  	{
64b39f4a2fd293 fs/cifsd/smb2pdu.c Namjae Jeon  2021-03-30  5790  		if (!test_tree_conn_flag(work->tcon, KSMBD_TREE_CONN_FLAG_WRITABLE)) {
e2f34481b24db2 fs/cifsd/smb2pdu.c Namjae Jeon  2021-03-16  5791  			ksmbd_debug(SMB,
e2f34481b24db2 fs/cifsd/smb2pdu.c Namjae Jeon  2021-03-16  5792  				    "User does not have write permission\n");
e2f34481b24db2 fs/cifsd/smb2pdu.c Namjae Jeon  2021-03-16  5793  			return -EACCES;
e2f34481b24db2 fs/cifsd/smb2pdu.c Namjae Jeon  2021-03-16  5794  		}
e2f34481b24db2 fs/cifsd/smb2pdu.c Namjae Jeon  2021-03-16  5795  
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5796  		if (buf_len < sizeof(struct smb2_file_disposition_info))
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5797  			return -EINVAL;
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5798  
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5799  		return set_file_disposition_info(fp,
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5800  						 (struct smb2_file_disposition_info *)req->Buffer);
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5801  	}
e2f34481b24db2 fs/cifsd/smb2pdu.c Namjae Jeon  2021-03-16  5802  	case FILE_FULL_EA_INFORMATION:
e2f34481b24db2 fs/cifsd/smb2pdu.c Namjae Jeon  2021-03-16  5803  	{
e2f34481b24db2 fs/cifsd/smb2pdu.c Namjae Jeon  2021-03-16  5804  		if (!(fp->daccess & FILE_WRITE_EA_LE)) {
bde1694aecdb53 fs/cifsd/smb2pdu.c Namjae Jeon  2021-06-28  5805  			pr_err("Not permitted to write ext  attr: 0x%x\n",
e2f34481b24db2 fs/cifsd/smb2pdu.c Namjae Jeon  2021-03-16  5806  			       fp->daccess);
e2f34481b24db2 fs/cifsd/smb2pdu.c Namjae Jeon  2021-03-16  5807  			return -EACCES;
e2f34481b24db2 fs/cifsd/smb2pdu.c Namjae Jeon  2021-03-16  5808  		}
e2f34481b24db2 fs/cifsd/smb2pdu.c Namjae Jeon  2021-03-16  5809  
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5810  		if (buf_len < sizeof(struct smb2_ea_info))
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5811  			return -EINVAL;
e2f34481b24db2 fs/cifsd/smb2pdu.c Namjae Jeon  2021-03-16  5812  
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5813  		return smb2_set_ea((struct smb2_ea_info *)req->Buffer,
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5814  				   buf_len, &fp->filp->f_path);
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5815  	}
e2f34481b24db2 fs/cifsd/smb2pdu.c Namjae Jeon  2021-03-16  5816  	case FILE_POSITION_INFORMATION:
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5817  	{
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5818  		if (buf_len < sizeof(struct smb2_file_pos_info))
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5819  			return -EINVAL;
e2f34481b24db2 fs/cifsd/smb2pdu.c Namjae Jeon  2021-03-16  5820  
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5821  		return set_file_position_info(fp, (struct smb2_file_pos_info *)req->Buffer);
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5822  	}
e2f34481b24db2 fs/cifsd/smb2pdu.c Namjae Jeon  2021-03-16  5823  	case FILE_MODE_INFORMATION:
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5824  	{
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5825  		if (buf_len < sizeof(struct smb2_file_mode_info))
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5826  			return -EINVAL;
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5827  
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5828  		return set_file_mode_info(fp, (struct smb2_file_mode_info *)req->Buffer);
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5829  	}
e2f34481b24db2 fs/cifsd/smb2pdu.c Namjae Jeon  2021-03-16  5830  	}
e2f34481b24db2 fs/cifsd/smb2pdu.c Namjae Jeon  2021-03-16  5831  
9496e268e3af78 fs/ksmbd/smb2pdu.c Namjae Jeon  2021-09-29  5832  	pr_err("Unimplemented Fileinfoclass :%d\n", req->FileInfoClass);
e2f34481b24db2 fs/cifsd/smb2pdu.c Namjae Jeon  2021-03-16  5833  	return -EOPNOTSUPP;
e2f34481b24db2 fs/cifsd/smb2pdu.c Namjae Jeon  2021-03-16  5834  }
e2f34481b24db2 fs/cifsd/smb2pdu.c Namjae Jeon  2021-03-16  5835  

:::::: The code at line 5736 was first introduced by commit
:::::: e2f34481b24db2fd634b5edb0a5bd0e4d38cc6e9 cifsd: add server-side procedures for SMB3

:::::: TO: Namjae Jeon <namjae.jeon@samsung.com>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
