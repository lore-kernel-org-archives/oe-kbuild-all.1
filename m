Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E511369
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 01:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UbuVSECh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697421102; x=1728957102;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nO2131pyk2PlDiinbXx5pKO8Agakm6PjEvu0Wt9Oe/8=;
  b=UbuVSEChSxEky5NlyzOhxUdHzJtqnkBp21YrLq+Na0rj7eWvmSElmiMn
   qKLkupEqkXmUnvcjtdryyBmgtxSAiARrWfSV5WXuTxip4mTFYXF/Zc9zS
   RkdMhCSA0BjXHvknCED4ace8kDN861l0ClntaIW0CWEA3zYQc/GTWUJa8
   BeYaPhI48XNoeYgB10qR9haT8g59Sc9cQnFQMruWQ38sc1vCNUWeJdMTl
   fED6MjxYgEZFOdKmCt8EBBQgIutVBUkK5ydgvde86DtiQ/q0u5JYTtSMT
   63eB3oJiJ6qdPYAeSS/P1Mj2I8B2I/5b3ojrWgIRBZYSHD0aa6kbdzaw8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="416495878"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="416495878"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 18:51:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="929182857"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="929182857"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 15 Oct 2023 18:51:39 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsClb-00080t-2o;
	Mon, 16 Oct 2023 01:51:35 +0000
Date: Mon, 16 Oct 2023 09:50:39 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:sound/speaker-safety 158/206] checkpatch: WARNING:
 Missing a blank line after declarations
Message-ID: <202310160903.5SnjHUL2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux sound/speaker-safety
head:   c4c1ca0ec7d6b3dcce7304ea88eaaad52f090d90
commit: 4b6578ec19c85fb5006227e2d64a49a9bcd71315 [158/206] ASoC: apple: mca: Support capture on multiples BEs
reproduce: (https://download.01.org/0day-ci/archive/20231016/202310160903.5SnjHUL2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310160903.5SnjHUL2-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:LINE_SPACING: Missing a blank line after declarations
#42: FILE: sound/soc/apple/mca.c:272:
+		int no = mca_dai_to_cluster(asoc_rtd_to_cpu(dpcm->be, 0))->no;
+		mask |= 1 << no;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
