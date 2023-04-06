Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6903B2F3A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Apr 2023 22:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680821366; x=1712357366;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wn9GOc5k2mKwaVhqQehqkBHzZT6p9PNx/YpZAvLEs5U=;
  b=C869dCVWs9bH3WBBhd8FtP0DCSGTXNgOjXuT8YR7E4d/I3SdhJlZgKHz
   j7E60P8G6+rzbPnoS5PWZbtNigFQIUffQDLvJQvnHcGaT9uMIklNcqEGA
   acWalBGWijEb/6DF1pHbaTh3MLeOs6SywqQTotZ3QwtibFkuYhj2cbzeW
   ZAYjcOBOwgNh9nmEuIKY8vIG9n8ff8kWjkr5VnhUdwhttEGq/57TONsMi
   AgEY1NZ6VflDc60vQJ+wNbzxr8Du3iHnl8PiUuaEVBOwf2DXUVWVI8FC+
   /vTEmSpcaLtSWTGAriCZcWwd6bkNp2ZFoiAnO0nx2jrZr+Mg6EfSWxN06
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="326932087"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="326932087"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 15:49:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="719869072"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; 
   d="scan'208";a="719869072"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 06 Apr 2023 15:49:22 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkYPs-000Rsu-2P;
	Thu, 06 Apr 2023 22:49:16 +0000
Date: Fri, 7 Apr 2023 06:48:59 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Coddington <bcodding@redhat.com>, linux-nfs@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Anna.Schumaker@netapp.com,
	Olga.Kornievskaia@netapp.com
Subject: Re: [PATCH 2/6] NFS: rename nfs_client_kobj to nfs_net_kobj
Message-ID: <202304070607.zNXFIg0W-lkp@intel.com>
References: <75aec6f877a89c63478073861cf277bbfcb90453.1680786859.git.bcodding@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75aec6f877a89c63478073861cf277bbfcb90453.1680786859.git.bcodding@redhat.com>

Hi Benjamin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on trondmy-nfs/linux-next]
[also build test WARNING on linus/master v6.3-rc5 next-20230406]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Coddington/NFS-rename-nfs_client_kset-to-nfs_kset/20230406-221247
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
patch link:    https://lore.kernel.org/r/75aec6f877a89c63478073861cf277bbfcb90453.1680786859.git.bcodding%40redhat.com
patch subject: [PATCH 2/6] NFS: rename nfs_client_kobj to nfs_net_kobj
config: i386-randconfig-s001-20230403 (https://download.01.org/0day-ci/archive/20230407/202304070607.zNXFIg0W-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/27e42c94f90782f5d27b8de8e18d701e99764a03
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Benjamin-Coddington/NFS-rename-nfs_client_kset-to-nfs_kset/20230406-221247
        git checkout 27e42c94f90782f5d27b8de8e18d701e99764a03
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash fs/nfs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304070607.zNXFIg0W-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/nfs/sysfs.c:20:16: sparse: sparse: symbol 'nfs_net_kobj' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
