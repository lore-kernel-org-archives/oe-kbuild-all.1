Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B360F149C70
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Aug 2024 08:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725094196; cv=none; b=gBb028qyaDc0spWIOe9cU1ExXDG+xwc1z8BDfp2ZtYZXXk6SBziQZdTJtumjTrDmuodJZPm4Vy4A8w4OSyxnl7/3hY4dB3PD12+ct167H1HsvMdCCJ2tX5PlG3zqtsyFHtpNr54xamkTdLnzs0az3nnX9hXqlyu8yeMP7Pt2Vvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725094196; c=relaxed/simple;
	bh=Qtwn4MMSQwPVIkrDa8LfPR7jXofCn96dS1Y0GPTstBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eAkGzA3o/ZqlTyWpQd9wKe2r3xVAx2iSbiYLxfqisCvKI4cvlBDuW2t6bDMtfC3/vLCiyi7W/xJTFUJfAQZxV+a6NDTgES8Pg5CeDz79+1VblpLTKIevI7cf3om50w7dYkIY3g6e2XD87YjvRNGL/Bv75P8sIYi3CJ/xTYYMgAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VPtNQsZ0; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VPtNQsZ0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725094195; x=1756630195;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Qtwn4MMSQwPVIkrDa8LfPR7jXofCn96dS1Y0GPTstBo=;
  b=VPtNQsZ05RIi0QAx1qaYQqNsVdEjdmDXYIKhXtjPtjyfP9m13XQc3048
   x1vhvJ4hkByZVlvbnU5lVwFa19EKJmFHpvLHxib6W5cp1zOw8M7zGEEfP
   /6hPxYj0Tv3qzwEZLidJCEvusvnQos8zVh5UWl2JQ4A/7qEcc+wkQFs9E
   P4fEnB6HRguil1xZCvUsbyLHcMIEJQLX92fSn94N0pf24zphdHnZg67ej
   ysuGQUJ2hIrOT/+lKaaD+1cQoLQxH/HDJ0EDY/4JjrgGVIgHKlscDxBql
   EnrHPrYGDekJG0ahzf/JC9epkSdI0QTQwYgaGBffLK7yYLzY9X7Q1XLIx
   A==;
X-CSE-ConnectionGUID: 5bCLtAJtS0Gr8Elb3gXC1w==
X-CSE-MsgGUID: f3asTQtrS8+Zg/eRmZlh+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="23863003"
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; 
   d="scan'208";a="23863003"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 01:49:55 -0700
X-CSE-ConnectionGUID: NA9CVosaQ76HRFxiqyDTEQ==
X-CSE-MsgGUID: D9nNyHbbSlGFAa3u55Njtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; 
   d="scan'208";a="64865875"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 31 Aug 2024 01:49:53 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skJnq-0002Tq-0d;
	Sat, 31 Aug 2024 08:49:50 +0000
Date: Sat, 31 Aug 2024 16:49:48 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Frank Rowand <frowand.list@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] of: move empty_root and unittest data DTBs to
 .init.rodata section
Message-ID: <202408311656.JgYqHrnC-lkp@intel.com>
References: <20240826124802.1552738-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826124802.1552738-1-masahiroy@kernel.org>

Hi Masahiro,

kernel test robot noticed the following build warnings:

[auto build test WARNING on masahiroy-kbuild/for-next]
[also build test WARNING on masahiroy-kbuild/fixes linus/master v6.11-rc5]
[cannot apply to robh/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Masahiro-Yamada/of-move-empty_root-and-unittest-data-DTBs-to-init-rodata-section/20240826-205316
base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git for-next
patch link:    https://lore.kernel.org/r/20240826124802.1552738-1-masahiroy%40kernel.org
patch subject: [PATCH] of: move empty_root and unittest data DTBs to .init.rodata section
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240831/202408311656.JgYqHrnC-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240831/202408311656.JgYqHrnC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408311656.JgYqHrnC-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: testdrv_probe+0x30 (section: .text) -> overlays (section: .init.data)
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_objpool.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
