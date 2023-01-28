Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A06A15AE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jan 2023 01:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674869587; x=1706405587;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=tI+RkUEbbsN6XOxvKxmUcYAO3RCxqu5W9JBu/5LToI8=;
  b=JyTqLwaC1047o+14TLH2zRINCnS2sAA9IrroD1S1sJl9w5QeqRzP6IwA
   lyEK4CMNOzGjjX6F3hboaHZaQdNc1YUcHnzrMxHXVH0CmuTbiufSyDbuQ
   Or7/T479O65PI3sS+dEAS9Vd2xdUu70Us0HIUvnOpdgg2Tat5DnIbxBqW
   cmghe2EzoGrR/sN69s8gZKyZCxDLHrehz8ZTlrZ+2gER+h9oQNq2N1D4d
   wJWTVMEMRZH9TwYKmwfJJnrA6RIElW4BHcw7ZmxMhQEl6fg4secRDv4g+
   DG1z23zbFHPZilooO+DwtHwgRmMloU8MjTr+BwDVHvT+VGEiY/UaP7iut
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="328532295"
X-IronPort-AV: E=Sophos;i="5.97,252,1669104000"; 
   d="scan'208";a="328532295"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2023 17:33:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="726878988"
X-IronPort-AV: E=Sophos;i="5.97,252,1669104000"; 
   d="scan'208";a="726878988"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 27 Jan 2023 17:33:05 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLa5Y-0000E5-2K;
	Sat, 28 Jan 2023 01:33:04 +0000
Date: Sat, 28 Jan 2023 09:32:29 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] fbcon: Check font dimension limits
Message-ID: <Y9R7LckLIeHlGE8o@904499574ff1>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230126004921.616264824@ens-lyon.org>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH] fbcon: Check font dimension limits
Link: https://lore.kernel.org/stable/20230126004921.616264824%40ens-lyon.org

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



