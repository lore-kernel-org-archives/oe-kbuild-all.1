Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9BD3C3C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Jul 2023 23:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688427328; x=1719963328;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2ZlY+49QfWrBgdwzsDlUsB/gbdCd9PLYYjEmyyysUqg=;
  b=kFX+pgIEJ2WytIIng/MvZZaTFOMAud9QYPrZ6Ae4yq9voqcTCz08HOzK
   JvrrbX7qPRoqHfM/bHxHNHxHIhBxF8KGWcdDmIFQLJ9g7FL0ailFhpvjf
   qMYSeFRL9Ncv81hUTqSZXQpQlQUJlNaEAeypiJjR/pX3ViVAxHlMeUse1
   zVOUJqROBVWihy/0X51SogpGdgf/8CivScOFSN21VEbYOLtRewkrNr3NG
   vtVAKcarOIx+Bu8kPremkmDgXr8pGhSnnLf8Hy90bjpMTsuqQwEVksi7D
   kJr8LXdElQYWEc9+MZGVn0n6o9cx8Iq/oIb/g2+Se3bRSDVKa3/Xn+NQj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="361845828"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="361845828"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 16:35:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="784027888"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="784027888"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 03 Jul 2023 16:35:26 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGT4n-000Hhf-34;
	Mon, 03 Jul 2023 23:35:25 +0000
Date: Tue, 4 Jul 2023 07:34:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.10 20/43] htmldocs:
 Documentation/output/videodev2.h.rst:6: WARNING: undefined label:
 v4l2-pix-fmt-mm21 (if the link has no caption the label must precede a
 section header)
Message-ID: <202307040725.kp04BV3v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.10
head:   6dd3ac3c941ba88059c44cc8c124a4c8e3619ab0
commit: 092d2bd3a36b02a7571471e787fe0f33916de91e [20/43] UPSTREAM: doc: media: Document MM21 tiled format
reproduce: (https://download.01.org/0day-ci/archive/20230704/202307040725.kp04BV3v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307040725.kp04BV3v-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-mm21 (if the link has no caption the label must precede a section header)

vim +6 Documentation/output/videodev2.h.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
