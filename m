Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0AF110A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Jun 2023 21:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686432426; x=1717968426;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l/aPG70MsqQsdwikSgs+5Lm7I0XVg/RqlQkWmPp0ZjE=;
  b=lJ1k/HDpk83Ajn8hNkXnkHgUSt9n6W8gNnVMHt7EOpNYJlt1F5KPiNbT
   PkpIdT3V0whIl5wa5w4QqROfBYv2EQLzO2JGOq2jEBxVeQskYycaxrys9
   +SBoqvjIwxtjoj4byEb8pxosYTpyzhnmSoF2iIqhHNlxIyRoPwzGdnHrY
   bOQ6Q0Laget2FH4w2xUVn0SYQtmWmsOnl7tAp/aYFrRBh7WcnbapVTkT4
   wgYYGnbXfMv5+tRTMPPmFl8fudr+a5iZCUuvT/COkj57b2/ukBag0E4Ne
   RCxorOvIgO4spI2TJW+oKZUdOVhjJryVZgCqwjVuoAdXej9IWREftBexH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="421399897"
X-IronPort-AV: E=Sophos;i="6.00,233,1681196400"; 
   d="scan'208";a="421399897"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2023 14:27:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="710737886"
X-IronPort-AV: E=Sophos;i="6.00,233,1681196400"; 
   d="scan'208";a="710737886"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 10 Jun 2023 14:27:03 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q866w-000ARk-2x;
	Sat, 10 Jun 2023 21:27:02 +0000
Date: Sun, 11 Jun 2023 05:26:44 +0800
From: kernel test robot <lkp@intel.com>
To: Baoquan He <bhe@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Zhen Lei <thunder.leizhen@huawei.com>, linux-doc@vger.kernel.org
Subject: [arm64:for-next/kdump 2/2] htmldocs: Documentation/arm64/kdump.rst:
 WARNING: document isn't included in any toctree
Message-ID: <202306110549.ynH2Juok-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/kdump
head:   03dc0e05407f394d4f8b3da8210013fef91e74ff
commit: 03dc0e05407f394d4f8b3da8210013fef91e74ff [2/2] Documentation: add kdump.rst to present crashkernel reservation on arm64
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/commit/?id=03dc0e05407f394d4f8b3da8210013fef91e74ff
        git remote add arm64 https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
        git fetch --no-tags arm64 for-next/kdump
        git checkout 03dc0e05407f394d4f8b3da8210013fef91e74ff
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306110549.ynH2Juok-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/arm64/kdump.rst: WARNING: document isn't included in any toctree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
