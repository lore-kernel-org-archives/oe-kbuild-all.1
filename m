Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A16B79E3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Sep 2023 13:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695646874; x=1727182874;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=ZkN0p2Soq8XMUh+o99Wn1yc0hzf8lSpVouGsN39VDKQ=;
  b=ZMdPQMcqjG89AhNjITuS9CW63sS88ci8CSifjEOrQvdVnl2J7GxfnBCm
   9xeW6dNLnH28u/8B909aWJs47MQ1WjZJWSIeQPCqjO8anF2Nh5P/jsX4x
   +/xg+8Jw4L40VBARjS1Jag157f7yiFEg3ptIqRYKWCCYGnTKpShKS2fda
   sPI/bd3s0+lpfXlcEy18CLDJ7dZ7F6Bs7Nr+CbWE37TbazAxiLdfcJKeg
   idZ3mMpPT9qGWW0+eFxgHUrxjBqAMIbmFz8a2Cz9y3GswAsSpSKA2OlMi
   3L+pIxqrdQNFncCKZn7y/UKY/FH+H+Qq0GUWPjNy6uz34xTeiitymibkK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="467529151"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="467529151"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 06:01:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="751664086"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="751664086"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 25 Sep 2023 06:01:11 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qklD3-0001Wv-1Y;
	Mon, 25 Sep 2023 13:01:09 +0000
Date: Mon, 25 Sep 2023 21:00:21 +0800
From: kernel test robot <lkp@intel.com>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] binfmt_elf: Support segments with 0 filesz and
 misaligned starts
Message-ID: <ZRGEZcVhvI2YKx2/@845c4ce01481>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jzsemmsd.fsf_-_@email.froward.int.ebiederm.org>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html/#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] binfmt_elf: Support segments with 0 filesz and misaligned starts
Link: https://lore.kernel.org/stable/87jzsemmsd.fsf_-_%40email.froward.int.ebiederm.org

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



