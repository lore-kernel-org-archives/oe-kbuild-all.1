Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F8F2837F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Dec 2023 10:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YmmDI/hv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702550559; x=1734086559;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=V7IuKL/SSyamqX/xSrLW5KXDTTl9FQjW+VnJq5UOCVs=;
  b=YmmDI/hv5qrhzNfgm4r04byfwUcaKANPEAp9dSQYeZzNGYADzn2CEw0+
   S3KVjrj+okve49aW4Z6pOHySebuGw+nZMwuMZ7JE0RCBlRjA136wnAG1x
   yE4KBaoLd/eJNMiqFtfnBzBdKGgkwQe97P4JuK2BqPiwPJlgwtjy0awfz
   GFRmG+6F41blvuT8mQnhibzzGBMHxGB0G0mhA2VHcZ52msc9imhOG3J2f
   ufnwxjhdUrCIzsWxRb2YKsXMyoHdOXGOClNTPJPSNjD4tOJD7l8e3kj9R
   D277KN7Jy63nyG4K2IqXNHkrYxd2xAfkNNMPYSo0dGR6B0o6FZJslcy4Y
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="481297800"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="481297800"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 02:42:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="803243774"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="803243774"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 14 Dec 2023 02:42:36 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDjAo-000Lvb-0J;
	Thu, 14 Dec 2023 10:42:34 +0000
Date: Thu, 14 Dec 2023 18:42:20 +0800
From: kernel test robot <lkp@intel.com>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] regulator: qcom_smd: Add LDO5 MP5496 regulator
Message-ID: <ZXrcDFV11ih830s3@171f04e7aea4>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231214104052.3267039-1-quic_varada@quicinc.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] regulator: qcom_smd: Add LDO5 MP5496 regulator
Link: https://lore.kernel.org/stable/20231214104052.3267039-1-quic_varada%40quicinc.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



