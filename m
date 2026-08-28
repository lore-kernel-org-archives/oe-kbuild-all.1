Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247AE374A0C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Aug 2026 20:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787948171; cv=none; b=Sg6dlTHYhQRzqwSJYd9vIeyM8uRUOiAvwfaIxXJDZStX0m0fwnKheCLw4H0yLRhhmmIK+7+PaAIp5jtPJEppyBHzUY4Qf28nYU3y2Uy+XOtA0uVaQ6otuGtHWSauckjaUwIqn4C3W0fxf83zdXi+swaHHNN2fNVSgVwH5XLI17E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787948171; c=relaxed/simple;
	bh=ECJERf6Alj5sBSQ5x2zeFS95wAn0E/EpC0ztiBiXJKI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oAj6b+S0FAzEc9JU9PZKAp5zgplaT3wLkBKFcFqXU+El9p1tr2fjW55Myle1/yzqJBlepcoulvPrZHASz4D+U77ohbPn+ROJWWVCPMTSa5f3z6YpsijDW/ra0/Tpjwh+HhwJqram8VGLIkWcZMNlZKSiIGpiQa9g/nfIZ7MRIDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XwaNzzlN; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XwaNzzlN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787948169; x=1819484169;
  h=date:from:to:cc:subject:message-id;
  bh=ECJERf6Alj5sBSQ5x2zeFS95wAn0E/EpC0ztiBiXJKI=;
  b=XwaNzzlNCaKTvStcaSPvFuEwDlZcSgZe3Rcg75DXeI9yDQ9zWGcD9fFl
   qcydSM5pdzuyGGJXRi5Ag2X7vEBhZPD7P3yJeATQ9GiaihWDmy9OswhBA
   f3dnH2H5SztFP09ufR9C4McxrkODFBbN+/2otABHMgTKsZSciU0NzEbP4
   mWsyYlmmQco6KDE+kwAkZNSUqJfpEXyjB9TVF2JWKDzlwjNhEa4kzE0JI
   xuEijdvZuOp8UKgnGdIkWrrbvmHO9UTcZo5ERVECHBdKm4/WoRu3h6CjF
   PP9F5x71LTWNnG3zfiXcN3kmLbkLbgadTpUj3P4zKLZnBaK/xqkS2syxS
   Q==;
X-CSE-ConnectionGUID: J/t4bCjHQ9egOLAZUyfw/Q==
X-CSE-MsgGUID: CjzahlzSS5Gwawyn6bxuIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="88584579"
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; 
   d="scan'208";a="88584579"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 13:16:09 -0700
X-CSE-ConnectionGUID: GTv1J3KXRhyvRxpOwzDoNg==
X-CSE-MsgGUID: B8bZZjqzR5qc0a33mTX2rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; 
   d="scan'208";a="298159290"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Aug 2026 13:16:07 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x02zc-00000000Bwg-3JUF;
	Fri, 28 Aug 2026 20:16:04 +0000
Date: Sat, 29 Aug 2026 04:15:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 0/1]
 fs/cifs/cifsacl.c:835:19: warning: variable 'end_of_dacl' set but not used
Message-ID: <202608290428.i4YYJqod-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Michael,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   ff2f7aad3c9da232ec90522f3531d7f1ebbcb9f0
commit: b8603d9ae6c9087662b098619996bc4a8064319d [0/1] smb: client: validate the whole DACL before rewriting it in cifsacl
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260829/202608290428.i4YYJqod-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 52774473867e49b5891ab9381accf4e5a3ce0024)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260829/202608290428.i4YYJqod-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608290428.i4YYJqod-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/cifs/cifsacl.c:835:19: warning: variable 'end_of_dacl' set but not used [-Wunused-but-set-variable]
     835 |         char *acl_base, *end_of_dacl;
         |                          ^
   1 warning generated.


vim +/end_of_dacl +835 fs/cifs/cifsacl.c

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
