Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0051A0B0E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Sep 2024 20:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727726736; cv=none; b=EyqQjCffj13u6ueBgr3UPZqmMudTxvCpNnGOSnd5lfWnVV6jMO3CSZ0H3L3Rgqfsd1ig00lJNEX+sU9yyTZ2GCi+t4/+hejfAhm6CKxJnLgtYsY//jsZPnZ7jPsfI4PDSs5SMysJ+w5zwmnHW619kDBcZh1McJIO+xbx52GHxnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727726736; c=relaxed/simple;
	bh=SCCXwH3bnjAffbdDwgUOdHtTq3r0NFben7o48e4HXNA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fObiBal4tWAlvxfWY/xozNqP2asYGp4/x5wmxHCjorzpg+zQC9r9kXlwjcjBfvhEuR3DacM6JuvOhBvSiuPpMs4QHF1Jp95+rg23aJEoBvDjiUmtov/xPJeShpMSSC/x2vFABVOT1jIJjXuVHcF8KuajtunaANB2IVW3uWc7K/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XHxvHGbw; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XHxvHGbw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727726734; x=1759262734;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SCCXwH3bnjAffbdDwgUOdHtTq3r0NFben7o48e4HXNA=;
  b=XHxvHGbwTEyD/Zp49BX7Zxn76/soI6lSWSyHCUTKGmAlwaYObQxqaUEA
   btpkz5jNkM9SAkg1iqKrPf2FXZjQOfaFioiVVZEPeez13PCnhFK1hfM+S
   I1jyXiS3xiIeWGiilZYXjfr9MWyrhFFsx3nA8uFHpGj2UPylpIJXrVz5Y
   S+4Eca6rKgE0JtW6ho8QW4TpOgB7msbfN8fhxg15Uxjo5Hbp3kajc0XKE
   AOscLM3gchikTj1SESPJVkQ07vySbBnm8p/vAcDh5jhaWyS/+AO3/XHsZ
   zjXXCdqunpQis6EYzyahvFDNnhXOrF9gYZKi9ax5EDDmkHKL2Gq+tB+WX
   Q==;
X-CSE-ConnectionGUID: aU8Ipg36ROOhKs4BIZhDPw==
X-CSE-MsgGUID: TOHSHlzUSparhj2u+oK0Kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="37423310"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; 
   d="scan'208";a="37423310"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 13:05:33 -0700
X-CSE-ConnectionGUID: WTd7uLv6S9WKjMA9/EjYCg==
X-CSE-MsgGUID: zNdqWDaUQ8aVBnFA7Fgk9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; 
   d="scan'208";a="96757673"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 30 Sep 2024 13:05:32 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svMe9-000Ppp-2k;
	Mon, 30 Sep 2024 20:05:29 +0000
Date: Tue, 1 Oct 2024 04:05:18 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Eric Sandeen <sandeen@redhat.com>
Subject: [brauner-vfs:vfs.all 49/66] fs/ubifs/super.c:1027: warning: Function
 parameter or struct member 'fc' not described in 'ubifs_parse_param'
Message-ID: <202410010459.w0x6Xbow-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
head:   26051352211fdfa19abdc9c2b607cd5366a1aa25
commit: 1c2c32657955b6ad43cec086b31f5ec598232bee [49/66] ubifs: Convert ubifs to use the new mount API
config: i386-buildonly-randconfig-002-20241001 (https://download.01.org/0day-ci/archive/20241001/202410010459.w0x6Xbow-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241001/202410010459.w0x6Xbow-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410010459.w0x6Xbow-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ubifs/super.c:1027: warning: Function parameter or struct member 'fc' not described in 'ubifs_parse_param'
>> fs/ubifs/super.c:1027: warning: Function parameter or struct member 'param' not described in 'ubifs_parse_param'
>> fs/ubifs/super.c:1027: warning: Excess function parameter 'c' description in 'ubifs_parse_param'
>> fs/ubifs/super.c:1027: warning: Excess function parameter 'options' description in 'ubifs_parse_param'
>> fs/ubifs/super.c:1027: warning: Excess function parameter 'is_remount' description in 'ubifs_parse_param'


vim +1027 fs/ubifs/super.c

8379ea31e991ed Artem Bityutskiy   2009-05-29  1016  
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1017  /**
1c2c32657955b6 David Howells      2024-09-26  1018   * ubifs_parse_param - parse a parameter.
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1019   * @c: UBIFS file-system description object
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1020   * @options: parameters to parse
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1021   * @is_remount: non-zero if this is FS re-mount
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1022   *
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1023   * This function parses UBIFS mount options and returns zero in case success
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1024   * and a negative error code in case of failure.
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1025   */
1c2c32657955b6 David Howells      2024-09-26  1026  static int ubifs_parse_param(struct fs_context *fc, struct fs_parameter *param)
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14 @1027  {
1c2c32657955b6 David Howells      2024-09-26  1028  	struct ubifs_info *c = fc->s_fs_info;
1c2c32657955b6 David Howells      2024-09-26  1029  	struct fs_parse_result result;
1c2c32657955b6 David Howells      2024-09-26  1030  	bool is_remount = (fc->purpose & FS_CONTEXT_FOR_RECONFIGURE);
1c2c32657955b6 David Howells      2024-09-26  1031  	int opt;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1032  
1c2c32657955b6 David Howells      2024-09-26  1033  	opt = fs_parse(fc, ubifs_fs_param_spec, param, &result);
1c2c32657955b6 David Howells      2024-09-26  1034  	if (opt < 0)
1c2c32657955b6 David Howells      2024-09-26  1035  		return opt;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1036  
1c2c32657955b6 David Howells      2024-09-26  1037  	switch (opt) {
27ad2799331331 Artem Bityutskiy   2009-01-29  1038  		/*
27ad2799331331 Artem Bityutskiy   2009-01-29  1039  		 * %Opt_fast_unmount and %Opt_norm_unmount options are ignored.
cb54ef8b1304fe Artem Bityutskiy   2009-06-23  1040  		 * We accept them in order to be backward-compatible. But this
27ad2799331331 Artem Bityutskiy   2009-01-29  1041  		 * should be removed at some point.
27ad2799331331 Artem Bityutskiy   2009-01-29  1042  		 */
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1043  	case Opt_fast_unmount:
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1044  		c->mount_opts.unmount_mode = 2;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1045  		break;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1046  	case Opt_norm_unmount:
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1047  		c->mount_opts.unmount_mode = 1;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1048  		break;
4793e7c5e1c883 Adrian Hunter      2008-09-02  1049  	case Opt_bulk_read:
4793e7c5e1c883 Adrian Hunter      2008-09-02  1050  		c->mount_opts.bulk_read = 2;
4793e7c5e1c883 Adrian Hunter      2008-09-02  1051  		c->bulk_read = 1;
4793e7c5e1c883 Adrian Hunter      2008-09-02  1052  		break;
4793e7c5e1c883 Adrian Hunter      2008-09-02  1053  	case Opt_no_bulk_read:
4793e7c5e1c883 Adrian Hunter      2008-09-02  1054  		c->mount_opts.bulk_read = 1;
4793e7c5e1c883 Adrian Hunter      2008-09-02  1055  		c->bulk_read = 0;
4793e7c5e1c883 Adrian Hunter      2008-09-02  1056  		break;
2953e73f1ce4b3 Adrian Hunter      2008-09-04  1057  	case Opt_chk_data_crc:
2953e73f1ce4b3 Adrian Hunter      2008-09-04  1058  		c->mount_opts.chk_data_crc = 2;
2953e73f1ce4b3 Adrian Hunter      2008-09-04  1059  		c->no_chk_data_crc = 0;
2953e73f1ce4b3 Adrian Hunter      2008-09-04  1060  		break;
2953e73f1ce4b3 Adrian Hunter      2008-09-04  1061  	case Opt_no_chk_data_crc:
2953e73f1ce4b3 Adrian Hunter      2008-09-04  1062  		c->mount_opts.chk_data_crc = 1;
2953e73f1ce4b3 Adrian Hunter      2008-09-04  1063  		c->no_chk_data_crc = 1;
2953e73f1ce4b3 Adrian Hunter      2008-09-04  1064  		break;
1c2c32657955b6 David Howells      2024-09-26  1065  	case Opt_compr:
1c2c32657955b6 David Howells      2024-09-26  1066  		c->mount_opts.compr_type = result.uint_32;
553dea4dd53156 Artem Bityutskiy   2008-11-01  1067  		c->mount_opts.override_compr = 1;
553dea4dd53156 Artem Bityutskiy   2008-11-01  1068  		c->default_compr = c->mount_opts.compr_type;
553dea4dd53156 Artem Bityutskiy   2008-11-01  1069  		break;
c38c5a7f2e5056 Richard Weinberger 2018-07-12  1070  	case Opt_assert:
1c2c32657955b6 David Howells      2024-09-26  1071  		c->assert_action = result.uint_32;
c38c5a7f2e5056 Richard Weinberger 2018-07-12  1072  		break;
d8a22773a12c6d Sascha Hauer       2018-09-07  1073  	case Opt_auth_key:
bb674a4d4de103 Zhihao Cheng       2020-09-29  1074  		if (!is_remount) {
1c2c32657955b6 David Howells      2024-09-26  1075  			kfree(c->auth_key_name);
1c2c32657955b6 David Howells      2024-09-26  1076  			c->auth_key_name = param->string;
1c2c32657955b6 David Howells      2024-09-26  1077  			param->string = NULL;
bb674a4d4de103 Zhihao Cheng       2020-09-29  1078  		}
d8a22773a12c6d Sascha Hauer       2018-09-07  1079  		break;
d8a22773a12c6d Sascha Hauer       2018-09-07  1080  	case Opt_auth_hash_name:
bb674a4d4de103 Zhihao Cheng       2020-09-29  1081  		if (!is_remount) {
1c2c32657955b6 David Howells      2024-09-26  1082  			kfree(c->auth_hash_name);
1c2c32657955b6 David Howells      2024-09-26  1083  			c->auth_hash_name = param->string;
1c2c32657955b6 David Howells      2024-09-26  1084  			param->string = NULL;
bb674a4d4de103 Zhihao Cheng       2020-09-29  1085  		}
d8a22773a12c6d Sascha Hauer       2018-09-07  1086  		break;
319c1042749862 Rabin Vincent      2017-05-31  1087  	case Opt_ignore:
319c1042749862 Rabin Vincent      2017-05-31  1088  		break;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1089  	}
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1090  
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1091  	return 0;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1092  }
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1093  

:::::: The code at line 1027 was first introduced by commit
:::::: 1e51764a3c2ac05a23a22b2a95ddee4d9bffb16d UBIFS: add new flash file system

:::::: TO: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
:::::: CC: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
