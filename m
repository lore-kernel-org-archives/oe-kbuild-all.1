Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E6A1C3B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Aug 2023 07:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691651469; x=1723187469;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=XBEEZGw754pa/yEjtog8E1K4vPKE3iLtCaMnZp1I31E=;
  b=WNRSakUlH7wvkQt8NuH/u6VnFEkUDuMk4ERheBDUIJLz2cD8+XdTXTM/
   SQ6IzRaVLEZT+v2rNlUCFcvL0ZxwAZwzG7J/lnteQAhDxWBM7l7TkAKa+
   4duB23eyOGv2jAPNF/KQaL8KBVmsx3sHUIdryrZeViIyySsODCXTKuRPP
   ruLEfgC3zKyRJfjJfVcWAZJ1CS7rELNqrdGBmjlDK/hoH6uytnvSYmjSO
   MNTQ8r5i1Ifop6fp6iLugvXtw8XAQdU5dbXgg3aX3y80RJj2lI7s4umVA
   szhGFTVygav1pcetxZeEKmGjy8NO6DeWu/hO+HcIe6HjcHSMPIt7irqtG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="375035452"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="375035452"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 00:11:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="709019093"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="709019093"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 10 Aug 2023 00:11:03 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTzp0-0006os-0m;
	Thu, 10 Aug 2023 07:11:02 +0000
Date: Thu, 10 Aug 2023 15:10:04 +0800
From: kernel test robot <lkp@intel.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net 1/5] netfilter: nf_tables: don't skip expired
 elements during walk
Message-ID: <ZNSNTI+r/EPb0ll/@11d7ca01dc46>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230810070830.24064-2-pablo@netfilter.org>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH net 1/5] netfilter: nf_tables: don't skip expired elements during walk
Link: https://lore.kernel.org/stable/20230810070830.24064-2-pablo%40netfilter.org

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



