Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F92FBEE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Oct 2023 17:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HEcI0GcE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697909479; x=1729445479;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O/JsK+d6nql5FoVlecIvW5WFgGKCubEAxVgqzuPEGiw=;
  b=HEcI0GcE88jhO720fafl7X3cSphqFJMDvDSzR7iouQrvk1Qm8A/oiYeR
   QzK/9y5jqaWRoj0ck6YBYrkkpgW2Xeh3b0abjFxxP+Qs1ecRmmbtVRh6k
   XeT/cVfxRAbzM+9LDhyjbdMVlgOC+v26QcEaZ6vYdz8uM8fa8mtc3KdPG
   fbudvhlwMq0DXpyBoyisb2Rhx6hQn8o35YnAiqlx1CC0ek9cJv6K3zZ3U
   XByY5GpiIWa2Ve8kor1TRiHxQe8vA8l3Lx2uRKqAJUDAL2GVAzCI6uvlh
   W9U+ulNTAIvAQfhnV1dcPORuJTZzq7D51OtFHD0UxyzEQWgDt1g5+6lyF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="417776924"
X-IronPort-AV: E=Sophos;i="6.03,241,1694761200"; 
   d="scan'208";a="417776924"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 10:31:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="874244200"
X-IronPort-AV: E=Sophos;i="6.03,241,1694761200"; 
   d="scan'208";a="874244200"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 21 Oct 2023 10:31:17 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quFoh-00055U-0r;
	Sat, 21 Oct 2023 17:31:15 +0000
Date: Sun, 22 Oct 2023 01:31:10 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:sound/speaker-safety 143/209] checkpatch: ERROR:
 trailing whitespace
Message-ID: <202310220112.h9td5GRb-lkp@intel.com>
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
commit: d106e644fae9ac246d94464c8618d31520edc17a [143/209] ASoC: macaudio: Tune DT parsing error messages
reproduce: (https://download.01.org/0day-ci/archive/20231022/202310220112.h9td5GRb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310220112.h9td5GRb-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:TRAILING_WHITESPACE: trailing whitespace
#127: FILE: sound/soc/apple/macaudio.c:373:
+^I^I^I/* $

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
