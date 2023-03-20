Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932556FA6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Mar 2023 20:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679343257; x=1710879257;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M4HkM8A5T6iNhMWzLvlSZnJqY1L7THJ0q1cesg0TP4U=;
  b=HAzRLgsqiYXNjHbnCcAgpGxD+H8BqcvJIodUg6lLhe5GZ0Ez0vMI0zqJ
   rHSxAWZKnowMaD1TIaimpxyAfu4mhFt9QJRk6e9LwAyv1/RGjaocTQIta
   LZMA9JntSNJc9/h7u7EpMmo66XrMKT3yAiyExSH/gAgRazF3nC71RFenb
   5zC17xUz7G8q6/H7WSKUY4nduO2tV3Dm5GaIKSOwYw7h4lfIach5C+HuM
   NEaDWbvcNz8xtZWSa56LRNXXv9o9Tax1O4hM993Pz33mdm6Yz3BblbcYd
   Vs28mRam0ShnkKLhQbmr69BMCHRCqvR3/AHngyVNVJliNuzJX9RmC765D
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="319168726"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; 
   d="scan'208";a="319168726"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 13:13:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="1010629490"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; 
   d="scan'208";a="1010629490"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 20 Mar 2023 13:13:56 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peLtD-000BHa-1b;
	Mon, 20 Mar 2023 20:13:55 +0000
Date: Tue, 21 Mar 2023 04:13:37 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:pending-fixes 38/188] kismet: WARNING: unmet direct
 dependencies detected for RPCSEC_GSS_KRB5 when selected by NFS_V4
Message-ID: <202303210420.quU07jcI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git pending-fixes
head:   9f7814c09ae60d83e61e7e5782ec16929897b2c9
commit: e57d06527738798039b8e91af762fbd33881b34d [38/188] NFS & NFSD: Update GSS dependencies
config: csky-kismet-CONFIG_RPCSEC_GSS_KRB5-CONFIG_NFS_V4-0-0 (https://download.01.org/0day-ci/archive/20230321/202303210420.quU07jcI-lkp@intel.com/config)
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=e57d06527738798039b8e91af762fbd33881b34d
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next pending-fixes
        git checkout e57d06527738798039b8e91af762fbd33881b34d
        # 1. reproduce by kismet
           # install kmax per https://github.com/paulgazz/kmax/blob/master/README.md
           kismet --linux-ksrc=linux --selectees CONFIG_RPCSEC_GSS_KRB5 --selectors CONFIG_NFS_V4 -a=csky
        # 2. reproduce by make
           # save the config file to linux source tree
           cd linux
           make ARCH=csky olddefconfig

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303210420.quU07jcI-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for RPCSEC_GSS_KRB5 when selected by NFS_V4
   .config:4847:warning: symbol value 'ONFIG_ARCH_MMAP_RND_BITS_MI' invalid for ARCH_MMAP_RND_BITS
   
   WARNING: unmet direct dependencies detected for RPCSEC_GSS_KRB5
     Depends on [n]: NETWORK_FILESYSTEMS [=y] && SUNRPC [=y] && CRYPTO [=n]
     Selected by [y]:
     - NFS_V4 [=y] && NETWORK_FILESYSTEMS [=y] && NFS_FS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
