Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82755197
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Apr 2023 14:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680360633; x=1711896633;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OdLbiFyL2viWolFifIaft2Vs4iyXHrFrzZF1FXm443Y=;
  b=K1BuVSLb3Jeogf5lhwEUj/s236keiV4svtz87cdc17K7VQJSnzUq9IoT
   1zVGiywl+aSi33euqHpeneM3iJuEfco5hfZb55Edsupbg55YUW4yoU7t4
   cW7PxPHV5dWHRJ6LQ635SyfxMJMN53smvNun9JYMFZeoN6L14UWvJEz3y
   XljjmSJl7oeBX/pCLgFjqfQmhpzmebqEgK073GENd9MGKmQPX/tIoY2ZU
   Q17IxSVVHQVOJl7kGKSbGXVf1DHKEbQxSl3tBkYfOMV9KMGdECF9BXCMI
   8spC8KigKIMRvtTKPUqlNYMuyL/YZBXpb8Wxeyk7DTZlJ8jbJ+VyfB4w7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="322048891"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; 
   d="scan'208";a="322048891"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2023 07:50:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="829052392"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; 
   d="scan'208";a="829052392"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 01 Apr 2023 07:50:32 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1picYp-000MrZ-0o;
	Sat, 01 Apr 2023 14:50:31 +0000
Date: Sat, 1 Apr 2023 22:50:21 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/qcom-audio-sm8550-rx-macro-on-dts-qrd8550-dts-soundwire
 20/34] drivers/soundwire/qcom.c:822:2-3: Unneeded semicolon
Message-ID: <202304012252.UPYe8L9u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/qcom-audio-sm8550-rx-macro-on-dts-qrd8550-dts-soundwire
head:   03cb625fb663407e23b15c4cd0acfdef60d214eb
commit: 35e0096938faf9468f8e9a42bd6923fff52a6d0b [20/34] soundwire: qcom: allow 16-bit sample interval for ports
config: m68k-randconfig-c024-20230329 (https://download.01.org/0day-ci/archive/20230401/202304012252.UPYe8L9u-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304012252.UPYe8L9u-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/soundwire/qcom.c:822:2-3: Unneeded semicolon

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
