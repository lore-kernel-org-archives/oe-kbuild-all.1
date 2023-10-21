Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90051C286
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Oct 2023 19:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RJTHKKEK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697917823; x=1729453823;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jk1n9oXi0lOjVYYa+caLUoy0pDNXrEDrI3fQmyaPKLo=;
  b=RJTHKKEKlJPQjDhYGrZxx+UCp+Q3fUgRvS+1mIEDnkTcj5I3Hvu9AxfL
   SmeGKiye3qLubGyUBF8GKBP7UrCyi8WqOMowl+9f2hXZs0ABBd6UWmiPn
   0VIQ2xOdxmVExYcJTNn/WlQSYXMLc+/Mb6Vxcs1rmT6Ojw/daCiWgk3fT
   9r78WOuU4P+Y/czZxSUfvQxZibKQdQq/bgUtQwtK+fejwkGuzX6WaNcDc
   CaTkdlre81wK0XSsvqmtPn+Tf4W3jCevOeC75VOSj4emcPElCI2DpiiXh
   Rfph4PY0grRL+t3idK6bIf5OVReifoHkT1JsnyiVeikE1hoxNGEtZ4hTL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="366885776"
X-IronPort-AV: E=Sophos;i="6.03,241,1694761200"; 
   d="scan'208";a="366885776"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 12:50:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="787103654"
X-IronPort-AV: E=Sophos;i="6.03,241,1694761200"; 
   d="scan'208";a="787103654"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 21 Oct 2023 12:50:21 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quHzH-0005Bs-2F;
	Sat, 21 Oct 2023 19:50:19 +0000
Date: Sun, 22 Oct 2023 03:50:10 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:sound/speaker-safety 171/209] checkpatch: WARNING: else
 is not generally useful after a break or return
Message-ID: <202310220309.WhZX5pjH-lkp@intel.com>
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
commit: 2f74083a4b8ef3f2b336d0c8358e71b86eff39fe [171/209] ASoC: macaudio: Sense improvements
reproduce: (https://download.01.org/0day-ci/archive/20231022/202310220309.WhZX5pjH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310220309.WhZX5pjH-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:UNNECESSARY_ELSE: else is not generally useful after a break or return
#54: FILE: sound/soc/apple/macaudio.c:506:
+			return 0;
+		} else {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
