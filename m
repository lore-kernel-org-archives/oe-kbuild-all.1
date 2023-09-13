Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB2529CA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Sep 2023 21:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694640125; x=1726176125;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=COKddad0tt+++z2/qHjchU04NwAOeYhSHVwx313PKOo=;
  b=BGilm204qWXZPa9uPS30amK4j4Qmrmh3rEYubj+AVxidCEczA9YcWwOk
   nhYAK5I8ofdQUGDggE4UqtWQACpa/uDKsrbLs/ijZyMkNf5sXnjuVRWf+
   7wSyIfdEXDea1ZMKy2p2+DP2e6/bB8jnh+KCjdauZfke6ZtiT9ut65m8t
   YfPeyQzB+yv3xgRKUKFPl8s1qprvtISdLFj+LW1atStx+XddsPs3fgCXS
   hPvr5evE0eCF7xnXQM9pBz65/d6I5qWnBxhp3w7Omf6wdcJXAep0bG9i/
   Xz3BSGISTwBQODApmYj87XU3knHQrmPFyq5Rzw3Cc9ggwfKnHoyb5+str
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="378713089"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="378713089"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 14:21:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="887498296"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="887498296"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 13 Sep 2023 14:21:27 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgXJ6-0000gB-07;
	Wed, 13 Sep 2023 21:21:56 +0000
Date: Thu, 14 Sep 2023 05:21:07 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/641 3364/25020] htmldocs:
 Documentation/security/keys/secure-key.rst:43: WARNING: Literal block
 expected; none found.
Message-ID: <202309140543.XjMsJNSl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/641
head:   ba2847ffebda28ba7be1b96bb506bfe5b67c856e
commit: e5f4442d1eb85bbfd43870406eed14d8e09a13aa [3364/25020] security/keys/secure_key: Adds the secure key support based on CAAM.
reproduce: (https://download.01.org/0day-ci/archive/20230914/202309140543.XjMsJNSl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309140543.XjMsJNSl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/security/keys/secure-key.rst:43: WARNING: Literal block expected; none found.
>> Documentation/security/keys/secure-key.rst: WARNING: document isn't included in any toctree

vim +43 Documentation/security/keys/secure-key.rst

    42	
  > 43	1. Create the secure key with name kmk-master of length 32 bytes::
    44	
    45		$ keyctl add secure kmk-master "new 32" @u
    46		46001928
    47	
    48		$keyctl show
    49		Session Keyring
    50		1030783626 --alswrv      0 65534  keyring: _uid_ses.0
    51		 695927745 --alswrv      0 65534   \_ keyring: _uid.0
    52		  46001928 --als-rv      0     0       \_ secure: kmk-master
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
