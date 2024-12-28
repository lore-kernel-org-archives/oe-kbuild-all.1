Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A976218E3F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 02:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735351220; cv=none; b=tJN3bWllUFhXdjUSBze0P2EqAHLGNxba+bVeXEfpIKYFoWX/8+x0OoHonsCF5Y2dRFq193zZq2wmKYqDDEXCfcEpz5nQN6tlc3ROhJGrA06u0wK9BpT7c9LRJy50gg6+MJchco0InDtux4/Say0oRG+r6S/Wj4edA3bBpcW5ISY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735351220; c=relaxed/simple;
	bh=AL7FPI26q8m0bq91aVZSQbUYYoBmZR5nA3F8EVMVoxU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aiqs98M8RwpjZElsjGT0KsG6TSkPbi+YklKmxRaBeZfEPQ21ZIFFOhqgwJ1FLnCiJBJ+EbI6ngIz4Q81MH3PfuosScelWMxOOHR9h9MIWwYXGNZUOv39UgtjBdTSonTW5i6F4CfKWstMcsXUj+T4NdAWElNIB1lp7vUnK7F8XxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j5EVvJwT; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j5EVvJwT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735351218; x=1766887218;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AL7FPI26q8m0bq91aVZSQbUYYoBmZR5nA3F8EVMVoxU=;
  b=j5EVvJwT/CGnvMZXMRmw1GjaNCAxQ88s1cvbz6dl23CCk+UUsCALtQRL
   BTCfCrGeYK+9ck/cCZdarZMpN8AoqfUGrTgGlEZNoVT+wSHd4UdxRRxMm
   LLVgPZ3VniM/1/9ZXWnooi60gTLwI1DiFzgUcsRjFWVwM2mCLO56i6kSJ
   j4IZbmGtxhY4lSkYNoN/ZKEv1/0p40gbjhNPYpGqeYjTGN8Hw2slvcOoa
   v2DrM+Q4zXpFWYZGS3qpn/d2vktb76n4qllEbHW1FYfCoae6PB+UabHuQ
   nbgIhSVw23eHJZOm+gUb0D4IYIE5b4uHYjUa0xJDWuEVj8D+7hNCTXiLv
   Q==;
X-CSE-ConnectionGUID: Lkrn2TaNShaDBU466CTs8A==
X-CSE-MsgGUID: gjf4fM+BQlmAwStCWzjlwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="47106563"
X-IronPort-AV: E=Sophos;i="6.12,271,1728975600"; 
   d="scan'208";a="47106563"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 18:00:18 -0800
X-CSE-ConnectionGUID: kuL7F2IpRuKS5iJofKj/jg==
X-CSE-MsgGUID: FbLNSx1wRf6LYgohBVpXGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104899267"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Dec 2024 18:00:17 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRM7i-0003oC-2w;
	Sat, 28 Dec 2024 02:00:14 +0000
Date: Sat, 28 Dec 2024 10:00:06 +0800
From: kernel test robot <lkp@intel.com>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [pali:cifs 48/48] fs/smb/client/cifssmb.c:2897:27: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202412280944.DH91CjjZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pali/linux.git cifs
head:   cc26137de51202e7210b058f6696393f1e006d46
commit: 817f8d87b6285eee3ee97e25a32f2405cd5819a0 [48/48] cifs: Add support for creating reparse points over SMB1
config: x86_64-randconfig-122-20241228 (https://download.01.org/0day-ci/archive/20241228/202412280944.DH91CjjZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412280944.DH91CjjZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412280944.DH91CjjZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/smb/client/cifssmb.c:2897:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] ByteCount @@     got restricted __le32 [usertype] @@
   fs/smb/client/cifssmb.c:2897:27: sparse:     expected restricted __le16 [usertype] ByteCount
   fs/smb/client/cifssmb.c:2897:27: sparse:     got restricted __le32 [usertype]

vim +2897 fs/smb/client/cifssmb.c

  2868	
  2869		rc = smb_init(SMB_COM_NT_TRANSACT, 23, tcon, (void **)&io_req, NULL);
  2870		if (rc)
  2871			goto out_close;
  2872	
  2873		inc_rfc1001_len(io_req, sizeof(io_req->Pad));
  2874	
  2875		io_req_len = be32_to_cpu(io_req->hdr.smb_buf_length) + sizeof(io_req->hdr.smb_buf_length);
  2876	
  2877		/* NT IOCTL response contains one-word long output setup buffer with size of output data. */
  2878		io_req->MaxSetupCount = 1;
  2879		/* NT IOCTL response does not contain output parameters. */
  2880		io_req->MaxParameterCount = cpu_to_le32(0);
  2881		/* FSCTL_SET_REPARSE_POINT response contains empty output data. */
  2882		io_req->MaxDataCount = cpu_to_le32(0);
  2883	
  2884		io_req->TotalParameterCount = cpu_to_le32(0);
  2885		io_req->TotalDataCount = cpu_to_le32(reparse_iov->iov_len);
  2886		io_req->ParameterCount = io_req->TotalParameterCount;
  2887		io_req->ParameterOffset = cpu_to_le32(0);
  2888		io_req->DataCount = io_req->TotalDataCount;
  2889		io_req->DataOffset = cpu_to_le32(offsetof(typeof(*io_req), Data) -
  2890						 sizeof(io_req->hdr.smb_buf_length));
  2891		io_req->SetupCount = 4;
  2892		io_req->SubCommand = cpu_to_le16(NT_TRANSACT_IOCTL);
  2893		io_req->FunctionCode = cpu_to_le32(FSCTL_SET_REPARSE_POINT);
  2894		io_req->Fid = fid.netfid;
  2895		io_req->IsFsctl = 1;
  2896		io_req->IsRootFlag = 0;
> 2897		io_req->ByteCount = cpu_to_le32(le32_to_cpu(io_req->DataCount) + sizeof(io_req->Pad));
  2898	
  2899		inc_rfc1001_len(io_req, reparse_iov->iov_len);
  2900	
  2901		in_iov[0].iov_base = (char *)io_req;
  2902		in_iov[0].iov_len = io_req_len;
  2903		in_iov[1] = *reparse_iov;
  2904		rc = SendReceive2(xid, tcon->ses, in_iov, ARRAY_SIZE(in_iov), &buf_type,
  2905				  CIFS_NO_RSP_BUF, &out_iov);
  2906	
  2907		cifs_buf_release(io_req);
  2908	
  2909		if (!rc)
  2910			rc = cifs_get_inode_info(&new, full_path, data, sb, xid, NULL);
  2911	
  2912	out_close:
  2913		CIFSSMBClose(xid, tcon, fid.netfid);
  2914	
  2915		/*
  2916		 * If CREATE was successful but FSCTL_SET_REPARSE_POINT failed then
  2917		 * remove the intermediate object created by CREATE. Otherwise
  2918		 * empty object stay on the server when reparse call failed.
  2919		 */
  2920		if (rc)
  2921			CIFSSMBDelFile(xid, tcon, full_path, cifs_sb, NULL);
  2922	
  2923		return rc ? ERR_PTR(rc) : new;
  2924	}
  2925	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
