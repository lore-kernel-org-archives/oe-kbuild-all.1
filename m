Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D698836
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 May 2023 14:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684161500; x=1715697500;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=vlscW+F6IkOqTCbIHzUtl95EflBOJXMHjXnqSlfn9RQ=;
  b=EIQ/ETJitqykQ0QxB99c6IrMVWt8aPEeYpmmIVL3VW2bQy/ZCY66UZwH
   04IcB8jfGP6KxBZcDAokJ4nKuAE7TYJ8w3xRXUEK8R7OJiwkQ17RIKcPB
   XDP+ZiVlgPsxCFPBgszn3BfHuVAwBtE7y28zxGJ94sWGaCzqL+WKJsoxr
   U1mOrkck5e5rbKTCNNISQFF6i9Bqo5g0ZS4jM5hT3B1qabcQFQ3eSQNkW
   pKif213iGd3xi9pH0bsMoXMiltWzis/ALQGCCcazcLuhoaUkYhLHbV08L
   ppHBcRz2hqmyZnl+TAxDbBfeJoAmf2TuqgvZWg8qCiYUVVh4qHbCM8/W4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="330836089"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; 
   d="scan'208";a="330836089"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2023 07:38:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="1030922057"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; 
   d="scan'208";a="1030922057"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 15 May 2023 07:38:18 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pyZL7-0006Ow-2N;
	Mon, 15 May 2023 14:38:17 +0000
Date: Mon, 15 May 2023 22:38:07 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 3/3][For 4.19/4.14] spi: fsl-cpm: Use 16 bit mode for
 large transfers with even size
Message-ID: <ZGJDz2+JPvdVoBfT@e0f96cf4e6cd>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9363da33f54e9862b4b59c0ed97924ca7265f7a4.1684158520.git.christophe.leroy@csgroup.eu>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH 3/3][For 4.19/4.14] spi: fsl-cpm: Use 16 bit mode for large transfers with even size
Link: https://lore.kernel.org/stable/9363da33f54e9862b4b59c0ed97924ca7265f7a4.1684158520.git.christophe.leroy%40csgroup.eu

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

Please ignore this mail if the patch is not relevant for upstream.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



