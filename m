Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50BF28468E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 06:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771310484; cv=none; b=AC5RqzGRrh8vz0ReFDoxzGKLkMl/1BRdtFrU1aEqZF1i6AzpOlEv49/h3CSD6cg9pi5uVCW+M/eNNfxEXoQJrwtvxRrqx5vTqQ5OiFX09Xfducf2MBtmZG2sBRWBogZYzWWeGvuky2DnXiSUaQmCiypZ8iozh0WnVfOQ1nrEGjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771310484; c=relaxed/simple;
	bh=VAr67/p7fgq9Ae3Q89TMaCl5KBkwJaorRYkVJG/azJc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZoyHf5N41VLvJw++uQzGDUcUiUua9gvN+DuEtwEL8Wn5nfNOh4Kmp2Ifd+q6am24T3oawJ70YnilwfMOLYzkbMW7dh3yY5rnQASQTQzPgeaQv7njYP9PgUEa9y6C+pc8MEKfN3cAJiW9uaeMfoQi44lmS1zvPR7J/gkNMfDzKtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dXsd+jQ8; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dXsd+jQ8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771310482; x=1802846482;
  h=date:from:to:cc:subject:message-id;
  bh=VAr67/p7fgq9Ae3Q89TMaCl5KBkwJaorRYkVJG/azJc=;
  b=dXsd+jQ8kyJTKOOTalOijk00iu++4SFLCIkuRcIml8goKq9TXFMx2BVi
   v5C4Xvw//Jm6dtOAvuxM0FPlPznynpobLdgSXcyvRqB979MkU54JY3ANI
   fbSyKnTW1pNXzRXNIfdX20I9SBXk1b0GqtepYBu+4x6mg2pl6BceovW6d
   nlBXuLdBO/j6u1TApvgohhWUBZU0fzdTWMhEtvQjOSR3a8g4XAajZoaAA
   ZRRgowft4VotyKDgv1U+anUZCU1MdrknfvvDsumAYyOuajVViTnqqPITR
   s6AtW3PBiU7D/GOquAzPr2hF+v7Qh90/nc2XzLAzOvwj97WCdAfg1zXb5
   A==;
X-CSE-ConnectionGUID: s/doxMQ/Tnihfy768jOfeg==
X-CSE-MsgGUID: Lgs9kpanTamxXrnuDwEQfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="82704853"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="82704853"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 22:41:21 -0800
X-CSE-ConnectionGUID: 1GfN67RyRxaT0u4+B0oqgA==
X-CSE-MsgGUID: mqTV2iE/T+a7OOcr4ovG8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="217756388"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Feb 2026 22:41:21 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsElr-000000010hQ-07bF;
	Tue, 17 Feb 2026 06:41:19 +0000
Date: Tue, 17 Feb 2026 14:40:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 53/53]
 security/smack/smack_access.c:576: warning: Function parameter or struct
 member 'gfp' not described in 'smk_import_allocated_label'
Message-ID: <202602171407.9KxbmqkH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Konstantin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   590a98f7b9783af3a52d4213d1f276148be94b4e
commit: f0a9ef99fb3c4b4693d69ec97b1bd354b04a66bb [53/53] smack: fix bug: setting task label silently ignores input garbage
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20260217/202602171407.9KxbmqkH-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602171407.9KxbmqkH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602171407.9KxbmqkH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/smack/smack_access.c:576: warning: Function parameter or struct member 'gfp' not described in 'smk_import_allocated_label'
>> security/smack/smack_access.c:576: warning: expecting prototype for smk_import_valid_allocated_label(). Prototype was for smk_import_allocated_label() instead
>> security/smack/smack_access.c:643: warning: Function parameter or struct member 'label' not described in 'smk_import_valid_label'
>> security/smack/smack_access.c:643: warning: Function parameter or struct member 'label_len' not described in 'smk_import_valid_label'
>> security/smack/smack_access.c:643: warning: Function parameter or struct member 'gfp' not described in 'smk_import_valid_label'


vim +576 security/smack/smack_access.c

322dd63c7f9831 Casey Schaufler     2020-08-11  566  
0e94ae17c857b3 Jarkko Sakkinen     2011-10-18  567  /**
f0a9ef99fb3c4b Konstantin Andreev  2025-06-17  568   * smk_import_valid_allocated_label - import a label, return the list entry
f0a9ef99fb3c4b Konstantin Andreev  2025-06-17  569   * @smack: a text string that is a valid Smack label and may be kfree()ed.
f0a9ef99fb3c4b Konstantin Andreev  2025-06-17  570   *         It is consumed: either becomes a part of the entry or kfree'ed.
0e94ae17c857b3 Jarkko Sakkinen     2011-10-18  571   *
f0a9ef99fb3c4b Konstantin Andreev  2025-06-17  572   * Returns: see description of smk_import_entry()
0e94ae17c857b3 Jarkko Sakkinen     2011-10-18  573   */
f0a9ef99fb3c4b Konstantin Andreev  2025-06-17  574  static struct smack_known *
f0a9ef99fb3c4b Konstantin Andreev  2025-06-17  575  smk_import_allocated_label(char *smack, gfp_t gfp)
0e94ae17c857b3 Jarkko Sakkinen     2011-10-18 @576  {
0e94ae17c857b3 Jarkko Sakkinen     2011-10-18  577  	struct smack_known *skp;
f7112e6c9abf1c Casey Schaufler     2012-05-06  578  	int rc;
e114e473771c84 Casey Schaufler     2008-02-04  579  
e114e473771c84 Casey Schaufler     2008-02-04  580  	mutex_lock(&smack_known_lock);
e114e473771c84 Casey Schaufler     2008-02-04  581  
272cd7a8c67dd4 Casey Schaufler     2011-09-20  582  	skp = smk_find_entry(smack);
f7112e6c9abf1c Casey Schaufler     2012-05-06  583  	if (skp != NULL)
f7112e6c9abf1c Casey Schaufler     2012-05-06  584  		goto freeout;
e114e473771c84 Casey Schaufler     2008-02-04  585  
f0a9ef99fb3c4b Konstantin Andreev  2025-06-17  586  	skp = kzalloc(sizeof(*skp), gfp);
e774ad683f425a Lukasz Pawelczyk    2015-04-20  587  	if (skp == NULL) {
e774ad683f425a Lukasz Pawelczyk    2015-04-20  588  		skp = ERR_PTR(-ENOMEM);
f7112e6c9abf1c Casey Schaufler     2012-05-06  589  		goto freeout;
e774ad683f425a Lukasz Pawelczyk    2015-04-20  590  	}
f7112e6c9abf1c Casey Schaufler     2012-05-06  591  
f7112e6c9abf1c Casey Schaufler     2012-05-06  592  	skp->smk_known = smack;
e114e473771c84 Casey Schaufler     2008-02-04  593  	skp->smk_secid = smack_next_secid++;
f7112e6c9abf1c Casey Schaufler     2012-05-06  594  
322dd63c7f9831 Casey Schaufler     2020-08-11  595  	rc = smack_populate_secattr(skp);
f7112e6c9abf1c Casey Schaufler     2012-05-06  596  	if (rc >= 0) {
272cd7a8c67dd4 Casey Schaufler     2011-09-20  597  		INIT_LIST_HEAD(&skp->smk_rules);
272cd7a8c67dd4 Casey Schaufler     2011-09-20  598  		mutex_init(&skp->smk_rules_lock);
e114e473771c84 Casey Schaufler     2008-02-04  599  		/*
e114e473771c84 Casey Schaufler     2008-02-04  600  		 * Make sure that the entry is actually
e114e473771c84 Casey Schaufler     2008-02-04  601  		 * filled before putting it on the list.
e114e473771c84 Casey Schaufler     2008-02-04  602  		 */
4d7cf4a1f49f76 Tomasz Stanislawski 2013-06-11  603  		smk_insert_entry(skp);
f7112e6c9abf1c Casey Schaufler     2012-05-06  604  		goto unlockout;
e114e473771c84 Casey Schaufler     2008-02-04  605  	}
f7112e6c9abf1c Casey Schaufler     2012-05-06  606  	kfree(skp);
e774ad683f425a Lukasz Pawelczyk    2015-04-20  607  	skp = ERR_PTR(rc);
f7112e6c9abf1c Casey Schaufler     2012-05-06  608  freeout:
f7112e6c9abf1c Casey Schaufler     2012-05-06  609  	kfree(smack);
f7112e6c9abf1c Casey Schaufler     2012-05-06  610  unlockout:
e114e473771c84 Casey Schaufler     2008-02-04  611  	mutex_unlock(&smack_known_lock);
e114e473771c84 Casey Schaufler     2008-02-04  612  
e114e473771c84 Casey Schaufler     2008-02-04  613  	return skp;
e114e473771c84 Casey Schaufler     2008-02-04  614  }
e114e473771c84 Casey Schaufler     2008-02-04  615  
f0a9ef99fb3c4b Konstantin Andreev  2025-06-17  616  /**
f0a9ef99fb3c4b Konstantin Andreev  2025-06-17  617   * smk_import_entry - import a label, return the list entry
f0a9ef99fb3c4b Konstantin Andreev  2025-06-17  618   * @string: a text string that might contain a Smack label at the beginning
f0a9ef99fb3c4b Konstantin Andreev  2025-06-17  619   * @len: the maximum size to look into, may be zero if string is null-terminated
f0a9ef99fb3c4b Konstantin Andreev  2025-06-17  620   *
f0a9ef99fb3c4b Konstantin Andreev  2025-06-17  621   * Returns a pointer to the entry in the label list that
f0a9ef99fb3c4b Konstantin Andreev  2025-06-17  622   * matches the passed string, adding it if necessary,
f0a9ef99fb3c4b Konstantin Andreev  2025-06-17  623   * or an error code.
f0a9ef99fb3c4b Konstantin Andreev  2025-06-17  624   */
f0a9ef99fb3c4b Konstantin Andreev  2025-06-17  625  struct smack_known *smk_import_entry(const char *string, int len)
f0a9ef99fb3c4b Konstantin Andreev  2025-06-17  626  {
f0a9ef99fb3c4b Konstantin Andreev  2025-06-17  627  	char *smack = smk_parse_smack(string, len);
f0a9ef99fb3c4b Konstantin Andreev  2025-06-17  628  
f0a9ef99fb3c4b Konstantin Andreev  2025-06-17  629  	if (IS_ERR(smack))
f0a9ef99fb3c4b Konstantin Andreev  2025-06-17  630  		return ERR_CAST(smack);
f0a9ef99fb3c4b Konstantin Andreev  2025-06-17  631  
f0a9ef99fb3c4b Konstantin Andreev  2025-06-17  632  	return smk_import_allocated_label(smack, GFP_NOFS);
f0a9ef99fb3c4b Konstantin Andreev  2025-06-17  633  }
f0a9ef99fb3c4b Konstantin Andreev  2025-06-17  634  
f0a9ef99fb3c4b Konstantin Andreev  2025-06-17  635  /**
f0a9ef99fb3c4b Konstantin Andreev  2025-06-17  636   * smk_import_valid_label - import a label, return the list entry
f0a9ef99fb3c4b Konstantin Andreev  2025-06-17  637   * @label a text string that is a valid Smack label, not null-terminated
f0a9ef99fb3c4b Konstantin Andreev  2025-06-17  638   *
f0a9ef99fb3c4b Konstantin Andreev  2025-06-17  639   * Returns: see description of smk_import_entry()
f0a9ef99fb3c4b Konstantin Andreev  2025-06-17  640   */
f0a9ef99fb3c4b Konstantin Andreev  2025-06-17  641  struct smack_known *
f0a9ef99fb3c4b Konstantin Andreev  2025-06-17  642  smk_import_valid_label(const char *label, int label_len, gfp_t gfp)
f0a9ef99fb3c4b Konstantin Andreev  2025-06-17 @643  {
f0a9ef99fb3c4b Konstantin Andreev  2025-06-17  644  	char *smack = kstrndup(label, label_len, gfp);
f0a9ef99fb3c4b Konstantin Andreev  2025-06-17  645  
f0a9ef99fb3c4b Konstantin Andreev  2025-06-17  646  	if  (!smack)
f0a9ef99fb3c4b Konstantin Andreev  2025-06-17  647  		return ERR_PTR(-ENOMEM);
f0a9ef99fb3c4b Konstantin Andreev  2025-06-17  648  
f0a9ef99fb3c4b Konstantin Andreev  2025-06-17  649  	return smk_import_allocated_label(smack, gfp);
f0a9ef99fb3c4b Konstantin Andreev  2025-06-17  650  }
f0a9ef99fb3c4b Konstantin Andreev  2025-06-17  651  

:::::: The code at line 576 was first introduced by commit
:::::: 0e94ae17c857b3835a2b8ea46ce44b5da4e2cc5d Smack: allow to access /smack/access as normal user

:::::: TO: Jarkko Sakkinen <jarkko.j.sakkinen@gmail.com>
:::::: CC: Casey Schaufler <cschaufler@cschaufler-intel.(none)>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
