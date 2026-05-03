Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED6437F746
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 May 2026 15:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777823821; cv=none; b=XX4xdEQbHYdhNibhvCB3yMHxCw/uouSUbfuQ+veKONoo/Rufv2fwPVcBqpCFl3flLHpYDpYNLxUYome9DTyRJZ420MJHm8EFzHINvoeT2IYaPrLrOtOvV2elsdqHVCDUR0FFCOjEZ3RvTZWs8VcDYvYhTj3dm9eCrzTScGMF01k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777823821; c=relaxed/simple;
	bh=0YnRxaNa2AC5AkRp7m+FVxkNZihPQ32xedwm42NkT5E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sQNLt5eYHC/f3lswJYHh3aOlN43/1S2OgLS2DosbrrMo3t3LXj0xxB4ZauYD4Me9W5DeaoXgVmPLwBXzeijaPmq5ss+r5rtMG+0tWWzUkpbyC2WcPKzu4njSXBXJvQonvV290/pTk+jDvfVj/C3tI9/9KixT/7XV4WfWX9vZs8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l+BMqZ4e; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l+BMqZ4e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777823819; x=1809359819;
  h=date:from:to:cc:subject:message-id;
  bh=0YnRxaNa2AC5AkRp7m+FVxkNZihPQ32xedwm42NkT5E=;
  b=l+BMqZ4eOxB8uh9NV8aMdyyIzjrMXuOydz9eu/M34Nga+gR5QRwprIhn
   0GLVtHl8BxWvU2Fqdy/zG8mjZHu4q70VOSDRj/hdIbDflrv209SqXgyv+
   4v0ifEvBMw1qC+H/AL4Dw7UF3fwIRpOE2tC4+ynaa4DyutFYvsQhqBU1V
   1Ezwbx2SUH+j1rAwDSzFCiLO3OKxjaNesXhEZoMttyonO4Acy/Y4Cwqqe
   qBFu/kXkqCCWAoFt7C+Av/sqX/d09XTLFXk5S9+DHmE4vfTGeeICKaTzs
   ZGI4Xae1gUJwCGfqlrY3EPU06O+yA3mDs9JFI2oXBcSTYNCGAEW1r0ls6
   g==;
X-CSE-ConnectionGUID: n7fOkIpRSXebeM2Q0++SFw==
X-CSE-MsgGUID: IwA4R1crRX6ROT0tX9MW2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="89393160"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="89393160"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 08:56:59 -0700
X-CSE-ConnectionGUID: UHs4cbA0So2XTVW5LCAFbg==
X-CSE-MsgGUID: P0pZiVHWS2a8fqzpql7Nyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="235185720"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 03 May 2026 08:56:57 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJZBf-000000002hj-1EvG;
	Sun, 03 May 2026 15:56:55 +0000
Date: Sun, 03 May 2026 23:55:56 +0800
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [smfrench-smb3:pr/192 3/3] fs/smb/client/smb2inode.c:124:25:
 sparse: sparse: incompatible types in comparison expression (different base
 types):
Message-ID: <202605032335.4VUwGMZ1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/smfrench/smb3-kernel.git pr/192
head:   bedb46d0f4ef3fe98e9da42665bd1d8ec3d013cb
commit: bedb46d0f4ef3fe98e9da42665bd1d8ec3d013cb [3/3] smb/client: fix out-of-bounds read in smb2_compound_op()
config: i386-randconfig-r123-20260503 (https://download.01.org/0day-ci/archive/20260503/202605032335.4VUwGMZ1-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605032335.4VUwGMZ1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605032335.4VUwGMZ1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/smb/client/smb2inode.c:124:25: sparse: sparse: incompatible types in comparison expression (different base types):
   fs/smb/client/smb2inode.c:124:25: sparse:    struct smb2_file_full_ea_info *
   fs/smb/client/smb2inode.c:124:25: sparse:    unsigned char [usertype] *

vim +124 fs/smb/client/smb2inode.c

   105	
   106	static int check_wsl_eas(struct kvec *rsp_iov)
   107	{
   108		struct smb2_file_full_ea_info *ea;
   109		struct smb2_query_info_rsp *rsp = rsp_iov->iov_base;
   110		unsigned long addr;
   111		u32 outlen, next;
   112		u16 vlen;
   113		u8 nlen;
   114		u8 *end;
   115	
   116		outlen = le32_to_cpu(rsp->OutputBufferLength);
   117		if (outlen < SMB2_WSL_MIN_QUERY_EA_RESP_SIZE ||
   118		    outlen > SMB2_WSL_MAX_QUERY_EA_RESP_SIZE)
   119			return -EINVAL;
   120	
   121		ea = (void *)((u8 *)rsp_iov->iov_base +
   122			      le16_to_cpu(rsp->OutputBufferOffset));
   123		end = (u8 *)rsp_iov->iov_base + rsp_iov->iov_len;
 > 124		if (ea + outlen > end)
   125			return -EINVAL;
   126	
   127		for (;;) {
   128			if ((u8 *)ea > end - sizeof(*ea))
   129				return -EINVAL;
   130	
   131			nlen = ea->ea_name_length;
   132			vlen = le16_to_cpu(ea->ea_value_length);
   133			if (nlen != SMB2_WSL_XATTR_NAME_LEN ||
   134			    (u8 *)ea->ea_data + nlen + 1 + vlen > end)
   135				return -EINVAL;
   136	
   137			switch (vlen) {
   138			case 4:
   139				if (strncmp(ea->ea_data, SMB2_WSL_XATTR_UID, nlen) &&
   140				    strncmp(ea->ea_data, SMB2_WSL_XATTR_GID, nlen) &&
   141				    strncmp(ea->ea_data, SMB2_WSL_XATTR_MODE, nlen))
   142					return -EINVAL;
   143				break;
   144			case 8:
   145				if (strncmp(ea->ea_data, SMB2_WSL_XATTR_DEV, nlen))
   146					return -EINVAL;
   147				break;
   148			case 0:
   149				if (!strncmp(ea->ea_data, SMB2_WSL_XATTR_UID, nlen) ||
   150				    !strncmp(ea->ea_data, SMB2_WSL_XATTR_GID, nlen) ||
   151				    !strncmp(ea->ea_data, SMB2_WSL_XATTR_MODE, nlen) ||
   152				    !strncmp(ea->ea_data, SMB2_WSL_XATTR_DEV, nlen))
   153					break;
   154				fallthrough;
   155			default:
   156				return -EINVAL;
   157			}
   158	
   159			next = le32_to_cpu(ea->next_entry_offset);
   160			if (!next)
   161				break;
   162			if (!IS_ALIGNED(next, 4) ||
   163			    check_add_overflow((unsigned long)ea, next, &addr))
   164				return -EINVAL;
   165			ea = (void *)addr;
   166		}
   167		return 0;
   168	}
   169	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
