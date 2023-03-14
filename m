Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923358F69
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Mar 2023 16:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678810398; x=1710346398;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=faJaWntiVCGWz9Mq8eHxleM80Hs/dIosUCg+ytVAJQE=;
  b=KuPkG/fYxW9a4gCYOwjTld77Vv0Gipz05iRVWN6pLbtjstI0tuCUg80w
   2/ksikvTpA2N5fmOTOLM1xBGDejJihD96DdZvspm+RYpcOS+EAd697EON
   B5i5R9sHeckKHM0oiWMKF6++CXr+pxri+eGac9SBRiT36rfp3NWX/7M+p
   Ffzw+07wPlP2ZorKeq4wWnPHiQt2yRP+dYuheONTCKMX58CtFssj+ySw3
   Z4nmOJTw2Q06Xnq15djBo4soAgPAPlNLjuVMiShC8i6PLvO9HPvhme9zS
   SwmOTo+1zVeJR+QPPlB+RKrOEKXdV4wA9Wrk7RBFmAekdBPugg+RZNRLa
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="317866766"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="317866766"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 09:09:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="822424203"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="822424203"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 14 Mar 2023 09:09:43 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pc7Da-00071I-3A;
	Tue, 14 Mar 2023 16:09:42 +0000
Date: Wed, 15 Mar 2023 00:08:54 +0800
From: kernel test robot <lkp@intel.com>
To: Wei Chen <harperchen1110@gmail.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3] i2c: xgene-slimpro: Fix out-of-bounds bug in
 xgene_slimpro_i2c_xfer()
Message-ID: <ZBCcFsRVwUSwI436@0f0c699f4fc0>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230314160416.2813398-1-harperchen1110@gmail.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH v3] i2c: xgene-slimpro: Fix out-of-bounds bug in xgene_slimpro_i2c_xfer()
Link: https://lore.kernel.org/stable/20230314160416.2813398-1-harperchen1110%40gmail.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



