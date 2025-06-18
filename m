Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212F52FEE0F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Jun 2025 17:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750267875; cv=none; b=g7p7nbQlkmp0XLqOmQZt+e1wmuOgbJHXfk6KbMl77vfXz7CzVdKSL0VO2PyokbhiCEqWe8vV4mslEKsXNeMTtoVXLZbCYK0niXMY0YtmDsfxN7Agp4eSmPUty2d8JWcxOK78Ar9vJdMpEQXEHtO2gniv9wogM9foX7J8JGxaoEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750267875; c=relaxed/simple;
	bh=cXUM1BJbWKJmeYAt1ml5qi02tQTu6fVGMaNvxJm2qdM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ojpB7siJJ7I77nhlVNoTZBTovuoe5+SBjQKfhqGIU8b56rcZdugvwWhead1CT0mGylrTqhOc3axBYk3dPeXKXgIe61UjMgjaL+/MIQJRbZ9EmZhvl9PF8s1bx0npwQI1JiTrzVpqvux5T8aZq10Y+KBN/EknQL08ndBE67jszVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BPpgo15i; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BPpgo15i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750267872; x=1781803872;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=cXUM1BJbWKJmeYAt1ml5qi02tQTu6fVGMaNvxJm2qdM=;
  b=BPpgo15i4LgMTPtya6ix1Z04uAVamn16uXQNrxRBy+0PdTLp6GKWxkjc
   5CTeWjs2bsPr+qnAN6Nv98OAB0z3qyDlJMAUxFdoIUmxdhYDkwL4uii5j
   b5nMYF0nAboHJchXbsOPbgwyd+Hjaw4oWgx+y078zOueVPBzS35n1cdyW
   lFdtHMnkWcV6vEvfdIL7JIIRrLn/kKj663zwmYzUHXsQ3ZusyUdm+07aQ
   7KhlEt4MN1Poeo1Om6BRhorv2ZAH1BryHzX3s8w2MVCNTJyOYf1tL+kfc
   ksaa2qL6Sn0Y7jrSgXuaRe0tBHbry0nk3cZTA2aW31QF2OHXFHTUzQMSU
   Q==;
X-CSE-ConnectionGUID: buQzyKiqSsmbPs9ARRBzRw==
X-CSE-MsgGUID: lY6nlVCGRaefQ76tS3scYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="63110063"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="63110063"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 10:31:11 -0700
X-CSE-ConnectionGUID: K9Xk270ZQgOrolX6UiySrQ==
X-CSE-MsgGUID: pfG+hj88QySTEyNkTEkCqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="150454876"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 18 Jun 2025 10:31:10 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRwcu-000K10-26;
	Wed, 18 Jun 2025 17:31:08 +0000
Date: Thu, 19 Jun 2025 01:30:41 +0800
From: kernel test robot <lkp@intel.com>
To: "Xin Li (Intel)" <xin@zytor.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 2/2] x86/traps: Initialize DR7 by writing its
 architectural reset value
Message-ID: <aFL3wV1jJKuTtRCa@d8702eadd420>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618172723.1651465-3-xin@zytor.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v3 2/2] x86/traps: Initialize DR7 by writing its architectural reset value
Link: https://lore.kernel.org/stable/20250618172723.1651465-3-xin%40zytor.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



