Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FC321D52
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jul 2023 18:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690310216; x=1721846216;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=O3WNw1IomdWkDJr2ZIyRjZ7kayR7RhsTlPQToycSmts=;
  b=U07SK9M5iAwmJKhMDH3E/RuyJZVWLKCrXuct5CWs2TguAjVzdvr/zMKv
   6URCFg2E0JLmiOwZ6SK5J+DLNBa+t/5P8fRmx6IGJAjBlzHfnCl7zhElI
   g0XAUTHNuEGmS4U5x4sv3jxquPAuFJl7W/rQb8AzNjBEh5W341O+fZA6L
   N3TDubuY3T/dz6dRJEFgBr7EPxa2WxUajcJye0+pOwBVMH1xHDJaWLJts
   /ym95A+r6THm3MmNysIUIka8FWfHR94jDml3jtTQJeyPzVMW93ysDGKqK
   ud2GIi+if4s2uFwFyqM47y+KxO9QGZWQiDXIdxO72IHQni3rJqcMnrZ6w
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="398735648"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="398735648"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 11:36:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="726196882"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="726196882"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 25 Jul 2023 11:36:54 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOMtx-0000Dz-2R;
	Tue, 25 Jul 2023 18:36:53 +0000
Date: Wed, 26 Jul 2023 02:36:31 +0800
From: kernel test robot <lkp@intel.com>
To: Mat Martineau <martineau@kernel.org>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net 1/2] selftests: mptcp: join: only check for ip6tables
 if needed
Message-ID: <ZMAWLwU5CVEksBoI@c507f7d2ae6a>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230725-send-net-20230725-v1-1-6f60fe7137a9@kernel.org>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH net 1/2] selftests: mptcp: join: only check for ip6tables if needed
Link: https://lore.kernel.org/stable/20230725-send-net-20230725-v1-1-6f60fe7137a9%40kernel.org

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



