Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96083C25
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jun 2023 11:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686654001; x=1718190001;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=CgeOb7YfFNT0oc72DRtaL4aP+N7E0yaJsIXhXf4UAqA=;
  b=JHgkR8Fm23nfB9UtVAS7O1JwDaAMz1ZiqHi9hp+w0MsmQkTbMcP3fMmI
   EAhrU0/jZ0HSiZX2Jl0tzyfHQOdSy5UNa0Cu6X262nduGUAOrcfxjkID2
   4fyhqgTEdfcjfc66PrqWONZ5pO5jcmE7Gt3L7hH/0IsKcWH8M78hNKgO0
   yY9kL/9N3RKpmecPcqg4hTzotGZT6D0kjsvriiDFsw95lhPK1vENcazj3
   p3c9prVHWIYmPSsMCbGeJ+h2yTaXutfMaMe6POOCNAmOdcNbTFJDKp3Z2
   kcuhS8qoXxAMQwIyjyoGqtgKWcCnAWzsxA4LTxKqOBBH6+odpjll4yl2j
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="338657858"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="338657858"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 03:59:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="1041726237"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="1041726237"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 13 Jun 2023 03:59:51 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q91kc-0001H6-1u;
	Tue, 13 Jun 2023 10:59:50 +0000
Date: Tue, 13 Jun 2023 18:59:03 +0800
From: kernel test robot <lkp@intel.com>
To: Sandipan Das <sandipan.das@amd.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] perf/x86/amd/core: Fix overflow reset on hotplug
Message-ID: <ZIhL96ombK2BwQiH@eeaf1f6db856>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230613105809.524535-1-sandipan.das@amd.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH] perf/x86/amd/core: Fix overflow reset on hotplug
Link: https://lore.kernel.org/stable/20230613105809.524535-1-sandipan.das%40amd.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



