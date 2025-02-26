Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F66C221D8E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Feb 2025 15:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740582506; cv=none; b=UNAcS9u6iwckZHxJgNufBxn47mxUPDXrYPQx3tkWRa7r52Rc5wfhbuderx42IWPqZffcXTsU44fWyYcAMnzwTMYLcoAKqYMrJLRhAC26vjgLGfOnTuZ5MHiCU1y0atLaqZbjMxnfNK8Av+OBbr0/biSU0vlIAdVEaxGFe3UiE/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740582506; c=relaxed/simple;
	bh=dquW1CRkHxUf9858+uZH9ZEns6kHNXc/+hyfXAFNNBo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O9woLXTqFX9mu6AuhtCegZUAjyJmsFno6kgt/z+a0gWpAmdQO2xKbzDFxSHCib7fPTBx3HChd54YKPeFEslqJNKh1fSBcgQwG9KRDBDmNzTkQn4K/kisysiWO52DDY3w9bKW8ecEdAKlh1eLdIY8/7l1SJUTk/NFpYOMlaqU2w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kGjgx5ID; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kGjgx5ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740582505; x=1772118505;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dquW1CRkHxUf9858+uZH9ZEns6kHNXc/+hyfXAFNNBo=;
  b=kGjgx5IDERg3mPbAqv06G3uF0B1UTdKqU8MiVr19Yy1AnLFE0b5Sc8aE
   L/ViZZOiQjLayXq6DSfCEfHHrgLEj0P3Bw23/u6LLxWOXdmtuN9j6h11/
   9GPslLUCQH3X+pTqakx3qMmE1EFg47ENIHhttGLxK6yhcg3+c9Jrc6ciD
   WTqN22FMfoPF8Nr5nJCfBIEK81RdumgKEU+B5zfkdaefb3wEtoI/0lbKY
   cYbD1PpSw3p0uSXi0ikYy2Umeiwg7PX07SuZisAdZzrH6i+reY7zkJNUI
   ig1OR3/EL9K/aS4lXEIInTKMJU2y9tMX6fyIfSjTAUQtCv/Ckf7O7/Uh/
   Q==;
X-CSE-ConnectionGUID: AH8l/iomQgKq71tqPnz+zQ==
X-CSE-MsgGUID: srLUSJOxQ5iFVzBsOOBRMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="52070926"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="52070926"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 07:08:09 -0800
X-CSE-ConnectionGUID: VuemhsurRui6ldHwxby8Tw==
X-CSE-MsgGUID: 3N94XQBAR1mjWtity0wuFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="117354442"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 26 Feb 2025 07:08:08 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnJ0l-000BrH-34;
	Wed, 26 Feb 2025 15:07:58 +0000
Date: Wed, 26 Feb 2025 23:07:04 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Sandeen <sandeen@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Jan Kara <jack@suse.cz>
Subject: [linux-next:master 5403/6583] fs/ext2/super.c:421:32: sparse:
 sparse: symbol 'ext2_param_spec' was not declared. Should it be static?
Message-ID: <202502262322.VgqxHPxD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8433c776e1eb1371f5cd40b5fd3a61f9c7b7f3ad
commit: eab61d3260d76b3e58888bd685734d0858f83aa3 [5403/6583] ext2: convert to the new mount API
config: alpha-randconfig-r112-20250226 (https://download.01.org/0day-ci/archive/20250226/202502262322.VgqxHPxD-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250226/202502262322.VgqxHPxD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502262322.VgqxHPxD-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/ext2/super.c:421:32: sparse: sparse: symbol 'ext2_param_spec' was not declared. Should it be static?

vim +/ext2_param_spec +421 fs/ext2/super.c

   420	
 > 421	const struct fs_parameter_spec ext2_param_spec[] = {
   422		fsparam_flag	("bsddf", Opt_bsd_df),
   423		fsparam_flag	("minixdf", Opt_minix_df),
   424		fsparam_flag	("grpid", Opt_grpid),
   425		fsparam_flag	("bsdgroups", Opt_grpid),
   426		fsparam_flag	("nogrpid", Opt_nogrpid),
   427		fsparam_flag	("sysvgroups", Opt_nogrpid),
   428		fsparam_gid	("resgid", Opt_resgid),
   429		fsparam_uid	("resuid", Opt_resuid),
   430		fsparam_u32	("sb", Opt_sb),
   431		fsparam_enum	("errors", Opt_errors, ext2_param_errors),
   432		fsparam_flag	("nouid32", Opt_nouid32),
   433		fsparam_flag	("debug", Opt_debug),
   434		fsparam_flag	("oldalloc", Opt_oldalloc),
   435		fsparam_flag	("orlov", Opt_orlov),
   436		fsparam_flag	("nobh", Opt_nobh),
   437		fsparam_flag_no	("user_xattr", Opt_user_xattr),
   438		fsparam_flag_no	("acl", Opt_acl),
   439		fsparam_flag	("xip", Opt_xip),
   440		fsparam_flag	("dax", Opt_dax),
   441		fsparam_flag	("grpquota", Opt_grpquota),
   442		fsparam_flag	("noquota", Opt_ignore),
   443		fsparam_flag	("quota", Opt_quota),
   444		fsparam_flag	("usrquota", Opt_usrquota),
   445		fsparam_flag_no	("reservation", Opt_reservation),
   446		{}
   447	};
   448	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
