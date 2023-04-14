Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E997C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Apr 2023 10:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681468648; x=1713004648;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Mv3eRWsF7vbqiNI5/ZORjRkZ7QwmyupN1VPZknpK/SA=;
  b=fi/r4CfNwNsROgdd5Kj0A9+PBRNkPdaa7ry0Dw+erTMFjghhmBXQGKth
   oxGp66NQFmfZ4jS1IDtmF6Y8FlHqHKNL1jnJD74hKOu2B/fj6bZWhU7Mg
   XT1cYoNMsdwOQ+i9BM/MLDCmgoScjAOE3kZ9DJVwR+PyiPTqY5VPOgPIX
   93OIT3IwUA04NKgcg0PEBaj38ZnkbYq6jn/HpnTbqBwnTO9sTNX9ek1Lc
   Ce37dPy36fu7kueG3xfvRJLoYnA0npO8dUZS/rKFvttdivPGocXqLZRa8
   ThHGt6p3gs+FP1361XhBsOk+gDzYGvTjVTp7m0NB7CcyptF5yFdsu/I5B
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="324062034"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="324062034"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 03:37:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="779153057"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="779153057"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Apr 2023 03:37:26 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnGo1-000ZRf-0o;
	Fri, 14 Apr 2023 10:37:25 +0000
Date: Fri, 14 Apr 2023 18:36:34 +0800
From: kernel test robot <lkp@intel.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 2/5] perf: Add fork to the sideband ioctl
Message-ID: <202304141847.w65deipC-lkp@intel.com>
References: <20230414082300.34798-3-adrian.hunter@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230414082300.34798-3-adrian.hunter@intel.com>

Hi Adrian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on acme/perf/core]
[also build test WARNING on tip/perf/core tip/master tip/auto-latest linus/master v6.3-rc6 next-20230413]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Adrian-Hunter/perf-Add-ioctl-to-emit-sideband-events/20230414-162719
base:   https://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git perf/core
patch link:    https://lore.kernel.org/r/20230414082300.34798-3-adrian.hunter%40intel.com
patch subject: [PATCH RFC 2/5] perf: Add fork to the sideband ioctl
config: x86_64-randconfig-a013-20230410 (https://download.01.org/0day-ci/archive/20230414/202304141847.w65deipC-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/48bf5fef7be6160c89995b4f98ffed4312999e96
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Adrian-Hunter/perf-Add-ioctl-to-emit-sideband-events/20230414-162719
        git checkout 48bf5fef7be6160c89995b4f98ffed4312999e96
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/events/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304141847.w65deipC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/events/core.c:7975:6: warning: no previous prototype for 'perf_output_f_wrapper' [-Wmissing-prototypes]
    7975 | void perf_output_f_wrapper(struct perf_event *event, void *data)
         |      ^~~~~~~~~~~~~~~~~~~~~


vim +/perf_output_f_wrapper +7975 kernel/events/core.c

  7974	
> 7975	void perf_output_f_wrapper(struct perf_event *event, void *data)
  7976	{
  7977		struct perf_output_f_data *f_data = data;
  7978	
  7979		f_data->func(event, f_data->data);
  7980	}
  7981	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
