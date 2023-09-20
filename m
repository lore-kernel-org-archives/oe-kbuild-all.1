Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC1E11721
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 09:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695202259; x=1726738259;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KZOSYgSJsXkQANOn6X4OkJoXJP7Bh3dETkoWTPhbl5g=;
  b=gGpBueQtCA2ywvVtKPhpY34BPg4XNXxNyy+RZ+HylZ92ygQznVKamtEU
   guiBX7pwxP2Gmz6tLT94qDg68fNRocObye6rT23Bcw7fSQFbppago9DzG
   vZrVtxUPVXu3IGUh3B2zEqPUrEZgz8mcLaNYnb10YJssdvSKvkP0Z5gld
   DIs41EkRt16MK24y4FiIQux0ms6gNnpUnGiq0YLPjHMTFICu098GJu2dg
   NP8xzJ57PgndhoSCg1RAYjmabTUrqLWNTnDCC7okzumXF7k8BapJ4mLWY
   VU9YqYp1Fb01ndHgG8QBx6HoJF+vL91fIj1soAKxSdgmcF0K4AZQhQAjN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="384018699"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="384018699"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 02:30:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="861909604"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="861909604"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 20 Sep 2023 02:30:48 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qitXi-0008Zo-0S;
	Wed, 20 Sep 2023 09:30:46 +0000
Date: Wed, 20 Sep 2023 17:30:15 +0800
From: kernel test robot <lkp@intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>,
	intel-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, jani.nikula@intel.com
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915/hdcp: Move common message
 filling function to its own file
Message-ID: <202309201747.5tql4Gr4-lkp@intel.com>
References: <20230920063611.242942-3-suraj.kandpal@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230920063611.242942-3-suraj.kandpal@intel.com>

Hi Suraj,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Suraj-Kandpal/drm-i915-hdcp-Move-checks-for-gsc-health-status/20230920-143839
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230920063611.242942-3-suraj.kandpal%40intel.com
patch subject: [Intel-gfx] [PATCH 2/2] drm/i915/hdcp: Move common message filling function to its own file
config: i386-buildonly-randconfig-002-20230920 (https://download.01.org/0day-ci/archive/20230920/202309201747.5tql4Gr4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309201747.5tql4Gr4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309201747.5tql4Gr4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[7]: *** No rule to make target 'drivers/gpu/drm/i915/display/intel_hdcp_gsc_message.o', needed by 'drivers/gpu/drm/i915/i915.o'.
   make[7]: *** [scripts/Makefile.build:243: drivers/gpu/drm/i915/display/intel_hdcp_gsc.o] Error 1 shuffle=1704323870
   make[7]: Target 'drivers/gpu/drm/i915/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
