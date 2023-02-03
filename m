Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C289B29A8
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Feb 2023 15:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675437848; x=1706973848;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e6fUOGrcxCOIclhMe+Zd9Sk8y95njkUMVgCVCpf+k3s=;
  b=Nfn865nHzLF5NqsSTquYSvHxRgAsAxSm/KiO8YiYOpdmh5hwqL2Gtakm
   UGGCzDo+AnY0vpg6oWU/wetkUNyyriAdBWISe+jXvvOBVNKq7Q1ME/xJn
   edkXMeCYDnztMPwVFNZG7IkeuUyUyVPTUhnh69INLdxGYSdEHsDOCCb8I
   cwmJ527g1KMUSYh/DNkYfeqEQ5FN1Ld9vpiwgFGeCBBhYQD7FcJkTwWH3
   GsnxhrBAE8QQEyYLJUEOtXnXjmNsbCXHjpxxLR4qW7zguz4WzZkVzR0fY
   U0DgQx0hHKk5gRXL8mrepB1ZPTgQ8DnpWtwmcd7DD5cvuhXZGK+jISrLJ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="330900510"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; 
   d="scan'208";a="330900510"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2023 07:24:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="696186462"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; 
   d="scan'208";a="696186462"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 03 Feb 2023 07:24:05 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNxv2-0000ar-23;
	Fri, 03 Feb 2023 15:24:04 +0000
Date: Fri, 3 Feb 2023 23:23:13 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/android14-5.15 3/3]
 htmldocs: Warning: Documentation/ABI/testing/dm-bow references a file that
 doesn't exist: Documentation/device-mapper/dm-bow
Message-ID: <202302032359.f3j1rOOl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android14-5.15
head:   2069048a7398dd0dfde60c2e9b0d720c1e62f87e
commit: 7a7986f840b09a4a80a6c042bb9316b71ef37b61 [3/3] ANDROID: dm-bow: Add ABI documentation
reproduce:
        # https://github.com/ammarfaizi2/linux-block/commit/7a7986f840b09a4a80a6c042bb9316b71ef37b61
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android14-5.15
        git checkout 7a7986f840b09a4a80a6c042bb9316b71ef37b61
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Warning: Documentation/ABI/testing/dm-bow references a file that doesn't exist: Documentation/device-mapper/dm-bow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
