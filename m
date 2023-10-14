Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6194134AC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 14:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G11Ef6yo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697293841; x=1728829841;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EFZ8SNra+fEzIqV//OmxxGxXUsI9j4Wm4Aq/HLc53GM=;
  b=G11Ef6yoPo3teWzke+O200pZyy188eb+8zQ3N3YIhHGQG3Y2RJWeEbnD
   S0mgSexhX4skqXUITd5ipHr1o+g95gyA4vcf0edI5kh6KGy1bU/5rxakj
   q4iaOetVqHajD/DTAOALA/Aowhz4c4Q2Z2UEcrCxEWXzQrhqVi/iDoEEP
   TsjcQ9YmVVTMu0vkte9bPAIucSYnSrkqK9h7g8SAlI5u/FT0uBNJQ7Rvl
   cSjmHpLX8CFCpR16U7xkB3SNFirTk7aWqmxP7PzzRnGfsW0LUH3cq89eu
   2A1xoMmA5XDzFse+2Qw5dp9TzVnKNv0N8qRg+9J9IzqgmAkxteZ0TQTve
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="365593616"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="365593616"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 07:30:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="758812621"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="758812621"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 14 Oct 2023 07:30:39 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrff3-0006Ft-1J;
	Sat, 14 Oct 2023 14:30:37 +0000
Date: Sat, 14 Oct 2023 22:29:58 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/643 4145/15767]
 drivers/crypto/caam/caamkeyblob.h:36:19: warning: 'caam_key_modifier'
 defined but not used
Message-ID: <202310142247.X85FKKeD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/643
head:   1fef7a26b48f767bcda4f5147cea10e83903ecf6
commit: 0c4539c2dce9c41c8026dc39c8641465c89f86a9 [4145/15767] MLK-24420-2 crypto: caam - add support for black keys and blobs
config: arm-randconfig-004-20231014 (https://download.01.org/0day-ci/archive/20231014/202310142247.X85FKKeD-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310142247.X85FKKeD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310142247.X85FKKeD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/crypto/caam/caamkeyblob.c:7:
>> drivers/crypto/caam/caamkeyblob.h:36:19: warning: 'caam_key_modifier' defined but not used [-Wunused-const-variable=]
      36 | static const char caam_key_modifier[KEYMOD_SIZE_GM] = {
         |                   ^~~~~~~~~~~~~~~~~
--
   drivers/crypto/caam/jr.c:403: warning: Function parameter or member 'idx' not described in 'caam_jridx_alloc'
>> drivers/crypto/caam/jr.c:570: warning: Excess function parameter 'status' description in 'caam_jr_run_and_wait_for_completion'
>> drivers/crypto/caam/jr.c:570: warning: Excess function parameter 'areq' description in 'caam_jr_run_and_wait_for_completion'


vim +/caam_key_modifier +36 drivers/crypto/caam/caamkeyblob.h

    22	
    23	#define MAX_BLACK_KEY_SIZE		(MAX_KEY_SIZE + CCM_OVERHEAD +\
    24						TAG_OVERHEAD_SIZE)
    25	
    26	/*
    27	 * For blobs a randomly-generated, 256-bit blob key is used to
    28	 * encrypt the data using the AES-CCM cryptographic algorithm.
    29	 * Therefore, blob size is max key size, CCM_OVERHEAD, blob header
    30	 * added by CAAM and the tagged object header size.
    31	 */
    32	#define MAX_BLOB_SIZE			(MAX_KEY_SIZE + CCM_OVERHEAD +\
    33						BLOB_OVERHEAD + TAG_OVERHEAD_SIZE)
    34	
    35	/* Key modifier for CAAM blobs, used as a revision number */
  > 36	static const char caam_key_modifier[KEYMOD_SIZE_GM] = {
    37			'C', 'A', 'A', 'M', '_', 'K', 'E', 'Y',
    38			'_', 'T', 'Y', 'P', 'E', '_', 'V', '1',
    39	};
    40	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
