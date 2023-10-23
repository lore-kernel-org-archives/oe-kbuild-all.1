Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B0221114
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Oct 2023 21:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DCIvOvB+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698095720; x=1729631720;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5WDmscDhe4isnD28UYgHS1Pt5UDipX1BznmlajaLX4E=;
  b=DCIvOvB+/VDUoPZfvhqADVW+ddBlxQeQ47+y/JhzQs8jMMy5fQe8GVT2
   i4zF9V5QTLBQlIjhlkWbTTwGL21Go2Nm9inFOJsYfK5JRnqfxRHVRORR9
   rnB9fnSqfuvz+BBYMtpKu824DwDmisO+ny5uKVEjWkJYkxRC4BAyUpRok
   KOstqHXGNvQb0hxLEoOBTZzXiWzmTvt6uGvvigJtmAXWH9kk8YZ4gLGAm
   ZBIOg2ERr7A21RsC6rfmJoehpBHybyPowhxQdMXpB+V0X2pTtc42RHq4+
   OMwZW7Eik2NMbLsLV/7Z7HZ9iJxvUGNsprK6E1hkIyfCVS+nqo5Rb5jra
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="366273014"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="366273014"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 14:15:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="758252917"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="758252917"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 23 Oct 2023 14:15:16 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qv2GX-0007Ht-2h;
	Mon, 23 Oct 2023 21:15:13 +0000
Date: Tue, 24 Oct 2023 05:14:48 +0800
From: kernel test robot <lkp@intel.com>
To: John Watts <contact@jookia.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:fileBmBKXx 39/125] checkpatch: WARNING: static const
 char * array should probably be static const char * const
Message-ID: <202310240549.Hnl3HlHV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git fileBmBKXx
head:   1174bb53f36e3bbc3c82c5d53affe22b007309f3
commit: 00524a8415aa400567538c0e75a463d517cded7f [39/125] ASoC: wm8782: Constrain maximum audio rate at runtime
reproduce: (https://download.01.org/0day-ci/archive/20231024/202310240549.Hnl3HlHV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310240549.Hnl3HlHV-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:STATIC_CONST_CHAR_ARRAY: static const char * array should probably be static const char * const
#27: FILE: sound/soc/codecs/wm8782.c:27:
+static const char *supply_names[] = {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
