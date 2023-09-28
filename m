Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2EC13AFB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Sep 2023 17:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695921500; x=1727457500;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=pJQ3AWv/+COP8pxKIb3bIOi4NYL+H5ugrXiX7BRfTGg=;
  b=CI9oXUd30lP03lgpE2JHGPjxIzlg8VU3EWui89loxka+mkAp8AmOgpGm
   EQTsLE7pYE85ZhctXlbNI0kddvyS1TK4nSe/eSfIDMetiqLFHwXwpE0d7
   3KCSazBXMLNU9sCbSHWaA1XXA7Dsjxlf8PlWXR+JTawIoQWvVO8B8tyRR
   cScik21GVeFHLLjrAPFdi1tNJKhDSj6EANuIDW1tIdP/gPjRmOtNUGgxO
   /3dTTbsgDQZOkoDG9XAtlmi23oq4jqBb7bCOYUMM+N22J0LJ77Fi972gu
   ZmlsFJY5As7PJ760mYp61Oon6xSZ7GHSU5O8Zfybf2pwOWwAv3xj0tRKY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="362367039"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; 
   d="scan'208";a="362367039"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 10:18:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="726305651"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; 
   d="scan'208";a="726305651"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 28 Sep 2023 10:18:17 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlueV-0001jk-1y;
	Thu, 28 Sep 2023 17:18:15 +0000
Date: Fri, 29 Sep 2023 01:17:36 +0800
From: kernel test robot <lkp@intel.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 3/3] mmap: Add clarifying comment to vma_merge() code
Message-ID: <ZRW1MBvWCCFevIg1@f61ccfac960a>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230928171634.2245042-4-Liam.Howlett@oracle.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html/#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v2 3/3] mmap: Add clarifying comment to vma_merge() code
Link: https://lore.kernel.org/stable/20230928171634.2245042-4-Liam.Howlett%40oracle.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



