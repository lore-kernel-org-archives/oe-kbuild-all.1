Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A55A747B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 07:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695194617; x=1726730617;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NGwWXjawuDox9zM+LjzLWSBL9Dr7nh/G3B8AKXZHwyM=;
  b=YTyQoS28U0XF7tbJZLatGBK5QN/zng5U99MNzQ865LQsoclNZk+OMEc8
   K5xdPnVrTu9vk8Pz/vESPlpimdCGJqVCgxU360VQO2cyuUgvXLjUYDhne
   POPMF3Z9DK9dBJb5ksZEZIOMSfZVE9oMwfz791g77sXxK03CwhTW1K7Ov
   y4Iyj//qC9kzfMzwLdnwMY7ooAf2IPaH610m2mMr11bpN84fqwtnx+35q
   o5CyQp/Hs0V+uGXqLwiV3ghvytphQ0DFEq4rLC4aPyXstJPDK2aZD+vJk
   Djsuf+6z7UcaBmlSi6tUw5osYWx8YadXporJYj5qSB87GE44zTbS0FujI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="411087356"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="411087356"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 00:23:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="781592235"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="781592235"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 20 Sep 2023 00:23:34 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qirYa-0008Ra-01;
	Wed, 20 Sep 2023 07:23:32 +0000
Date: Wed, 20 Sep 2023 15:23:17 +0800
From: kernel test robot <lkp@intel.com>
To: Max Kellermann <max.kellermann@ionos.com>, Jan Kara <jack@suse.cz>,
	Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Max Kellermann <max.kellermann@ionos.com>,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] inotify: support returning file_handles
Message-ID: <202309201518.s23Ngrnu-lkp@intel.com>
References: <20230919202304.1197654-1-max.kellermann@ionos.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230919202304.1197654-1-max.kellermann@ionos.com>

Hi Max,

kernel test robot noticed the following build errors:

[auto build test ERROR on jack-fs/fsnotify]
[also build test ERROR on linus/master v6.6-rc2 next-20230920]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Max-Kellermann/inotify-support-returning-file_handles/20230920-042458
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git fsnotify
patch link:    https://lore.kernel.org/r/20230919202304.1197654-1-max.kellermann%40ionos.com
patch subject: [PATCH] inotify: support returning file_handles
config: powerpc64-randconfig-002-20230920 (https://download.01.org/0day-ci/archive/20230920/202309201518.s23Ngrnu-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309201518.s23Ngrnu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309201518.s23Ngrnu-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc64-linux-ld: warning: discarding dynamic section .glink
   powerpc64-linux-ld: warning: discarding dynamic section .plt
   powerpc64-linux-ld: linkage table error against `exportfs_encode_inode_fh'
   powerpc64-linux-ld: stubs don't match calculated size
   powerpc64-linux-ld: can not build stubs: bad value
   powerpc64-linux-ld: fs/notify/inotify/inotify_fsnotify.o: in function `.inotify_handle_inode_event':
>> inotify_fsnotify.c:(.text+0x2f4): undefined reference to `.exportfs_encode_inode_fh'
>> powerpc64-linux-ld: inotify_fsnotify.c:(.text+0x560): undefined reference to `.exportfs_encode_inode_fh'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
