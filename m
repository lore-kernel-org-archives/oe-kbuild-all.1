Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D289286B5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Nov 2023 14:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OPJjAl4j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700057578; x=1731593578;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WS8UIze/6Lz0J4s8CrP1OtmfOMg4p9n6G92sw9WDlSQ=;
  b=OPJjAl4jCQvrXKvtI7aHcflwx5OdMEVvmlXTudMrwlAmRSHFbLbbrrni
   t5MtxOkWxN6Z+PXpNBJVf0ngcynS0xLkbWZ59m/got/kP7xYoISdLxKKt
   lpgP5KcwgeSxLJlPXxv3ACCXwBjDET6i3P1lNkHJKEQ7dXRyRRY3PPLLM
   tUb1On4SpaLzFMlpVNguRxYFX5LoFzAFrT3unlTbCSUFbhovusQ3e+QuN
   PmaH51t2o5oEMvVKTWlBEv47dp9tagf/9ts8iK2VEcqKES4Bdl9V6UhVT
   wd2XXI1yHnzQqt9287FRI8iGqZdRhjj6bvDfJJ0WvhtUJU3uNpVPBIPsP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="370226129"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="370226129"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 06:12:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="794170591"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="794170591"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 15 Nov 2023 06:12:54 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3GdQ-0000OH-09;
	Wed, 15 Nov 2023 14:12:52 +0000
Date: Wed, 15 Nov 2023 22:11:45 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH] drm/doc/rfc: SR-IOV support on the new Xe driver
Message-ID: <202311152144.cn5cUZqV-lkp@intel.com>
References: <20231110182231.1730-1-michal.wajdeczko@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231110182231.1730-1-michal.wajdeczko@intel.com>

Hi Michal,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.7-rc1 next-20231115]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Michal-Wajdeczko/drm-doc-rfc-SR-IOV-support-on-the-new-Xe-driver/20231111-022816
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231110182231.1730-1-michal.wajdeczko%40intel.com
patch subject: [PATCH] drm/doc/rfc: SR-IOV support on the new Xe driver
reproduce: (https://download.01.org/0day-ci/archive/20231115/202311152144.cn5cUZqV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311152144.cn5cUZqV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/gpu/rfc/sysfs-driver-xe-sriov references a file that doesn't exist: Documentation/ABI/testing/sysfs-driver-xe-sriov

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
