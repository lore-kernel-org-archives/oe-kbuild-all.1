Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F264A33
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Dec 2023 07:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jDPnbMn/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703488797; x=1735024797;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=VvP3lVseSwZso8Vfs7xEYANVnkrnNrLbJwwacbxIHVQ=;
  b=jDPnbMn/ZvRYGuCahFDyxzS9Tjdns2gpa/rVCkvH5ImR0acK5fPwLpFT
   1Fy3gUKnC1LWQrdttuS92Gc/umqJOXJeUC7S68YTK+PqNLPE4S5M8p5Ap
   G20kx8me/44JApJPnhc70rkHCyp5djjOm1KFz/+BeoCOdtQfi+4g7xQKU
   EvmQQybuuHLF740/EfA17uRN7gdLSIVVdR4xIspQ6yk42iAwKPnzfk39L
   R+I2o87Hhhguh8zmaxvimtkxjsa2yb9ivrK8gp2/T2SL0SCG/+XShVKYc
   SFoZNNFsW/4IJi/TgCw5xoHQEv0t+uS2ggjCIYezE9NfNjY5QLbAq3B/o
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="395161401"
X-IronPort-AV: E=Sophos;i="6.04,302,1695711600"; 
   d="scan'208";a="395161401"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2023 23:19:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="868314059"
X-IronPort-AV: E=Sophos;i="6.04,302,1695711600"; 
   d="scan'208";a="868314059"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Dec 2023 23:19:55 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHfFg-000D7U-1w;
	Mon, 25 Dec 2023 07:19:52 +0000
Date: Mon, 25 Dec 2023 15:15:32 +0800
From: kernel test robot <lkp@intel.com>
To: Felix Zhang <mrman@mrman314.tech>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] Bluetooth: Fix Bluetooth for BCM4377 on T2 Intel
 MacBooks
Message-ID: <ZYksFJtDVQHy_Az_@89a6bd94b8e8>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <05aa1755970796d5a250660e42ee85ad@mrman314.tech>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v2] Bluetooth: Fix Bluetooth for BCM4377 on T2 Intel MacBooks
Link: https://lore.kernel.org/stable/05aa1755970796d5a250660e42ee85ad%40mrman314.tech

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



