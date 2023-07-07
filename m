Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1686EA0
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jul 2023 04:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688704433; x=1720240433;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=vytT7TEwKhYPHkiJ3LpIi4rGC7Ld22/i2DIxPAtwzuY=;
  b=K7sJ573GohJAPRE8ar4NKTTU5dUhWxi+K5+583PC7UpADLqhyMi4QZmP
   W4/ZkVQqOp2yklUHCFL0jadu5QJtLydYpcQKfxgBPA7cYIrN3Eo5nTY6h
   avaxpGtJl/1GNdvfz3rOCdP4ibbu2GgBCjuzEcCa5AYepg8zIDGifxeHx
   6cS5FyVVdmxOlLtqvLOhM1Yh/ipMnw9p4R6tTxXFh6PpQcCAns7TN78Qb
   RQcuqDPT0nag1IB/I/SLVS28+npFJXvtRJpBZW6jVJ6DCIGXsYN5PE27/
   T6T+GojXb+C7NYPS7nIjXuv83gvQcQV+TvOiU/S5lWyePAfcbzqs8Dt1Q
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="343386830"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="343386830"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 21:33:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="713846027"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="713846027"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 06 Jul 2023 21:33:51 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHdAE-0001le-2S;
	Fri, 07 Jul 2023 04:33:50 +0000
Date: Fri, 7 Jul 2023 12:33:47 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/2] mm: lock a vma before stack expansion
Message-ID: <ZKeVq4oIFqT55cZw@a1daa7802ad8>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230707043211.3682710-1-surenb@google.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH 1/2] mm: lock a vma before stack expansion
Link: https://lore.kernel.org/stable/20230707043211.3682710-1-surenb%40google.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



