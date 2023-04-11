Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F5017DB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Apr 2023 23:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681255834; x=1712791834;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=17DSHfO+a7l1aT8Erip//1ZjO27TPmM67AQ2Lt2eR+8=;
  b=RuhqfsEFolVErzxK+vhhybXRppb19L7a5V24Ct1ZZovUjFExLbZGmWYZ
   lnL38mSgM/hPS8czct4ZURvZuOjkZXNazgtzKu7FePsKT/6oAedNL9C+e
   bh49NbKFjMATiLPygknqoQxJdGtDhb5TaIbij6DZ2mBihDUeNSKYHHtGd
   dK4TpmA42GHURtQo0taI7hIW3sdSXbeT+wMF3Q5GpoM5TDztWhljKMduF
   9UriWUN98Bvgoip74uILB8x15jMFyZECvxG8kNaEuIO3buSZTAkHyLF3m
   AJQUsSegR1nzsz5LAHhHWHayihjKV4EHFXKWPFoj83kS5I5um9lvwmNrR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="327862835"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="327862835"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 16:30:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="1018544718"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="1018544718"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 11 Apr 2023 16:30:33 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmNRY-000WoP-0N;
	Tue, 11 Apr 2023 23:30:32 +0000
Date: Wed, 12 Apr 2023 07:30:05 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:sendpage-1 18/18] ERROR: modpost:
 "skb_splice_from_iter" [net/unix/unix.ko] undefined!
Message-ID: <202304120754.136ChTTG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git sendpage-1
head:   bba6f6c58ac9c8f61b66951059e4060b61cbd46b
commit: bba6f6c58ac9c8f61b66951059e4060b61cbd46b [18/18] af_unix: Support MSG_SPLICE_PAGES
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230412/202304120754.136ChTTG-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/commit/?id=bba6f6c58ac9c8f61b66951059e4060b61cbd46b
        git remote add dhowells-fs https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
        git fetch --no-tags dhowells-fs sendpage-1
        git checkout bba6f6c58ac9c8f61b66951059e4060b61cbd46b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304120754.136ChTTG-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "skb_splice_from_iter" [net/unix/unix.ko] undefined!
ERROR: modpost: "skb_splice_from_iter" [net/ipv6/ipv6.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
