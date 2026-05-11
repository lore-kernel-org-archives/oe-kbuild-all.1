Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9163BADBD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 May 2026 08:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778488809; cv=none; b=CmejvRFPsQRB+f8TW95l8q4ArsSeQ3QoA6IF6P8nXKX6N7+sroQ6heIBvZ+JkfboCR77hvIp169E9G10dFff+QTz7jGXb4zHJtZEmg/ZwjgjCdfnrK1DOPq8pt+Rppi9BLJYivSUmSyhnNHrwMF5xWA1uj5cdZfcjjic9DpXdQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778488809; c=relaxed/simple;
	bh=FjxoFU/iuph2uKQuJYPBP/jRCiI5H4PriSYE3OFrGPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FssrUirabcp3juns3FnhKePudcheh/+zzwSGRzCbaYJCjf9fG4/9rL3ckXzNALge9zaK4AaTJLV3W5VHThu+w4v0bn9ocj3UDNBil8JwE8gAfMcVrehnFu8frq4Nyh/oE9P6RE/CZUGijT8BveyDtxdu4PPkvwqgL7+tfshzfR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dLSH/H2M; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dLSH/H2M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778488805; x=1810024805;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FjxoFU/iuph2uKQuJYPBP/jRCiI5H4PriSYE3OFrGPU=;
  b=dLSH/H2MjALLOpYlgbnvyhLpHANvhi+ZAokedB6AYrvkQquOwS7s8nDG
   u7CKhtlI0sysXND7gBP/d57HGrI4Fx6xPR2CEmY7X4zuSOCIOzepD0lPG
   DJBtielLmqtBnwfjHngzXUUeXfi07jxD7ekJpavbf5J7qNMPeRsRkADPR
   ZXFYX3eNJfGGvTlLSo/JnTXyqcYf5dXSwpRQIgSwcRVwoYXg1OnzMWNDU
   NxonmABxoNoDrt80LXiLyypyjYFCymHzNDS/lztEDFWTM9RapiDdNA8Ie
   3nUOGkWxA1Rj9CjBprlRSy/fUmvAx35dsdfG4ZXJ2qsX8+U3+YrRsEkN4
   A==;
X-CSE-ConnectionGUID: Aw/5TcGFRNKUD519RROTbQ==
X-CSE-MsgGUID: sgNzfKx5Q5mxrnOHFwZrIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="82981396"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="82981396"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 01:39:59 -0700
X-CSE-ConnectionGUID: 8umqLdDHQJyo1nUXtxdk0Q==
X-CSE-MsgGUID: gn3R5xLYTm+H4pTe+HNCFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="242380856"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 11 May 2026 01:39:56 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMMB7-000000007v7-2d8S;
	Mon, 11 May 2026 08:39:53 +0000
Date: Mon, 11 May 2026 10:39:44 +0200
From: kernel test robot <lkp@intel.com>
To: Yan Zhu <zhuyan2015@qq.com>, corbet@lwn.net, alexs@kernel.org,
	si.yanteng@linux.dev, kees@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, skhan@linuxfoundation.org,
	dzm91@hust.edu.cn, tony.luck@intel.com, gpiccoli@igalia.com,
	frederic@kernel.org, jani.nikula@intel.com, longman@redhat.com,
	mchehab+huawei@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Yan Zhu <zhuyan2015@qq.com>
Subject: Re: [PATCH] docs/zh_CN: update admin-guide/index.rst translation
Message-ID: <202605111009.hlpiVkT6-lkp@intel.com>
References: <tencent_7ADF2D1EBD8EAD2028BC93BA7858EA655D0A@qq.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_7ADF2D1EBD8EAD2028BC93BA7858EA655D0A@qq.com>

Hi Yan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lwn/docs-next]
[also build test WARNING on linus/master v7.1-rc3 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yan-Zhu/docs-zh_CN-update-admin-guide-index-rst-translation/20260511-102406
base:   git://git.lwn.net/linux.git docs-next
patch link:    https://lore.kernel.org/r/tencent_7ADF2D1EBD8EAD2028BC93BA7858EA655D0A%40qq.com
patch subject: [PATCH] docs/zh_CN: update admin-guide/index.rst translation
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260511/202605111009.hlpiVkT6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605111009.hlpiVkT6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Checksumming on output with GSO
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ [docutils]
   MAINTAINERS:40: WARNING: Inline strong start-string without end-string. [docutils]
>> Documentation/translations/zh_CN/admin-guide/index.rst:114: WARNING: toctree contains reference to nonexisting document 'translations/zh_CN/admin-guide/module-signing' [toc.not_readable]
   Documentation/userspace-api/landlock:504: ./security/landlock/errata/abi-4.h:5: ERROR: Unexpected section title.


vim +114 Documentation/translations/zh_CN/admin-guide/index.rst

   113	
 > 114	.. toctree::
   115	   :maxdepth: 1
   116	
   117	   cpu-load
   118	   mm/index
   119	   module-signing
   120	   numastat
   121	
   122	
   123	Todolist:
   124	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
