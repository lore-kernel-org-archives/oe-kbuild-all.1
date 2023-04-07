Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B26EBC
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 03:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680838587; x=1712374587;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YMdsQ2ycM87FVb3mQbRikcYVOun61otSn68YylUrHzo=;
  b=jIqEBvhbhq+wBCEb2dn59bY3JOZa5rKOdzkuWNuwSHnCVYNZNhPZw5Fn
   p8CAJWBm0PK4hd2DffN7tvs/ZTXkKlcNE7mc90T1HGFnuit9APwDnrTFz
   btn8cqKQGKPIUiu2VwQFOLvPBfooOHz+Rf0wlxQTRyUwkyoCHuZw1Unxa
   KV4QeNsNumLO1Y/UGePDkUD/t9gvEbRTRRKSi6e7eO4lLNu41fu+Dkkco
   FTPPCFxuAZg6L1ly4ldEnvmceSjTE1lKm/kevD+xDXEMbKkEwskQ0ci41
   +xDy+Ya2uod2ziSyiyn3AwgjNfefxn4fuVPDtXSN7xURQ6KGIQ4ZHD7Lg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="344690765"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; 
   d="scan'208";a="344690765"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 20:36:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="861661844"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; 
   d="scan'208";a="861661844"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 06 Apr 2023 20:36:26 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkctl-000S5S-0x;
	Fri, 07 Apr 2023 03:36:25 +0000
Date: Fri, 7 Apr 2023 11:36:16 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Riesch via B4 Relay <devnull+michael.riesch.wolfvision.net@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 1/4] media: v4l2-ctrls: add lens group status
 controls for zoom and focus
Message-ID: <202304071123.OGjDUAln-lkp@intel.com>
References: <20230406-feature-controls-lens-v1-1-543189a680de@wolfvision.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230406-feature-controls-lens-v1-1-543189a680de@wolfvision.net>

Hi Michael,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on fe15c26ee26efa11741a7b632e9f23b01aca4cc6]

url:    https://github.com/intel-lab-lkp/linux/commits/Michael-Riesch-via-B4-Relay/media-v4l2-ctrls-add-lens-group-status-controls-for-zoom-and-focus/20230406-223922
base:   fe15c26ee26efa11741a7b632e9f23b01aca4cc6
patch link:    https://lore.kernel.org/r/20230406-feature-controls-lens-v1-1-543189a680de%40wolfvision.net
patch subject: [PATCH RFC 1/4] media: v4l2-ctrls: add lens group status controls for zoom and focus
reproduce:
        # https://github.com/intel-lab-lkp/linux/commit/c1630c0aaed9c37193a2b0f4ada0f4e5da4c641e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Michael-Riesch-via-B4-Relay/media-v4l2-ctrls-add-lens-group-status-controls-for-zoom-and-focus/20230406-223922
        git checkout c1630c0aaed9c37193a2b0f4ada0f4e5da4c641e
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304071123.OGjDUAln-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-ctrl-type-lens-status (if the link has no caption the label must precede a section header)

vim +6 Documentation/output/videodev2.h.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
