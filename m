Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDEC33F9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Oct 2023 11:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dKw8SA3k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698665645; x=1730201645;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=F6a69DBMdWz//e4S3fNtmi9N9e/c7IrOYuu021asz1c=;
  b=dKw8SA3kRE9nDihB/JiB0jNDPJcrQstU3S2lioA/Q/jp1gc6NlaEs89d
   ZjKkiW8Ye0ffn//bYmR+swzRd1HHetjMhuzRjyEc6/S/g8dlLKx5yQ26c
   g7zXBdlalv5VRFWmT9Ql6gZlxxSoeyqExp34SjgtJExzeCQG4eQFEKuV5
   mbRI7M1nHnermoA1AZj/7oS7rZcickJ4H4InROsN6UYkevR9tDzar4ZWP
   ytodS1puudgT7Oux7RSlzI9bpAz1Wu0SqxO0l4XrSpshFXrheGvh4wun2
   XK6Ul2TALZLNxInqY1fySbfmUU3SupNAaStMruxNveualSZsQ7CFtmiRL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="368267703"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="368267703"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 04:34:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="933751950"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="933751950"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 30 Oct 2023 04:34:03 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxQWv-000DEs-0y;
	Mon, 30 Oct 2023 11:34:01 +0000
Date: Mon, 30 Oct 2023 19:33:07 +0800
From: kernel test robot <lkp@intel.com>
To: Oliver Hartkopp <socketcan@hartkopp.net>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] can: isotp: upgrade 5.15 LTS to latest 6.6 mainline code
 base
Message-ID: <ZT+Uc/f+ivKZd+ft@dceb3e7df498>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231030113110.3404-1-socketcan@hartkopp.net>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] can: isotp: upgrade 5.15 LTS to latest 6.6 mainline code base
Link: https://lore.kernel.org/stable/20231030113110.3404-1-socketcan%40hartkopp.net

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



