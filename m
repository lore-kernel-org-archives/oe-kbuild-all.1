Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D35C33D2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Dec 2022 14:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670942225; x=1702478225;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=xgNrKtjkuBXAdoSYd0SQ7z78QUyYjWn3p6n80iFjMUc=;
  b=KwcYGCZ+O0X6uL3kwzItPFnMUvOdBUSixR8jHB69viIZqmt6xXoZj4uN
   EGs4ZcxO35+Ebp49WpkxtPPibrzvoAbdoA/+jgRuUqNSJ6A7YLsm8BPNe
   qFVfWZOFP1kQq9TqSYW3vqlUQEfmepXneqt2DJXExziFSxkjJ10++35FV
   Pc4OODpWbkpP9H/BTIL+vFwgEWzL1rpT4piS1iIA7hg4ehaAPmnb5Orjf
   XtBAB+cCg5rhHZyQfM+h6ZigHyZp3biNhmJiUz8VygChiOgZlTBcYahkH
   9Tl9TlkDM8DSfm6eocuO7jttEO5lwCuOEKgM0NZpmmFis2v1FobnSKTky
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="301559937"
X-IronPort-AV: E=Sophos;i="5.96,241,1665471600"; 
   d="scan'208";a="301559937"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2022 06:37:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="650726061"
X-IronPort-AV: E=Sophos;i="5.96,241,1665471600"; 
   d="scan'208";a="650726061"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 13 Dec 2022 06:37:02 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p56Oz-0004Qn-1H;
	Tue, 13 Dec 2022 14:37:01 +0000
Date: Tue, 13 Dec 2022 22:36:56 +0800
From: kernel test robot <lkp@intel.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/2] media: uvcvideo: Do not alloc dev->status
Message-ID: <Y5iOCG8fSyuaFdfz@0d7994225921>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221212-uvc-race-v2-2-54496cc3b8ab@chromium.org>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH v2 2/2] media: uvcvideo: Do not alloc dev->status
Link: https://lore.kernel.org/stable/20221212-uvc-race-v2-2-54496cc3b8ab%40chromium.org

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp



