Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6CA3D971
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 20:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U2Kiu0y9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697144000; x=1728680000;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AH3jIX+7Lc4Jhjj7uz+i4bHEvdvHQTwLNtLjx5Wu5CA=;
  b=U2Kiu0y9hNE88rjFizHXQ+0+bDnT0nUHjjVQzrZMNm4izr9B1Ac1vhpD
   5XjHFIdMq7V3XmVj2SRqoNem+Kk6fj3cPwjYx9Qc+kld/17clatKiIZHm
   Lni4VTwcXbNFs7nkwLiKngvZAGor4Ve9EN/FnSD38wPN8lNnFkGnnsY12
   nIXM/OA+Dygcxiodi6lSvxznQDSl1KKMDJjaafO9Z6aAmNBSwQg/J9vBe
   5JvDtzgJo58odlgb+78tQqTbKc0+wxDxowwZUuzHp27PEcKHfmvoVoa9/
   cy5FgNzE3OtgzDh+dXNiQj7WgzQt39cn4VXjryGFngguEm6DylqhsEdtf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="370107659"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="370107659"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 13:53:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="704331255"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="704331255"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 12 Oct 2023 13:53:18 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qr2gC-0003sL-11;
	Thu, 12 Oct 2023 20:53:13 +0000
Date: Fri, 13 Oct 2023 04:52:37 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:sound/speaker-safety 177/196] checkpatch: ERROR: Macros
 with complex values should be enclosed in parentheses
Message-ID: <202310130451.3WF47N0D-lkp@intel.com>
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
commit: ebb178f1e6af14b676c92324c80d8204cfe71da8 [177/196] macaudio: speaker volume safety interlocks
reproduce: (https://download.01.org/0day-ci/archive/20231013/202310130451.3WF47N0D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310130451.3WF47N0D-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#19: FILE: sound/soc/apple/macaudio.c:58:
+#define SPEAKER_MAGIC_VALUE (s32)0xdec1be15

WARNING:LINE_SPACING: Missing a blank line after declarations
#116: FILE: sound/soc/apple/macaudio.c:246:
+			const struct macaudio_limit_cfg *limit = &ma->cfg->limits[i];
+			if (!limit->match)

ERROR:CODE_INDENT: code indent should use tabs where possible
#191: FILE: sound/soc/apple/macaudio.c:321:
+        struct macaudio_snd_data *ma = container_of(to_delayed_work(wrk),$

WARNING:IF_0: Consider removing the code enclosed by this #if 0 and its #endif
#299: FILE: sound/soc/apple/macaudio.c:1163:
+#if 0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
