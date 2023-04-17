Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22AA1C2C0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Apr 2023 03:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681703555; x=1713239555;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EDcKZrMDQYEpqqjTe35hAtK+IIvfLD2IaEuc4+nsdes=;
  b=Z93hzu9507IG2yX0wqaJIj62MQ4ED9Q4TM/LEPQ8SI8fbVTTwS/IZxlE
   0UGc1iIiPDVbyfkBvbVk4J5lsy5k1/e4oqNF67QPiv8Y2pL4ohZdGx6sc
   dxrQDz5Wdh9hpC59o0A2dpGGkA9hgadGWIVRBOwD6vdyTWMKEUkguQG6H
   +Xsu67fqRTstXCvIEK7vbQhfa5Ali8psOmtlwX2EYuhBt2gSDaDtt7N0i
   3/eARnhc8MuKZBopDh/BX+V9baxNtjK7FjrEalLcSfxVjWVR/w0RySjXV
   5tWkoIhXejy3MxoXbQtyo6eGcz6RhthbIyFbG1CSeufc1F1ivEP9cRolV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="407687687"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; 
   d="scan'208";a="407687687"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2023 20:52:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="667967036"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; 
   d="scan'208";a="667967036"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 16 Apr 2023 20:52:33 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poFuq-000c6b-1W;
	Mon, 17 Apr 2023 03:52:32 +0000
Date: Mon, 17 Apr 2023 11:51:44 +0800
From: kernel test robot <lkp@intel.com>
To: NeilBrown <neilb@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH/RFC] VFS: LOOKUP_MOUNTPOINT should used cached info
 whenever possible.
Message-ID: <202304171114.ZGYokKL6-lkp@intel.com>
References: <168168683217.24821.6260957092725278201@noble.neil.brown.name>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <168168683217.24821.6260957092725278201@noble.neil.brown.name>

Hi NeilBrown,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on viro-vfs/for-next]
[also build test WARNING on vfs-idmapping/for-next linus/master v6.3-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/NeilBrown/VFS-LOOKUP_MOUNTPOINT-should-used-cached-info-whenever-possible/20230417-071435
base:   https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git for-next
patch link:    https://lore.kernel.org/r/168168683217.24821.6260957092725278201%40noble.neil.brown.name
patch subject: [PATCH/RFC] VFS: LOOKUP_MOUNTPOINT should used cached info whenever possible.
config: x86_64-randconfig-s021 (https://download.01.org/0day-ci/archive/20230417/202304171114.ZGYokKL6-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/7084d22d194837a61c41fb56ab65999c32b143bd
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review NeilBrown/VFS-LOOKUP_MOUNTPOINT-should-used-cached-info-whenever-possible/20230417-071435
        git checkout 7084d22d194837a61c41fb56ab65999c32b143bd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304171114.ZGYokKL6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/namei.c:501:5: sparse: sparse: symbol 'inode_permission_mp' was not declared. Should it be static?
   fs/namei.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:804:9: sparse: sparse: context imbalance in 'leave_rcu' - unexpected unlock
   fs/namei.c:2374:19: sparse: sparse: context imbalance in 'path_init' - different lock contexts for basic block

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
