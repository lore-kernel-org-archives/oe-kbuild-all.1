Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4117839FC1
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jul 2024 18:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720116881; cv=none; b=hlTE9Mi+Cw66/m9Ih3+DlomZlkBd7QLCJE7IVHuDDgJqx76of6Mk9VHSPRQQ/4hwrOvkj+qg0cKiQrnv3RmRcBQ0p9HeC6xsK63qIrgM+HWYQDIXpIIv6fEWqKRKm2TFnqtUEsrgNQBcbq9o5Z5q7TtOqu7YEdZNdvEQz63XXso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720116881; c=relaxed/simple;
	bh=l9qsh+O1bt8/W9pkjTpImClXGx8QO6pfyAs12JraJKw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B1X/GHRPm2dB0E3wQ1dQ1BhWQ1zqSKFwKzJ5RhWRncgpbf6FrLN9jY5BCjHGzl6dptycB/lDLM8YJpGDf8Et887hZ9iiTDK2+/tc5wPwc1naXiifKTaCIVsQFxVzKHcMc7c1Z9sCYpmGSXJ/NmUbORA8ZDzIX4Exw9qWVswy1Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ISiiMSUM; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ISiiMSUM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720116879; x=1751652879;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l9qsh+O1bt8/W9pkjTpImClXGx8QO6pfyAs12JraJKw=;
  b=ISiiMSUMf9CmKgKL9aDA78g0V6Ir8twcBvcpp+/Iaa5Xle/m05A686Eq
   W0u+uBHIO1DlPTn/A/zwYAjtWNIoXAsUpBpNv0DGBEI0Fnw/MNvE9HRMO
   KPLYrxcD57Q7EnGYo4ge+yEyB6IzzuFOPNHXv+Ino2htoqE3xNwe7fLBe
   lwWp4AQ2JlnW2q2zXNAjiVc/SoTZh/JiMPB87vBTjvBjOJeJFjacOvja9
   YyJmcC7GyiJ1itQ1NGBEj0SUwj7DwElTcDW+dWa5kxDbVjOPkJSedSWp3
   gqunRp5HtriYyLMN6UUrOwB9BtzYtKUum0AfYfBiQBWJlq2+QocTTCkAq
   g==;
X-CSE-ConnectionGUID: 4cbuFVfxTM2PoAFrGAxE3Q==
X-CSE-MsgGUID: GPIl5HGMT1WmaoVoKKYUEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="21220363"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="21220363"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 11:14:38 -0700
X-CSE-ConnectionGUID: qVKB+pfTRGq+PdXpbGrEIw==
X-CSE-MsgGUID: xoEd8hzgQQm65od9zzOtOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="51262215"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Jul 2024 11:14:37 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPQyZ-000RIt-0C;
	Thu, 04 Jul 2024 18:14:35 +0000
Date: Fri, 5 Jul 2024 02:14:02 +0800
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [smfrench-smb3:ksmbd-for-next-next 4/4]
 fs/smb/server/smb2pdu.c:2061: warning: Function parameter or struct member
 'is_dir' not described in 'smb2_create_open_flags'
Message-ID: <202407050244.1nLPnfIn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/smfrench/smb3-kernel.git ksmbd-for-next-next
head:   cbd22525a55a8f74c730b254d708f8e92bb8dc53
commit: cbd22525a55a8f74c730b254d708f8e92bb8dc53 [4/4] ksmbd: discard write access to the directory open
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240705/202407050244.1nLPnfIn-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240705/202407050244.1nLPnfIn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407050244.1nLPnfIn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/smb/server/smb2pdu.c:2061: warning: Function parameter or struct member 'is_dir' not described in 'smb2_create_open_flags'


vim +2061 fs/smb/server/smb2pdu.c

e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2047  
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2048  /**
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2049   * smb2_create_open_flags() - convert smb open flags to unix open flags
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2050   * @file_present:	is file already present
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2051   * @access:		file access flags
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2052   * @disposition:	file disposition flags
6c5e36d13e2a33 fs/ksmbd/smb2pdu.c      Hyunchul Lee 2021-06-23  2053   * @may_flags:		set with MAY_ flags
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2054   *
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2055   * Return:      file open flags
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2056   */
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2057  static int smb2_create_open_flags(bool file_present, __le32 access,
6c5e36d13e2a33 fs/ksmbd/smb2pdu.c      Hyunchul Lee 2021-06-23  2058  				  __le32 disposition,
cbd22525a55a8f fs/smb/server/smb2pdu.c Hobin Woo    2024-07-04  2059  				  int *may_flags,
cbd22525a55a8f fs/smb/server/smb2pdu.c Hobin Woo    2024-07-04  2060  				  bool is_dir)
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16 @2061  {
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2062  	int oflags = O_NONBLOCK | O_LARGEFILE;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2063  
cbd22525a55a8f fs/smb/server/smb2pdu.c Hobin Woo    2024-07-04  2064  	if (is_dir) {
cbd22525a55a8f fs/smb/server/smb2pdu.c Hobin Woo    2024-07-04  2065  		access &= ~FILE_WRITE_DESIRE_ACCESS_LE;
cbd22525a55a8f fs/smb/server/smb2pdu.c Hobin Woo    2024-07-04  2066  		ksmbd_debug(SMB, "Discard write access to a directory\n");
cbd22525a55a8f fs/smb/server/smb2pdu.c Hobin Woo    2024-07-04  2067  	}
cbd22525a55a8f fs/smb/server/smb2pdu.c Hobin Woo    2024-07-04  2068  
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2069  	if (access & FILE_READ_DESIRED_ACCESS_LE &&
6c5e36d13e2a33 fs/ksmbd/smb2pdu.c      Hyunchul Lee 2021-06-23  2070  	    access & FILE_WRITE_DESIRE_ACCESS_LE) {
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2071  		oflags |= O_RDWR;
6c5e36d13e2a33 fs/ksmbd/smb2pdu.c      Hyunchul Lee 2021-06-23  2072  		*may_flags = MAY_OPEN | MAY_READ | MAY_WRITE;
6c5e36d13e2a33 fs/ksmbd/smb2pdu.c      Hyunchul Lee 2021-06-23  2073  	} else if (access & FILE_WRITE_DESIRE_ACCESS_LE) {
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2074  		oflags |= O_WRONLY;
6c5e36d13e2a33 fs/ksmbd/smb2pdu.c      Hyunchul Lee 2021-06-23  2075  		*may_flags = MAY_OPEN | MAY_WRITE;
6c5e36d13e2a33 fs/ksmbd/smb2pdu.c      Hyunchul Lee 2021-06-23  2076  	} else {
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2077  		oflags |= O_RDONLY;
6c5e36d13e2a33 fs/ksmbd/smb2pdu.c      Hyunchul Lee 2021-06-23  2078  		*may_flags = MAY_OPEN | MAY_READ;
6c5e36d13e2a33 fs/ksmbd/smb2pdu.c      Hyunchul Lee 2021-06-23  2079  	}
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2080  
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2081  	if (access == FILE_READ_ATTRIBUTES_LE)
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2082  		oflags |= O_PATH;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2083  
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2084  	if (file_present) {
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2085  		switch (disposition & FILE_CREATE_MASK_LE) {
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2086  		case FILE_OPEN_LE:
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2087  		case FILE_CREATE_LE:
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2088  			break;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2089  		case FILE_SUPERSEDE_LE:
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2090  		case FILE_OVERWRITE_LE:
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2091  		case FILE_OVERWRITE_IF_LE:
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2092  			oflags |= O_TRUNC;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2093  			break;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2094  		default:
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2095  			break;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2096  		}
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2097  	} else {
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2098  		switch (disposition & FILE_CREATE_MASK_LE) {
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2099  		case FILE_SUPERSEDE_LE:
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2100  		case FILE_CREATE_LE:
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2101  		case FILE_OPEN_IF_LE:
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2102  		case FILE_OVERWRITE_IF_LE:
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2103  			oflags |= O_CREAT;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2104  			break;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2105  		case FILE_OPEN_LE:
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2106  		case FILE_OVERWRITE_LE:
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2107  			oflags &= ~O_CREAT;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2108  			break;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2109  		default:
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2110  			break;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2111  		}
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2112  	}
6c5e36d13e2a33 fs/ksmbd/smb2pdu.c      Hyunchul Lee 2021-06-23  2113  
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2114  	return oflags;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2115  }
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2116  

:::::: The code at line 2061 was first introduced by commit
:::::: e2f34481b24db2fd634b5edb0a5bd0e4d38cc6e9 cifsd: add server-side procedures for SMB3

:::::: TO: Namjae Jeon <namjae.jeon@samsung.com>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
