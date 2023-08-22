Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BBE20183
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 22:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692742160; x=1724278160;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=j+9TAz65NR9x8sN8e/5bYTTQCD3dgfkDKeLaOToZmfM=;
  b=iAtakX0B+BPDtWQVE3YOiIBi1eGAcvEwWq/J3yuE/yzYOvPV+r5b9ruQ
   Yq+sUdZ38BPbAgxSSpPGtcll6rsYxMk5+xKFfONYqFE4XdKC6IRiCGAyH
   FlareoLa/GMUOOM2ghRQ3JajaJWEykF+S1sQkaWWJwoJc2g07GtSExwOu
   TDyKMveyKihGu0o25ThYfjw+JPPM0D5zMneHboPjJtO4f3r3uaA0l+c0h
   ekMjFuFBdRAB66hzXVwdWYIXehiNaTsFxOPViHZUP10LdVJnED9ZS4H9C
   n7MS8Xekkh7cR2F8aFJA4G9cqfpcF8ZiQeclLdHY22poMLEQtW7kRaVq6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="364190144"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="364190144"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 15:09:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="806447531"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="806447531"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2023 15:09:18 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYZYr-0000Z6-1M;
	Tue, 22 Aug 2023 22:09:17 +0000
Date: Wed, 23 Aug 2023 06:08:45 +0800
From: kernel test robot <lkp@intel.com>
To: Hardik Garg <hargar@linux.microsoft.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 6.1] selftests/net: mv bpf/nat6to4.c to net folder
Message-ID: <ZOUx7Q7mB3mC3Fe7@24313c2339b3>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230822220710.3992-1-hargar@linux.microsoft.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH 6.1] selftests/net: mv bpf/nat6to4.c to net folder
Link: https://lore.kernel.org/stable/20230822220710.3992-1-hargar%40linux.microsoft.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

Please ignore this mail if the patch is not relevant for upstream.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



