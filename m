Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7970328E07
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Nov 2023 15:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qa+d6Nmy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699284735; x=1730820735;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=0bFeBd+noHuXD+FYfWx5LwfjAAxeiAFNpAGVqCVP93E=;
  b=Qa+d6Nmyuw255yhTbDpxLPi01zZ51110gwF8B5n6QUktjamuj71LCk1y
   J+oXC2S0Nn+WH27IFruJkHYDl9ajnoFcvANM6TJBJ264ILSzl+witnvg/
   1VZ2PcOlbkPS3Lr0xpfqi0DCc6wUG3v8aLSBXw4Z5pROJYT4ny3ZfwOF4
   Wli7Egb5AQHvGvYnPROi2BisqI2Z6DObfiQA2aKvcjjHb/0d+M4X8ESr3
   YUxI+8qIhH//mYs88FvNeRJr7Juhv4m8Lp/m0KtQE55S4G2EPCJOBeeRS
   q0p4thkoHZQdSY++QE8ddsuiBjWfDz6J+jAAXzha0wnwKW3KpfM6Jng+j
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="379691051"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="379691051"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 07:32:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="828252795"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="828252795"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 06 Nov 2023 07:32:13 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r01aE-0006Vk-2b;
	Mon, 06 Nov 2023 15:32:10 +0000
Date: Mon, 6 Nov 2023 23:30:16 +0800
From: kernel test robot <lkp@intel.com>
To: Zheng Wang <zyytlz.wz@163.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [RESEND PATCH v2 1/3] media: mtk-jpeg: Remove cancel worker in
 mtk_jpeg_remove to  avoid the crash of multi-core JPEG devices
Message-ID: <ZUkGiBa3FksnBHvi@dccdf558eea4>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231106144811.868127-2-zyytlz.wz@163.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [RESEND PATCH v2 1/3] media: mtk-jpeg: Remove cancel worker in mtk_jpeg_remove to  avoid the crash of multi-core JPEG devices
Link: https://lore.kernel.org/stable/20231106144811.868127-2-zyytlz.wz%40163.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



