Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15A215A9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Dec 2022 02:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671676134; x=1703212134;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=xrlavxxJX9nRKs80rKe8/VFF61BnAsPPj8kXPRcNo+E=;
  b=atggnunkNuDpzmGjDvEHTa4C0BIFMbhkQ/mSF1bUKTZwmVneSPJmV+kW
   fluA6bU4H1rsjfeTKe50EIIWEq1EqerPC9JV2l+Jv9ywHD0CW6MAddYj3
   oO6UM1YbgRF7jPrrJa65CDojAJmi60EvGWNtgo4Ns56nvpBoa9qd1Mhwx
   c7YTfeVwSdOQNkHbe1/1EuTIQrs3huN30QZqwDVvCFgMWlsVu5+WzqBrc
   upDRKcN9WlyMT0hEEknnrZa9AF5Qe5zxjTjaN4J9TH4wz0mqrxSi3LZP1
   DuTDjGCIQjNtRPiVjJuHGTCe2zKdueFlVrogCbaeKb1xeQG2cw0VEL/d7
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="347161849"
X-IronPort-AV: E=Sophos;i="5.96,264,1665471600"; 
   d="scan'208";a="347161849"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2022 18:28:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="740380096"
X-IronPort-AV: E=Sophos;i="5.96,264,1665471600"; 
   d="scan'208";a="740380096"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Dec 2022 18:28:51 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p8BKE-000B8M-28;
	Thu, 22 Dec 2022 02:28:50 +0000
Date: Thu, 22 Dec 2022 10:28:08 +0800
From: kernel test robot <lkp@intel.com>
To: Matthias Kaehlcke <mka@chromium.org>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 1/2] usb: misc: onboard_usb_hub: Don't create platform
 devices for DT nodes without 'vdd-supply'
Message-ID: <Y6PAuCsjbX7y3Wrf@416bcb91c936>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221222022605.v2.1.If5e7ec83b1782e4dffa6ea759416a27326c8231d@changeid>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH v2 1/2] usb: misc: onboard_usb_hub: Don't create platform devices for DT nodes without 'vdd-supply'
Link: https://lore.kernel.org/stable/20221222022605.v2.1.If5e7ec83b1782e4dffa6ea759416a27326c8231d%40changeid

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp



