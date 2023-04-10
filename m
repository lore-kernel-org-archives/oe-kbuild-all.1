Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44AB15AE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Apr 2023 02:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681093685; x=1712629685;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EjOmyNjwv7deSwbM+hWUaXmedxB8gZSoYSkOsjZnLDU=;
  b=BB0NZ7uyrkqSG8vuKQpWwVV33uJourtGyboINFpRl698fxXWLxXmXMgW
   GZtwvScSKagvEmh18qeGK4SItoC/Hl1hwMSaayZfHFuL9q4KHR7tN9pEq
   gVsY5JSMSIugYchK60yIjNQ1evl1R5EqnmCdlcEQhUhmLPyfjJWSFnG0b
   oyvCtN38/NaSna0O4ngh1zYYejgIMH28TPaNVHbdPNEQnULDycKZpWgSV
   E2aATo/X4FuJNSkKUAmEv1yZ/cYT3m2RAgl4npgUoJmSSVm2oCpQ6jea+
   WaiWRHgkKAWZQe8cyyY7zw9csC5HpC0ulQEov6J0/RDMTmF2zwhLIEEzI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="322907007"
X-IronPort-AV: E=Sophos;i="5.98,332,1673942400"; 
   d="scan'208";a="322907007"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2023 19:28:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="757323331"
X-IronPort-AV: E=Sophos;i="5.98,332,1673942400"; 
   d="scan'208";a="757323331"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 09 Apr 2023 19:28:03 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1plhGF-000Uwt-0O;
	Mon, 10 Apr 2023 02:28:03 +0000
Date: Mon, 10 Apr 2023 10:27:26 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [asahilinux:bits/005-maintainers 2/3] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/devicetree/bindings/spi/apple,spi.yaml
Message-ID: <202304101025.Vpjnwodr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/005-maintainers
head:   332d1bd2c6f629438bc0e1e9a2c657a98159831a
commit: 9cf611bacc5136da75a47371082efa566cbcc866 [2/3] MAINTAINERS: Add apple-spi driver & binding files
reproduce:
        # https://github.com/AsahiLinux/linux/commit/9cf611bacc5136da75a47371082efa566cbcc866
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/005-maintainers
        git checkout 9cf611bacc5136da75a47371082efa566cbcc866
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304101025.Vpjnwodr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/spi/apple,spi.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
