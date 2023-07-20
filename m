Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C5218C03
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jul 2023 15:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689866411; x=1721402411;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OPAh7uWMmiVvCvHe/zlEyBCCYIwplwRJJIKvkymgoQU=;
  b=BnY/etrDWUKnqOzOdDJ12IH0v0zjJ+zDWgmYKlczGkxoNUUj91C61C8W
   mQfHHqmymvI6bjQL1CyIqkejNfdwkvrqmpC5X5WSKMSj+AZwyQHMiA65M
   aIi3TakhcEU3G22ey1QdqCtknoUptcR3Oh0ofN6oln66x7PQYdmmmUBFl
   Q5dD3cq04QBP/+Yk9rJ0RMA3sMYkKIS9c7j2NOK4q0Jn0gI3Nt0sbUu8o
   NI2NnvqehtXvTiQ94YU5dCNGxJBTMkZyaC3KA7YOog55GKA4hdmKfTE4k
   2R4lqRsK88gSZINQDZ0wLN15UBRRGIR8cy3JDMMTfLx2H865AUury8+A+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="370361971"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="370361971"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 08:20:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="814574854"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="814574854"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 20 Jul 2023 08:20:08 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMVRo-0006BZ-0r;
	Thu, 20 Jul 2023 15:20:08 +0000
Date: Thu, 20 Jul 2023 23:19:41 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Michalik <michal.michalik@intel.com>,
	intel-wired-lan@lists.osuosl.org
Cc: oe-kbuild-all@lists.linux.dev, karol.kolacinski@intel.com,
	anthony.l.nguyen@intel.com, jesse.brandeburg@intel.com
Subject: Re: [Intel-wired-lan] [PATCH net-next v1 3/3] ice: PTP: add clock
 domain number to auxiliary interface
Message-ID: <202307202358.6Djg24Ou-lkp@intel.com>
References: <20230720121357.26739-4-michal.michalik@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230720121357.26739-4-michal.michalik@intel.com>

Hi Michal,

kernel test robot noticed the following build errors:

[auto build test ERROR on tnguy-next-queue/dev-queue]
[cannot apply to net-next/main tnguy-net-queue/dev-queue linus/master v6.5-rc2 next-20230720]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Michal-Michalik/ice-Auxbus-devices-driver-for-E822-TS/20230720-202358
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
patch link:    https://lore.kernel.org/r/20230720121357.26739-4-michal.michalik%40intel.com
patch subject: [Intel-wired-lan] [PATCH net-next v1 3/3] ice: PTP: add clock domain number to auxiliary interface
config: x86_64-randconfig-x014-20230720 (https://download.01.org/0day-ci/archive/20230720/202307202358.6Djg24Ou-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230720/202307202358.6Djg24Ou-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307202358.6Djg24Ou-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/intel/ice/ice.h:69,
                    from drivers/net/ethernet/intel/ice/ice_virtchnl.c:6:
>> drivers/net/ethernet/intel/ice/ice_ptp.h:344:19: error: static declaration of 'ice_ptp_clock_index' follows non-static declaration
     344 | static inline int ice_ptp_clock_index(struct ice_pf *pf)
         |                   ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_ptp.h:290:5: note: previous declaration of 'ice_ptp_clock_index' with type 'int(struct ice_pf *)'
     290 | int ice_ptp_clock_index(struct ice_pf *pf);
         |     ^~~~~~~~~~~~~~~~~~~


vim +/ice_ptp_clock_index +344 drivers/net/ethernet/intel/ice/ice_ptp.h

   343	
 > 344	static inline int ice_ptp_clock_index(struct ice_pf *pf)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
