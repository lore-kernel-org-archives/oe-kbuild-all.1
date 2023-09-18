Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3ED27EF4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Sep 2023 20:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695068681; x=1726604681;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cD9aWdh0g+KCQJtJTKordl0I6iSumVWkrBzStxTXKAw=;
  b=ZTf//KenbQYfzWIzDEKBNwisjafMceSit2lFVFF/4Ou/NZE3tK703E7P
   l/uh5FtvnB+HfJNv2E3ktn/WcjjXDf9mpsy23OKA5G5yZDKGseDb8m8PK
   PV2ZAnuE0y7AZZ53ntzLxwm2yi7h1/i2k8iR99hmzcpG/MlhSEDBNR0Oa
   688ZY8wbBGjQIRfnFAX14iQu6kONWXKhajXYxxmylfh2uGous4yBhMz0g
   zO3I/ZvVbKD+2Bq1WSEegrM6fNadQ7CGTaqy8ekjoq9Hsa1cotXfl9A/M
   RkeysCiNFIw6UgjeHG/4UnOywcUlVNYsLlLVDmvHWbU7I96SB9sZtyMhQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="466110216"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; 
   d="scan'208";a="466110216"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 13:24:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="775263452"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; 
   d="scan'208";a="775263452"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 18 Sep 2023 13:24:36 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qiKnJ-0006RF-2x;
	Mon, 18 Sep 2023 20:24:33 +0000
Date: Tue, 19 Sep 2023 04:24:01 +0800
From: kernel test robot <lkp@intel.com>
To: Max Kellermann <max.kellermann@ionos.com>, jack@suse.cz,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, amir73il@gmail.com,
	max.kellermann@ionos.com
Subject: Re: [PATCH 4/4] arch: register inotify_add_watch_at
Message-ID: <202309190447.Md4xeYhu-lkp@intel.com>
References: <20230918123217.932179-4-max.kellermann@ionos.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230918123217.932179-4-max.kellermann@ionos.com>

Hi Max,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/asm]
[also build test ERROR on linus/master v6.6-rc2]
[cannot apply to jack-fs/fsnotify arm64/for-next/core next-20230918]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Max-Kellermann/inotify_user-move-code-to-do_inotify_add_watch/20230918-203410
base:   tip/x86/asm
patch link:    https://lore.kernel.org/r/20230918123217.932179-4-max.kellermann%40ionos.com
patch subject: [PATCH 4/4] arch: register inotify_add_watch_at
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20230919/202309190447.Md4xeYhu-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230919/202309190447.Md4xeYhu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309190447.Md4xeYhu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> or1k-linux-ld: arch/openrisc/kernel/sys_call_table.o:(.data+0x718): undefined reference to `sys_inotify_add_watch_at'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
