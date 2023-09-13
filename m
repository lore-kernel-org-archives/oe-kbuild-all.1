Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCF02773B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Sep 2023 12:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694608311; x=1726144311;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HrD1kau9wT3KEsqQTKdQ+/wu8yACK1Fs2bkBjLcV3V0=;
  b=hz24A3CbORyWP4s3KRWrqaCZXDciHbaOd3+vQ/EA82nQOI61DE14cwye
   PQKTEEp8TjYCTwhGdpQi78SBk+LyjSO8myUOxozYB8u3ijkJ6jaa0LE3b
   nyHbnhHy3DIwkpb8DFGSZV1QJuOU0s9rPh5Y/A0/fKSeqiFUmJ4feEikO
   xGdusH+ICgze3695i/QNEsDDmUAe938XJs6Jp7nYFql1oJYKx7NiW7NmM
   y9REJoQSY8k5nLf2T9SzxoKoxT7irxjpy0RBuVnFg4kNBO6Apx5FI/j+3
   X50nqKVtqaYfRuqF+fvGw9V7PnmAYKFCzADobbgNQchpSa4vo7mIqwqTb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="375975557"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="375975557"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 05:31:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="779171258"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="779171258"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 13 Sep 2023 05:31:44 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgP1x-000034-0k;
	Wed, 13 Sep 2023 12:31:41 +0000
Date: Wed, 13 Sep 2023 20:30:58 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>,
	dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, robdclark@chromium.org,
	thomas.hellstrom@linux.intel.com,
	Matthew Brost <matthew.brost@intel.com>, sarah.walker@imgtec.com,
	ketil.johnsen@arm.com, mcanal@igalia.com, Liviu.Dudau@arm.com,
	luben.tuikov@amd.com, lina@asahilina.net, donald.robson@imgtec.com,
	boris.brezillon@collabora.com, christian.koenig@amd.com,
	faith.ekstrand@collabora.com
Subject: Re: [PATCH v3 04/13] drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY
 scheduling policy
Message-ID: <202309132041.76l2uKon-lkp@intel.com>
References: <20230912021615.2086698-5-matthew.brost@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230912021615.2086698-5-matthew.brost@intel.com>

Hi Matthew,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-exynos/exynos-drm-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.6-rc1 next-20230913]
[cannot apply to drm-misc/drm-misc-next drm-intel/for-linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Brost/drm-sched-Add-drm_sched_submit_-helpers/20230912-102001
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20230912021615.2086698-5-matthew.brost%40intel.com
patch subject: [PATCH v3 04/13] drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy
reproduce: (https://download.01.org/0day-ci/archive/20230913/202309132041.76l2uKon-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309132041.76l2uKon-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/gpu/drm-mm:552: ./drivers/gpu/drm/scheduler/sched_main.c:52: WARNING: Enumerated list ends without a blank line; unexpected unindent.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
