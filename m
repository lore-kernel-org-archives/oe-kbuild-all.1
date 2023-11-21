Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5917D3C688
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Nov 2023 16:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QPegALvi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700583669; x=1732119669;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=bN0/tT3ID9thdu8ZN98YMx6TIdYYuKDHnRlzb6COkHQ=;
  b=QPegALvi1gW/M+zMi7hWqvYnmeUT5Wcyn8vDftw7nKDBq3ve6CUtLeNo
   7zNNUOeUVQC3VKwu7L6rkuPVz4p/L8iTXOzWfFh4HaeseRlXPFg7f4aBg
   u0HuOEI29QTB0EZFZWw1Gps8SPySiv2M18XxI5XZKhiafg2xKjcXwfxUv
   I/N5biWmd/ySRS1uOFj+rilkFuLl/fLPUCoCP0EMVQtxnnjgwEKw5KWAv
   DR8u3jE82WKtNBVaH2Wh+1TLmByde82i6rFkaNmCZT0qJiaUFnb534izH
   UmpdIRdf4Ye3Z15jBWADcm6jZJyiJNo5eDASt9Nn686is2wbatX6n2TIj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="13415765"
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; 
   d="scan'208";a="13415765"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 08:21:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="716578646"
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; 
   d="scan'208";a="716578646"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 21 Nov 2023 08:21:07 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5TUm-00080w-1x;
	Tue, 21 Nov 2023 16:21:04 +0000
Date: Wed, 22 Nov 2023 00:20:35 +0800
From: kernel test robot <lkp@intel.com>
To: Florian Westphal <fw@strlen.de>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] netfilter: nf_tables: split async and sync catchall
 in two functions
Message-ID: <ZVzY02pFIdhp4TEw@4c37e47e6016>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231121121431.8612-3-fw@strlen.de>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH 2/2] netfilter: nf_tables: split async and sync catchall in two functions
Link: https://lore.kernel.org/stable/20231121121431.8612-3-fw%40strlen.de

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



