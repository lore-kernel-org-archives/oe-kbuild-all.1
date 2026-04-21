Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C4A376BD3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Apr 2026 16:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776788665; cv=none; b=cY/2l4Eb7h3X6jYLRPtZfiQsx67r8Hd6TGWYjQ40p1k9lXgE5PYzX8MDbYkAdNBA38tlKiRdYfavbu9MXD9x87kM49XSFGSdY8WgMlAZ52QFTvbX4BCASjv/gjifsZnCUTIf+oDrlgV9EDd5sZHHJvUVEwpDYxk9Lj/TQGTq9Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776788665; c=relaxed/simple;
	bh=ODVknP/g8sBwUfv3+vhEjixnO0RShjifNndcvURhcL0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=osKTSIwXNZpm5sxae+tG6o972jR5vya1cpr45VUSjmwiNH1wUyC3SrU0W5hfFVESY7e2N42rzSkq+WkXcT7O+3BziVIKvS9e48KsD1ZNnTXf3A7Pv9BKyiFl8khc7Oh2BZzLlE851ncdTpjJk+GNCjOaNcc01ml+PdRpr3BLyAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GN3tZ916; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GN3tZ916"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776788664; x=1808324664;
  h=date:from:to:cc:subject:message-id;
  bh=ODVknP/g8sBwUfv3+vhEjixnO0RShjifNndcvURhcL0=;
  b=GN3tZ916+TiJqfU/GwQaBDFoNg1G4C+V/RgyUtMfv7QUciCo4ZBBeeA0
   +X1efFdAuCmrIgaDCyioD2Dm4BoTgyVyIX0zFNZdT0+OJTMr4hMO9Jmb0
   Bnsh9FuoWYSoJfG4fXM2A+DKVQjdrzhaKDuEm68CPkDK4+Gud0nqEzX6e
   zTxhoWqkCvh82szycb7VrcMFpU3yaR0iFSUIKO+qe8q7VBYyIN3oCVcHb
   zOjOVCFZq1LQQG1Bt5wMtap6TXRiGiVZTDIchhujzaV76Gptx2wFuyDNb
   /57hDXRTQqAy8vhto3mrwWvujCnuex3hz6BnE3aau0CZStGdgaxAubBHM
   A==;
X-CSE-ConnectionGUID: SE8HeTDfQDGOO3gICHOHHQ==
X-CSE-MsgGUID: cguZkcZuQEKdV2rxWuDzkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="88427196"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="88427196"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 09:24:24 -0700
X-CSE-ConnectionGUID: hCyhUHZYTF2wjNDGyPJxDA==
X-CSE-MsgGUID: 8oyO8AH/RIW8wCBNRFA/8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="237059156"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 21 Apr 2026 09:24:22 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFDtb-000000003kk-3LJD;
	Tue, 21 Apr 2026 16:24:19 +0000
Date: Wed, 22 Apr 2026 00:24:08 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Bommarito <michael.bommarito@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Steve French <stfrench@microsoft.com>
Subject: [linux-next:master 14127/14297]
 fs/smb/client/cifsacl.c:839:26: warning: variable 'end_of_dacl' set but not
 used
Message-ID: <202604220046.tGkRxVtS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bee6ea30c48788e18348309f891ed8afbf7702ac
commit: 149822e5541c7e9c1b4445ef94b6f7c0401ce88e [14127/14297] smb: client: validate the whole DACL before rewriting it in cifsacl
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260422/202604220046.tGkRxVtS-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260422/202604220046.tGkRxVtS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604220046.tGkRxVtS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/smb/client/cifsacl.c: In function 'parse_dacl':
>> fs/smb/client/cifsacl.c:839:26: warning: variable 'end_of_dacl' set but not used [-Wunused-but-set-variable]
     839 |         char *acl_base, *end_of_dacl;
         |                          ^~~~~~~~~~~


vim +/end_of_dacl +839 fs/smb/client/cifsacl.c

   831	
   832	static void parse_dacl(struct smb_acl *pdacl, char *end_of_acl,
   833			       struct smb_sid *pownersid, struct smb_sid *pgrpsid,
   834			       struct cifs_fattr *fattr, bool mode_from_special_sid)
   835	{
   836		int i;
   837		u16 num_aces = 0;
   838		int acl_size;
 > 839		char *acl_base, *end_of_dacl;
   840		struct smb_ace **ppace;
   841	
   842		/* BB need to add parm so we can store the SID BB */
   843	
   844		if (!pdacl) {
   845			/* no DACL in the security descriptor, set
   846			   all the permissions for user/group/other */
   847			fattr->cf_mode |= 0777;
   848			return;
   849		}
   850	
   851		if (validate_dacl(pdacl, end_of_acl))
   852			return;
   853	
   854		cifs_dbg(NOISY, "DACL revision %d size %d num aces %d\n",
   855			 le16_to_cpu(pdacl->revision), le16_to_cpu(pdacl->size),
   856			 le16_to_cpu(pdacl->num_aces));
   857	
   858		/* reset rwx permissions for user/group/other.
   859		   Also, if num_aces is 0 i.e. DACL has no ACEs,
   860		   user/group/other have no permissions */
   861		fattr->cf_mode &= ~(0777);
   862	
   863		end_of_dacl = (char *)pdacl + le16_to_cpu(pdacl->size);
   864		acl_base = (char *)pdacl;
   865		acl_size = sizeof(struct smb_acl);
   866	
   867		num_aces = le16_to_cpu(pdacl->num_aces);
   868		if (num_aces > 0) {
   869			umode_t denied_mode = 0;
   870	
   871			ppace = kmalloc_objs(struct smb_ace *, num_aces);
   872			if (!ppace)
   873				return;
   874	
   875			for (i = 0; i < num_aces; ++i) {
   876				ppace[i] = (struct smb_ace *) (acl_base + acl_size);
   877	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
