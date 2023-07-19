Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C241095B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 09:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689757821; x=1721293821;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8DGKiig9+fzzh0JkgD62R+v9YoG7Xf6THVrk988BiqM=;
  b=Qztn4AeSt+6HNuQGO+mDfB7BRUGOztCTZCUYt6Acfwy8TCgc3050L2Wp
   OXWyqjMaYQN4DtQFamVts4kutEVmDVOKxOZXgK+Yi1vTqTkDTtGypIPqW
   OtXl/umN7CZLHzOexh9U4TgX9C9Xbil9DF935uRw4+VKVUngcuZINzxyM
   FYg4ivOaleqZKNqWUHz4ue2d17Si9uxa69QgZ9P2F0xmTMU2bIet+br6P
   umJRfZ9OEeuqTGL5KijV3AQxElLd3yjeeU1dMzy9eKOHh/icnwewkBSdA
   v5a/80qlX7zOw2TAWL6fj/PbiFvzVIaf5FpW2QdJ0ykSCTv797A+Epri6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="369060613"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="369060613"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 02:10:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="793934869"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="793934869"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 19 Jul 2023 02:10:17 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qM3CK-0004bZ-2V;
	Wed, 19 Jul 2023 09:10:16 +0000
Date: Wed, 19 Jul 2023 17:09:18 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Herdler <herdler@nurfuerspam.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Tomasz Maciej Nowak <tmn505@gmail.com>,
	Corinna Vinschen <vinschen@redhat.com>, Soeren Moch <smoch@web.de>
Subject: Re: [PATCH v3 3/6] Add documentation for audio.h (data types)
Message-ID: <202307191616.jdo5lLxc-lkp@intel.com>
References: <20230717020446.28877-4-herdler@nurfuerspam.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230717020446.28877-4-herdler@nurfuerspam.de>

Hi Stefan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on media-tree/master]
[also build test WARNING on linus/master v6.5-rc2 next-20230719]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stefan-Herdler/Add-documentation-for-legacy-DVB-decoder-API/20230718-174209
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230717020446.28877-4-herdler%40nurfuerspam.de
patch subject: [PATCH v3 3/6] Add documentation for audio.h (data types)
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307191616.jdo5lLxc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307191616.jdo5lLxc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst:80: WARNING: Unknown interpreted text role "c:enum".

vim +80 Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst

  > 80	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
