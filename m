Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE79168BC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Oct 2023 09:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fQmiyv7/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698399808; x=1729935808;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sZSvMj+sMmnuJAD1wIn0COel3298HD5DQCZGy+m8TEk=;
  b=fQmiyv7/iPVQ6DCswV3flftDciQVrwbMO/RWwgCybiDVRikEQ7REd/Gf
   HjviQ9eFtioYGO07zJW21eXL5Qckf4a7wdrezQpBmfYUy5PAhCULiAEkU
   cLOXQkUqgOpXbwwlzTX8LC+F6cub3gxP1SJCZFhwR0t0jZx2Xrvgkme2h
   cexR7iGvxO3nbpP1B5rTmY1kVccKM4mPmPsFLNcFx6Dh1sswImZG8Rt55
   p5mPQfNci/IPZljvNv5ypmQtCTnsFE6vR5+6f4TpoGnsdcRgzQVk3mfvr
   xn2UUpvqx69GAjMSgu1RH5vzgZxk5p36d1fEl6/8zCqVnu179obYRDVc7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="473983676"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="473983676"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 02:43:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="736032673"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="736032673"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 27 Oct 2023 02:43:21 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwJN9-000Ahd-29;
	Fri, 27 Oct 2023 09:43:19 +0000
Date: Fri, 27 Oct 2023 17:42:44 +0800
From: kernel test robot <lkp@intel.com>
To: Aleksa Savic <savicaleksa83@gmail.com>, linux-hwmon@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Aleksa Savic <savicaleksa83@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: Add driver for Gigabyte AORUS Waterforce AIO
 coolers
Message-ID: <202310271721.sxzJ5Xir-lkp@intel.com>
References: <20231020130212.8919-1-savicaleksa83@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231020130212.8919-1-savicaleksa83@gmail.com>

Hi Aleksa,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on linus/master v6.6-rc7 next-20231026]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aleksa-Savic/hwmon-Add-driver-for-Gigabyte-AORUS-Waterforce-AIO-coolers/20231020-210452
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20231020130212.8919-1-savicaleksa83%40gmail.com
patch subject: [PATCH] hwmon: Add driver for Gigabyte AORUS Waterforce AIO coolers
reproduce: (https://download.01.org/0day-ci/archive/20231027/202310271721.sxzJ5Xir-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310271721.sxzJ5Xir-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/hwmon/gigabyte_waterforce.rst: WARNING: document isn't included in any toctree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
