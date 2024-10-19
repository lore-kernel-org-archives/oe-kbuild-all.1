Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD216224CF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Oct 2024 18:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729362050; cv=none; b=qzLeQLYlb75n6uEd5Bb+r9ba+31DTUvaizNwYshaq1quGvoy6D6EPAlSMy8MRJkNGInv5eTUmCDyWSByh2r0ssrLJdRorTlhnb4G+84TRFOPq8t8X9HFFHstzFt+uRiGynG2zwi/NZUw0LWRftINa1hWVWYwQFR8IyrY+WJVdk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729362050; c=relaxed/simple;
	bh=PRFv1n4kQ5dIwnY3JhUqeG+jIic/6z9ZcWBq09dlpc8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ZS/r/ibgOca04AgimqjBeeIHoImo7e9UTRZ5Le+Ci8aiDvcpQSZItgZwRzcR9JNgILR8lq5XfZFIA5ImW0NCmGIJayGirwn9wopG6fEhEbJ+crh3kNqku1LfopYVolRy6iLLSisNUamjGvUzLJ+HTsa4y69sxidom9oYgDg2NCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bTlPUgfi; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bTlPUgfi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729362048; x=1760898048;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=PRFv1n4kQ5dIwnY3JhUqeG+jIic/6z9ZcWBq09dlpc8=;
  b=bTlPUgfiNWxJEvw4N+IgKGTMjiuIzu2KgfJh7HSH/VAvh+FnMP2kewtn
   RX54YtxBCbKsxulq3nxnDLwM/rQP+2TZhRYpc1dRrCDcVGI1oKLAanVgE
   ZxfskplXFeiggWvmNA9WUWZ4LFpnMRZ7rlfESjb8JyReUxZ6ZYpZHrV+t
   4A/j923jUSJz1ZSUGucs1faKlNgzoukzFMeRVpY2ZQHNhVY9+mRA5u4eX
   Isv/92L/E/rqnIpMCOiNGC68h8qYcjqbDSDfWO+RSj27G+xRx+Q92M0LH
   Dd3zYEcaVcw/FhB/he8450tkFL8wDmKVLWIJ4ZpZB/WB8RNyMihp8IRWi
   Q==;
X-CSE-ConnectionGUID: FV9uWELfSmGYKpfs+iOjHA==
X-CSE-MsgGUID: ZF3mY/XrRBuwfX5GGXjpzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29040048"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29040048"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 11:20:48 -0700
X-CSE-ConnectionGUID: zFJOPblCSrilazQLxBcS6g==
X-CSE-MsgGUID: oFqhPEE4Ti6DeZmwLJhyKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="83935740"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 19 Oct 2024 11:20:48 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2E4D-000PM1-0T;
	Sat, 19 Oct 2024 18:20:45 +0000
Date: Sun, 20 Oct 2024 02:19:55 +0800
From: kernel test robot <lkp@intel.com>
To: Ilya Katsnelson <me@0upti.me>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3] netfilter: xtables: fix a bunch of typos causing some
 targets to not load on IPv6
Message-ID: <ZxP4Sw9WEIMv8lKs@594376e94b8d>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241019-xtables-typos-v3-1-66dd2eaacf2f@0upti.me>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v3] netfilter: xtables: fix a bunch of typos causing some targets to not load on IPv6
Link: https://lore.kernel.org/stable/20241019-xtables-typos-v3-1-66dd2eaacf2f%400upti.me

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



