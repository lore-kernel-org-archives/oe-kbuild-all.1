Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3B42563
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Dec 2022 09:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671700754; x=1703236754;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=16bTkjPfOm4GVVOCLxOWVI48vCRaZP29kQwpIIAcYm4=;
  b=dQJZ5PJWiQ/zr+drfnuIny7juyUrk2n5sQTCwqvX1wLzc5KU9My8sl36
   aFGEex78ikxpYmBpIIDu1JZnUVmdNANlFl6JXmpnBw8Kly7cbU8NudALn
   pHJvc7Tjc6QTJ/vYVTVs+F8X/wl9g6SqaZVTxcRYuCLQsFsa5orqwFaiB
   V6BsJ5dtybixirFQECmCGnfvVFUR0yvCIvVMVa/zgtD2YvljE8499XoLk
   nqNYwLtKYoQR82yab5lfQXg+Tcps3dQfF0cLehwZ4bjnPBEH3Z2n5tXV/
   6lBzAkSZ/ISaBXcOfTpY+Zmx++huhdpRpE6pkwbFpSiij4ANc6SybSU/c
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="382313515"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; 
   d="scan'208";a="382313515"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2022 01:19:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="758882471"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; 
   d="scan'208";a="758882471"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 22 Dec 2022 01:19:12 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p8HjL-000BS4-2E;
	Thu, 22 Dec 2022 09:19:11 +0000
Date: Thu, 22 Dec 2022 17:18:54 +0800
From: kernel test robot <lkp@intel.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] Documentation: stable: Add rule on what kind of patches
 are accepted
Message-ID: <Y6Qg/msh9b9TYSPp@181616e551cc>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221222091658.1975240-1-tudor.ambarus@linaro.org>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH] Documentation: stable: Add rule on what kind of patches are accepted
Link: https://lore.kernel.org/stable/20221222091658.1975240-1-tudor.ambarus%40linaro.org

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



