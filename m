Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071DD199BA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Sep 2023 16:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695313297; x=1726849297;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=VFRCODsJNfdcvJJhUcuwsfzTPniBXQCCWfGakGAFnuw=;
  b=iRllAnhzKSwL0dR3iy/b5I3h5hug/OFcwNteCR9YI31LOUMBqxMlbYFC
   Anl8XaVCIcqbir13p8y4wM8XqO9AeGH8I+VF1PCF8mWhaaa+AbraqC6j2
   RajttbVgs0CsDOEVNPNraNiBrAuN6yzWa2mM0fG7URCTDTwAbwrxGihYN
   wKbQoAkJ5PJH/VHrvT3U8BRzsUMcsxAa8QHkl3rwBmwBR0dXtAbjbDFkK
   sEfQxn/3LNrzW2rrK9/+tfFkggUWarBj91BB9nqmw/KjdkrnrA/kYOR/g
   maHiW3uaAsxZo+EiwUA1Jc+gFB+blhREe3Exkbw3lDClf121GuQ9gExEq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="380476403"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="380476403"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 09:21:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="994141504"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="994141504"
Received: from lkp-server02.sh.intel.com (HELO b77866e22201) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 21 Sep 2023 09:21:08 -0700
Received: from kbuild by b77866e22201 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjMQM-00009V-1n;
	Thu, 21 Sep 2023 16:21:06 +0000
Date: Fri, 22 Sep 2023 00:21:04 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 4/8] s390: hugetlb: Convert set_huge_pte_at() to take
 vma
Message-ID: <ZQxtcKDtX0sgBM1O@a36b5d0e9c41>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230921162007.1630149-5-ryan.roberts@arm.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html/#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v1 4/8] s390: hugetlb: Convert set_huge_pte_at() to take vma
Link: https://lore.kernel.org/stable/20230921162007.1630149-5-ryan.roberts%40arm.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



