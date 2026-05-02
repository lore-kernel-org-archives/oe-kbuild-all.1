Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0816C263C8F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 May 2026 22:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777759752; cv=none; b=ZHW31HUyL24Hs7XSyr3BlXgHVMhTR2UwVnNovtdnHl4Wk57iZn1cO17R72+VDvgMMmURJAueqkFxpDzcKF2G+5xiMMn4B/TOF/DC/IpvsOidS8t9VjmvNBoi9/mQ0qVepWRkSgLyw34cPv3px+D6iXUgYekRpDNGCvhgHk0e8O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777759752; c=relaxed/simple;
	bh=r/xYnPncpaXHg0Ffy9FfBaPoXMrpovCdThcLpQDG7nI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OtMGYwCXyZoYEhS4Zf3t1QLxalZkKAKUksmzs47iHEWI9rfs6xPxC6JEbEWVSJPNKlik3LCQIZ0BPxDHIXZBUBFTavJC3Ci6PFU+2le3s3CXRfhR7QC8WxQ4fABstpXTxCaGkz1bx7MNNCb5a7op/EqFcX7AN2ciVi8Fe5mw9lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iFIbHwHs; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iFIbHwHs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777759750; x=1809295750;
  h=date:from:to:cc:subject:message-id;
  bh=r/xYnPncpaXHg0Ffy9FfBaPoXMrpovCdThcLpQDG7nI=;
  b=iFIbHwHsfm8OFz3+IbMD2coDI0cvo65FMqg6YsFa6kwA9gumeUMJHPL7
   6diWLBRbb9cipH+ruczPYpa1PPGk8fF9ZC4a2rOHi+AwkoGkB4OWMnSBy
   qJuoVaa/THiElJeqtasUYtcDJ08Ir6DjO/JLvGzQUrzImLc4yIK2eAUfI
   jHGe24tRPtl4CZm9duZXe2YGZL5cueGcMqS7hhK2O4M3TYfFaK8KpkpWl
   lwJHxXf7O3BL9nbkx0nur8a2ot38aIVRTJCYCFc+mIBut25et+WxM5ol+
   +nPYMgodeOXPxq2MM5umjv9RwIOScmHuLaEpAcv1HPJGomWrMDik77P6R
   w==;
X-CSE-ConnectionGUID: yI1CAJ0aRo2lPckWFJE4fA==
X-CSE-MsgGUID: x4d8miu/S2i+g1/hKGNDPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="78540691"
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="78540691"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 15:09:09 -0700
X-CSE-ConnectionGUID: kjHlrs8YQ06+BZ45uSo10A==
X-CSE-MsgGUID: 2iLZQ7yuTp2xLl5BTRLo9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="239487657"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 02 May 2026 15:09:08 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJIWH-000000005Mm-3YXP;
	Sat, 02 May 2026 22:09:05 +0000
Date: Sun, 03 May 2026 00:08:30 +0200
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [smfrench-smb3:pr/192 3/3] fs/smb/client/smb2inode.c:124:25:
 warning: comparison of distinct pointer types lacks a cast
Message-ID: <202605030011.ousN8aw6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/smfrench/smb3-kernel.git pr/192
head:   bedb46d0f4ef3fe98e9da42665bd1d8ec3d013cb
commit: bedb46d0f4ef3fe98e9da42665bd1d8ec3d013cb [3/3] smb/client: fix out-of-bounds read in smb2_compound_op()
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260503/202605030011.ousN8aw6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605030011.ousN8aw6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605030011.ousN8aw6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/smb/client/smb2inode.c: In function 'check_wsl_eas':
>> fs/smb/client/smb2inode.c:124:25: warning: comparison of distinct pointer types lacks a cast [-Wcompare-distinct-pointer-types]
     124 |         if (ea + outlen > end)
         |                         ^


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
