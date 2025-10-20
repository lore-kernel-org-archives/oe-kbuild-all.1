Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9488283129
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Oct 2025 16:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760976209; cv=none; b=GNlVzAsv2O7fpMpcm4n9n1WA9WjnsP+ff8fQQeXMSm0nXg7TZPGbLEU5T7KPgvA/4qI1wvqq+SIlQwdPiUdWXVqXjyxE3lw4Xq0uZEWF8i0HhEK/G0MHrNmJYjZy5INvGfogfZ0im22rAuOt+OIn2fjkXev6B34bV3p1OIgLEYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760976209; c=relaxed/simple;
	bh=VZYtjQ3JpJIM7U6rKABv6mHLgQiZABpgNhuw2J+mrpo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=eG7ag0RAHewO9/SoVAhgsPbmC7G/fQ2q7v5lInTHWghVfE1+57cTGxhbl6ms0sxsigwRW42DhW6f3/JLZUBTTpVcUWDdWRR4dr1HMEOxpbLFelooI0yN72A1S5JpNgWtaN2VtwlJIfzJID5qhJcqi/K+hmSB7MdUFcz4aO1fX50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d4sxL1V7; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d4sxL1V7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760976208; x=1792512208;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=VZYtjQ3JpJIM7U6rKABv6mHLgQiZABpgNhuw2J+mrpo=;
  b=d4sxL1V72UKC4emylEa+F9Ba5iYJQRGq26b3UdnTXO4QXavnPxoDObo2
   CvqU8TeAx8xy37AJMXqUIyW6TSIl20cmZpXQchzBhalvwqr6PW8g7f/fp
   Ep2Mx9ZwS1SF1T7lTRGnNVV9RrGkmxmo2tGSthT80oZxdSBFapNNP/mwM
   xh77PBMSMXRS0SbdLRDCUeDWjPGxgvWZO/u97FGypclhgzMUimCLboxt3
   Mb9gCsbGHny3Z8ZJJ5MtEiu7uCqgE6tkGN/yLFX6kKMIbUV76Fti6lG2C
   NSCCVC2ipJcC6qqRNarC8mxrAsbglpZlqOYkyWi6radWHjqh01WjywVj9
   w==;
X-CSE-ConnectionGUID: ejgrl1pBQi6+zZG8UOE7Kw==
X-CSE-MsgGUID: yjFzyKW2Q2q0rWXBkemXAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="85715422"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="85715422"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 09:03:28 -0700
X-CSE-ConnectionGUID: HmJKdjmsTh+NNofw9Cd+pQ==
X-CSE-MsgGUID: qBF9iuSPRR+LTD7E06a9xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="187624646"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 20 Oct 2025 09:03:27 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAsLz-0009yD-3D;
	Mon, 20 Oct 2025 16:03:24 +0000
Date: Tue, 21 Oct 2025 00:03:10 +0800
From: kernel test robot <lkp@intel.com>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] soc: qcom: gsbi: fix double disable caused by devm
Message-ID: <aPZdPsWgiGwY4kxn@c50de720c4f1>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020160215.523-1-vulab@iscas.ac.cn>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] soc: qcom: gsbi: fix double disable caused by devm
Link: https://lore.kernel.org/stable/20251020160215.523-1-vulab%40iscas.ac.cn

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



