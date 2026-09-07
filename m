Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3756341BA61
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Sep 2026 11:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780878; cv=none; b=Igmfq7/sfL2n0jTbQPjDt1K+HjaH7ir4ctvgAJI4dequ8uZiKqwX7mmln9pto/S3Nr6Jo3dkYhhNOOjN/1VMIEXHVxIISwUsHciERSisacUxscRIGuRcGptw8UywCDJ1e364rh5AbwjId10hHbb96/cBpa5Rablb1r2HCZn73tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780878; c=relaxed/simple;
	bh=b34L5w0lT8fPaB2QJoXbvvrXphC19XE/uMGOABNgRyk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=F9dbYQAr22WE9iWE8iwO0NGIK7CdnJSue+asW7lrMorkIpJ5t5xgsKUdJjCQjgZC4qYyd7yJoMHnan7Pq4WJuRVm76GhEDjNebfJw/y8bRkxFD/jugw8po5nvyKXxIz6AT85N31pe0Npg1OOPiGfUErr0pz/HIqTQpSDJlr5oSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dWlhtzeq; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dWlhtzeq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788780876; x=1820316876;
  h=date:from:to:cc:subject:message-id;
  bh=b34L5w0lT8fPaB2QJoXbvvrXphC19XE/uMGOABNgRyk=;
  b=dWlhtzeq34it5RQ7hHZczv5YcIyAJ/+cMPrW6xZquP6kSlVGyRTFh069
   L3dFybKSchzy8xxrgR0oAUSM+mR3wlXEBnV/Je5M5BcAZOycr8B1Nrk81
   z5t5zOzop1+6V4LkbK6SPM71HsMsTMm3Ja1vtPiDV4FehzaJWbqmP6yxP
   DRhc83idXThXkBOstKnKSf3I/9DPbF0BYn8NpAd9YEnnmsEaUhuzXojcH
   +/PQ5hsRQvynbGuIceFaHBEV+uEHVeOfgRdd8crnt1yHBpWoz238Dnx1o
   ZPLAbaepvsL8RNhB0S6bBgRb+zhotCwrvKU0mEmFqXPmTHsGCdTuqC+Nx
   g==;
X-CSE-ConnectionGUID: 7OaI7CUBTKa7eaXDWa9HPQ==
X-CSE-MsgGUID: hx+xBNE+QHSTDk6fn6kvLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="99842073"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="99842073"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 04:34:35 -0700
X-CSE-ConnectionGUID: mWWZ4gw2QT+AX/+Fu4fp6w==
X-CSE-MsgGUID: aCgKPZjTSRSr5tTJT3wpYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="294158517"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Sep 2026 04:34:34 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3XcO-000000000q7-0XzY;
	Mon, 07 Sep 2026 11:34:32 +0000
Date: Mon, 07 Sep 2026 19:33:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 254/254]
 fs/smb/client/cifsacl.c:835:26: warning: variable 'end_of_dacl' set but not
 used
Message-ID: <202609071902.PsYXupOK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   7025f9c2fb2cec65324445321db6486af3876474
commit: c2abdebf72000a64603ced84d36ccbd164f11391 [254/254] smb: client: validate the whole DACL before rewriting it in cifsacl
config: x86_64-randconfig-102-20260907 (https://download.01.org/0day-ci/archive/20260907/202609071902.PsYXupOK-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260907/202609071902.PsYXupOK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609071902.PsYXupOK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/smb/client/cifsacl.c: In function 'parse_dacl':
>> fs/smb/client/cifsacl.c:835:26: warning: variable 'end_of_dacl' set but not used [-Wunused-but-set-variable]
     835 |         char *acl_base, *end_of_dacl;
         |                          ^~~~~~~~~~~


vim +/end_of_dacl +835 fs/smb/client/cifsacl.c

   827	
   828	static void parse_dacl(struct cifs_acl *pdacl, char *end_of_acl,
   829			       struct cifs_sid *pownersid, struct cifs_sid *pgrpsid,
   830			       struct cifs_fattr *fattr, bool mode_from_special_sid)
   831	{
   832		int i;
   833		int num_aces = 0;
   834		int acl_size;
 > 835		char *acl_base, *end_of_dacl;
   836		struct cifs_ace **ppace;
   837	
   838		/* BB need to add parm so we can store the SID BB */
   839	
   840		if (!pdacl) {
   841			/* no DACL in the security descriptor, set
   842			   all the permissions for user/group/other */
   843			fattr->cf_mode |= 0777;
   844			return;
   845		}
   846	
   847		if (validate_dacl(pdacl, end_of_acl))
   848			return;
   849	
   850		cifs_dbg(NOISY, "DACL revision %d size %d num aces %d\n",
   851			 le16_to_cpu(pdacl->revision), le16_to_cpu(pdacl->size),
   852			 le32_to_cpu(pdacl->num_aces));
   853	
   854		/* reset rwx permissions for user/group/other.
   855		   Also, if num_aces is 0 i.e. DACL has no ACEs,
   856		   user/group/other have no permissions */
   857		fattr->cf_mode &= ~(0777);
   858	
   859		end_of_dacl = (char *)pdacl + le16_to_cpu(pdacl->size);
   860		acl_base = (char *)pdacl;
   861		acl_size = sizeof(struct cifs_acl);
   862	
   863		num_aces = le32_to_cpu(pdacl->num_aces);
   864		if (num_aces > 0) {
   865			umode_t denied_mode = 0;
   866	
   867			if (num_aces > ULONG_MAX / sizeof(struct cifs_ace *))
   868				return;
   869			ppace = kmalloc_array(num_aces, sizeof(struct cifs_ace *),
   870					      GFP_KERNEL);
   871			if (!ppace)
   872				return;
   873	
   874			for (i = 0; i < num_aces; ++i) {
   875				ppace[i] = (struct cifs_ace *) (acl_base + acl_size);
   876	#ifdef CONFIG_CIFS_DEBUG2
   877				dump_ace(ppace[i], end_of_dacl);
   878	#endif
   879				if (mode_from_special_sid &&
   880				    ppace[i]->sid.num_subauth >= 3 &&
   881				    (compare_sids(&(ppace[i]->sid),
   882						  &sid_unix_NFS_mode) == 0)) {
   883					/*
   884					 * Full permissions are:
   885					 * 07777 = S_ISUID | S_ISGID | S_ISVTX |
   886					 *         S_IRWXU | S_IRWXG | S_IRWXO
   887					 */
   888					fattr->cf_mode &= ~07777;
   889					fattr->cf_mode |=
   890						le32_to_cpu(ppace[i]->sid.sub_auth[2]);
   891					break;
   892				} else {
   893					if (compare_sids(&(ppace[i]->sid), pownersid) == 0) {
   894						access_flags_to_mode(ppace[i]->access_req,
   895								ppace[i]->type,
   896								&fattr->cf_mode,
   897								&denied_mode,
   898								ACL_OWNER_MASK);
   899					} else if (compare_sids(&(ppace[i]->sid), pgrpsid) == 0) {
   900						access_flags_to_mode(ppace[i]->access_req,
   901								ppace[i]->type,
   902								&fattr->cf_mode,
   903								&denied_mode,
   904								ACL_GROUP_MASK);
   905					} else if ((compare_sids(&(ppace[i]->sid), &sid_everyone) == 0) ||
   906							(compare_sids(&(ppace[i]->sid), &sid_authusers) == 0)) {
   907						access_flags_to_mode(ppace[i]->access_req,
   908								ppace[i]->type,
   909								&fattr->cf_mode,
   910								&denied_mode,
   911								ACL_EVERYONE_MASK);
   912					}
   913				}
   914	
   915	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
