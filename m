Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF093D970
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 20:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a6+9WRwb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697142727; x=1728678727;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VXiv9XWSxk5uh/7ub9D8h/Ppc0H4Ffywn+iMs0dWtn4=;
  b=a6+9WRwbLajhtSLgN2xmCCsvH+cNkHVAc/6nLsoGFMLiLnLHVkiV47s3
   IqJ61xBSO8Y/atGvtBqvLAaNreTWEYixXk5gS1D9X98p+iUfWmkj0ANX/
   xa/jGCYEUM9qFT2gKGzF+QJtVsAyfuMBLdndY74qk8GkFNIrhyV4Hnx/U
   5u5MO3/INsMMU/918B1LOxmT611UXOoI9iYYtRuKx2vFrhVb8AGiuNKKS
   vaJ11whOj+ONndkK/ct8KJz70uLbc3X0wwbVaqjzcGH1SSd0qLVXToNkF
   yg/AkiQFXxlDiuC8IPgGDuUYWlWIyVRlejeOHJAHiIk5htbATVsj809WW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="416076437"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="416076437"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 13:32:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="820293067"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="820293067"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 12 Oct 2023 13:32:05 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qr2Lj-0003rB-1Z;
	Thu, 12 Oct 2023 20:32:03 +0000
Date: Fri, 13 Oct 2023 04:31:04 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:sound/speaker-safety 172/196] checkpatch: WARNING:
 Consider removing the code enclosed by this #if 0 and its #endif
Message-ID: <202310130416.GmzSwoUu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux sound/speaker-safety
head:   899711ed1c90b438d31e322d1b0638b328435963
commit: 8ad688c909e8a623a6b76eb0e44e0beb308d629e [172/196] ASoC: macaudio: Do not disable ISENSE/VSENSE switches on j314
reproduce: (https://download.01.org/0day-ci/archive/20231013/202310130416.GmzSwoUu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310130416.GmzSwoUu-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:IF_0: Consider removing the code enclosed by this #if 0 and its #endif
#22: FILE: sound/soc/apple/macaudio.c:927:
+#if 0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
