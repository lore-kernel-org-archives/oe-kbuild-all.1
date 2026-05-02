Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3192C21F6
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 May 2026 22:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777760352; cv=none; b=k8uJ5tH6LBy4GNSfNvRvUQqX3ieGFK88+fu7fODMoKYs62SIuyMrggQl1v8qguInZ4SSF1fo6qaDGZkCwn6TdpEjuaCN66GOokRqDFz4tEJmvpsnMkTpyc6oEB6Givv/hpm1MhMlco7NzOh0YQ3Roehy+a36UMKHEbOI+rcIfbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777760352; c=relaxed/simple;
	bh=06seWD/Bywea7BdCdysFANm19/LjOi2z+D+Ny+NPUHM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IRlx4/g7EL8kT41Xrwe3XY4HWFJuGWwE4hKhbqpVj+O/mBUaa+4qM9BXG46yayBhui5ogHryrZ84G5LbbE8Vi+uNXIPeABhKx8E4J9ur+UtLiqpuToHpwUD0hOgBuLyI1XUfLLNnpD52ZXoFhVgL+XkH0jZnfyREb50E/YIJgHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lerwCXPl; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lerwCXPl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777760350; x=1809296350;
  h=date:from:to:cc:subject:message-id;
  bh=06seWD/Bywea7BdCdysFANm19/LjOi2z+D+Ny+NPUHM=;
  b=lerwCXPlYi+JTeWnAP1k6niC89zSaBXLzRL6WhX5J5EBN/A/UhzwHjY0
   IM5dzal+hR5HpQ4OPU4HpNILralqO74mTc3/23vyv4lVSX3XSKO1rUAqk
   1F2i9MVLz+jGn/IjyWZ0d11hUkCCJuX2yKqyJL2gu33iwA7oDdwZ3mk7H
   wltSprPR36W5y/gJP+Oa2mKR+F4GAJzDXsFCRFd8kM2JpMjLav4s6017k
   pe1R3cZV1qgGu+l99jMoHpHO4RfFWZT5ZpTnmIiIXh+EO6F85SxsoTTkl
   Uu0WGQpJUE9O6fq39kfPwCy2ZZLxbY7mFKdTtp/lzBv4pE0LuNRMykMr2
   g==;
X-CSE-ConnectionGUID: c6nT7atER8+jpfjzpb/g/g==
X-CSE-MsgGUID: BhB+xYUbQbKatRbAKIU7ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="104128647"
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="104128647"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 15:19:10 -0700
X-CSE-ConnectionGUID: fHLYCrWZQZWZExchxJ9f3Q==
X-CSE-MsgGUID: DTWwK3+uRjyLhCZvG5mLWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="273267610"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 02 May 2026 15:19:09 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJIfx-000000005Mz-42Sa;
	Sat, 02 May 2026 22:19:05 +0000
Date: Sun, 03 May 2026 00:18:56 +0200
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [smfrench-smb3:pr/192 3/3] fs/smb/client/smb2inode.c:124:18:
 warning: comparison of distinct pointer types ('struct smb2_file_full_ea_info
 *' and 'u8 *' (aka 'unsigned char *'))
Message-ID: <202605030009.Et3z8iAD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/smfrench/smb3-kernel.git pr/192
head:   bedb46d0f4ef3fe98e9da42665bd1d8ec3d013cb
commit: bedb46d0f4ef3fe98e9da42665bd1d8ec3d013cb [3/3] smb/client: fix out-of-bounds read in smb2_compound_op()
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260503/202605030009.Et3z8iAD-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605030009.Et3z8iAD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605030009.Et3z8iAD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/smb/client/smb2inode.c:124:18: warning: comparison of distinct pointer types ('struct smb2_file_full_ea_info *' and 'u8 *' (aka 'unsigned char *')) [-Wcompare-distinct-pointer-types]
     124 |         if (ea + outlen > end)
         |             ~~~~~~~~~~~ ^ ~~~
   1 warning generated.


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
