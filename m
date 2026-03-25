Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F341224DFF3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 13:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774444445; cv=none; b=Vr4gEOdIS5CyEVfNe6SuYzlmtfNxFMH2D9l/ngMpCre6eIPtaPKrtZbTY2Q815Dn3xOYR4wMcjbNKzGJTH7NcbHAxmWlX8naqyoWl/gxW6eKlLISanlSaEi99NWGAXHD8HarOAaYtOc0Lmv9BOfP9M/Uo+bWaCEjnDPfn9wFsJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774444445; c=relaxed/simple;
	bh=uxEBIxgSBiUMUpNeEe4Ddp7Ta1ciSWm7f5f17rKyrVY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SY81/z2pFEbdvQzRL7DsQ7j8o/VVuw2+tOYofvHxs7XjU9fOvgN0zr8yxXX+xo3BzaCYL4xNrulO403u+8AfUAP1QJ/3EE8mfiQ5QRRmMKodzx32qN/1yic/8ScPAeFr86mc4mkj9pCSJJWQQKUnf8gDXAYHVJBRwkJDkbEVomY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ve9lOuV7; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ve9lOuV7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774444444; x=1805980444;
  h=date:from:to:cc:subject:message-id;
  bh=uxEBIxgSBiUMUpNeEe4Ddp7Ta1ciSWm7f5f17rKyrVY=;
  b=Ve9lOuV7BDcmX0uokXLmS4G9VUWr2M7iam/pUfjCD6RcYpSbFG6K1sgl
   xdtOQLn39eUqgc0OHYd0nXQYFF1SoJDvuhmQJ+g6eXLeswbB2hkgYOpGQ
   X6lNZH2ob+FkdGvuUOS2KIpYw3vsi0arO+Y60OxNqzPsmeV4OYZMSqnHc
   tG1w/kZCUuE17p+OK0Bcj4/lpfXR3M0HWHhUaRfu2MbJiLPxn/N0Ja4rX
   WjvmGUxgG3bpk8WZefGotn4r9/6OA0IFfV3/o4dFyhG82Y/928XXzDuUB
   WEaNyfCvyu1+HKQA5FgYe1Ms8hk1U4ZR6fzhFSct5tb0K86MQ2w68AYX6
   A==;
X-CSE-ConnectionGUID: YX2t1dmDQwWcWOWmdn2uTA==
X-CSE-MsgGUID: w2KjtHffTJ62G0sfizx/2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="98099838"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="98099838"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 06:13:47 -0700
X-CSE-ConnectionGUID: mM6jQEWVThaoWF0RvjUj4g==
X-CSE-MsgGUID: hl2043t0Tg+SmW6t1MkVoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="218101751"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 25 Mar 2026 06:13:45 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5O3L-000000006y3-0vHl;
	Wed, 25 Mar 2026 13:13:43 +0000
Date: Wed, 25 Mar 2026 21:13:31 +0800
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [smfrench-smb3:ksmbd-for-next-next 11/15]
 fs/smb/server/smb2pdu.c:5790:6: warning: variable 'scratch_len' is used
 uninitialized whenever 'if' condition is true
Message-ID: <202603252147.lIPyoNlD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/smfrench/smb3-kernel.git ksmbd-for-next-next
head:   3a3623e9d49586a0dac997718a9fb9c4cb18fff4
commit: 7657677ba79aa5bafeb8c8f173761b86e9f047b7 [11/15] ksmbd: fix OOB write in QUERY_INFO for compound requests
config: arm-randconfig-002-20260325 (https://download.01.org/0day-ci/archive/20260325/202603252147.lIPyoNlD-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603252147.lIPyoNlD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603252147.lIPyoNlD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/smb/server/smb2pdu.c:5790:6: warning: variable 'scratch_len' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    5790 |         if (max_len < 0) {
         |             ^~~~~~~~~~~
   fs/smb/server/smb2pdu.c:5817:29: note: uninitialized use occurs here
    5817 |         if (ALIGN(secdesclen, 8) > scratch_len)
         |                                    ^~~~~~~~~~~
   fs/smb/server/smb2pdu.c:5790:2: note: remove the 'if' if its condition is always false
    5790 |         if (max_len < 0) {
         |         ^~~~~~~~~~~~~~~~~~
    5791 |                 rc = -EINVAL;
         |                 ~~~~~~~~~~~~~
    5792 |                 goto release_acl;
         |                 ~~~~~~~~~~~~~~~~~
    5793 |         }
         |         ~
   fs/smb/server/smb2pdu.c:5734:20: note: initialize the variable 'scratch_len' to silence this warning
    5734 |         size_t scratch_len;
         |                           ^
         |                            = 0
   1 warning generated.


vim +5790 fs/smb/server/smb2pdu.c

  5720	
  5721	static int smb2_get_info_sec(struct ksmbd_work *work,
  5722				     struct smb2_query_info_req *req,
  5723				     struct smb2_query_info_rsp *rsp)
  5724	{
  5725		struct ksmbd_file *fp;
  5726		struct mnt_idmap *idmap;
  5727		struct smb_ntsd *pntsd = NULL, *ppntsd = NULL;
  5728		struct smb_fattr fattr = {{0}};
  5729		struct inode *inode;
  5730		__u32 secdesclen = 0;
  5731		unsigned int id = KSMBD_NO_FID, pid = KSMBD_NO_FID;
  5732		int addition_info = le32_to_cpu(req->AdditionalInformation);
  5733		int rc = 0, ppntsd_size = 0, max_len;
  5734		size_t scratch_len;
  5735	
  5736		if (addition_info & ~(OWNER_SECINFO | GROUP_SECINFO | DACL_SECINFO |
  5737				      PROTECTED_DACL_SECINFO |
  5738				      UNPROTECTED_DACL_SECINFO)) {
  5739			ksmbd_debug(SMB, "Unsupported addition info: 0x%x)\n",
  5740			       addition_info);
  5741	
  5742			pntsd = kmalloc(ALIGN(sizeof(struct smb_ntsd), 8),
  5743					KSMBD_DEFAULT_GFP);
  5744			if (!pntsd)
  5745				return -ENOMEM;
  5746	
  5747			pntsd->revision = cpu_to_le16(1);
  5748			pntsd->type = cpu_to_le16(SELF_RELATIVE | DACL_PROTECTED);
  5749			pntsd->osidoffset = 0;
  5750			pntsd->gsidoffset = 0;
  5751			pntsd->sacloffset = 0;
  5752			pntsd->dacloffset = 0;
  5753	
  5754			secdesclen = sizeof(struct smb_ntsd);
  5755			goto iov_pin;
  5756		}
  5757	
  5758		if (work->next_smb2_rcv_hdr_off) {
  5759			if (!has_file_id(req->VolatileFileId)) {
  5760				ksmbd_debug(SMB, "Compound request set FID = %llu\n",
  5761					    work->compound_fid);
  5762				id = work->compound_fid;
  5763				pid = work->compound_pfid;
  5764			}
  5765		}
  5766	
  5767		if (!has_file_id(id)) {
  5768			id = req->VolatileFileId;
  5769			pid = req->PersistentFileId;
  5770		}
  5771	
  5772		fp = ksmbd_lookup_fd_slow(work, id, pid);
  5773		if (!fp)
  5774			return -ENOENT;
  5775	
  5776		idmap = file_mnt_idmap(fp->filp);
  5777		inode = file_inode(fp->filp);
  5778		ksmbd_acls_fattr(&fattr, idmap, inode);
  5779	
  5780		if (test_share_config_flag(work->tcon->share_conf,
  5781					   KSMBD_SHARE_FLAG_ACL_XATTR))
  5782			ppntsd_size = ksmbd_vfs_get_sd_xattr(work->conn, idmap,
  5783							     fp->filp->f_path.dentry,
  5784							     &ppntsd);
  5785	
  5786		/* Check if sd buffer size exceeds response buffer size */
  5787		max_len = smb2_calc_max_out_buf_len(work,
  5788				offsetof(struct smb2_query_info_rsp, Buffer),
  5789				le32_to_cpu(req->OutputBufferLength));
> 5790		if (max_len < 0) {
  5791			rc = -EINVAL;
  5792			goto release_acl;
  5793		}
  5794	
  5795		scratch_len = smb_acl_sec_desc_scratch_len(&fattr, ppntsd,
  5796				ppntsd_size, addition_info);
  5797		if (!scratch_len || scratch_len == SIZE_MAX) {
  5798			rc = -EFBIG;
  5799			goto release_acl;
  5800		}
  5801	
  5802		pntsd = kvzalloc(scratch_len, KSMBD_DEFAULT_GFP);
  5803		if (!pntsd) {
  5804			rc = -ENOMEM;
  5805			goto release_acl;
  5806		}
  5807	
  5808		rc = build_sec_desc(idmap, pntsd, ppntsd, ppntsd_size,
  5809				addition_info, &secdesclen, &fattr);
  5810	
  5811	release_acl:
  5812		posix_acl_release(fattr.cf_acls);
  5813		posix_acl_release(fattr.cf_dacls);
  5814		kfree(ppntsd);
  5815		ksmbd_fd_put(work, fp);
  5816	
  5817		if (ALIGN(secdesclen, 8) > scratch_len)
  5818			rc = -EFBIG;
  5819		if (rc)
  5820			goto err_out;
  5821	
  5822	iov_pin:
  5823		rsp->OutputBufferLength = cpu_to_le32(secdesclen);
  5824		rc = buffer_check_err(le32_to_cpu(req->OutputBufferLength),
  5825				      rsp, work->response_buf);
  5826		if (rc)
  5827			goto err_out;
  5828	
  5829		rc = ksmbd_iov_pin_rsp_read(work, (void *)rsp,
  5830				offsetof(struct smb2_query_info_rsp, Buffer),
  5831				pntsd, secdesclen);
  5832	err_out:
  5833		if (rc) {
  5834			rsp->OutputBufferLength = 0;
  5835			kvfree(pntsd);
  5836		}
  5837	
  5838		return rc;
  5839	}
  5840	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
