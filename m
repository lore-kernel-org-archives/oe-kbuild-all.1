Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EDE3FEF
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Sep 2023 10:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693996162; x=1725532162;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=Cpqn67BN9jBtR7ECYs84RA3KIUwXd7muAo4t/fOmV7I=;
  b=eW7pgvSHcBLUxPRiBCendlOzNOAfN8mtSYk5yD9yWFeJqfB1+u9HQt+N
   WbpCQFf8EMSUgBCf0saYR3W6Dh/Y8W5TF/iq3SkXkovo/kdLk6tDdQ4Mz
   3S/utbnv8+lipvZrVv752+5oKf3Hmn31oNvwkl5emA8Bj0dTETYEb/ADT
   W4X6BFA5JLA1RiYhd1PJ+Yg3M1j/iWQr7cPHGDsGa9c5UI0YEsfNXDXin
   HcfbAlx0C2NvAI8Yhg4KHWeJiABLrCNnGKD4I4NHeVwzFwKvht+8Q4+Fu
   TjA64RQhQBXNBn8HbrGK0zzcsEzzcaUp6SmLV+yrzQGWpdUakXbWnhqDA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="374423838"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; 
   d="scan'208";a="374423838"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 03:28:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="1072332886"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; 
   d="scan'208";a="1072332886"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 06 Sep 2023 03:28:53 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdpmF-00005r-0c;
	Wed, 06 Sep 2023 10:28:51 +0000
Date: Wed, 6 Sep 2023 18:28:27 +0800
From: kernel test robot <lkp@intel.com>
To: Alfred Piccioni <alpic@google.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] SELinux: Check correct permissions for FS_IOC32_*
Message-ID: <ZPhUSwb+srKodCQ7@0091dd92274c>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230906102557.3432236-1-alpic@google.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html/#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] SELinux: Check correct permissions for FS_IOC32_*
Link: https://lore.kernel.org/stable/20230906102557.3432236-1-alpic%40google.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



