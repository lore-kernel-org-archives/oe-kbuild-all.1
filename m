Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7C12580CF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Feb 2025 18:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739299191; cv=none; b=oEaf7RDHlecjXoinIavUKcYpTsheTddIDcj0lAwHr/l1SPtQI1//l69vXjqn79E9sPMS+GhWUiUPIkhupuCGB/RAd5vDgyVHRrWNlNWcpqE6dWrkAGTFWN3rZy7bo0WaK1GOiqTZHicnCAG/w2cRl39DEBedPfpYnpFp5dk91CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739299191; c=relaxed/simple;
	bh=BPzbUuqe+YqweRRoU4Yp6bfOhR0LRnWT8H9JOLeXJaE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Uk9wqLaaywN4/ZLDZiBTIqRSCZ7VTbZvyVA/QBBC8YMBnwoIJJ1uqAUBTjEYKquMc9QgGK5DObvrSq2R4O0c088YEt4hj0QdGTB4Hrg6R12qyCeKEq/Gpq3/BWYYa8UUj+MeK2BV5p5HYs9L+NbJ6ibt+RwXhW0KgOuxkaW5Bkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fHmKmoYD; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fHmKmoYD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739299189; x=1770835189;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BPzbUuqe+YqweRRoU4Yp6bfOhR0LRnWT8H9JOLeXJaE=;
  b=fHmKmoYDdQXxZXk9LmlibYCxzVEikyviF7V2INzqZ+LW6EMuTuGr2ePR
   SRb1+TWeEoYjFQ6QaBjSztwEzqHAYreCXKTUjVVb2s42SdLWKVEXIGGdg
   kCxmx1obpiIv7Jc2BwP6Ba0A90vG+MdarH66W2ORgbYMTfCwVmoP++uZe
   fuWlHUQ2nuJbY6uBs7eHdCiy77wvalBvqsJu/hSv7kgkLsQWov7EHUBFJ
   4Vb/R6IcRlD29yk+EO9JDOQtsXtDNFmYe7Y24gWOvwGY20q2PXisYN/ce
   TwF5Dif/VCseNXHDXi0Fj2q6bhfeVvMOAvR8snwD6mjknKcuE6sZtAehp
   w==;
X-CSE-ConnectionGUID: 07QMWxcmRUK7qXctLz7AEg==
X-CSE-MsgGUID: t6Rmcg0lR++6i1afG5ufCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51362816"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="51362816"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 10:39:49 -0800
X-CSE-ConnectionGUID: e47LbekCR6WMlNgARFRH+w==
X-CSE-MsgGUID: ALx6m8GtS8atOL59LMpJMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="112808033"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 Feb 2025 10:39:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thvAf-0014Zd-0j;
	Tue, 11 Feb 2025 18:39:45 +0000
Date: Wed, 12 Feb 2025 02:39:17 +0800
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [smfrench-smb3:ksmbd-for-next-next 1/1]
 fs/smb/server/smbacl.c:401:15: warning: result of comparison of constant
 2305843009213693951 with expression of type 'u16' (aka 'unsigned short') is
 always false
Message-ID: <202502120216.Dw3PS0UN-lkp@intel.com>
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
config: um-randconfig-001-20250212 (https://download.01.org/0day-ci/archive/20250212/202502120216.Dw3PS0UN-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502120216.Dw3PS0UN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502120216.Dw3PS0UN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/smb/server/smbacl.c:401:15: warning: result of comparison of constant 2305843009213693951 with expression of type 'u16' (aka 'unsigned short') is always false [-Wtautological-constant-out-of-range-compare]
           if (num_aces > ULONG_MAX / sizeof(struct smb_ace *))
               ~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +401 fs/smb/server/smbacl.c

e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  364  
4d7ca4090184c1 fs/ksmbd/smbacl.c      Christian Brauner 2023-01-13  365  static void parse_dacl(struct mnt_idmap *idmap,
af34983e831587 fs/ksmbd/smbacl.c      Hyunchul Lee      2021-06-30  366  		       struct smb_acl *pdacl, char *end_of_acl,
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  367  		       struct smb_sid *pownersid, struct smb_sid *pgrpsid,
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  368  		       struct smb_fattr *fattr)
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  369  {
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  370  	int i, ret;
d2b8db9f4873a1 fs/smb/server/smbacl.c Namjae Jeon       2025-02-11  371  	u16 num_aces = 0;
8f77150c15f877 fs/ksmbd/smbacl.c      Hyunchul Lee      2021-09-24  372  	unsigned int acl_size;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  373  	char *acl_base;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  374  	struct smb_ace **ppace;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  375  	struct posix_acl_entry *cf_pace, *cf_pdace;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  376  	struct posix_acl_state acl_state, default_acl_state;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  377  	umode_t mode = 0, acl_mode;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  378  	bool owner_found = false, group_found = false, others_found = false;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  379  
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  380  	if (!pdacl)
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  381  		return;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  382  
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  383  	/* validate that we do not go past end of acl */
8f77150c15f877 fs/ksmbd/smbacl.c      Hyunchul Lee      2021-09-24  384  	if (end_of_acl < (char *)pdacl + sizeof(struct smb_acl) ||
548e9ad317393b fs/cifsd/smbacl.c      Namjae Jeon       2021-03-21  385  	    end_of_acl < (char *)pdacl + le16_to_cpu(pdacl->size)) {
bde1694aecdb53 fs/cifsd/smbacl.c      Namjae Jeon       2021-06-28  386  		pr_err("ACL too small to parse DACL\n");
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  387  		return;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  388  	}
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  389  
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  390  	ksmbd_debug(SMB, "DACL revision %d size %d num aces %d\n",
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  391  		    le16_to_cpu(pdacl->revision), le16_to_cpu(pdacl->size),
d2b8db9f4873a1 fs/smb/server/smbacl.c Namjae Jeon       2025-02-11  392  		    le16_to_cpu(pdacl->num_aces));
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  393  
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  394  	acl_base = (char *)pdacl;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  395  	acl_size = sizeof(struct smb_acl);
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  396  
d2b8db9f4873a1 fs/smb/server/smbacl.c Namjae Jeon       2025-02-11  397  	num_aces = le16_to_cpu(pdacl->num_aces);
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  398  	if (num_aces <= 0)
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  399  		return;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  400  
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16 @401  	if (num_aces > ULONG_MAX / sizeof(struct smb_ace *))
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  402  		return;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  403  
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  404  	ret = init_acl_state(&acl_state, num_aces);
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  405  	if (ret)
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  406  		return;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  407  	ret = init_acl_state(&default_acl_state, num_aces);
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  408  	if (ret) {
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  409  		free_acl_state(&acl_state);
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  410  		return;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  411  	}
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  412  
0066f623bce8f9 fs/smb/server/smbacl.c Namjae Jeon       2024-11-22  413  	ppace = kmalloc_array(num_aces, sizeof(struct smb_ace *), KSMBD_DEFAULT_GFP);
8cf9bedfc3c47d fs/smb/server/smbacl.c Fedor Pchelkin    2024-01-09  414  	if (!ppace) {
8cf9bedfc3c47d fs/smb/server/smbacl.c Fedor Pchelkin    2024-01-09  415  		free_acl_state(&default_acl_state);
8cf9bedfc3c47d fs/smb/server/smbacl.c Fedor Pchelkin    2024-01-09  416  		free_acl_state(&acl_state);
8cf9bedfc3c47d fs/smb/server/smbacl.c Fedor Pchelkin    2024-01-09  417  		return;
8cf9bedfc3c47d fs/smb/server/smbacl.c Fedor Pchelkin    2024-01-09  418  	}
8cf9bedfc3c47d fs/smb/server/smbacl.c Fedor Pchelkin    2024-01-09  419  
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  420  	/*
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  421  	 * reset rwx permissions for user/group/other.
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  422  	 * Also, if num_aces is 0 i.e. DACL has no ACEs,
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  423  	 * user/group/other have no permissions
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  424  	 */
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  425  	for (i = 0; i < num_aces; ++i) {
8f77150c15f877 fs/ksmbd/smbacl.c      Hyunchul Lee      2021-09-24  426  		if (end_of_acl - acl_base < acl_size)
8f77150c15f877 fs/ksmbd/smbacl.c      Hyunchul Lee      2021-09-24  427  			break;
8f77150c15f877 fs/ksmbd/smbacl.c      Hyunchul Lee      2021-09-24  428  
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  429  		ppace[i] = (struct smb_ace *)(acl_base + acl_size);
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  430  		acl_base = (char *)ppace[i];
8f77150c15f877 fs/ksmbd/smbacl.c      Hyunchul Lee      2021-09-24  431  		acl_size = offsetof(struct smb_ace, sid) +
8f77150c15f877 fs/ksmbd/smbacl.c      Hyunchul Lee      2021-09-24  432  			offsetof(struct smb_sid, sub_auth);
8f77150c15f877 fs/ksmbd/smbacl.c      Hyunchul Lee      2021-09-24  433  
8f77150c15f877 fs/ksmbd/smbacl.c      Hyunchul Lee      2021-09-24  434  		if (end_of_acl - acl_base < acl_size ||
8f77150c15f877 fs/ksmbd/smbacl.c      Hyunchul Lee      2021-09-24  435  		    ppace[i]->sid.num_subauth > SID_MAX_SUB_AUTHORITIES ||
8f77150c15f877 fs/ksmbd/smbacl.c      Hyunchul Lee      2021-09-24  436  		    (end_of_acl - acl_base <
8f77150c15f877 fs/ksmbd/smbacl.c      Hyunchul Lee      2021-09-24  437  		     acl_size + sizeof(__le32) * ppace[i]->sid.num_subauth) ||
8f77150c15f877 fs/ksmbd/smbacl.c      Hyunchul Lee      2021-09-24  438  		    (le16_to_cpu(ppace[i]->size) <
8f77150c15f877 fs/ksmbd/smbacl.c      Hyunchul Lee      2021-09-24  439  		     acl_size + sizeof(__le32) * ppace[i]->sid.num_subauth))
8f77150c15f877 fs/ksmbd/smbacl.c      Hyunchul Lee      2021-09-24  440  			break;
8f77150c15f877 fs/ksmbd/smbacl.c      Hyunchul Lee      2021-09-24  441  
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  442  		acl_size = le16_to_cpu(ppace[i]->size);
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  443  		ppace[i]->access_req =
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  444  			smb_map_generic_desired_access(ppace[i]->access_req);
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  445  
64b39f4a2fd293 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-30  446  		if (!(compare_sids(&ppace[i]->sid, &sid_unix_NFS_mode))) {
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  447  			fattr->cf_mode =
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  448  				le32_to_cpu(ppace[i]->sid.sub_auth[2]);
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  449  			break;
64b39f4a2fd293 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-30  450  		} else if (!compare_sids(&ppace[i]->sid, pownersid)) {
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  451  			acl_mode = access_flags_to_mode(fattr,
070fb21e5912b6 fs/cifsd/smbacl.c      Namjae Jeon       2021-05-26  452  							ppace[i]->access_req,
070fb21e5912b6 fs/cifsd/smbacl.c      Namjae Jeon       2021-05-26  453  							ppace[i]->type);
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  454  			acl_mode &= 0700;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  455  
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  456  			if (!owner_found) {
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  457  				mode &= ~(0700);
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  458  				mode |= acl_mode;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  459  			}
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  460  			owner_found = true;
64b39f4a2fd293 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-30  461  		} else if (!compare_sids(&ppace[i]->sid, pgrpsid) ||
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  462  			   ppace[i]->sid.sub_auth[ppace[i]->sid.num_subauth - 1] ==
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  463  			    DOMAIN_USER_RID_LE) {
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  464  			acl_mode = access_flags_to_mode(fattr,
070fb21e5912b6 fs/cifsd/smbacl.c      Namjae Jeon       2021-05-26  465  							ppace[i]->access_req,
070fb21e5912b6 fs/cifsd/smbacl.c      Namjae Jeon       2021-05-26  466  							ppace[i]->type);
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  467  			acl_mode &= 0070;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  468  			if (!group_found) {
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  469  				mode &= ~(0070);
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  470  				mode |= acl_mode;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  471  			}
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  472  			group_found = true;
64b39f4a2fd293 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-30  473  		} else if (!compare_sids(&ppace[i]->sid, &sid_everyone)) {
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  474  			acl_mode = access_flags_to_mode(fattr,
070fb21e5912b6 fs/cifsd/smbacl.c      Namjae Jeon       2021-05-26  475  							ppace[i]->access_req,
070fb21e5912b6 fs/cifsd/smbacl.c      Namjae Jeon       2021-05-26  476  							ppace[i]->type);
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  477  			acl_mode &= 0007;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  478  			if (!others_found) {
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  479  				mode &= ~(0007);
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  480  				mode |= acl_mode;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  481  			}
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  482  			others_found = true;
64b39f4a2fd293 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-30  483  		} else if (!compare_sids(&ppace[i]->sid, &creator_owner)) {
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  484  			continue;
64b39f4a2fd293 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-30  485  		} else if (!compare_sids(&ppace[i]->sid, &creator_group)) {
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  486  			continue;
64b39f4a2fd293 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-30  487  		} else if (!compare_sids(&ppace[i]->sid, &sid_authusers)) {
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  488  			continue;
64b39f4a2fd293 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-30  489  		} else {
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  490  			struct smb_fattr temp_fattr;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  491  
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  492  			acl_mode = access_flags_to_mode(fattr, ppace[i]->access_req,
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  493  							ppace[i]->type);
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  494  			temp_fattr.cf_uid = INVALID_UID;
4d7ca4090184c1 fs/ksmbd/smbacl.c      Christian Brauner 2023-01-13  495  			ret = sid_to_id(idmap, &ppace[i]->sid, SIDOWNER, &temp_fattr);
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  496  			if (ret || uid_eq(temp_fattr.cf_uid, INVALID_UID)) {
bde1694aecdb53 fs/cifsd/smbacl.c      Namjae Jeon       2021-06-28  497  				pr_err("%s: Error %d mapping Owner SID to uid\n",
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  498  				       __func__, ret);
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  499  				continue;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  500  			}
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  501  
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  502  			acl_state.owner.allow = ((acl_mode & 0700) >> 6) | 0004;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  503  			acl_state.users->aces[acl_state.users->n].uid =
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  504  				temp_fattr.cf_uid;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  505  			acl_state.users->aces[acl_state.users->n++].perms.allow =
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  506  				((acl_mode & 0700) >> 6) | 0004;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  507  			default_acl_state.owner.allow = ((acl_mode & 0700) >> 6) | 0004;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  508  			default_acl_state.users->aces[default_acl_state.users->n].uid =
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  509  				temp_fattr.cf_uid;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  510  			default_acl_state.users->aces[default_acl_state.users->n++].perms.allow =
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  511  				((acl_mode & 0700) >> 6) | 0004;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  512  		}
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  513  	}
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  514  	kfree(ppace);
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  515  
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  516  	if (owner_found) {
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  517  		/* The owner must be set to at least read-only. */
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  518  		acl_state.owner.allow = ((mode & 0700) >> 6) | 0004;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  519  		acl_state.users->aces[acl_state.users->n].uid = fattr->cf_uid;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  520  		acl_state.users->aces[acl_state.users->n++].perms.allow =
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  521  			((mode & 0700) >> 6) | 0004;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  522  		default_acl_state.owner.allow = ((mode & 0700) >> 6) | 0004;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  523  		default_acl_state.users->aces[default_acl_state.users->n].uid =
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  524  			fattr->cf_uid;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  525  		default_acl_state.users->aces[default_acl_state.users->n++].perms.allow =
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  526  			((mode & 0700) >> 6) | 0004;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  527  	}
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  528  
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  529  	if (group_found) {
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  530  		acl_state.group.allow = (mode & 0070) >> 3;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  531  		acl_state.groups->aces[acl_state.groups->n].gid =
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  532  			fattr->cf_gid;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  533  		acl_state.groups->aces[acl_state.groups->n++].perms.allow =
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  534  			(mode & 0070) >> 3;
86df49e105afa6 fs/cifsd/smbacl.c      Dan Carpenter     2021-03-18  535  		default_acl_state.group.allow = (mode & 0070) >> 3;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  536  		default_acl_state.groups->aces[default_acl_state.groups->n].gid =
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  537  			fattr->cf_gid;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  538  		default_acl_state.groups->aces[default_acl_state.groups->n++].perms.allow =
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  539  			(mode & 0070) >> 3;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  540  	}
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  541  
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  542  	if (others_found) {
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  543  		fattr->cf_mode &= ~(0007);
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  544  		fattr->cf_mode |= mode & 0007;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  545  
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  546  		acl_state.other.allow = mode & 0007;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  547  		default_acl_state.other.allow = mode & 0007;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  548  	}
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  549  
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  550  	if (acl_state.users->n || acl_state.groups->n) {
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  551  		acl_state.mask.allow = 0x07;
777cad1604d68e fs/ksmbd/smbacl.c      Namjae Jeon       2021-08-13  552  
777cad1604d68e fs/ksmbd/smbacl.c      Namjae Jeon       2021-08-13  553  		if (IS_ENABLED(CONFIG_FS_POSIX_ACL)) {
777cad1604d68e fs/ksmbd/smbacl.c      Namjae Jeon       2021-08-13  554  			fattr->cf_acls =
777cad1604d68e fs/ksmbd/smbacl.c      Namjae Jeon       2021-08-13  555  				posix_acl_alloc(acl_state.users->n +
0066f623bce8f9 fs/smb/server/smbacl.c Namjae Jeon       2024-11-22  556  					acl_state.groups->n + 4, KSMBD_DEFAULT_GFP);
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  557  			if (fattr->cf_acls) {
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  558  				cf_pace = fattr->cf_acls->a_entries;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  559  				posix_state_to_acl(&acl_state, cf_pace);
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  560  			}
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  561  		}
777cad1604d68e fs/ksmbd/smbacl.c      Namjae Jeon       2021-08-13  562  	}
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  563  
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  564  	if (default_acl_state.users->n || default_acl_state.groups->n) {
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  565  		default_acl_state.mask.allow = 0x07;
777cad1604d68e fs/ksmbd/smbacl.c      Namjae Jeon       2021-08-13  566  
777cad1604d68e fs/ksmbd/smbacl.c      Namjae Jeon       2021-08-13  567  		if (IS_ENABLED(CONFIG_FS_POSIX_ACL)) {
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  568  			fattr->cf_dacls =
67d1c432994cbf fs/cifsd/smbacl.c      Namjae Jeon       2021-06-22  569  				posix_acl_alloc(default_acl_state.users->n +
0066f623bce8f9 fs/smb/server/smbacl.c Namjae Jeon       2024-11-22  570  				default_acl_state.groups->n + 4, KSMBD_DEFAULT_GFP);
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  571  			if (fattr->cf_dacls) {
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  572  				cf_pdace = fattr->cf_dacls->a_entries;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  573  				posix_state_to_acl(&default_acl_state, cf_pdace);
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  574  			}
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  575  		}
777cad1604d68e fs/ksmbd/smbacl.c      Namjae Jeon       2021-08-13  576  	}
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  577  	free_acl_state(&acl_state);
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  578  	free_acl_state(&default_acl_state);
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  579  }
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon       2021-03-16  580  

:::::: The code at line 401 was first introduced by commit
:::::: e2f34481b24db2fd634b5edb0a5bd0e4d38cc6e9 cifsd: add server-side procedures for SMB3

:::::: TO: Namjae Jeon <namjae.jeon@samsung.com>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
