Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8F3241139
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 May 2026 12:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777812894; cv=none; b=m6Bj+pqYLsDkM8n/lUv+MnXc+waKFVuVCdONHOL4HrEfDGH9794BWInmxBJxWW+WySLKz4T8CD7/VKYzmiSRvvj3m1fDes2JcGG5nvA50neTiJMQ0Pq7qNkBK2SP9rL9ZJcFQyPS6VFg2jbsYrCNzurJ5gtRLLRDjL9KnLFHsZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777812894; c=relaxed/simple;
	bh=rilKCP91XzGGx/GkiJqAzVcbM/vurxpOPQ3K2DTg2Hc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TyopOPT0xprVqjJagb5VCGBxhjvUMThe5HjBC2coD4WlGXbq6Hbr4T7ahhrB0rPHdcmtg2wvpGowAcVkWUYdw1Ru8EluwQO3Obv5ptrI1+QBPlOk5/jSvRFv+pnhDcHDl5sWzHNbA6EOeyVpDeH3x7L8rT8jEaPo0est3Q/O2uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P4NiKhCc; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P4NiKhCc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777812892; x=1809348892;
  h=date:from:to:cc:subject:message-id;
  bh=rilKCP91XzGGx/GkiJqAzVcbM/vurxpOPQ3K2DTg2Hc=;
  b=P4NiKhCcDVc9iqnXD9onUZcuaUPry8Nd1pqIprmub8U8digh5p+x9OFN
   uSYnmKEC6Gg0LJBqeNNBhz773gUEcfnpPdb3lKqJW9CkEZh4n4BMQwGhk
   +CX6gKfCn0NvXZxsxrm0iLRBM5mPh+bWKs5BskrPumKJLz8y7W3eRKElH
   ozm5Jd1lrNT2rZooGXfvKWOuESAISV+fq5B8BCyYtUi32P1w2diiO0KkJ
   EJh1EJ5Ry3HdsRoO4wyTGV2K0lPLawohZpLbkf3TU3wCJjdIndSqZUSNN
   3+Dh7P8TRYAwdAgXe0rIwc8l+at7p1kN6IRZWCqsALCkLHG+/Pne4z0pv
   Q==;
X-CSE-ConnectionGUID: SXfJuFwPSHmMF0lUW5+4Nw==
X-CSE-MsgGUID: T35QauBLS/GDVjfv16Dgaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="78799089"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="78799089"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 05:54:51 -0700
X-CSE-ConnectionGUID: X+1oH/HcQVO8kxGIZuuoxA==
X-CSE-MsgGUID: aQjDtebuS02Xx6W4cT7hrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="237062004"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 May 2026 05:54:49 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJWLP-000000002ZJ-0ytT;
	Sun, 03 May 2026 12:54:47 +0000
Date: Sun, 03 May 2026 20:54:07 +0800
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [smfrench-smb3:pr/192 3/3] fs/smb/client/smb2inode.c:124:18:
 warning: comparison of distinct pointer types ('struct smb2_file_full_ea_info
 *' and 'u8 *' (aka 'unsigned char *'))
Message-ID: <202605032002.nU7uHLDo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/smfrench/smb3-kernel.git pr/192
head:   bedb46d0f4ef3fe98e9da42665bd1d8ec3d013cb
commit: bedb46d0f4ef3fe98e9da42665bd1d8ec3d013cb [3/3] smb/client: fix out-of-bounds read in smb2_compound_op()
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260503/202605032002.nU7uHLDo-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605032002.nU7uHLDo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605032002.nU7uHLDo-lkp@intel.com/

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
