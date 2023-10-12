Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A874262BA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 19:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NIVBnwVO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697137984; x=1728673984;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xJlCPQyCI1YpUVihd4npEqGDPADHWGnSPc2noyBwVNY=;
  b=NIVBnwVO63lIp8TZ+xOkuaJzYSziey7/oF41YZdFGTuIzCPSPJKSM9i3
   3mpNwjidoZWdAPakTQuY9LGrQHRF9go9ZP/nCAOKn6owZ+8rEq0BJvd5/
   cXg/mJJ4OSpS2VVYSf6IQzYgUwc4jXt99vylEqtWz/+jnbw240vRUAkAm
   QHAjUOIIgnPpsk3i23lgOPUCJXq7PftADemUNhVBwymBKBqY+PcllyeMS
   NsxeR3jbh6SGMcVLkWwa1fnDWkYd0SyZt4fXL/Dcyh5QNIzOJhRp367cq
   QK9n2oYNQYW9GKvxY0pdAm12t8TyeEaq30CYxJ9w2lK/Cp+rpZy7XYT5e
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="365277832"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="365277832"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 12:13:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="820266557"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="820266557"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 12 Oct 2023 12:12:59 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qr17A-0003mH-2R;
	Thu, 12 Oct 2023 19:12:56 +0000
Date: Fri, 13 Oct 2023 03:11:57 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:sound/speaker-safety 150/196] checkpatch: ERROR:
 trailing whitespace
Message-ID: <202310130325.CFuxuROc-lkp@intel.com>
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
commit: e64972bf253d4def0a3870988b5cd2a7e1b75a81 [150/196] ASoC: macaudio: Start speaker sense capture support
reproduce: (https://download.01.org/0day-ci/archive/20231013/202310130325.CFuxuROc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310130325.CFuxuROc-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:TRAILING_WHITESPACE: trailing whitespace
#104: FILE: sound/soc/apple/macaudio.c:988:
+^I{ "PCM2 RX", NULL, "Speaker Sense Capture" },^I$

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
