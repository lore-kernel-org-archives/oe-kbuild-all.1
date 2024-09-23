Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9751CA84
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Sep 2024 20:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727121946; cv=none; b=mhlIvd03wa0e4ZminC/Um1sXLd/kbgWBYs+bc4o7FXU4WERD10gg55EKaWsUdqOQeuphhft81s5mZbhjcgMVsPwr8ksize3yqmzjCR2iZ2W+l4LKAnuHTsXy2aGIkAORp89SkDoT0MW8sn3J8qwJ4qNROgA/N7V8NtYiFvVrMzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727121946; c=relaxed/simple;
	bh=vYQLfq3+j5GZ6dy8/Mx3vR8HV1qDa6f2vwyWwx9K5zs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TML33t7gvY3N2HSAypwycweaT162x/YqE5MrNxYu24dyjZaw4FPE74n1/4KxVZ5A+brlQChbN5Acsk15BKqP9gGnECPZzN3wE1sk8gfY81oy+Lre//nkIKsawn33YWBMe2o4Xp7zYsto2pkD9X23hcd46dtR1xKvY1jkaKRaN1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a6avfF0G; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a6avfF0G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727121945; x=1758657945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vYQLfq3+j5GZ6dy8/Mx3vR8HV1qDa6f2vwyWwx9K5zs=;
  b=a6avfF0G06V9xns6empcb/aIIvqS2VzxeDEtdsVyCFpzGrvsDlNYnbbg
   90BmWD3QcUPI9+p2d15YzU7jq3RqXBeMXykBenXH6adSAUaxPWR04Xn7M
   weajuvNRca9vf+ahz1z+suymhP0VUBprTp/cga19ow91M/p4Pduc5X+Wz
   tkynaLdmMrwHdSbWY+CTpLktbSvHwq+7vfnRBf4z4BC/0s973GEp0QDTK
   WAdbnByLZGYIuM8RFAhlveGBGgZNIIOMs6HUtflPTrzY6KziP31c/jrSf
   E72MiQcPYefC1JDGq0WWI0wHiUN1OFWCVoAys2fzr9tpR5ij/mfIYmJ68
   g==;
X-CSE-ConnectionGUID: Dg0EtUEgQTqP04fAfqzTlA==
X-CSE-MsgGUID: V0vYX5PSR0+Us0DsjxRgSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="26183984"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; 
   d="scan'208";a="26183984"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 13:05:44 -0700
X-CSE-ConnectionGUID: H0FwaxYBRHGSszziuO8cUw==
X-CSE-MsgGUID: 4dMasNMCRfWFmhZuzk9Zmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; 
   d="scan'208";a="75946862"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 23 Sep 2024 13:05:42 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sspJU-000HZ9-1n;
	Mon, 23 Sep 2024 20:05:40 +0000
Date: Tue, 24 Sep 2024 04:04:55 +0800
From: kernel test robot <lkp@intel.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Steve French <stfrench@microsoft.com>
Subject: [samba-ksmbd:ksmbd-for-next-next 3/4] fs/smb/server/smb2pdu.c:2070:
 warning: Function parameter or struct member 'coptions' not described in
 'smb2_create_open_flags'
Message-ID: <202409240317.7UrEkD87-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.samba.org/ksmbd.git ksmbd-for-next-next
head:   073f3e59284343a926e47db3d7373aad7bfa4e8b
commit: 676fc89e7fdf5873f3f0df11a684400348e175b3 [3/4] ksmbd: fix open failure from block and char device file
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240924/202409240317.7UrEkD87-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240924/202409240317.7UrEkD87-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409240317.7UrEkD87-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/smb/server/smb2pdu.c:2070: warning: Function parameter or struct member 'coptions' not described in 'smb2_create_open_flags'
>> fs/smb/server/smb2pdu.c:2070: warning: Function parameter or struct member 'mode' not described in 'smb2_create_open_flags'
>> fs/smb/server/smb2pdu.c:2070: warning: Excess function parameter 'is_dir' description in 'smb2_create_open_flags'


vim +2070 fs/smb/server/smb2pdu.c

e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2054  
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2055  /**
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2056   * smb2_create_open_flags() - convert smb open flags to unix open flags
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2057   * @file_present:	is file already present
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2058   * @access:		file access flags
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2059   * @disposition:	file disposition flags
6c5e36d13e2a33 fs/ksmbd/smb2pdu.c      Hyunchul Lee 2021-06-23  2060   * @may_flags:		set with MAY_ flags
e2e33caa5dc2ea fs/smb/server/smb2pdu.c Hobin Woo    2024-07-05  2061   * @is_dir:		is creating open flags for directory
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2062   *
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2063   * Return:      file open flags
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2064   */
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2065  static int smb2_create_open_flags(bool file_present, __le32 access,
6c5e36d13e2a33 fs/ksmbd/smb2pdu.c      Hyunchul Lee 2021-06-23  2066  				  __le32 disposition,
e2e33caa5dc2ea fs/smb/server/smb2pdu.c Hobin Woo    2024-07-05  2067  				  int *may_flags,
676fc89e7fdf58 fs/smb/server/smb2pdu.c Namjae Jeon  2024-09-23  2068  				  __le32 coptions,
676fc89e7fdf58 fs/smb/server/smb2pdu.c Namjae Jeon  2024-09-23  2069  				  umode_t mode)
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16 @2070  {
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2071  	int oflags = O_NONBLOCK | O_LARGEFILE;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2072  
676fc89e7fdf58 fs/smb/server/smb2pdu.c Namjae Jeon  2024-09-23  2073  	if (coptions & FILE_DIRECTORY_FILE_LE || S_ISDIR(mode)) {
e2e33caa5dc2ea fs/smb/server/smb2pdu.c Hobin Woo    2024-07-05  2074  		access &= ~FILE_WRITE_DESIRE_ACCESS_LE;
e2e33caa5dc2ea fs/smb/server/smb2pdu.c Hobin Woo    2024-07-05  2075  		ksmbd_debug(SMB, "Discard write access to a directory\n");
e2e33caa5dc2ea fs/smb/server/smb2pdu.c Hobin Woo    2024-07-05  2076  	}
e2e33caa5dc2ea fs/smb/server/smb2pdu.c Hobin Woo    2024-07-05  2077  
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2078  	if (access & FILE_READ_DESIRED_ACCESS_LE &&
6c5e36d13e2a33 fs/ksmbd/smb2pdu.c      Hyunchul Lee 2021-06-23  2079  	    access & FILE_WRITE_DESIRE_ACCESS_LE) {
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2080  		oflags |= O_RDWR;
6c5e36d13e2a33 fs/ksmbd/smb2pdu.c      Hyunchul Lee 2021-06-23  2081  		*may_flags = MAY_OPEN | MAY_READ | MAY_WRITE;
6c5e36d13e2a33 fs/ksmbd/smb2pdu.c      Hyunchul Lee 2021-06-23  2082  	} else if (access & FILE_WRITE_DESIRE_ACCESS_LE) {
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2083  		oflags |= O_WRONLY;
6c5e36d13e2a33 fs/ksmbd/smb2pdu.c      Hyunchul Lee 2021-06-23  2084  		*may_flags = MAY_OPEN | MAY_WRITE;
6c5e36d13e2a33 fs/ksmbd/smb2pdu.c      Hyunchul Lee 2021-06-23  2085  	} else {
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2086  		oflags |= O_RDONLY;
6c5e36d13e2a33 fs/ksmbd/smb2pdu.c      Hyunchul Lee 2021-06-23  2087  		*may_flags = MAY_OPEN | MAY_READ;
6c5e36d13e2a33 fs/ksmbd/smb2pdu.c      Hyunchul Lee 2021-06-23  2088  	}
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2089  
676fc89e7fdf58 fs/smb/server/smb2pdu.c Namjae Jeon  2024-09-23  2090  	if (access == FILE_READ_ATTRIBUTES_LE || S_ISBLK(mode) || S_ISCHR(mode))
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2091  		oflags |= O_PATH;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2092  
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2093  	if (file_present) {
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2094  		switch (disposition & FILE_CREATE_MASK_LE) {
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2095  		case FILE_OPEN_LE:
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2096  		case FILE_CREATE_LE:
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2097  			break;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2098  		case FILE_SUPERSEDE_LE:
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2099  		case FILE_OVERWRITE_LE:
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2100  		case FILE_OVERWRITE_IF_LE:
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2101  			oflags |= O_TRUNC;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2102  			break;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2103  		default:
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2104  			break;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2105  		}
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2106  	} else {
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2107  		switch (disposition & FILE_CREATE_MASK_LE) {
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2108  		case FILE_SUPERSEDE_LE:
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2109  		case FILE_CREATE_LE:
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2110  		case FILE_OPEN_IF_LE:
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2111  		case FILE_OVERWRITE_IF_LE:
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2112  			oflags |= O_CREAT;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2113  			break;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2114  		case FILE_OPEN_LE:
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2115  		case FILE_OVERWRITE_LE:
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2116  			oflags &= ~O_CREAT;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2117  			break;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2118  		default:
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2119  			break;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2120  		}
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2121  	}
6c5e36d13e2a33 fs/ksmbd/smb2pdu.c      Hyunchul Lee 2021-06-23  2122  
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2123  	return oflags;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2124  }
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2125  

:::::: The code at line 2070 was first introduced by commit
:::::: e2f34481b24db2fd634b5edb0a5bd0e4d38cc6e9 cifsd: add server-side procedures for SMB3

:::::: TO: Namjae Jeon <namjae.jeon@samsung.com>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
