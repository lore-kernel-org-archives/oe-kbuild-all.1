Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6263C12B79
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Jun 2023 21:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686172125; x=1717708125;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=UeHpEIaj26GpUP5IYCU1e0+WwoHn/3OuH4lzcnE55yc=;
  b=jS2r5+zVgOSBeUu1n6Otedk3CaboW5qbcNVokAF7TpgLVUAAt3C3gyvN
   u44PD/L0nxoh0zyGaJSWNXy3n82234vYEaa+G/MyMQ0Yr2s+HSHuFUBS4
   9423r18fa4RW+iN9QBAtZZuLwzw7w17t15itS/NVyVcbhEJWOKmA9d5vr
   fDTBiOqHVTMt1o41qlIdxz2Eyv5e+F+09ACO3mW2x1/1U1gsy9RqbhRFE
   9i4/il3rMZRqOk78oEbm2v17qwL1z2PHFUlUIq6xt4RetiBILlgrJ/sey
   sPRKLTZoUHwIcMAob4/tX46VNSjtW3sX1FzUfFM0/W3/eLYmZYmLmouV1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="354598657"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="354598657"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 14:08:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="712833493"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="712833493"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 07 Jun 2023 14:08:43 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q70OY-0006uf-2J;
	Wed, 07 Jun 2023 21:08:42 +0000
Date: Thu, 8 Jun 2023 05:07:50 +0800
From: kernel test robot <lkp@intel.com>
To: Krister Johansen <kjlx@templeofstupid.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH bpf v2 1/2] selftests/bpf: add a test for subprogram
 extables
Message-ID: <ZIDxpjpcp7EqWTsH@a93e062a6cea>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3d55cfd8ce7ed989c997d1e3ea2678879227300.1686166633.git.kjlx@templeofstupid.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH bpf v2 1/2] selftests/bpf: add a test for subprogram extables
Link: https://lore.kernel.org/stable/c3d55cfd8ce7ed989c997d1e3ea2678879227300.1686166633.git.kjlx%40templeofstupid.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



