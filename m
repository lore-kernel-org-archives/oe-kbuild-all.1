Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117623D382
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 20:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="me6u7Mbc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697746290; x=1729282290;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3Wr277I4UzoXFMN0qOXQwRxx5AUKPiNav/yCLmgKaRM=;
  b=me6u7MbcqnuWwBdDx/QAjbwFH3TkQhDBZUHPxd5jVAJtnil2XQiJqK9j
   h0/dwuwIITr9U3gldFt6sydZk19BNr8HXJxIx5iMHGmzqg+h3oxUwQ+W8
   RlSGNEaDfEQBiQmWci1Ns12es81814xLgTW9Ah/8qgwZXxU4QEZlcT3Wa
   qiglUpiu5R1eSM3pRKE55oNj3DtWyyyJK6r3QcBizzLDcTr+mxHR0bbqD
   2vfgn/e4TA6QhHYPqQ9HHHRtYqBWgksa9dtUayT8KJoGx1LEBJjLHwLZo
   EKuTdUrs3u6fSF2d4+Lc84vxWmkS+a6NmuqiqUkr2crZ4nvwEC2zhZkR5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="390241152"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="390241152"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 13:11:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="900884383"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="900884383"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 19 Oct 2023 13:09:20 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtZMc-0002YL-0h;
	Thu, 19 Oct 2023 20:11:26 +0000
Date: Fri, 20 Oct 2023 04:10:45 +0800
From: kernel test robot <lkp@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [plbossart-sound:fix/prepare-i915-deferred-probe 23/31] checkpatch:
 WARNING: quoted string split across lines
Message-ID: <202310200429.uvKX8Q0k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/plbossart/sound fix/prepare-i915-deferred-probe
head:   4bb0e68ce78f4899b3e6f939a657d57798dae8cb
commit: 663c94d1cb6077bfe3ff4fb45ec7acc070f9c4a4 [23/31] ALSA: hda: i915: Allow override of gpu binding.
reproduce: (https://download.01.org/0day-ci/archive/20231020/202310200429.uvKX8Q0k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310200429.uvKX8Q0k-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPLIT_STRING: quoted string split across lines
#43: FILE: sound/hda/hdac_i915.c:18:
+MODULE_PARM_DESC(gpu_bind, "Whether to bind sound component to GPU "
+			   "(1=always, 0=never, -1=on nomodeset(default))");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
