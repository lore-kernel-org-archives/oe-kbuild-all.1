Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AACD33D2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 May 2023 11:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683804487; x=1715340487;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=LGTcFkUu2O2bNdVPjLIv5NydNt+bv7zs9YzW4TO5K0g=;
  b=djzbPfzeLSl9gW1TkRSHkYSNpKtvzayx8D6EBtkQ6eSKCw9ghFR3phd0
   jmUknf6yTYYL1IRzOuhYbHIfVzjEqURwgdGRcUtVScOvxE1ZQpM0bKZWZ
   5wkWtUJajePultynKtZXN4TfP15b1h62bcbWXZqPVX7QrzRBDXtoJFCM8
   PnahIQ4UzBetcvzO/NkKMidI7XX7fkeggKDgoAy3zw2QE0NToi2ppdVaP
   WRTXUiA4JS5LRebHBfK1M/MQhZur22MSVZsh2ABGc77zYO4mBHlHL4Erz
   C7UFuktHqOslsIqpZFeLNJh+jSYcLpGJ1cybgw7cFvxE6uSuAdzONICXg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="350503676"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="350503676"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 04:28:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="677206932"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="677206932"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 11 May 2023 04:28:05 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1px4Sq-0003zI-2F;
	Thu, 11 May 2023 11:28:04 +0000
Date: Thu, 11 May 2023 19:28:02 +0800
From: kernel test robot <lkp@intel.com>
To: Daniil Dulov <d.dulov@aladdin.ru>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] drm/amdkfd: Fix potential deallocation of previously
 deallocated memory.
Message-ID: <ZFzRQnguWILn/uaF@e0f96cf4e6cd>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230511112314.29322-1-d.dulov@aladdin.ru>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH v2] drm/amdkfd: Fix potential deallocation of previously deallocated memory.
Link: https://lore.kernel.org/stable/20230511112314.29322-1-d.dulov%40aladdin.ru

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



