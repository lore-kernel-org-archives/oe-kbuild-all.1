Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C128320E32F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Oct 2024 03:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729223526; cv=none; b=eoyO6GKymZLlsEGyEsaUZ1VKPDUZkcNhrlMiOmPsYvSvEJTIUesRmREg9pthdhkJRou7w8jwlEJp4HSQZOsbuGLJYfQOEp5/IZtjrFtRKuMknFVtLwbd6XpI8j1z9upWG8zQ/W57yiC4NKCVDgFhUwROw0EhqiUnitYl+EzJArY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729223526; c=relaxed/simple;
	bh=GwaWOOboQlho3iQSLbSyHOn/x2HDxOr4BC20PaYIEqk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=c+UA6+nf8tf9b1c+tJjzH1NE6RlDGJAOQlwWTbwiV+VxYquNQklqRzHQtuibEUp0/yZ/8FHw5fGBAdw6GuuuSz5B8LbDawrsbmm5EFkJgxOEKBOMwDAHT8u9om8YCEq+KPAJ+PYm3TqjPnFtQqxY984S9akE3+EIxTqHcGO3Yhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AMlmluCZ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AMlmluCZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729223525; x=1760759525;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=GwaWOOboQlho3iQSLbSyHOn/x2HDxOr4BC20PaYIEqk=;
  b=AMlmluCZdX2d+/MOpN05R0LXJup9unHpbLfNXNRT6WBeq2KNukhJkDDN
   cyKn49CLRKpyZD7VizXrNL7ibLyNw6VTwCKJtA2/6oNr21rD9EuFJIEW4
   8ZCx9rMLA3qTocgljWkQVwIx7m/coJk8Ti+SCZ/CnsM+3bV/fv0Ms2E0N
   Acfsat7Tq0tQGuSCk0X9TfPzai2Be6b9LRiQbOfyrXQ+9JXhxF1Nl66Oe
   f4FKeWDBqKgww4uLTA7s58jWQhEtBXPqGsQEvJkm5+FIBV6FuqYUg5R0k
   fsUvjy/yDzu58xaou7yzRTYUsur5w4S+4ShZKgQgR+YJGFhviLDucAtU6
   w==;
X-CSE-ConnectionGUID: Xc7fWgxfSP6wYwzo4dvsFQ==
X-CSE-MsgGUID: RXba0SAITzKkbaDR5GHE2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="32540697"
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; 
   d="scan'208";a="32540697"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 20:52:05 -0700
X-CSE-ConnectionGUID: twWNI8GTQcW+HYkX88klXQ==
X-CSE-MsgGUID: 0PUHcgb6TKynbUGPXk7LFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; 
   d="scan'208";a="83390268"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Oct 2024 20:52:03 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1e1w-000NEl-39;
	Fri, 18 Oct 2024 03:52:00 +0000
Date: Fri, 18 Oct 2024 11:51:26 +0800
From: kernel test robot <lkp@intel.com>
To: Tommy Huang <tommy_huang@aspeedtech.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] i2c: aspeed: Consider i2c reset for muti-master case
Message-ID: <ZxHbPvTBX-E2AV-1@594376e94b8d>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018034919.974025-1-tommy_huang@aspeedtech.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] i2c: aspeed: Consider i2c reset for muti-master case
Link: https://lore.kernel.org/stable/20241018034919.974025-1-tommy_huang%40aspeedtech.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



