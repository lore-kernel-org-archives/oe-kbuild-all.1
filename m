Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B20678F59
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 May 2025 10:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748600648; cv=none; b=MTKJDWgcvncSLt0NVGRwyW0q/P3E8Wnsdg2Hob8feoNAUAV2xcLFh+TvpP4lBlhZ5+oAQ5J0oa5MrkecBds/jo3VtckwVbS/wHmokww6cg3gUrtkiyJOxHkfC9eVapfe8azDh2OCjuY5w3K2cByNOLEZijInYYUlRKsgxy0Tp40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748600648; c=relaxed/simple;
	bh=InyYN+ms/DYeLN5HBFsy33ovOPHYoJa//uEDLI3v2Gc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rE7M1gh9x88Z5lfWP2cyTAJidBn3KNMIlOSmI9YLg0m7xCUaGAxS1xahYdPGwZdFFpu/A7L8+6xTvkVh52k/yjvFKimFzU6Xvqm5Qsl+r5OBitHVPHawFgrLz6neShei6lY4qDFy/Cd21kxR0fwYoqsMjPhawe9/W/sESSrW8sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HoWaRdsq; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HoWaRdsq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748600647; x=1780136647;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=InyYN+ms/DYeLN5HBFsy33ovOPHYoJa//uEDLI3v2Gc=;
  b=HoWaRdsqIZ9HRHnagfYHrcDNdX9xXAB0Vdqdyjm4fmWVQ7kVWTmoeqyx
   cQKiFrY58v/8MlhbDD4MrLopwGG9lR/aMw6PXU4tydZ3+w3JwYN6BJyOw
   6tvdwN/Tqy5uWUF/oyzbDZ6Efywtnue1poF1CKClRHqT5KHdzlF6n7zSJ
   odWlG2SP0NdRITtw7+2i+1l41jbaP34ucFiA3X8dr+r5TG5UxtsV+Pw9S
   ciTyEvz+GCI5qgMGIOZ0ALTicneMYAaYBoP2y4iyH3GE7ShrVhGw/jYjG
   r5Pxu0XucIxizVoJfdxH1mirpdgwhJgZNq8c4jQyoXXDQYZK0zw+Z4skC
   g==;
X-CSE-ConnectionGUID: XDjZu0XjRb+febFFsbCF5g==
X-CSE-MsgGUID: g6hGQAjZRYWFgMHcsrGKMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="38312969"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="38312969"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 03:24:06 -0700
X-CSE-ConnectionGUID: Rn2cINhHTEGueYeoGnY2Tw==
X-CSE-MsgGUID: +spQzj8LS0e5Vh2JfFLGVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="174841351"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 May 2025 03:24:05 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKwuA-000XY0-0R;
	Fri, 30 May 2025 10:24:02 +0000
Date: Fri, 30 May 2025 18:23:50 +0800
From: kernel test robot <lkp@intel.com>
To: Henrique Carvalho <henrique.carvalho@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, Steve French <stfrench@microsoft.com>
Subject: [linux-next:master 13675/13986] fs/smb/client/smb2ops.c:4114:34:
 sparse: sparse: incorrect type in assignment (different base types)
Message-ID: <202505301823.k6F1EM7P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3a83b350b5be4b4f6bd895eecf9a92080200ee5d
commit: 496be4d63ae67386a6baaaa98eaa4a81aa5a9d30 [13675/13986] smb: client: add ParentLeaseKey support
config: csky-randconfig-r122-20250530 (https://download.01.org/0day-ci/archive/20250530/202505301823.k6F1EM7P-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0
reproduce: (https://download.01.org/0day-ci/archive/20250530/202505301823.k6F1EM7P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505301823.k6F1EM7P-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/smb/client/smb2ops.c:4114:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] LeaseFlags @@     got unsigned int [usertype] flags @@
   fs/smb/client/smb2ops.c:4114:34: sparse:     expected restricted __le32 [usertype] LeaseFlags
   fs/smb/client/smb2ops.c:4114:34: sparse:     got unsigned int [usertype] flags
>> fs/smb/client/smb2ops.c:4115:21: sparse: sparse: restricted __le32 degrades to integer
>> fs/smb/client/smb2ops.c:5557:29: sparse: sparse: incorrect type in initializer (incompatible argument 4 (different base types)) @@     expected char *( *create_lease_buf )( ... ) @@     got char *( * )( ... ) @@
   fs/smb/client/smb2ops.c:5557:29: sparse:     expected char *( *create_lease_buf )( ... )
   fs/smb/client/smb2ops.c:5557:29: sparse:     got char *( * )( ... )
   fs/smb/client/smb2ops.c:5673:29: sparse: sparse: incorrect type in initializer (incompatible argument 4 (different base types)) @@     expected char *( *create_lease_buf )( ... ) @@     got char *( * )( ... ) @@
   fs/smb/client/smb2ops.c:5673:29: sparse:     expected char *( *create_lease_buf )( ... )
   fs/smb/client/smb2ops.c:5673:29: sparse:     got char *( * )( ... )

vim +4114 fs/smb/client/smb2ops.c

  4102	
  4103	static char *
  4104	smb3_create_lease_buf(u8 *lease_key, u8 oplock, u8 *parent_lease_key, u32 flags)
  4105	{
  4106		struct create_lease_v2 *buf;
  4107	
  4108		buf = kzalloc(sizeof(struct create_lease_v2), GFP_KERNEL);
  4109		if (!buf)
  4110			return NULL;
  4111	
  4112		memcpy(&buf->lcontext.LeaseKey, lease_key, SMB2_LEASE_KEY_SIZE);
  4113		buf->lcontext.LeaseState = map_oplock_to_lease(oplock);
> 4114		buf->lcontext.LeaseFlags = flags;
> 4115		if (flags & SMB2_LEASE_FLAG_PARENT_LEASE_KEY_SET_LE)
  4116			memcpy(&buf->lcontext.ParentLeaseKey, parent_lease_key, SMB2_LEASE_KEY_SIZE);
  4117	
  4118		buf->ccontext.DataOffset = cpu_to_le16(offsetof
  4119						(struct create_lease_v2, lcontext));
  4120		buf->ccontext.DataLength = cpu_to_le32(sizeof(struct lease_context_v2));
  4121		buf->ccontext.NameOffset = cpu_to_le16(offsetof
  4122					(struct create_lease_v2, Name));
  4123		buf->ccontext.NameLength = cpu_to_le16(4);
  4124		/* SMB2_CREATE_REQUEST_LEASE is "RqLs" */
  4125		buf->Name[0] = 'R';
  4126		buf->Name[1] = 'q';
  4127		buf->Name[2] = 'L';
  4128		buf->Name[3] = 's';
  4129		return (char *)buf;
  4130	}
  4131	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
