Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9337ED0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Mar 2023 07:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678433112; x=1709969112;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=szhfwaA2qsyJowTNJVU2fZYh4jv37phL3mTzGJRXIFA=;
  b=ZCaLWLCWtNGQxvNJAj7xgtCLhBQEgtI3+w3PaPmU0ccXDDx07Nmuqju7
   80xQXZ+HCJH6RrYnjFj36kaL+nYtF0LyegLaCwq4xzJR+yhkOZ7I3Jy0k
   4ezY2W7F9t+m3MzAzya9zkFpZ9uM00ftvjHT48pI6GRfI1uNst9hJ8vxu
   /DpfXcxKX+XFuMSLb5oWb7TBWABZ2h2r8Edv/7V7zHmbiXn0qGDaf/IM4
   i9aBTrrd8yNPe+atzPN2ubvFbleUjZg1EotYEtAJFmaUD+9vyaIJ/xQw+
   qfGxNWCmV33v7ZYtVvs6nqvOH53PheQYUdhyLHC3lg5E8qjKTzG8JRnRK
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="401529610"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="401529610"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 23:25:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="820952416"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="820952416"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 09 Mar 2023 23:25:07 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paX7j-0003cM-0i;
	Fri, 10 Mar 2023 07:25:07 +0000
Date: Fri, 10 Mar 2023 15:24:12 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: drivers/powercap/idle_inject.c:130:40-42: WARNING !A || A && B is
 equivalent to !A || B
Message-ID: <202303101512.mR87EHWR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   44889ba56cbb3d51154660ccd15818bc77276696
commit: acbc661032b8aa0e8359ac77074769ade34a176c powercap: idle_inject: Add update callback
date:   5 weeks ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20230310/202303101512.mR87EHWR-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303101512.mR87EHWR-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/powercap/idle_inject.c:130:40-42: WARNING !A || A && B is equivalent to !A || B

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
