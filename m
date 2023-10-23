Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C575E22EFB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Oct 2023 20:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I53zDCAu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698091366; x=1729627366;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uni8w8zq2iH/UBLVWnyjxgfqoky7n0zZS1uIXS19GFQ=;
  b=I53zDCAu8GKCOtn2rnnCc9PidVBmbdP2ddcVAmJQXrryGpV1gpZXeTNa
   7hejfPtneEuvnqJn/Iy5JiGZDKY24w2dha3ddZZgS2WDFZ6NLOAB/MuK6
   d+1q9rbgw6B7qwnGnWf+zuW0Z9ns50feQVgIFMRkxnpgRUshvO9ls2V8g
   pRP9Yjfn3LJkqCvEasgm665RQC30xbHaQaa05Rfc/wIKcDeXwQsCwdePv
   GPSyTIKxeUIhuqSMIuhVk9IJY8SRp2ZAnmeg17Sj+UzITGBIxV2CVdKlB
   9h1BaoVteBji/00v+BkQF0YAsQ0aater90PJyetcPnOKezxYcyyO28y8b
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="385814571"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="385814571"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 13:02:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="1089604283"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="1089604283"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 23 Oct 2023 13:02:11 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qv17n-0007Dm-2m;
	Mon, 23 Oct 2023 20:02:07 +0000
Date: Tue, 24 Oct 2023 04:01:09 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm64:for-next/lpa2-stage1 48/61] checkpatch: WARNING: do not add
 new typedefs
Message-ID: <202310240335.7oDgey7v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/lpa2-stage1
head:   aa77c7fe48f8b863ab1c30daf17ed8893850c7eb
commit: 5d663424caa1377d7a403dc07b40368e3111c00c [48/61] arm64: mm: Add definitions to support 5 levels of paging
reproduce: (https://download.01.org/0day-ci/archive/20231024/202310240335.7oDgey7v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310240335.7oDgey7v-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:NEW_TYPEDEFS: do not add new typedefs
#137: FILE: arch/arm64/include/asm/pgtable-types.h:40:
+typedef struct { p4dval_t p4d; } p4d_t;

ERROR:SPACING: space prohibited before that close parenthesis ')'
#139: FILE: arch/arm64/include/asm/pgtable-types.h:42:
+#define __p4d(x)	((p4d_t) { (x) } )

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
