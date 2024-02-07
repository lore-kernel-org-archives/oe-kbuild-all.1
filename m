Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BE21CD1F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Feb 2024 06:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707286064; cv=none; b=Tw9E3WfS6OHNYNg8yGI77ViRvAAGHR+cQ98e1rRSe0O+Gi9BjfCm0srSZ/sbNUyToPs3RQr1L2we9y0Dn6VKbNx0HvaorNB1n60yJsxBkQ1a2Moc+0lRBQBICLwh32eCzkEHqRsn9ppUmXRK4Ea0ou68SXgolqQM6ny03Rze1X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707286064; c=relaxed/simple;
	bh=Blq1eOAMpcMoBC2CmFzPuoCsBfz537te9Ld2NXwMniY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lhTkCNwHOJ7GgqpiNJRg4D2J+LbHa3Js+3pxnGXpGA3NcyUjf5kA8EOS0dsYdRvPIW3j0xng5Ij/XsxhhSCpwOmMaN5QBfzbEP6drVk2rF4QoOwJpZD6jaHL4obdjaRc0+exvHA4uF31m5iI8NkTgl7gRAXXf1RCPuXX3Qao9Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=go3g9HYt; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="go3g9HYt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707286061; x=1738822061;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Blq1eOAMpcMoBC2CmFzPuoCsBfz537te9Ld2NXwMniY=;
  b=go3g9HYt15pjz/6FgbBI+YuSJrJSPBpNBhBLrtC9xQux5IwekElj1t4x
   kSwYM82ECGeSSyhEX7W/kcGDR2duIUp9+ORe20Cb2EiNmXAIvEKnOFFIb
   luHJOBYF3tphuv0PaJCuYwFbef2z1275/FM/EJQOi7jyF1gaZ6a/nPrCh
   ZihS7GwpOFFwpOyUn1nbZtNgebw6GCCrojuzIZMiBMxMfbtAWNEcuKeyE
   hggKuz0AbAaW36SvLpzdktkn+3Q+QtG3+9sZ0klknazCgB1osKbnzfjRk
   rXwYAUwbkCHdh4jEiFSCt5PzZ2pePwT5LNaghPPgTtXNnZNm+xBiB/OWw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="436053809"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="436053809"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 22:07:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="5849550"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 Feb 2024 22:07:40 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXb5t-0002G0-2K;
	Wed, 07 Feb 2024 06:07:37 +0000
Date: Wed, 7 Feb 2024 14:07:07 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 67/67] fs/bcachefs/error.c:35:24: error:
 implicit declaration of function 'bch2_run_explicit_recovery_pass'
Message-ID: <202402071357.pS5OZzr3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   18627fdec55036b874377d9201351f0a8f9baa68
commit: 18627fdec55036b874377d9201351f0a8f9baa68 [67/67] bcachefs: Kill more -EIO error codes
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20240207/202402071357.pS5OZzr3-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240207/202402071357.pS5OZzr3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402071357.pS5OZzr3-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/bcachefs.h:209,
                    from fs/bcachefs/error.c:2:
   fs/bcachefs/bcachefs_format.h:221:25: warning: 'version' offset 27 in 'struct bkey' isn't aligned to 4 [-Wpacked-not-aligned]
     221 |         struct bversion version;
         |                         ^~~~~~~
   fs/bcachefs/error.c: In function 'bch2_topology_error':
>> fs/bcachefs/error.c:35:24: error: implicit declaration of function 'bch2_run_explicit_recovery_pass' [-Werror=implicit-function-declaration]
      35 |                 return bch2_run_explicit_recovery_pass(c, BCH_RECOVERY_PASS_check_topology) ?:
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from fs/bcachefs/bcachefs.h:209,
                    from fs/bcachefs/recovery.c:3:
   fs/bcachefs/bcachefs_format.h:221:25: warning: 'version' offset 27 in 'struct bkey' isn't aligned to 4 [-Wpacked-not-aligned]
     221 |         struct bversion version;
         |                         ^~~~~~~
   fs/bcachefs/recovery.c: In function 'journal_replay_entry_early':
>> fs/bcachefs/recovery.c:267:36: warning: overflow in conversion from 'int' to 's8' {aka 'signed char'} changes value from '-2275' to '29' [-Woverflow]
     267 |                         r->error = -BCH_ERR_btree_node_read_error;
         |                                    ^


vim +/bch2_run_explicit_recovery_pass +35 fs/bcachefs/error.c

   > 2	#include "bcachefs.h"
     3	#include "error.h"
     4	#include "super.h"
     5	#include <linux/thread_with_file.h>
     6	
     7	#define FSCK_ERR_RATELIMIT_NR	10
     8	
     9	bool bch2_inconsistent_error(struct bch_fs *c)
    10	{
    11		set_bit(BCH_FS_error, &c->flags);
    12	
    13		switch (c->opts.errors) {
    14		case BCH_ON_ERROR_continue:
    15			return false;
    16		case BCH_ON_ERROR_ro:
    17			if (bch2_fs_emergency_read_only(c))
    18				bch_err(c, "inconsistency detected - emergency read only");
    19			return true;
    20		case BCH_ON_ERROR_panic:
    21			panic(bch2_fmt(c, "panic after error"));
    22			return true;
    23		default:
    24			BUG();
    25		}
    26	}
    27	
    28	int bch2_topology_error(struct bch_fs *c)
    29	{
    30		set_bit(BCH_FS_topology_error, &c->flags);
    31		if (!test_bit(BCH_FS_fsck_running, &c->flags)) {
    32			bch2_inconsistent_error(c);
    33			return -BCH_ERR_btree_need_topology_repair;
    34		} else {
  > 35			return bch2_run_explicit_recovery_pass(c, BCH_RECOVERY_PASS_check_topology) ?:
    36				-BCH_ERR_btree_node_read_validate_error;
    37		}
    38	}
    39	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
