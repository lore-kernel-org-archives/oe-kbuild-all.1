Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E8163B7
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Feb 2023 13:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675345010; x=1706881010;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=ofKN6pdYNSrQbvweD2jq4mGqjgTfrQID4aanb98QxhU=;
  b=UToq0Rr+zkijRHo8ylcVBBlJWD8BUmzxBNlXL1FClJFoKhxfA7o9PgGA
   JSlqAldUA2vmbdnrbrX5niJQ4+iu3/xQqtY4fMNZ2a6BshUJHpzahBv7e
   qk2Sk2DMBDCL4A1t9EPHiOfcRxlfVGXGpWY9xb9c9j+xoWhJFLdA0wJKR
   Pi0CuQhAQrXA7YMuJ/eoqMvxFFWN2hDM8iiGuTavkdGI/e42yTvLrQg/h
   O18LEswNjRa8VYf8X/I5BTyDzWar0q4/QzIvcBTO6RBgGKTWWezEG730C
   evA4SEIPc4t7yVdlSu+meKlwEk3/uQIEaIvB3+PO/qBRKGVOf2jp2Db72
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="326140986"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="326140986"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 05:36:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="615284358"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="615284358"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 02 Feb 2023 05:36:33 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNZlQ-0006YC-1s;
	Thu, 02 Feb 2023 13:36:32 +0000
Date: Thu, 2 Feb 2023 21:36:22 +0800
From: kernel test robot <lkp@intel.com>
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 4.19] cfq: fix memory leak for cfqq
Message-ID: <Y9u8VnupyG2jPXjM@904499574ff1>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230202135850.2415165-1-yukuai1@huaweicloud.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH 4.19] cfq: fix memory leak for cfqq
Link: https://lore.kernel.org/stable/20230202135850.2415165-1-yukuai1%40huaweicloud.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



