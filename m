Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2C7266B8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 15:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gLkTmyCa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697124684; x=1728660684;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nEdVLRLqQq613YQsCfpq7i8a7CaghaZ2Trfoo+Y53dU=;
  b=gLkTmyCa7O+sIh5M92y8mwm0T9QEdyWoT0Wv1O9GIjBuCXlhB8u5M7Wy
   XOjc/bSW2G86ZwEyr9IX/VX6JiFRQY6MgGB/S/eWgqBHCvZaLxs0vS8QD
   +C5S+6UYtJBBygJVB72TtF0jfAZdtRqwJm3ajw7DnZUi8gfelOa24USG9
   CTBpeFvyGeRxG4la/YV0zbE4Vq51PuSe+8DeeRjMlAKksL5GGkppWLXhC
   e0Z6VGVlo0EixPXw4n7xuKujCgCoKRURrkXz6/2CdARcFBR6nO8084q5g
   3wQzHgxS5b2+OAmdV1HRWi+nZ62AWHiD8P+BYKtOYL3YBNHIg65YiFQD4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="375307240"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="375307240"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 08:31:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="878152318"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="878152318"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 12 Oct 2023 08:31:23 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqxei-0003ZV-2E;
	Thu, 12 Oct 2023 15:31:20 +0000
Date: Thu, 12 Oct 2023 23:31:18 +0800
From: kernel test robot <lkp@intel.com>
To: John Watts <contact@jookia.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:filedwL67x 39/103] checkpatch: WARNING: static const
 char * array should probably be static const char * const
Message-ID: <202310122332.uLWYKwIY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git filedwL67x
head:   41cb1126bed152f7679417834ad7ea39f2252dfb
commit: 00524a8415aa400567538c0e75a463d517cded7f [39/103] ASoC: wm8782: Constrain maximum audio rate at runtime
reproduce: (https://download.01.org/0day-ci/archive/20231012/202310122332.uLWYKwIY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310122332.uLWYKwIY-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:STATIC_CONST_CHAR_ARRAY: static const char * array should probably be static const char * const
#27: FILE: sound/soc/codecs/wm8782.c:27:
+static const char *supply_names[] = {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
