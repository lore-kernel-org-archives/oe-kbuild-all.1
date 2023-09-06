Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3E47E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Sep 2023 02:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693968758; x=1725504758;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b/IlaQTZB5j0he0vRsx9Okx0UXxCOU0YpQJ6T4yXngA=;
  b=YAL1DqNtqcCEz1NuQ8xrXt9XvfcoRDhk7DaP/Xkn2JJfNrAE9UXmnPkZ
   +j0WSz8wCpLCDm7EzP5RUmoWvPtI1iTBRCtrPiOd4m4Dv790ey+rFGU/V
   xi9zWyvd3RwqkRL/wW/1FmH0LagEd724cQwA41rWkSlACJLRxZRSvl5gB
   T9ayFdv5YJX48LCfY1XZBZn8GKOJjwrxsE8SvHME512mqH8fG0biP1GZr
   OHguXdX+EWpbknTGvPhuvJhCYyZgDR3V3Tx5EbIGHP0MFzKrD7I7SE1HM
   ZlWWNrz7/R7h9OSGqiEvk8r/XJNcKqkub/TgUtPfUYyS7y2oQT6c8Q21T
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="407954963"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="407954963"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 19:52:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="776411652"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="776411652"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 05 Sep 2023 19:52:34 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdiea-0002Oj-11;
	Wed, 06 Sep 2023 02:52:29 +0000
Date: Wed, 6 Sep 2023 10:52:03 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Ajay Kaher <akaher@vmware.com>,
	Zheng Yejian <zhengyejian1@huawei.com>
Subject: Re: [PATCH] tracefs/eventfs: Use dput to free the toplevel events
 directory
Message-ID: <202309061055.V08YOtla-lkp@intel.com>
References: <20230905183332.628d7cc0@gandalf.local.home>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230905183332.628d7cc0@gandalf.local.home>

Hi Steven,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on next-20230905]
[cannot apply to v6.5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steven-Rostedt/tracefs-eventfs-Use-dput-to-free-the-toplevel-events-directory/20230906-063414
base:   linus/master
patch link:    https://lore.kernel.org/r/20230905183332.628d7cc0%40gandalf.local.home
patch subject: [PATCH] tracefs/eventfs: Use dput to free the toplevel events directory
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230906/202309061055.V08YOtla-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230906/202309061055.V08YOtla-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309061055.V08YOtla-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/tracefs/event_inode.c: In function 'eventfs_remove_events_dir':
>> fs/tracefs/event_inode.c:804:31: warning: variable 'ei' set but not used [-Wunused-but-set-variable]
     804 |         struct eventfs_inode *ei;
         |                               ^~


vim +/ei +804 fs/tracefs/event_inode.c

5bdcd5f5331a276 Ajay Kaher 2023-07-28  794  
5bdcd5f5331a276 Ajay Kaher 2023-07-28  795  /**
5bdcd5f5331a276 Ajay Kaher 2023-07-28  796   * eventfs_remove_events_dir - remove eventfs dir or file from list
5bdcd5f5331a276 Ajay Kaher 2023-07-28  797   * @dentry: events's dentry to be removed.
5bdcd5f5331a276 Ajay Kaher 2023-07-28  798   *
5bdcd5f5331a276 Ajay Kaher 2023-07-28  799   * This function remove events main directory
5bdcd5f5331a276 Ajay Kaher 2023-07-28  800   */
5bdcd5f5331a276 Ajay Kaher 2023-07-28  801  void eventfs_remove_events_dir(struct dentry *dentry)
5bdcd5f5331a276 Ajay Kaher 2023-07-28  802  {
5bdcd5f5331a276 Ajay Kaher 2023-07-28  803  	struct tracefs_inode *ti;
5bdcd5f5331a276 Ajay Kaher 2023-07-28 @804  	struct eventfs_inode *ei;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
