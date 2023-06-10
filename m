Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCE3C8E3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Jun 2023 15:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686412668; x=1717948668;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v+y/418MuaBoO3fZpIbAeLVvmSI/899QvJacUVsaBkA=;
  b=KNQtVuAeDJy/iiL1LyI9L61S7RXMAbJm+89cHMhAoQIrZcKdGls22rvT
   G9RQwtn7dYTGkPSp0j3E+JLONteX2htFFSWpu1KYRY/zbQ6EWg127QfWz
   Wv66k2joeE5e+i/HKF88hBQQf9OusHqdCCeMs75Mj3vn4qkysklvV7KaU
   WABQfZlb7Uj1neQNjvxfeapusooiVOzciCFXNHU7EAfeW7b/Vr2VhvKLM
   xs2z5xqNOH6Sp5f0c6Pwt+Ihvp//XKiJD74HcxodXcJRrEQiSPZ5l10h4
   jvknVfMiQVNHrKW1Ypo/Ppa7rIabzbrjnEuYWrn41q5hWiox3D3wBMyqy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="338143859"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="338143859"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2023 08:57:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="688092488"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="688092488"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 10 Jun 2023 08:57:46 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q80yH-000ABu-1J;
	Sat, 10 Jun 2023 15:57:45 +0000
Date: Sat, 10 Jun 2023 23:57:36 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [dhowells-fs:crypto-krb5 1/19] htmldocs:
 Documentation/crypto/krb5.rst: WARNING: document isn't included in any
 toctree
Message-ID: <202306102318.PMcNQCst-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git crypto-krb5
head:   5b181cb5852b03279d830e9d98cdc20ae1ca6e8e
commit: 869538ece641e93491db66d965ab576bb551c185 [1/19] crypto/krb5: Add API Documentation
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/commit/?id=869538ece641e93491db66d965ab576bb551c185
        git remote add dhowells-fs https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
        git fetch --no-tags dhowells-fs crypto-krb5
        git checkout 869538ece641e93491db66d965ab576bb551c185
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306102318.PMcNQCst-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/crypto/krb5.rst: WARNING: document isn't included in any toctree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
