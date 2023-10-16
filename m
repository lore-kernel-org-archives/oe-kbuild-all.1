Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0AE620
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 02:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aoaD5Gdw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697423681; x=1728959681;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0qX1pMMgYwBvN1EYeh5oHPyxCfRXxP5Dgq214ggN2cU=;
  b=aoaD5Gdw4ySQqFvpV+CCqN64+fUGkzm0fX7odGsGmrUpNFStDoysLIxn
   1xfU6AEyfsbyk3qU3Hl/pxlg1H74YqHAwwuHicHm8mmGgFdtnrwDs+67A
   umJVhkUW0fQGyNCfBSmY/OgxfE08Y/E5dZPzNO+Yeb1Qo8lEwA6o2d9Aw
   ul2dNvW4zWCCv2ZKccM+Sg7mNwB6zv+LOemuYYyt40hQHXxNnF2jAJ+31
   5JfbejD0Voj7ld0clAzFuGbQFKWdWl35SfJD9iQqmRtdcWDItkA/5SNNx
   BovahK7xzRns/o19FqDVYoM58/wF6UBDQQbxyYKKb9pC3xmfdhUSVkfdh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="389294268"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="389294268"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 19:34:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="825832758"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="825832758"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 15 Oct 2023 19:34:39 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsDRF-00081f-08;
	Mon, 16 Oct 2023 02:34:37 +0000
Date: Mon, 16 Oct 2023 10:34:25 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:sound/speaker-safety 173/206] checkpatch: ERROR: Macros
 with complex values should be enclosed in parentheses
Message-ID: <202310161030.1nCtCe9t-lkp@intel.com>
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
commit: c31d606e41375fb4436c6398e5ed421d1e809d82 [173/206] macaudio: speaker volume safety interlocks
reproduce: (https://download.01.org/0day-ci/archive/20231016/202310161030.1nCtCe9t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310161030.1nCtCe9t-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#19: FILE: sound/soc/apple/macaudio.c:58:
+#define SPEAKER_MAGIC_VALUE (s32)0xdec1be15

WARNING:LINE_SPACING: Missing a blank line after declarations
#117: FILE: sound/soc/apple/macaudio.c:247:
+			const struct macaudio_limit_cfg *limit = &ma->cfg->limits[i];
+			if (!limit->match)

ERROR:CODE_INDENT: code indent should use tabs where possible
#197: FILE: sound/soc/apple/macaudio.c:327:
+        struct macaudio_snd_data *ma = container_of(to_delayed_work(wrk),$

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
