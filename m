Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBED8492
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Apr 2023 13:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681996363; x=1713532363;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xe2gdwtHwSZm1dE8XVidNnzjVTedKDR7BQ2EC+29ju8=;
  b=SetQ3G8QPjnajgKUcEU8jVHPIhRMbSYVJPhGAZSdWSO3UB1gClhruTjn
   XT1dqJ2hPq55aNmoGvUwnrEKtYxmyUFHPMwu1KevHvtGIvfkbhxRD163Z
   fgWvIaX7PO4NSwe76ZY9JsGz+QvkcUH40g4E/krjLdnAvhRSGhbW9HVNL
   OCkk+tlmUHoCLW9dM3iXNrdGyLVTPXKkk+7GVNlIWr3+qmsgWTJUCM3a+
   tN/R4/rRjzTgYfnM0I9tqUY48wxTw5gZO4mI/aHhgwgLXwnbGshNuWrLc
   tulkZf0sG17sWr38aRSeUHMlJ0uRom/k1pIGxlneZCJJ8RRcFNPgxiphs
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="344481834"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; 
   d="scan'208";a="344481834"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 06:12:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="803331786"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; 
   d="scan'208";a="803331786"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 20 Apr 2023 06:12:42 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppU5Z-000fqU-1B;
	Thu, 20 Apr 2023 13:12:41 +0000
Date: Thu, 20 Apr 2023 21:12:06 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.15 97/97] fs/ksmbd/smb2pdu.c:890:28: error:
 'MIN_PREAUTH_CTXT_DATA_LEN' undeclared
Message-ID: <202304202118.MghgLELh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.15
head:   83f10153cf1bcae9eae8aca904a3884c440448bf
commit: 83f10153cf1bcae9eae8aca904a3884c440448bf [97/97] ksmbd: avoid out of bounds access in decode_preauth_ctxt()
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230420/202304202118.MghgLELh-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=83f10153cf1bcae9eae8aca904a3884c440448bf
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-5.15
        git checkout 83f10153cf1bcae9eae8aca904a3884c440448bf
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304202118.MghgLELh-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/ksmbd/smb2pdu.c: In function 'decode_preauth_ctxt':
>> fs/ksmbd/smb2pdu.c:890:28: error: 'MIN_PREAUTH_CTXT_DATA_LEN' undeclared (first use in this function)
     890 |         if (len_of_ctxts < MIN_PREAUTH_CTXT_DATA_LEN)
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ksmbd/smb2pdu.c:890:28: note: each undeclared identifier is reported only once for each function it appears in


vim +/MIN_PREAUTH_CTXT_DATA_LEN +890 fs/ksmbd/smb2pdu.c

   881	
   882	static __le32 decode_preauth_ctxt(struct ksmbd_conn *conn,
   883					  struct smb2_preauth_neg_context *pneg_ctxt,
   884					  int len_of_ctxts)
   885	{
   886		/*
   887		 * sizeof(smb2_preauth_neg_context) assumes SMB311_SALT_SIZE Salt,
   888		 * which may not be present. Only check for used HashAlgorithms[1].
   889		 */
 > 890		if (len_of_ctxts < MIN_PREAUTH_CTXT_DATA_LEN)
   891			return STATUS_INVALID_PARAMETER;
   892	
   893		if (pneg_ctxt->HashAlgorithms != SMB2_PREAUTH_INTEGRITY_SHA512)
   894			return STATUS_NO_PREAUTH_INTEGRITY_HASH_OVERLAP;
   895	
   896		conn->preauth_info->Preauth_HashId = SMB2_PREAUTH_INTEGRITY_SHA512;
   897		return STATUS_SUCCESS;
   898	}
   899	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
