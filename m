Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CF27C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jul 2023 00:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689209113; x=1720745113;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=2JSW+fqxtpaewM6OwjihilivyyFzTam+eb7IKME5l8Y=;
  b=jjTD5mG8OKDfp+ZM4NGXBat6fXO8JjqO37ELVrweenkxso3vI81Jwln9
   v0hG+YiIAstZ/965eW9mdjmHsqjRHMusL88U/qsJtuOkMTHLXhzX/skdw
   nd0F3Zn8WNKjHCi82cilFXUTQpuTWSo3qPGbgUUbK1ehuz8vdhGLaR9EA
   vb/Uinu7UcWOg+25xgVXlIRz1jIit1MzmrUXMdeyc6PxMSNJ45QetkBH3
   F6My2zbrQtLMQD7dIEvE2VfyrX4Pts0+x6hDC4ZLGhlwyMhbp1NFoX/3b
   rMIhWBoNC6HKr+7WsZ+ndDQ5Fr3dp4+lPWssEwNhUPU2mTCNhzwsNKq55
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="365072769"
X-IronPort-AV: E=Sophos;i="6.01,201,1684825200"; 
   d="scan'208";a="365072769"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 17:45:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="672064085"
X-IronPort-AV: E=Sophos;i="6.01,201,1684825200"; 
   d="scan'208";a="672064085"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 12 Jul 2023 17:45:10 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJkSD-00063t-1Z;
	Thu, 13 Jul 2023 00:45:09 +0000
Date: Thu, 13 Jul 2023 08:44:28 +0800
From: kernel test robot <lkp@intel.com>
To: Ruihong Luo <colorsu1922@gmail.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4] serial: 8250_dw: Preserve original value of DLF
 register
Message-ID: <ZK9I7A3xo+I8x7fo@a1daa7802ad8>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230713004235.35904-1-colorsu1922@gmail.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH v4] serial: 8250_dw: Preserve original value of DLF register
Link: https://lore.kernel.org/stable/20230713004235.35904-1-colorsu1922%40gmail.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



