Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C44272908
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Feb 2025 23:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739315000; cv=none; b=rr8wmxXYmlteksX1WUj+q4Q755RCCt4jKSAS5fYbaQbSaDPl0uq43oqUt8y1zHmlnjVp8lyPp7p4Z6YHNRBzWsB0DmNW3ScUo0forw+a+N1cjMVTEgERv/rnlf6XXaJgGHHuOFjEAB4Ay0O2ObQpLVpw18ujlHWXjrfr4Sm5JuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739315000; c=relaxed/simple;
	bh=hI3J3pbtRvvYEXpyWSHMkCsP2dpFvaW3GjgcQvwLyYg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MMhVsipUDQEuX2G5+iXITsBx/yz0/tAQLRhbvdORdF/fcg765Yo99be06hurT8GNqxFr2WdTm1+HU1mFXQ1LamNG4bwT6FvGDdYYju6bXJGEzoqwJQl/vzt5tBwiYC7s3oryPgIpLhsaltSGDCezsWHPctSeTVhJUE4+MsKexeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XCTQ8OQy; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XCTQ8OQy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739314999; x=1770850999;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hI3J3pbtRvvYEXpyWSHMkCsP2dpFvaW3GjgcQvwLyYg=;
  b=XCTQ8OQy/Xd+9B5SkgiG1GZJzbsWCdWM9TAk0ma20diIVkPtVW14tYt9
   u5JbnmEQIeshubp2gsHv9FwJ7zi3sWqX0HSaaNpwSDIA9QLhEh8Ab+xRr
   Cf2bKfeZyRQvm9lr79KGF0tE1M3dH+aBwaH4VFx45XhKBHhXqyoWDzHMB
   ecX3vpJxH1FPZg6zgxZtrFRLag35ByKJCwZk6+/tQyU9vvRBP5+16XM5C
   eok1PHUT5sHuFO5NjeLFCZyfCoQ7V3o/CF1Blg9gaFkP1ooBZHiD2CIjc
   9is8OSlGAnQrffe3JamSW5Li/vGq6gnDeygZ0IBwQnrWgxTr96byKHCdh
   w==;
X-CSE-ConnectionGUID: kcCsQIQ5TcK0zp0HqheIdw==
X-CSE-MsgGUID: XbQu6RNtR2mr+taspBfU2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="62422484"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="62422484"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 15:03:18 -0800
X-CSE-ConnectionGUID: ShUgoahES9+OEVJ2z979CA==
X-CSE-MsgGUID: Zlb+g1odQRetvtKf1dCN6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113538631"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Feb 2025 15:03:16 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thzHe-0014oT-1K;
	Tue, 11 Feb 2025 23:03:14 +0000
Date: Wed, 12 Feb 2025 07:02:22 +0800
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [smfrench-smb3:ksmbd-for-next-next 1/1]
 fs/smb/client/cifsacl.c:802:16: warning: result of comparison of constant
 2305843009213693951 with expression of type 'u16' (aka 'unsigned short') is
 always false
Message-ID: <202502120645.NdjyIqzr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/smfrench/smb3-kernel.git ksmbd-for-next-next
head:   d2b8db9f4873a117bb3307b8b8063bc647c07492
commit: d2b8db9f4873a117bb3307b8b8063bc647c07492 [1/1] smb: common: change the data type of num_aces to le16
config: riscv-randconfig-002-20250212 (https://download.01.org/0day-ci/archive/20250212/202502120645.NdjyIqzr-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502120645.NdjyIqzr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502120645.NdjyIqzr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/smb/client/cifsacl.c:802:16: warning: result of comparison of constant 2305843009213693951 with expression of type 'u16' (aka 'unsigned short') is always false [-Wtautological-constant-out-of-range-compare]
     802 |                 if (num_aces > ULONG_MAX / sizeof(struct smb_ace *))
         |                     ~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +802 fs/smb/client/cifsacl.c

d0d66c443aefa5 fs/cifs/cifsacl.c       Shirish Pargaonkar 2007-10-03  760  
251b93ae73805b fs/smb/client/cifsacl.c ChenXiaoSong       2024-08-22  761  static void parse_dacl(struct smb_acl *pdacl, char *end_of_acl,
7f599d8fb3e087 fs/smb/client/cifsacl.c ChenXiaoSong       2024-08-22  762  		       struct smb_sid *pownersid, struct smb_sid *pgrpsid,
e2f8fbfb8d09c0 fs/cifs/cifsacl.c       Steve French       2019-07-19  763  		       struct cifs_fattr *fattr, bool mode_from_special_sid)
d0d66c443aefa5 fs/cifs/cifsacl.c       Shirish Pargaonkar 2007-10-03  764  {
d0d66c443aefa5 fs/cifs/cifsacl.c       Shirish Pargaonkar 2007-10-03  765  	int i;
d2b8db9f4873a1 fs/smb/client/cifsacl.c Namjae Jeon        2025-02-11  766  	u16 num_aces = 0;
d0d66c443aefa5 fs/cifs/cifsacl.c       Shirish Pargaonkar 2007-10-03  767  	int acl_size;
d0d66c443aefa5 fs/cifs/cifsacl.c       Shirish Pargaonkar 2007-10-03  768  	char *acl_base;
09bedafc1e2c5c fs/smb/client/cifsacl.c ChenXiaoSong       2024-08-22  769  	struct smb_ace **ppace;
d0d66c443aefa5 fs/cifs/cifsacl.c       Shirish Pargaonkar 2007-10-03  770  
d0d66c443aefa5 fs/cifs/cifsacl.c       Shirish Pargaonkar 2007-10-03  771  	/* BB need to add parm so we can store the SID BB */
d0d66c443aefa5 fs/cifs/cifsacl.c       Shirish Pargaonkar 2007-10-03  772  
2b83457bded19c fs/cifs/cifsacl.c       Steve French       2007-11-25  773  	if (!pdacl) {
2b83457bded19c fs/cifs/cifsacl.c       Steve French       2007-11-25  774  		/* no DACL in the security descriptor, set
2b83457bded19c fs/cifs/cifsacl.c       Steve French       2007-11-25  775  		   all the permissions for user/group/other */
0f22053e811ca5 fs/cifs/cifsacl.c       Shyam Prasad N     2020-08-17  776  		fattr->cf_mode |= 0777;
2b83457bded19c fs/cifs/cifsacl.c       Steve French       2007-11-25  777  		return;
2b83457bded19c fs/cifs/cifsacl.c       Steve French       2007-11-25  778  	}
2b83457bded19c fs/cifs/cifsacl.c       Steve French       2007-11-25  779  
d0d66c443aefa5 fs/cifs/cifsacl.c       Shirish Pargaonkar 2007-10-03  780  	/* validate that we do not go past end of acl */
af6f4612fdfd78 fs/cifs/cifsacl.c       Steve French       2007-10-16  781  	if (end_of_acl < (char *)pdacl + le16_to_cpu(pdacl->size)) {
f96637be081141 fs/cifs/cifsacl.c       Joe Perches        2013-05-04  782  		cifs_dbg(VFS, "ACL too small to parse DACL\n");
d0d66c443aefa5 fs/cifs/cifsacl.c       Shirish Pargaonkar 2007-10-03  783  		return;
d0d66c443aefa5 fs/cifs/cifsacl.c       Shirish Pargaonkar 2007-10-03  784  	}
d0d66c443aefa5 fs/cifs/cifsacl.c       Shirish Pargaonkar 2007-10-03  785  
f96637be081141 fs/cifs/cifsacl.c       Joe Perches        2013-05-04  786  	cifs_dbg(NOISY, "DACL revision %d size %d num aces %d\n",
af6f4612fdfd78 fs/cifs/cifsacl.c       Steve French       2007-10-16  787  		 le16_to_cpu(pdacl->revision), le16_to_cpu(pdacl->size),
d2b8db9f4873a1 fs/smb/client/cifsacl.c Namjae Jeon        2025-02-11  788  		 le16_to_cpu(pdacl->num_aces));
d0d66c443aefa5 fs/cifs/cifsacl.c       Shirish Pargaonkar 2007-10-03  789  
7505e0525c914c fs/cifs/cifsacl.c       Steve French       2007-11-01  790  	/* reset rwx permissions for user/group/other.
7505e0525c914c fs/cifs/cifsacl.c       Steve French       2007-11-01  791  	   Also, if num_aces is 0 i.e. DACL has no ACEs,
7505e0525c914c fs/cifs/cifsacl.c       Steve French       2007-11-01  792  	   user/group/other have no permissions */
0f22053e811ca5 fs/cifs/cifsacl.c       Shyam Prasad N     2020-08-17  793  	fattr->cf_mode &= ~(0777);
7505e0525c914c fs/cifs/cifsacl.c       Steve French       2007-11-01  794  
d0d66c443aefa5 fs/cifs/cifsacl.c       Shirish Pargaonkar 2007-10-03  795  	acl_base = (char *)pdacl;
251b93ae73805b fs/smb/client/cifsacl.c ChenXiaoSong       2024-08-22  796  	acl_size = sizeof(struct smb_acl);
d0d66c443aefa5 fs/cifs/cifsacl.c       Shirish Pargaonkar 2007-10-03  797  
d2b8db9f4873a1 fs/smb/client/cifsacl.c Namjae Jeon        2025-02-11  798  	num_aces = le16_to_cpu(pdacl->num_aces);
d0d66c443aefa5 fs/cifs/cifsacl.c       Shirish Pargaonkar 2007-10-03  799  	if (num_aces > 0) {
0f22053e811ca5 fs/cifs/cifsacl.c       Shyam Prasad N     2020-08-17  800  		umode_t denied_mode = 0;
15b0395911eb45 fs/cifs/cifsacl.c       Steve French       2007-11-08  801  
09bedafc1e2c5c fs/smb/client/cifsacl.c ChenXiaoSong       2024-08-22 @802  		if (num_aces > ULONG_MAX / sizeof(struct smb_ace *))
7250170c9ed00f fs/cifs/cifsacl.c       Dan Carpenter      2012-01-11  803  			return;
09bedafc1e2c5c fs/smb/client/cifsacl.c ChenXiaoSong       2024-08-22  804  		ppace = kmalloc_array(num_aces, sizeof(struct smb_ace *),
d0d66c443aefa5 fs/cifs/cifsacl.c       Shirish Pargaonkar 2007-10-03  805  				      GFP_KERNEL);
f96637be081141 fs/cifs/cifsacl.c       Joe Perches        2013-05-04  806  		if (!ppace)
8132b65bc6ce6d fs/cifs/cifsacl.c       Stanislav Fomichev 2011-02-06  807  			return;
d0d66c443aefa5 fs/cifs/cifsacl.c       Shirish Pargaonkar 2007-10-03  808  
d0d66c443aefa5 fs/cifs/cifsacl.c       Shirish Pargaonkar 2007-10-03  809  		for (i = 0; i < num_aces; ++i) {
09bedafc1e2c5c fs/smb/client/cifsacl.c ChenXiaoSong       2024-08-22  810  			ppace[i] = (struct smb_ace *) (acl_base + acl_size);
953f868138dbf4 fs/cifs/cifsacl.c       Steve French       2007-10-31  811  #ifdef CONFIG_CIFS_DEBUG2
953f868138dbf4 fs/cifs/cifsacl.c       Steve French       2007-10-31  812  			dump_ace(ppace[i], end_of_acl);
953f868138dbf4 fs/cifs/cifsacl.c       Steve French       2007-10-31  813  #endif
e2f8fbfb8d09c0 fs/cifs/cifsacl.c       Steve French       2019-07-19  814  			if (mode_from_special_sid &&
e2f8fbfb8d09c0 fs/cifs/cifsacl.c       Steve French       2019-07-19  815  			    (compare_sids(&(ppace[i]->sid),
e2f8fbfb8d09c0 fs/cifs/cifsacl.c       Steve French       2019-07-19  816  					  &sid_unix_NFS_mode) == 0)) {
e2f8fbfb8d09c0 fs/cifs/cifsacl.c       Steve French       2019-07-19  817  				/*
e2f8fbfb8d09c0 fs/cifs/cifsacl.c       Steve French       2019-07-19  818  				 * Full permissions are:
e2f8fbfb8d09c0 fs/cifs/cifsacl.c       Steve French       2019-07-19  819  				 * 07777 = S_ISUID | S_ISGID | S_ISVTX |
e2f8fbfb8d09c0 fs/cifs/cifsacl.c       Steve French       2019-07-19  820  				 *         S_IRWXU | S_IRWXG | S_IRWXO
e2f8fbfb8d09c0 fs/cifs/cifsacl.c       Steve French       2019-07-19  821  				 */
e2f8fbfb8d09c0 fs/cifs/cifsacl.c       Steve French       2019-07-19  822  				fattr->cf_mode &= ~07777;
e2f8fbfb8d09c0 fs/cifs/cifsacl.c       Steve French       2019-07-19  823  				fattr->cf_mode |=
e2f8fbfb8d09c0 fs/cifs/cifsacl.c       Steve French       2019-07-19  824  					le32_to_cpu(ppace[i]->sid.sub_auth[2]);
e2f8fbfb8d09c0 fs/cifs/cifsacl.c       Steve French       2019-07-19  825  				break;
0f22053e811ca5 fs/cifs/cifsacl.c       Shyam Prasad N     2020-08-17  826  			} else {
0f22053e811ca5 fs/cifs/cifsacl.c       Shyam Prasad N     2020-08-17  827  				if (compare_sids(&(ppace[i]->sid), pownersid) == 0) {
e01b6400135903 fs/cifs/cifsacl.c       Shirish Pargaonkar 2007-10-30  828  					access_flags_to_mode(ppace[i]->access_req,
15b0395911eb45 fs/cifs/cifsacl.c       Steve French       2007-11-08  829  							ppace[i]->type,
0b8f18e358384a fs/cifs/cifsacl.c       Jeff Layton        2009-07-09  830  							&fattr->cf_mode,
0f22053e811ca5 fs/cifs/cifsacl.c       Shyam Prasad N     2020-08-17  831  							&denied_mode,
0f22053e811ca5 fs/cifs/cifsacl.c       Shyam Prasad N     2020-08-17  832  							ACL_OWNER_MASK);
0f22053e811ca5 fs/cifs/cifsacl.c       Shyam Prasad N     2020-08-17  833  				} else if (compare_sids(&(ppace[i]->sid), pgrpsid) == 0) {
e01b6400135903 fs/cifs/cifsacl.c       Shirish Pargaonkar 2007-10-30  834  					access_flags_to_mode(ppace[i]->access_req,
15b0395911eb45 fs/cifs/cifsacl.c       Steve French       2007-11-08  835  							ppace[i]->type,
0b8f18e358384a fs/cifs/cifsacl.c       Jeff Layton        2009-07-09  836  							&fattr->cf_mode,
0f22053e811ca5 fs/cifs/cifsacl.c       Shyam Prasad N     2020-08-17  837  							&denied_mode,
0f22053e811ca5 fs/cifs/cifsacl.c       Shyam Prasad N     2020-08-17  838  							ACL_GROUP_MASK);
0f22053e811ca5 fs/cifs/cifsacl.c       Shyam Prasad N     2020-08-17  839  				} else if ((compare_sids(&(ppace[i]->sid), &sid_everyone) == 0) ||
0f22053e811ca5 fs/cifs/cifsacl.c       Shyam Prasad N     2020-08-17  840  						(compare_sids(&(ppace[i]->sid), &sid_authusers) == 0)) {
2fbc2f1729e785 fs/cifs/cifsacl.c       Shirish Pargaonkar 2010-12-06  841  					access_flags_to_mode(ppace[i]->access_req,
2fbc2f1729e785 fs/cifs/cifsacl.c       Shirish Pargaonkar 2010-12-06  842  							ppace[i]->type,
2fbc2f1729e785 fs/cifs/cifsacl.c       Shirish Pargaonkar 2010-12-06  843  							&fattr->cf_mode,
0f22053e811ca5 fs/cifs/cifsacl.c       Shyam Prasad N     2020-08-17  844  							&denied_mode,
0f22053e811ca5 fs/cifs/cifsacl.c       Shyam Prasad N     2020-08-17  845  							ACL_EVERYONE_MASK);
0f22053e811ca5 fs/cifs/cifsacl.c       Shyam Prasad N     2020-08-17  846  				}
0f22053e811ca5 fs/cifs/cifsacl.c       Shyam Prasad N     2020-08-17  847  			}
2fbc2f1729e785 fs/cifs/cifsacl.c       Shirish Pargaonkar 2010-12-06  848  
e01b6400135903 fs/cifs/cifsacl.c       Shirish Pargaonkar 2007-10-30  849  

:::::: The code at line 802 was first introduced by commit
:::::: 09bedafc1e2c5c82aad3cbfe1359e2b0bf752f3a smb/client: rename cifs_ace to smb_ace

:::::: TO: ChenXiaoSong <chenxiaosong@kylinos.cn>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
