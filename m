Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0CB8F42
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Jul 2023 12:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688645847; x=1720181847;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=tmboW8yx1/+ZQqBNV+MR5wQoq2TPiTukKq1gxHNahg0=;
  b=UDqcrW18jqkN6sULJwZ1jp3faB7DqT3eR3nn3MtH6FEqNzSX8sgY27Rc
   uOt6yZCdbAyN7m1WCn3Kt0/bFWZDOkNOSjdtXMnzquUN04z9cAfaiD5rF
   eqEJrF2NawIoo9lfo8xFN/AOFt2jHUCWvTqPYP5U/OQY5KUYLf1RXsl9r
   2yNvAKb6SOnJDgbLDMau24q0vTZ8GzzCBNORf2V4GGKNdPrzYADTtGP2K
   AddSrN6moJV30jQ2ywUVBd/i3TqcPOfpJjT7k2fQwM/2PP4h4l1RpzzoN
   A6XqyB4wYGTxum2p7vUfHk9WTiCJURjeK8Ze6BaxWBbKBu1/LXkvHrtHX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="449945462"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="449945462"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 05:17:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="754739045"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="754739045"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 06 Jul 2023 05:17:24 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHNvI-0001J8-0H;
	Thu, 06 Jul 2023 12:17:24 +0000
Date: Thu, 6 Jul 2023 20:16:55 +0800
From: kernel test robot <lkp@intel.com>
To: Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH V3] PCI: qcom: Fix broken pcie bring up for 2_3_3 configs
 ops
Message-ID: <ZKawt2xzy0f/bzxe@a1daa7802ad8>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230706121537.3129617-1-quic_srichara@quicinc.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH V3] PCI: qcom: Fix broken pcie bring up for 2_3_3 configs ops
Link: https://lore.kernel.org/stable/20230706121537.3129617-1-quic_srichara%40quicinc.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



