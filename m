Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD1F499F1E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 17:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786640956; cv=none; b=FdUm1VrjSsO9twC0F3XJgQrhqf9aZSyYbUoCd1DgS9LKlES/QKGGmEmddhKdGiYJyl89rUw/PwiUc11tTlah+Zj5tlXOQNQwRtlO4188fR5rT0pRYV7mWltTiG9GA1jAgB2AQ97w8SX0oiEcmF2JMh3JDxXJyA94QyuoocCTJsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786640956; c=relaxed/simple;
	bh=C3gaqcWIjrHBpy/9u3sW58x56fDfDebm1SzjYUupUKY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ei6Edtjqvmob8IIVjVl9w23cVQUKlA94YEp5DK8kj8F0QYJICUuVbwk59bF5Ooi7IFMxvhl5JE5rPliWpFKfaeYJRIJoJtRaxpLzoPsW6I3CSu+qr9Cr1slckbXvTEZ/bl2MCwG8mmdGmrxba7yAAfALeu3vKc3OXUEVhUyAggM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=an43dkkb; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="an43dkkb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786640953; x=1818176953;
  h=date:from:to:cc:subject:message-id;
  bh=C3gaqcWIjrHBpy/9u3sW58x56fDfDebm1SzjYUupUKY=;
  b=an43dkkbxXjCeVlyRQatOt5IfOvMCGl8rz9IYDwdKSGKaubWL33107/q
   OFA5FE3231h53qMSo3EaiNi1CCIJ2koll8stF9HsVn27mOsfuAhYVa1I4
   dM8GkGQpLKSwedeGxgSFBGP9+ZM70OKVP7vA14OaGJDkfCLy/XRL8QfJv
   0Ryh+cdJRmuNmecZaI7isWNSzMMedIdqpkUAP+KnU6/02KjvM+eI2z0NI
   BIkhy8WklPpa5f+NA7+cO8yKxAv9FmXtYfxWZaOgbzEcnt/RvaUItbyYy
   ccdkBCvsS/hj6zaZ/lEDCE0IBfDOnPMEFaqb6jaTpnMd06x1tlIIpdrJD
   w==;
X-CSE-ConnectionGUID: zyMrYDfeSr2lnQWEtYjZEA==
X-CSE-MsgGUID: 81wsjR2BQSuZcTRInrChdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="104753491"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="104753491"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 10:09:11 -0700
X-CSE-ConnectionGUID: NI7XNhRsSe2qNZVAHONVCQ==
X-CSE-MsgGUID: i6pVBrQXQCC1MfdYqwy3+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="262246938"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 Aug 2026 10:09:08 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuYvR-00000000Vwo-1SSa;
	Thu, 13 Aug 2026 17:09:05 +0000
Date: Fri, 14 Aug 2026 01:08:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:main-16k-gs-shusky-5.15 36/36]
 fs/ksmbd/misc.c:162: warning: Excess function parameter 'sharepath'
 description in 'convert_to_nt_pathname'
Message-ID: <202608140153.sOW7LWfR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Hyunchul,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common main-16k-gs-shusky-5.15
head:   3b83adad5dbcce249f6042cc64bf4ae9fddf5262
commit: 265fd1991c1db85fbabaad4946ca0e63e2ae688d [36/36] ksmbd: use LOOKUP_BENEATH to prevent the out of share access
config: i386-buildonly-randconfig-004-20260813 (https://download.01.org/0day-ci/archive/20260814/202608140153.sOW7LWfR-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260814/202608140153.sOW7LWfR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 265fd1991c1d ("ksmbd: use LOOKUP_BENEATH to prevent the out of share access")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608140153.sOW7LWfR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/ksmbd/misc.c:30: warning: Function parameter or member 'str' not described in 'match_pattern'
   fs/ksmbd/misc.c:30: warning: Excess function parameter 'string' description in 'match_pattern'
>> fs/ksmbd/misc.c:162: warning: Excess function parameter 'sharepath' description in 'convert_to_nt_pathname'
   fs/ksmbd/misc.c:240: warning: Function parameter or member 'share' not described in 'convert_to_unix_name'
   fs/ksmbd/misc.c:240: warning: Function parameter or member 'name' not described in 'convert_to_unix_name'
   fs/ksmbd/misc.c:240: warning: Excess function parameter 'path' description in 'convert_to_unix_name'
   fs/ksmbd/misc.c:240: warning: Excess function parameter 'tid' description in 'convert_to_unix_name'


vim +162 fs/ksmbd/misc.c

e2f34481b24db2 fs/cifsd/misc.c Namjae Jeon  2021-03-16  151  
e2f34481b24db2 fs/cifsd/misc.c Namjae Jeon  2021-03-16  152  /**
e2f34481b24db2 fs/cifsd/misc.c Namjae Jeon  2021-03-16  153   * convert_to_nt_pathname() - extract and return windows path string
e2f34481b24db2 fs/cifsd/misc.c Namjae Jeon  2021-03-16  154   *      whose share directory prefix was removed from file path
e2f34481b24db2 fs/cifsd/misc.c Namjae Jeon  2021-03-16  155   * @filename : unix filename
e2f34481b24db2 fs/cifsd/misc.c Namjae Jeon  2021-03-16  156   * @sharepath: share path string
e2f34481b24db2 fs/cifsd/misc.c Namjae Jeon  2021-03-16  157   *
e2f34481b24db2 fs/cifsd/misc.c Namjae Jeon  2021-03-16  158   * Return : windows path string or error
e2f34481b24db2 fs/cifsd/misc.c Namjae Jeon  2021-03-16  159   */
e2f34481b24db2 fs/cifsd/misc.c Namjae Jeon  2021-03-16  160  
265fd1991c1db8 fs/ksmbd/misc.c Hyunchul Lee 2021-09-25  161  char *convert_to_nt_pathname(char *filename)
e2f34481b24db2 fs/cifsd/misc.c Namjae Jeon  2021-03-16 @162  {
e2f34481b24db2 fs/cifsd/misc.c Namjae Jeon  2021-03-16  163  	char *ab_pathname;
e2f34481b24db2 fs/cifsd/misc.c Namjae Jeon  2021-03-16  164  
265fd1991c1db8 fs/ksmbd/misc.c Hyunchul Lee 2021-09-25  165  	if (strlen(filename) == 0) {
265fd1991c1db8 fs/ksmbd/misc.c Hyunchul Lee 2021-09-25  166  		ab_pathname = kmalloc(2, GFP_KERNEL);
e2f34481b24db2 fs/cifsd/misc.c Namjae Jeon  2021-03-16  167  		ab_pathname[0] = '\\';
e2f34481b24db2 fs/cifsd/misc.c Namjae Jeon  2021-03-16  168  		ab_pathname[1] = '\0';
265fd1991c1db8 fs/ksmbd/misc.c Hyunchul Lee 2021-09-25  169  	} else {
265fd1991c1db8 fs/ksmbd/misc.c Hyunchul Lee 2021-09-25  170  		ab_pathname = kstrdup(filename, GFP_KERNEL);
265fd1991c1db8 fs/ksmbd/misc.c Hyunchul Lee 2021-09-25  171  		if (!ab_pathname)
265fd1991c1db8 fs/ksmbd/misc.c Hyunchul Lee 2021-09-25  172  			return NULL;
e2f34481b24db2 fs/cifsd/misc.c Namjae Jeon  2021-03-16  173  
e2f34481b24db2 fs/cifsd/misc.c Namjae Jeon  2021-03-16  174  		ksmbd_conv_path_to_windows(ab_pathname);
e2f34481b24db2 fs/cifsd/misc.c Namjae Jeon  2021-03-16  175  	}
e2f34481b24db2 fs/cifsd/misc.c Namjae Jeon  2021-03-16  176  	return ab_pathname;
e2f34481b24db2 fs/cifsd/misc.c Namjae Jeon  2021-03-16  177  }
e2f34481b24db2 fs/cifsd/misc.c Namjae Jeon  2021-03-16  178  

:::::: The code at line 162 was first introduced by commit
:::::: e2f34481b24db2fd634b5edb0a5bd0e4d38cc6e9 cifsd: add server-side procedures for SMB3

:::::: TO: Namjae Jeon <namjae.jeon@samsung.com>
:::::: CC: Steve French <stfrench@microsoft.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
