Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AE25690
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Oct 2023 06:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696400913; x=1727936913;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=pPnWyQ7N475HAS401N5uHMtsjktSeZ7GJGr+L+mNdeM=;
  b=USnq+RgEvjwtwsP9IJygFJ6Cc5DVzzURdhbHc5es/eTGsIhAj+1ySxfA
   VQVjwkmi5hIac9pQpNHMjzqy+GNX/xZpV0iTg0b4orKEqKYYXyz61I6Nx
   UCcz/E6BVOGJDnkBT5RRv3i7Qtnf1Mm6xuwuDRgzfxZkmK8Vh9p4fITJF
   MBU55hKEPrbB962QQUERUlZaISfoz+YuQc+sMxHgOFgNqjfbZmcl6LbZf
   h4mr2r9U7in85Tx4dSKtgDu0uGy7y06j52axpypnbkeaefkonKdtYXSdu
   EmYpliXywaxYf6d2cIYMvJn1febEzumal51ah6ZNzcvxON1AcfQGBnQmB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="368130621"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; 
   d="scan'208";a="368130621"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 23:28:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="744817169"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; 
   d="scan'208";a="744817169"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 03 Oct 2023 23:28:29 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnvMx-000D4t-13;
	Wed, 04 Oct 2023 06:28:27 +0000
Date: Wed, 4 Oct 2023 14:28:10 +0800
From: kernel test robot <lkp@intel.com>
To: Woo-kwang Lee <wookwang.lee@samsung.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] usb: core: add bos NULL pointer checking condition
Message-ID: <ZR0F+gw7I45SqlQJ@f61ccfac960a>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231004062642.16431-1-wookwang.lee@samsung.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html/#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] usb: core: add bos NULL pointer checking condition
Link: https://lore.kernel.org/stable/20231004062642.16431-1-wookwang.lee%40samsung.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



