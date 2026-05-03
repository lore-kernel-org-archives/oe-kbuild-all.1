Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0629346AD4
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 May 2026 11:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777808988; cv=none; b=r1T9dgzccygzckrnebTXZP6mW95RgCJAHpsudm6WQEmZNqdvw7wQ6N+G7VJjeAlniANqI4XStPTfVmHhVrd8hmvpe4jGUobK5eqB3BKCAFPvgiuyen3bV51gYodBfiKL9A1pyXbZIeOVMfEQen97hzmlWdoufQFoefmJnYpaK/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777808988; c=relaxed/simple;
	bh=MdIDr2U7Pptv7ps5pOmRRK9pBWFqcc6RuvZfZZ7q+90=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KXGkXt81+VMA+Qcskq0LFVqLe9srll3wouOjo86ej6K5+eTlG1Bz57s7kl/Ftk4PJOLd7w2dc93ST7QyLyHbzo+wdomFurzlLhmZv59PvlmCg0Lp7SDVilSD2pRcqtX4MuFYOv7+eB/mQIelLPm/XlpglOmHW/Gar5s3ornp4Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B4HQhW8b; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B4HQhW8b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777808987; x=1809344987;
  h=date:from:to:cc:subject:message-id;
  bh=MdIDr2U7Pptv7ps5pOmRRK9pBWFqcc6RuvZfZZ7q+90=;
  b=B4HQhW8bZQW0moFE/Pz2Cbv9o/NY3Gt8kjw+UJXbIQS5a9jg9ZTGviKm
   hep53YFWFas8dQUv+8qNpXkuVoJuCrEv58Txk5B8kck0V9KYfmawW3tmb
   zDu1NuAjYNTIF5NRjRHhP8uFsfF72wBEJtqs+dLZzea+zd8e/LxqJiN4c
   kPwkvzScOGYrPqoAGJpsIxXfs/VC1ZWOKtmAx4mVHdH78ZF8sHbH2yA1B
   Dpk6HWbrgfyOsZVbHrMsoFXpVHyVYHA8wQjnp9Wrs3fQdgU5nMqM9gwfi
   XrQwRAoqH19G9abVy6lzCCmm0AivKfDKY0rtboA5khlzjBCqyQj3D+WPB
   g==;
X-CSE-ConnectionGUID: roNaDhIhSzirJMVbRMOwZg==
X-CSE-MsgGUID: w0a1NJZIRhuKXWBaz6A8DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="96122818"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="96122818"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 04:49:47 -0700
X-CSE-ConnectionGUID: xtT0E56DTeS8n4vFqO6ByQ==
X-CSE-MsgGUID: Or/mTH5pTZ6ftWb+p1DAQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="235145665"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 03 May 2026 04:49:45 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJVKQ-000000002W3-1rHD;
	Sun, 03 May 2026 11:49:42 +0000
Date: Sun, 03 May 2026 19:49:15 +0800
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [smfrench-smb3:pr/192 3/3] fs/smb/client/smb2inode.c:124:25:
 warning: comparison of distinct pointer types lacks a cast
Message-ID: <202605031945.y37WEeoJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/smfrench/smb3-kernel.git pr/192
head:   bedb46d0f4ef3fe98e9da42665bd1d8ec3d013cb
commit: bedb46d0f4ef3fe98e9da42665bd1d8ec3d013cb [3/3] smb/client: fix out-of-bounds read in smb2_compound_op()
config: i386-randconfig-141-20260503 (https://download.01.org/0day-ci/archive/20260503/202605031945.y37WEeoJ-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
smatch: v0.5.0-9065-ge9cc34fd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605031945.y37WEeoJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605031945.y37WEeoJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/smb/client/smb2inode.c: In function 'check_wsl_eas':
>> fs/smb/client/smb2inode.c:124:25: warning: comparison of distinct pointer types lacks a cast
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
