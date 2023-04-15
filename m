Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6515F10FD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 10:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681553670; x=1713089670;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=1C0mHI+agNTFHBpkndFOsXgcZwA3eL5ojftjvt4vIbk=;
  b=cZXczR5bMsiiJHv8NXP6SIozmKr95qobXHztbcUumVO6UFf/oOx1OfmR
   9g78uX1iIKhUQlnM3YbK3P89q+afaU1HIM2QRjCyhAg/0fHGATLfbL8dn
   YP9NmmAoJVOwHIE6oHywDPjtJs3Hiy8Vfykq7b1syYD25Mg+7/qkZQ+6M
   i1liS/AeuzfouMRYDUP4bf0cfkjzNeRnx3YzbDoBC1u9wmOCD8KMfHpqI
   sgmwU0GdaVXup445Wj73QEG6/RnG/WbPOjzcDLy0kByD7iK4kLeMhukd2
   QC8aLQ+H7M3moIgRCy5oL+jn5zavjY+trCh+CN+7FMbRlj4Mcky/Msis4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="333421514"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="333421514"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2023 03:14:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="759426389"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="759426389"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 15 Apr 2023 03:14:28 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pncvL-000aqp-2i;
	Sat, 15 Apr 2023 10:14:27 +0000
Date: Sat, 15 Apr 2023 18:14:09 +0800
From: kernel test robot <lkp@intel.com>
To: Gaosheng Cui <cuigaosheng1@huawei.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 5.10 1/4] crypto: api - Fix built-in testing dependency
 failures
Message-ID: <ZDp48YsrIfYVFReR@96b608206aa4>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230415101158.1648486-2-cuigaosheng1@huawei.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH 5.10 1/4] crypto: api - Fix built-in testing dependency failures
Link: https://lore.kernel.org/stable/20230415101158.1648486-2-cuigaosheng1%40huawei.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

Please ignore this mail if the patch is not relevant for upstream.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



