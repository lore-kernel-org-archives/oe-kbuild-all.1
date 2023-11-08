Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08CF650
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Nov 2023 01:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WPRP7Sbv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699405767; x=1730941767;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jSbvozwGRvQQOYW63BAYjVre1u+/HqpteLCvrbLqCP8=;
  b=WPRP7SbvxwAVzn6RkC+eYX2ccDFRjXLPyJnX0fDB5ahwEIGx3THtuwYc
   V4qHL/WkxYvjouiOiBKakMR7gVfkgFAb1vY5jaar1Ehav8a4X+YqNErDT
   zPbU3lWXed7UxE0YZTZ7sRTjlEoenuoelJOpZqkMQiQPuAkSHQiFN4dP8
   w2VuTI3euNINuBFh3pY9X4VK2YNnq/OeMsRzZkCKTjBUKEhmq/xmdyyU6
   74/peyRqqZM8x5M5fzovfXUse5Jkjvv0V7srSbT5YXxULEpgogIJYtHCd
   wowCJTbCeldzwMSUX/1oys/HXT6/V0HL3pOAlMi7PPSF40g9X9fH9skRy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="368997635"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="368997635"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 17:09:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="797849538"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="797849538"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 07 Nov 2023 17:09:25 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0X4N-0007XM-12;
	Wed, 08 Nov 2023 01:09:23 +0000
Date: Wed, 8 Nov 2023 09:04:16 +0800
From: kernel test robot <lkp@intel.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [samba-ksmbd:ksmbd-for-next-next 3/3]
 fs/smb/server/smb_common.c:374:6: warning: no previous prototype for
 'set_smb1_rsp_status'
Message-ID: <202311080822.8m1ZWST6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.samba.org/ksmbd.git ksmbd-for-next-next
head:   ad635769dc92afd2667ee92dc0eba59aad8fe034
commit: ad635769dc92afd2667ee92dc0eba59aad8fe034 [3/3] ksmbd: handle malformed smb1 message
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231108/202311080822.8m1ZWST6-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231108/202311080822.8m1ZWST6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311080822.8m1ZWST6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/smb/server/smb_common.c:374:6: warning: no previous prototype for 'set_smb1_rsp_status' [-Wmissing-prototypes]
     374 | void set_smb1_rsp_status(struct ksmbd_work *work, __le32 err)
         |      ^~~~~~~~~~~~~~~~~~~


vim +/set_smb1_rsp_status +374 fs/smb/server/smb_common.c

   368	
   369	/**
   370	 * set_smb1_rsp_status() - set error type in smb response header
   371	 * @work:	smb work containing smb response header
   372	 * @err:	error code to set in response
   373	 */
 > 374	void set_smb1_rsp_status(struct ksmbd_work *work, __le32 err)
   375	{
   376		work->send_no_response = 1;
   377	}
   378	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
