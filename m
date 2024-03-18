Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45803A297
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Mar 2024 17:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710783792; cv=none; b=dAxWnd9eJ8ksJAFRm9MqHl9UZAJjAD2lqaw0KDfLkf/7WSjdOi7ff+Td+zR23Byhw+bi8o/fJTV+mpKCGuhKl3kH+dKpOOi9e8h88eI0v/xwxrV913K8g+4K5hpK34twfyb5OMQhiERUb219LuN9j2cHspgB72xGPD+cbEud0zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710783792; c=relaxed/simple;
	bh=NGWslG7diW64Qk/L3M1ormMDsRZR/hHWlYfvYffde7k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H6Czx71kUPMZX+9kGJfmTDoEatfBZJUwSuJy83UytTi3uop8tDZbMJqYPFEUKOti1ia54yCQhPV2kLpAUE7GiA2IE/Kjb3U7piakBPAA9X2UEnTUy3j9hOHwX3HewFWzcN03PTgEMgy3uiJ3TDOc/5ndrnvGNBIwVoUjiY5CiL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EIt2G+FJ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EIt2G+FJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710783791; x=1742319791;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NGWslG7diW64Qk/L3M1ormMDsRZR/hHWlYfvYffde7k=;
  b=EIt2G+FJjS62e1A/W5PrpSBA76qxV1sTbV1E9S0YK4N1YYxn42wDAoLQ
   CRgzN+u13hWpvU8dNZ5aEvpFGxLAPMO4KF4tK60jUqN+w1OflbClqfLCk
   B9J5e+vb4XX4M84L5aSl4iJflPjkgxB4ZdNPZgq6n2UHsWOdFE/n6l5At
   NRWdtpnKJ8TdZbjyWIyGAiHqifHddcqp6xJQpLX7KG61NXqmR4ToETubp
   2YCUJ7cPt7Ad3gziFPcX8QVmrFdXiko8o/6V3i+ZFu9gRMocD3OQIhGSM
   /yyDN+yCof2xXD45ywutGAYNw0tAA9RI4DmF4Buu74UELJWDd6VM6cHjv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5450258"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="5450258"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 10:43:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="13628522"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 Mar 2024 10:43:09 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmH0s-000H9R-2r;
	Mon, 18 Mar 2024 17:43:06 +0000
Date: Tue, 19 Mar 2024 01:42:49 +0800
From: kernel test robot <lkp@intel.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Steve French <stfrench@microsoft.com>
Subject: [linux-next:master 13671/13793] fs/smb/server/smb2pdu.c:7821:40:
 sparse: sparse: cast to restricted __le16
Message-ID: <202403190118.CmBL5MpO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2e93f143ca010a5013528e1cfdc895f024fe8c21
commit: eb143b7ceab55d75f33833f9289f7194ed9c4f73 [13671/13793] ksmbd: fix potencial out-of-bounds when buffer offset is invalid
config: i386-randconfig-r122-20240318 (https://download.01.org/0day-ci/archive/20240319/202403190118.CmBL5MpO-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240319/202403190118.CmBL5MpO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403190118.CmBL5MpO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/smb/server/smb2pdu.c:7821:40: sparse: sparse: cast to restricted __le16
>> fs/smb/server/smb2pdu.c:7821:40: sparse: sparse: cast from restricted __le32
   fs/smb/server/smb2pdu.c:7957:32: sparse: sparse: cast to restricted __le16
   fs/smb/server/smb2pdu.c:7957:32: sparse: sparse: cast from restricted __le32

vim +7821 fs/smb/server/smb2pdu.c

  7814	
  7815	static int fsctl_pipe_transceive(struct ksmbd_work *work, u64 id,
  7816					 unsigned int out_buf_len,
  7817					 struct smb2_ioctl_req *req,
  7818					 struct smb2_ioctl_rsp *rsp)
  7819	{
  7820		struct ksmbd_rpc_command *rpc_resp;
> 7821		char *data_buf = (char *)req + le16_to_cpu(req->InputOffset);
  7822		int nbytes = 0;
  7823	
  7824		rpc_resp = ksmbd_rpc_ioctl(work->sess, id, data_buf,
  7825					   le32_to_cpu(req->InputCount));
  7826		if (rpc_resp) {
  7827			if (rpc_resp->flags == KSMBD_RPC_SOME_NOT_MAPPED) {
  7828				/*
  7829				 * set STATUS_SOME_NOT_MAPPED response
  7830				 * for unknown domain sid.
  7831				 */
  7832				rsp->hdr.Status = STATUS_SOME_NOT_MAPPED;
  7833			} else if (rpc_resp->flags == KSMBD_RPC_ENOTIMPLEMENTED) {
  7834				rsp->hdr.Status = STATUS_NOT_SUPPORTED;
  7835				goto out;
  7836			} else if (rpc_resp->flags != KSMBD_RPC_OK) {
  7837				rsp->hdr.Status = STATUS_INVALID_PARAMETER;
  7838				goto out;
  7839			}
  7840	
  7841			nbytes = rpc_resp->payload_sz;
  7842			if (rpc_resp->payload_sz > out_buf_len) {
  7843				rsp->hdr.Status = STATUS_BUFFER_OVERFLOW;
  7844				nbytes = out_buf_len;
  7845			}
  7846	
  7847			if (!rpc_resp->payload_sz) {
  7848				rsp->hdr.Status =
  7849					STATUS_UNEXPECTED_IO_ERROR;
  7850				goto out;
  7851			}
  7852	
  7853			memcpy((char *)rsp->Buffer, rpc_resp->payload, nbytes);
  7854		}
  7855	out:
  7856		kvfree(rpc_resp);
  7857		return nbytes;
  7858	}
  7859	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
