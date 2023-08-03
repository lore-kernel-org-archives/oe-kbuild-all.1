Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E07763BC
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Aug 2023 19:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691091048; x=1722627048;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=vkY5TWdxdxL2u8+kTBBSiCpR/KBiDNmODuJIoeh+zrQ=;
  b=X2eHZyDwamAvBL+59RlQdvuMF/1UZIKQDHOdkRm6iA8KVW6lSJVBsqjq
   LcekshEltQdPCkALs0YVFv4avh6Rq54YqpzmZB13sm34xn74BtGeDMohC
   42bc8vNXc0/GCzRP3BJHuNo/Dus5ieE/MzJuI1OdD/Jrgz/tWHo7Pkc7l
   lHGepc/sz0FXHSkhtp0Vf1GBSzayvGrFFLhnYWUDXpWLhT2MBjqRbdBQW
   1vhe7nhH5uAyeFqFAYiEJ+lSoPkn6+xcoHSBrNxlPpfOLtg+W72RpTLeF
   3F6iNCkZAkoTrC8p6W7aNljussTR1iuRrRWqrauJvWrq5dfdkt3AJ/WtI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="360032535"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="360032535"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 12:30:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="976250232"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="976250232"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 03 Aug 2023 12:30:46 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRe21-0002JX-2b;
	Thu, 03 Aug 2023 19:30:45 +0000
Date: Fri, 4 Aug 2023 03:29:53 +0800
From: kernel test robot <lkp@intel.com>
To: Hardik Garg <hargar@linux.microsoft.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 6.1 5.15] net/mlx5: Free irqs only on shutdown callback
Message-ID: <ZMwAMamINBvdL4XC@11d7ca01dc46>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230803192832.22966-1-hargar@linux.microsoft.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH 6.1 5.15] net/mlx5: Free irqs only on shutdown callback
Link: https://lore.kernel.org/stable/20230803192832.22966-1-hargar%40linux.microsoft.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

Please ignore this mail if the patch is not relevant for upstream.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



