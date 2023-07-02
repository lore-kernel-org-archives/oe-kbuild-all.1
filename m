Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6451361
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Jul 2023 00:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688256086; x=1719792086;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=dt3ish8l/dwCYC3dQF9tTPUPRNE2LfJ1WSODUJituTY=;
  b=ZLK0nfJt0+pLLzSuITEtRlA+MzR2XY4/32WP9faoxeX1KZ6p37j7fyUv
   T/hbRjrs9aiVNwqm96PLoSISlmo73KST/tWfmdb2sKOER35tHC0cx/C6u
   F8kTykNo5FSxLoA6UKt0dmn0/8W12g6jFgWsTboZ3XZHuCQUFKL7xS98a
   iQ/POQLRsnJKs5fvpOciNsiTcmlt7h/6BnYl1itewZXrqwASMsRBuDYXG
   e1yOZmxeISS+nMxhxLRaapvBKrSqOqZVpkChhBdR136TbNxzsGR3TymIv
   IKLzh5IsrrAeXuSx3YMU7uJgGwZeW4zphQFaa2nqxlz2tP/+vXrjipI1G
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10758"; a="365218305"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="365218305"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2023 17:01:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10758"; a="695411857"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="695411857"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 01 Jul 2023 17:01:24 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFkWp-000GL7-2e;
	Sun, 02 Jul 2023 00:01:23 +0000
Date: Sun, 2 Jul 2023 08:01:21 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] TIOCSTI: always enable for CAP_SYS_ADMIN
Message-ID: <ZKC+UQ7HYVZCWhpR@65525e8f8615>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230701235918.kwfathbdklkyrbde@begin>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH] TIOCSTI: always enable for CAP_SYS_ADMIN
Link: https://lore.kernel.org/stable/20230701235918.kwfathbdklkyrbde%40begin

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



