Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF422469D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Oct 2023 01:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ds3LFsoi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698285533; x=1729821533;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=+adLPgiS7b6XKq06ZLA0MvWi0dYkt5YhHmzsRvm++5M=;
  b=Ds3LFsoiRCFL5eD0iHKDca7ExwTU+JpWTK3Jb536+11opIsv9bbtL862
   KjdY9ebqhdcnyoDFEQg+N4WDp5fvlOG9wjNvVUUEAVwMENsMpR87RuqQM
   XP6aY1iLTUBn13KnySylcW+DRO3VykCEZWfoe6F1kGWlvlE6oNgfYC/xf
   GnV9JekZADeiV0bZE61yLmVK7Ft/T6p2W3IUib+rydL5nJdxx1ZEWMq2F
   mVJYyIW28VZW7uTT8OH/MTElJAYpuBzTtl5BLKRoOAQsVqfWSyQY32TXO
   JrwgYaxBUO7hi4ZS+SLcphuCCUlB0UWxhBd1gW0FyXi+QnmnD7jg+sW4+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="473677674"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; 
   d="scan'208";a="473677674"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 18:58:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="708906484"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; 
   d="scan'208";a="708906484"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 25 Oct 2023 18:58:51 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvpe4-0009Mo-23;
	Thu, 26 Oct 2023 01:58:48 +0000
Date: Thu, 26 Oct 2023 09:58:44 +0800
From: kernel test robot <lkp@intel.com>
To: John Sperbeck <jsperbeck@google.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] objtool/x86: add missing embedded_insn check
Message-ID: <ZTnH1KLl0Bn4pXoQ@20f93f21cc77>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231026015728.1601280-1-jsperbeck@google.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] objtool/x86: add missing embedded_insn check
Link: https://lore.kernel.org/stable/20231026015728.1601280-1-jsperbeck%40google.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



