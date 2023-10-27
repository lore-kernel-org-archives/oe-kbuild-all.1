Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5611E1946F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Oct 2023 17:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cAyc8HEn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698428934; x=1729964934;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=/7SjA1LpJ8qWzgG9ARbe5wAImR6tfU/v7q6M7oDJ9b0=;
  b=cAyc8HEnIOl1aNe86mbxE5ssSFekixKr85S2+5WKprBDjv5jRCZa3WaW
   Ayxe6l9NrAJHmGmhvayaf3e7EXW/FVKurSbbtJDJINOReF6G+MxhZPIbX
   wOcM0/zxE0iBWbvldvy1WR3ZDh99xakKE13+U8x6s8DMgQBG+HMlrbPS5
   Ds1iQrmZoRH38dh7FYdiL6EDL+3fxLyKSN5Nn7fJcTYevhauR1XO0Ejqt
   3qhP2nPKspI8BZygso1pCykyyutCIR1lshB15FZYwceTEsGnFETd5lgzM
   gZYjIM8kREysmmE/WevlA+MeCX1rmdvYqlDh56ip56DkP1uoslXhvREfa
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="372875999"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="372875999"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 10:48:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="825417952"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="825417952"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 27 Oct 2023 10:48:52 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwQx0-000B3n-0m;
	Fri, 27 Oct 2023 17:48:50 +0000
Date: Sat, 28 Oct 2023 01:47:55 +0800
From: kernel test robot <lkp@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: Apply a1e2c031ec39 and e32683c6f7d2 to 5.15 and earlier
Message-ID: <ZTv3y8NB7A3KrFPF@dceb3e7df498>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231027160144.GA232578@dev-arch.thelio-3990X>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: Apply a1e2c031ec39 and e32683c6f7d2 to 5.15 and earlier
Link: https://lore.kernel.org/stable/20231027160144.GA232578%40dev-arch.thelio-3990X

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



