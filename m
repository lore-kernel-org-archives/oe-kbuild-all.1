Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47B8C2E6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Mar 2024 09:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711012305; cv=none; b=hRtQH1ZQrc+TAPpGROX7O1yBZLQPSAr6F3CqTMVD2yQDXwsFOOTDAvUaY0mvUr6zvqPbmdnpB1C8PYYEFc+sEM2rS62IgLcP581tlSeilAR6QLPHSUTpOHyMbOjIFgR5co37ykEwdaX/BEDwUeOoyjXG8RcltG6xHUM5Lk0iELQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711012305; c=relaxed/simple;
	bh=0NIU+TJsUOzjrs8pO6/ItcR0avG8D3Okh7qfg8hVwnY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=umj+uJQOooYPVCo2MCkBoPgf4+dwVx3BVUlO+8jv3YLqJcAaJ893Hhmi1QyALVmTZdn6/RRtoK48BaONfWuLWBFBDpv2IJVZIjS+7eCJ6k2SOp0w7aqqZHDt4jYcevQKD1zJWP9E60xDscEYh8qoYstRyNj/KtTlkBpHFvntDAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XJuyVuK7; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XJuyVuK7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711012304; x=1742548304;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=0NIU+TJsUOzjrs8pO6/ItcR0avG8D3Okh7qfg8hVwnY=;
  b=XJuyVuK71DZnfmOb5huYX6jcGRBeS9cvgX49HbXRMUaOwbYNvBoqa0/b
   +SvuNHrp6Ha/GQyHjvonGSt4mRLc2u3KPE07+aL9c2Bih0IKKbYQzx7bn
   Gz5hGvTMw4SOInhqyvN86jA3nJat7ihy5ilgGu8N0HdPA2+0z4VbFYh8P
   hnnlw4my/EcINUqBZJPotl7Lu1cqoh7YeWXKqIkZVbbw2lZSTvXZuOjDT
   8NLe/59CYszEmoFdMUunyo4optpCMGXnLD6QxRrMYxoVHswox2boFAoGI
   hTdB7iAh1u0BtEFNlIh5ntwBuv03Ulr4ElXyJG+vCO4J7StHr+ttpL9AB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="31424811"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="31424811"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2024 02:11:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="14446650"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 Mar 2024 02:11:41 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnESZ-000JIR-1K;
	Thu, 21 Mar 2024 09:11:39 +0000
Date: Thu, 21 Mar 2024 17:11:23 +0800
From: kernel test robot <lkp@intel.com>
To: Guo Mengqi <guomengqi3@huawei.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] drm/vkms: call drm_atomic_helper_shutdown before
 drm_dev_put()
Message-ID: <Zfv5uwalPfiJQx1M@28e5c5ca316a>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240321070752.81405-1-guomengqi3@huawei.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] drm/vkms: call drm_atomic_helper_shutdown before drm_dev_put()
Link: https://lore.kernel.org/stable/20240321070752.81405-1-guomengqi3%40huawei.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



