Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8706CD2F1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Oct 2023 20:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QVQ6AtiC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697918484; x=1729454484;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TKTDFHC+UoU2H61ZDa65zHtDVuERRxCtJ2rCjKVl57U=;
  b=QVQ6AtiCjHkL3nBQ/hPLuF5xRjIKUea5kvCzuk/VR2NOSpU/TMI+wx0C
   koufbVA4Os59tJP0qpMoWsJjeg4z6I5nrWUcpbatUriwaXJLEU5wRurEU
   0AmBM58wTPwMg8iUQyZn3LrAeij5uMYHKcWNHfes3HMVfJAUoKfzNq/ne
   YWMQOyrwJpQ5DIiF/5M9Mu7EaoIVmieiGK0hkVwXVtsNyS0bO6rwPgtI5
   4vvZ9o0M+ZR2MPl3pJvpR7SSnH5mFdKcE92pc5MGfrfY/ZpjpyDMM2ZW0
   8vTf4M4/zr7kAtTxa9WvLmIHORM0KlZ2heRnldlWpIbDauhnqJ5JKucNE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="385543514"
X-IronPort-AV: E=Sophos;i="6.03,241,1694761200"; 
   d="scan'208";a="385543514"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 13:01:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,241,1694761200"; 
   d="scan'208";a="5413060"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 Oct 2023 13:00:09 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quI9v-0005CC-38;
	Sat, 21 Oct 2023 20:01:19 +0000
Date: Sun, 22 Oct 2023 04:00:53 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:sound/speaker-safety 173/209] checkpatch: ERROR: Macros
 with complex values should be enclosed in parentheses
Message-ID: <202310220318.lEjI3c6W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux sound/speaker-safety
head:   37f4315008c663a55629554adcfcae4e5d88fdc7
commit: b1cedb6dc1a97617d6b39f1350fc3577870f3552 [173/209] macaudio: speaker volume safety interlocks
reproduce: (https://download.01.org/0day-ci/archive/20231022/202310220318.lEjI3c6W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310220318.lEjI3c6W-lkp@intel.com/

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
