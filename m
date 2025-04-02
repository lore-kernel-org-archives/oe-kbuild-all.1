Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9A72E336E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Apr 2025 07:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743579409; cv=none; b=tNm/y+2WYiA/PsTnIXHe/kqr1jvA4jkufpIQYM1JRnLFNUYtlhhSyxV2PnPM6eDnX8xRCZz7N0dl/5ApLgZ5elD3g6FT3fbQ8XsmNgcyEajYd3vJM/EXLqSmIZXz0Wzbwk+nPBamU61p/kox26bmHuNbKJi4UP6NjDQmjuZ9jM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743579409; c=relaxed/simple;
	bh=F7pdwd3MfJlyZWraB6FNiufwjsGrJUmNf+1FDtcLlDw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f5NBjqxL8MtsJImljvqt5kdnCV4+ZiBd+k7NMne5+CT5TdqG4H8oXFp/6iHgOnv21MYTgn8Qi/HMJWeaDf2zHcFvGiTk2/zvTtK2I34ZvrgDKv9Df0cfREKIkA1ZI9joCbOWtZuSeFRXbssbF7opXg1Z22NEwUIGSQ3+cIaTqPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=apxg44Jl; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="apxg44Jl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743579408; x=1775115408;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F7pdwd3MfJlyZWraB6FNiufwjsGrJUmNf+1FDtcLlDw=;
  b=apxg44Jl2xHFdJj8g6Q3bZUoF87yI1DRYeXRCpNtOQz8BHriWbqGD/5u
   5fxy6bsaQkni0LnjO/RhzaaaPYqAdpyAJ7z17QioGSgItz7lfXhEc4Pw3
   F8WK+L1ZVEI3EXdJvhh+noQu6RqN3yixSny2KsAsXdvC2OmMhqonljiYv
   AsKRPulS80zt5WV8Uj2pVUmXJbal3fxPFvVEYHujwAJpc6/VVWhGNdUJY
   OpYwPK+Fgvh6ESGkZWjlYISBTi0gRW4Eboa3y5s2cvU7i+sIMNHkxcZMu
   tAiGKG+CrpFqYunzIAjIqg1Jox/rh10V91uOz4HBtgZVW3DliFggznQwI
   Q==;
X-CSE-ConnectionGUID: Q6FWtxk9QD6251Q8jP7DQg==
X-CSE-MsgGUID: 6pmqfQlQQemcCxt4M31lWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44634863"
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; 
   d="scan'208";a="44634863"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 00:36:47 -0700
X-CSE-ConnectionGUID: KYUrQS6aQUOsN7eiw5bC2w==
X-CSE-MsgGUID: BVKbadV+TESdn8JdNOJibA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; 
   d="scan'208";a="126376240"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 02 Apr 2025 00:36:46 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzseS-000AXk-0j;
	Wed, 02 Apr 2025 07:36:44 +0000
Date: Wed, 2 Apr 2025 15:35:47 +0800
From: kernel test robot <lkp@intel.com>
To: Paulo Alcantara <pc@manguebit.com>
Cc: oe-kbuild-all@lists.linux.dev, Steve French <stfrench@microsoft.com>
Subject: [linux-next:master 14083/14328] fs/smb/client/cifssmb.c:3094:5:
 error: conflicting types for 'cifs_do_set_acl'; have 'int(const unsigned
 int,  struct cifs_tcon *, const unsigned char *, const struct posix_acl *,
 const int,  const struct nls_table *, int)'
Message-ID: <202504021549.evbuYKS3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fefb886b1344e222b3218f3c0165b0fd770e8b88
commit: 9f043ebda20bc29a856721ba7432d5541d89c14f [14083/14328] smb: client: optimize pathname checking
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20250402/202504021549.evbuYKS3-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250402/202504021549.evbuYKS3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504021549.evbuYKS3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/smb/client/cifssmb.c:3094:5: error: conflicting types for 'cifs_do_set_acl'; have 'int(const unsigned int,  struct cifs_tcon *, const unsigned char *, const struct posix_acl *, const int,  const struct nls_table *, int)'
    3094 | int cifs_do_set_acl(const unsigned int xid, struct cifs_tcon *tcon,
         |     ^~~~~~~~~~~~~~~
   In file included from fs/smb/client/cifssmb.c:33:
   fs/smb/client/cifsproto.h:556:5: note: previous declaration of 'cifs_do_set_acl' with type 'int(const unsigned int,  struct cifs_tcon *, const unsigned char *, const struct posix_acl *, const int,  struct cifs_sb_info *)'
     556 | int cifs_do_set_acl(const unsigned int xid, struct cifs_tcon *tcon,
         |     ^~~~~~~~~~~~~~~


vim +3094 fs/smb/client/cifssmb.c

dc1af4c4b4721a fs/cifs/cifssmb.c Christian Brauner 2022-09-22  3093  
dc1af4c4b4721a fs/cifs/cifssmb.c Christian Brauner 2022-09-22 @3094  int cifs_do_set_acl(const unsigned int xid, struct cifs_tcon *tcon,
dc1af4c4b4721a fs/cifs/cifssmb.c Christian Brauner 2022-09-22  3095  		    const unsigned char *fileName, const struct posix_acl *acl,
dc1af4c4b4721a fs/cifs/cifssmb.c Christian Brauner 2022-09-22  3096  		    const int acl_type, const struct nls_table *nls_codepage,
dc1af4c4b4721a fs/cifs/cifssmb.c Christian Brauner 2022-09-22  3097  		    int remap)
dc1af4c4b4721a fs/cifs/cifssmb.c Christian Brauner 2022-09-22  3098  {
dc1af4c4b4721a fs/cifs/cifssmb.c Christian Brauner 2022-09-22  3099  	return -EOPNOTSUPP;
dc1af4c4b4721a fs/cifs/cifssmb.c Christian Brauner 2022-09-22  3100  }
bd9684b042dcbb fs/cifs/cifssmb.c Christian Brauner 2022-09-22  3101  #endif /* CONFIG_FS_POSIX_ACL */
bd9684b042dcbb fs/cifs/cifssmb.c Christian Brauner 2022-09-22  3102  

:::::: The code at line 3094 was first introduced by commit
:::::: dc1af4c4b4721abfa07b351063825acc7e69cc66 cifs: implement set acl method

:::::: TO: Christian Brauner <brauner@kernel.org>
:::::: CC: Christian Brauner (Microsoft) <brauner@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
