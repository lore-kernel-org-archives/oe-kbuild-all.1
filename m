Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85B9D505
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Aug 2023 09:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692869279; x=1724405279;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=ncmYVryyM1achfgaxsduDWJtPWOcnkseasKGyLkKACo=;
  b=kX1fm+oh4Z7Bqg+UKGoM9qRz7nQjjnb9069d9zQrqnd0iEyPb2FXqhhV
   yvykY/x5kv8nEnST/nwuQ2kaQY/H7XhtmuI53iZKVp8J4LbivQ3XFKvqo
   unho5Qx7AvIk2gAg91tbO5gaE22BF/RhnqlL7EeuCUAOvxjTnTKANLvKX
   7ZA5f5xL6yh5akltTIUM4BviXmF2jefFTS/dlo2M1sOwJxcToF6o5to5H
   7MX9HZS4irmHbrMCo+m+pMNOXs4nqgoGHajzkmH3fne/icWuzbHROOJSr
   Z4d5HlKk+5Tbllt8sgQ3a0eAzkNtqvdmO/BB8S3laOVxjCdrdvEdo+9jP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="378146069"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="378146069"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 02:27:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="851419077"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="851419077"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 24 Aug 2023 02:27:57 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZ6d0-0001ua-0J;
	Thu, 24 Aug 2023 09:27:53 +0000
Date: Thu, 24 Aug 2023 17:26:57 +0800
From: kernel test robot <lkp@intel.com>
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] docs: add backporting and conflict resolution document
Message-ID: <ZOciYTu2+wLHcDik@24313c2339b3>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230824092325.1464227-1-vegard.nossum@oracle.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH v2] docs: add backporting and conflict resolution document
Link: https://lore.kernel.org/stable/20230824092325.1464227-1-vegard.nossum%40oracle.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



