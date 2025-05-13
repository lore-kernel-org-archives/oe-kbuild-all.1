Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA4317BD3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 May 2025 00:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747096426; cv=none; b=XoHVr5RSV8Yeqh66rYkaUzMBLYR0hpxJsOWM6Xz6Ac2KitXNbtg7GcmQjM/cW7s6KDpC0AD+AUgMiy+duIaYDhDTQs60oQ/SBAxBIf8N9CFQvfaJ+JNDfKLVdqJITJUoEHHq4x4IWCRYJX8VKuNCDLOzQVmVNl8S6edjJnZ0X6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747096426; c=relaxed/simple;
	bh=eP3w5B5JoRyfFTkvE+3CHRThVVgPe9GsyPcFZdkgxnk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nNpJPVMXb2tKaMoIrLjKoU5pA05S+Ncb+zeVKb0Flb1kxsjbO3VYCbcP66xkQpAvIHgSPNbnCPCssvC43waPHbJwuKm+0p+JyvPNSIz54bbxilD9PdIXH9Hx4iRBQ8TCQoRkERAGnXr98Nt454Uq8lYzWDJQ/EkXH8e6hlc2C2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PR/+WCiP; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PR/+WCiP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747096424; x=1778632424;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eP3w5B5JoRyfFTkvE+3CHRThVVgPe9GsyPcFZdkgxnk=;
  b=PR/+WCiPl8EomJDL02B9DG1odDBUZ10ux5Tw/OMFhcaiYZ+OKDhGesvK
   ugAwCfScVK34vqZvTaHajIG3Q5P0Jk8WY8TVd3hyQ7JBKBRcYScDJh6XS
   JbPzvo+0ZZFvkkzg2G7SIHl1H6mXTrI/N0wXPeI3FuMNVz445ce5OmDEv
   +LyZizL5JxrTBGxTaNJgV1q1XGp4+7/GFd95kn1Ax/o6uWhVpzNNtGnq/
   4Us2hE3X5VrUGyQ8sMbRNrLYmslxqbpAlkEe0RI+bToIcr1Q02i7kskLS
   JePjCQdLiNHVJMDB4aNKdCG1lzYz7OGRy/ZcBJe9/AVlID/kqGUJ9FyhY
   Q==;
X-CSE-ConnectionGUID: KGlBEtUNR+irzi9JU8NY4A==
X-CSE-MsgGUID: xHMzhDNQRV21j6TZtKE0NQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="60318177"
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; 
   d="scan'208";a="60318177"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 17:33:44 -0700
X-CSE-ConnectionGUID: hYsEsWrYQx2LgyZVSxqjYQ==
X-CSE-MsgGUID: eiNNkckaQVigSoqGS/b49w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; 
   d="scan'208";a="138463158"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 May 2025 17:33:42 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEdaW-000FYN-1k;
	Tue, 13 May 2025 00:33:40 +0000
Date: Tue, 13 May 2025 08:33:03 +0800
From: kernel test robot <lkp@intel.com>
To: stephen.smalley.work@gmail.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ssmalley-selinuxns:working-selinuxns 48/48]
 security/selinux/ss/services.c:3015: warning: Function parameter or struct
 member 'fstype' not described in 'selinux_ss_fs_use'
Message-ID: <202505130813.ok5ehnLb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/stephensmalley/selinux-kernel working-selinuxns
head:   7cc9381b9d3d327d33cea8911c8fb9c9fe5e1049
commit: 7cc9381b9d3d327d33cea8911c8fb9c9fe5e1049 [48/48] selinux: repair security_fs_use() interface and its users
config: nios2-randconfig-001-20250513 (https://download.01.org/0day-ci/archive/20250513/202505130813.ok5ehnLb-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250513/202505130813.ok5ehnLb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505130813.ok5ehnLb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/selinux/ss/services.c:3015: warning: Function parameter or struct member 'fstype' not described in 'selinux_ss_fs_use'


vim +3015 security/selinux/ss/services.c

02a52c5c8c3b8c Stephen Smalley 2020-08-07  3006  
^1da177e4c3f41 Linus Torvalds  2005-04-16  3007  /**
b1db0e6206426e Stephen Smalley 2024-09-05  3008   * selinux_ss_fs_use - Determine how to handle labeling for a filesystem.
ded8cd28eeec0b Stephen Smalley 2024-07-30  3009   * @state: SELinux state
7cc9381b9d3d32 Stephen Smalley 2025-05-12  3010   * @behavior: labeling behavior to apply
7cc9381b9d3d32 Stephen Smalley 2025-05-12  3011   * @sid: SID for superblock
^1da177e4c3f41 Linus Torvalds  2005-04-16  3012   */
7cc9381b9d3d32 Stephen Smalley 2025-05-12  3013  int selinux_ss_fs_use(struct selinux_state *state, const char *fstype,
7cc9381b9d3d32 Stephen Smalley 2025-05-12  3014  		      unsigned short *behavior, u32 *sid)
^1da177e4c3f41 Linus Torvalds  2005-04-16 @3015  {
1b8b31a2e6120b Stephen Smalley 2020-08-19  3016  	struct selinux_policy *policy;
aa8e712cee93d5 Stephen Smalley 2018-03-01  3017  	struct policydb *policydb;
225621c9348d2a Ondrej Mosnacek 2020-04-17  3018  	struct sidtab *sidtab;
9ad6e9cb39c663 Ondrej Mosnacek 2021-04-07  3019  	int rc;
^1da177e4c3f41 Linus Torvalds  2005-04-16  3020  	struct ocontext *c;
^1da177e4c3f41 Linus Torvalds  2005-04-16  3021  
ded8cd28eeec0b Stephen Smalley 2024-07-30  3022  	if (!selinux_initialized(state)) {
7cc9381b9d3d32 Stephen Smalley 2025-05-12  3023  		*behavior = SECURITY_FS_USE_NONE;
7cc9381b9d3d32 Stephen Smalley 2025-05-12  3024  		*sid = SECINITSID_UNLABELED;
37ea433c66070f Stephen Smalley 2020-08-19  3025  		return 0;
37ea433c66070f Stephen Smalley 2020-08-19  3026  	}
37ea433c66070f Stephen Smalley 2020-08-19  3027  
9ad6e9cb39c663 Ondrej Mosnacek 2021-04-07  3028  retry:
1b8b31a2e6120b Stephen Smalley 2020-08-19  3029  	rcu_read_lock();
ded8cd28eeec0b Stephen Smalley 2024-07-30  3030  	policy = rcu_dereference(state->policy);
1b8b31a2e6120b Stephen Smalley 2020-08-19  3031  	policydb = &policy->policydb;
1b8b31a2e6120b Stephen Smalley 2020-08-19  3032  	sidtab = policy->sidtab;
aa8e712cee93d5 Stephen Smalley 2018-03-01  3033  
aa8e712cee93d5 Stephen Smalley 2018-03-01  3034  	c = policydb->ocontexts[OCON_FSUSE];
4d546f81717d25 Paul Moore      2013-12-13  3035  	while (c) {
4d546f81717d25 Paul Moore      2013-12-13  3036  		if (strcmp(fstype, c->u.name) == 0)
102aefdda4d827 Anand Avati     2013-04-16  3037  			break;
4d546f81717d25 Paul Moore      2013-12-13  3038  		c = c->next;
102aefdda4d827 Anand Avati     2013-04-16  3039  	}
102aefdda4d827 Anand Avati     2013-04-16  3040  
^1da177e4c3f41 Linus Torvalds  2005-04-16  3041  	if (c) {
7cc9381b9d3d32 Stephen Smalley 2025-05-12  3042  		*behavior = c->v.behavior;
7cc9381b9d3d32 Stephen Smalley 2025-05-12  3043  		rc = ocontext_to_sid(sidtab, c, 0, sid);
9ad6e9cb39c663 Ondrej Mosnacek 2021-04-07  3044  		if (rc == -ESTALE) {
9ad6e9cb39c663 Ondrej Mosnacek 2021-04-07  3045  			rcu_read_unlock();
9ad6e9cb39c663 Ondrej Mosnacek 2021-04-07  3046  			goto retry;
9ad6e9cb39c663 Ondrej Mosnacek 2021-04-07  3047  		}
^1da177e4c3f41 Linus Torvalds  2005-04-16  3048  		if (rc)
^1da177e4c3f41 Linus Torvalds  2005-04-16  3049  			goto out;
089be43e403a78 James Morris    2008-07-15  3050  	} else {
1b8b31a2e6120b Stephen Smalley 2020-08-19  3051  		rc = __security_genfs_sid(policy, fstype, "/",
7cc9381b9d3d32 Stephen Smalley 2025-05-12  3052  					SECCLASS_DIR, sid);
9ad6e9cb39c663 Ondrej Mosnacek 2021-04-07  3053  		if (rc == -ESTALE) {
9ad6e9cb39c663 Ondrej Mosnacek 2021-04-07  3054  			rcu_read_unlock();
9ad6e9cb39c663 Ondrej Mosnacek 2021-04-07  3055  			goto retry;
9ad6e9cb39c663 Ondrej Mosnacek 2021-04-07  3056  		}
^1da177e4c3f41 Linus Torvalds  2005-04-16  3057  		if (rc) {
7cc9381b9d3d32 Stephen Smalley 2025-05-12  3058  			*behavior = SECURITY_FS_USE_NONE;
^1da177e4c3f41 Linus Torvalds  2005-04-16  3059  			rc = 0;
^1da177e4c3f41 Linus Torvalds  2005-04-16  3060  		} else {
7cc9381b9d3d32 Stephen Smalley 2025-05-12  3061  			*behavior = SECURITY_FS_USE_GENFS;
^1da177e4c3f41 Linus Torvalds  2005-04-16  3062  		}
089be43e403a78 James Morris    2008-07-15  3063  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  3064  
^1da177e4c3f41 Linus Torvalds  2005-04-16  3065  out:
1b8b31a2e6120b Stephen Smalley 2020-08-19  3066  	rcu_read_unlock();
^1da177e4c3f41 Linus Torvalds  2005-04-16  3067  	return rc;
^1da177e4c3f41 Linus Torvalds  2005-04-16  3068  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  3069  

:::::: The code at line 3015 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
