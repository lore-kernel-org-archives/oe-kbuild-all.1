Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA09253BB
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Feb 2023 19:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675712235; x=1707248235;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q3xZ7OM/uN2gRQ0bzjgjs8pO1hanEXsmXRHXnFq+bws=;
  b=czL32Ojv7apktkWj1xVgVndV60debINITRHxjvZL2ozOdOy/VCiTyRwv
   jWFXlBQb/7gMzw8nqn6XPAqBEn32zWgiRAMyWsgASxlONG0gwOr1qbHKS
   y0zrk6QAnT4/pcORJxPww4EyrWamPDkHGHc5dktuaFvj4Hf4UsSSuj50+
   rTv6DGNxfvqjmnkK9m0OgkHy7a25xofH3UfezEsS/UxaAR9rI2xDVaHds
   NQcTd3FDdICLFZB4wSfGzj0gvjS8AaBkKs0NXd1SlprruReV5WaZjJOM/
   hxqSUDzZFrHe6kKXnpQ2fLguHUOmkSWJvRSD5adL45HwTy1ICrnh+MSZS
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="391693018"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="391693018"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 11:37:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="809238111"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="809238111"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 06 Feb 2023 11:37:11 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pP7Ic-0002kC-1W;
	Mon, 06 Feb 2023 19:37:10 +0000
Date: Tue, 7 Feb 2023 03:36:54 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: oe-kbuild-all@lists.linux.dev,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [mchehab-media-next:master 63/135] htmldocs: Warning:
 Documentation/admin-guide/kernel-parameters.txt references a file that
 doesn't exist: Documentation/admin-guide/media/meye.rst
Message-ID: <202302070341.OVqstpMM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/mchehab/media-next.git master
head:   14cd15e7a1e2a321f6184124bee95560035db4ef
commit: ba47652ba65523ccadac3f8d50dc0e0d560477b2 [63/135] media: meye: remove this deprecated driver
reproduce:
        git remote add mchehab-media-next git://linuxtv.org/mchehab/media-next.git
        git fetch --no-tags mchehab-media-next master
        git checkout ba47652ba65523ccadac3f8d50dc0e0d560477b2
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Warning: Documentation/admin-guide/kernel-parameters.txt references a file that doesn't exist: Documentation/admin-guide/media/meye.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
