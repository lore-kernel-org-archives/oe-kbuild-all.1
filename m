Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795506643;
	b=oHFczZfj1gTV6kGanWjclDRDaw32ez21tn15tYbN5mpfnH+JvR51FtHXb3d2LfMttABD
	 8BvQdk+WtnERVh3ZzcL3lERHyAUlRRiiczTuTAUzxyNk8i+2eNjBmI5449+Fe085MQbED
	 sE4WUowIFgK11irf5hgSG21eSbxjHQ/jUscoI9RqsRWPyMX2O9kECmkoxc+cW8Oapeg0Z
	 yJDLJ2PZTwK0dkGGIdUqTHtHu7UIA5GSL0/6pDF15ercuvwh0Y4GkQiHIFIb2VYdtQQId
	 Q/mwIRF94IxpymzBHs5A+6BWFxKAxCPRIA1ZTGOtjyNnQ9SYz6O1vpt0rgsNxRlOp9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506643;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=LPuiI8+fEoZ3XHt3EEseqS7c8sMolzG6McDF216jE8Y=;
	b=LFb2Eve2wKNA3ZSE1adTKmT816+aIj9plU2enuJtYnUCuUcWhfrfXBf5k8HhPB2mAuSu
	 kvvHz6WLH0KLK6Y6uHUr3qe/+mwLQ322xNa7YPcB0PNAYSry+zDkj8lVVfdIkDUQMXaVN
	 GE/i/RPzZk7fLyZwBotF1fun6iZ9aW9OmuwJUCKHJ9OpHs2dCDrKOyHDaAC/b1zRFT+rI
	 yWxUJXw8D/sHDnOI5WM4svzBGKYKkq1Pc+c6X66OtN/GUotVXgDJBP9pxNll1zWogYL3T
	 2yMlY2Q/Z3Oe7b+lRpWfZ2CZkWsjgxYU2tO5XrX5zH5jq6oGyC/dIO2EJcrGfXd378A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VEMjiv3Z;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B41606A321
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Nov 2026 07:50:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93B41606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VEMjiv3Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795506643; x=1827042643;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VYNBiC56YADEA7hL5PeT8sjOGfZIMtK5pBn2f2flI2Y=;
  b=VEMjiv3ZzqeasHv9WjfT0g8mOswqjIIDEJBT2H8dqtQZgDphMP+/srl4
   9NXGZisL7nQDE520o5Z7z42RdkuFwe4yIIyQx7xvBjwut5teGjm3M7oca
   KvECWZkcAObniT2pjl2PC1Ad4Er51OSVW9i4/EpNCwPouWZrjoal2UG9e
   D5a7TSEROjEfqTFgZAACMzAJdiCfMH043P8b07P5KQ6PYD0m2BgXxKPge
   z8s62tTcQmPuv+e+Iw1Awtyaa7zZMcSJDVgy2mxaWbUVrKHfsF1KWDZJo
   osysjvSsNKX4qAqE7Qco+SX1uUNYF2mmWQSmFK/f086IGWiuokvj0gFb+
   g==;
X-CSE-ConnectionGUID: TEjguDwwSRCC76GJiOnpPQ==
X-CSE-MsgGUID: mfKNfQyqSVCS5FPxVM/ttg==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4177519"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4177519"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 23:27:05 -0800
X-CSE-ConnectionGUID: mJ8j8SZdQfSzdo/4z/iCfg==
X-CSE-MsgGUID: 1TxkKq4wTDqxPvKr9H2NRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="11397608"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 23 Nov 2026 23:26:34 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVkv9-00000001Ol8-3Cxh;
	Tue, 24 Nov 2026 07:26:31 +0000
Date: Tue, 24 Nov 2026 15:25:45 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Terrell <nickrterrell@gmail.com>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Nick Terrell <terrelln@fb.com>,
	Kernel Team <Kernel-team@fb.com>, David Sterba <dsterba@suse.com>
Subject: Re: [PATCH] zstd: decompress: prevent stale literal leaks after
 output buffer wraps
Message-ID: <20261124152149.1N2qpvne-lkp@intel.com>
References: <20261124012731.87451-1-nickrterrell@gmail.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124012731.87451-1-nickrterrell@gmail.com>

Hi Nick,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-nonmm-unstable]
[also build test WARNING on linus/master v7.4-rc4 next-20261123]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nick-Terrell/zstd-decompress-prevent-stale-literal-leaks-after-output-buffer-wraps/20261123-172731
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/20261124012731.87451-1-nickrterrell%40gmail.com
patch subject: [PATCH] zstd: decompress: prevent stale literal leaks after output buffer wraps
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20261124/20261124152149.1N2qpvne-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261124/20261124152149.1N2qpvne-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261124152149.1N2qpvne-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: lib/zstd/decompress/zstd_decompress_block.c:127 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Zeros the bytes directly after the decompressed literals so that over-reads

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
