Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA37219E833
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Oct 2024 18:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729620056; cv=none; b=X972U1mr4b/tA32Fjj7C4MyDlH0t32qn/a/803J0GzHuV742ijflF0IiN/6zBxknVcu8RcWvIrdzMPVGboAV62paOXmODab7yl6xwjqI42iUWAPT6gLZTb3wYiR8xWP3UVkpu0pcyohem/AfCFSQ7Faq9AZYlY8pO8dBvFAktV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729620056; c=relaxed/simple;
	bh=+C6xcks3TAvLTD033DNHXFEAW+54GsNNp6vpRyaeBQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=DNWrBhZ1az6nRkPq3Hq9og6U+8XPk6CeQPzDac+1cA1Mhumw4UzgtkTDJSx1t9bqZMu5qjWo7YPbeJ460MLZHRhRov5tTn+q6GajXBXrDMYccSsjcKO5omVxX35Im1ANFozYLhKogp/eLkwqCuhcMPBkQ7WYMHeKF4teWzK+Y1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KxiF4mgL; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KxiF4mgL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729620054; x=1761156054;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=+C6xcks3TAvLTD033DNHXFEAW+54GsNNp6vpRyaeBQ0=;
  b=KxiF4mgLT0KngHka9DutMxoLf10xAxWSsI0nXSOPI9p0lQTVpatsYH31
   aMGlmYociDW75abg5GCZdxeA0ms8aspusCTlFRw/XQJ68DTn+2ih5G0wi
   WfxGXGrz3972gGgpBfyAewCpLNvURbqp3A0P3rn/Esh8iZlV2/8J822b3
   D7bd1ODUh5uE21+VaY5a1TFFN4N2UCAkW6vKeecMkcLULibdu1iqpBPE4
   /7lwUU5vniN68m5tnosvRQ3ScrWpMyTyG1OY8uVqwS9NlaX3qUyoXZu2l
   pC8D5+bBYnAeG34/IAHv24onrpt7dm2NRzfdytAz/HhjpaY9iAsYVKCQa
   w==;
X-CSE-ConnectionGUID: Uo2nIfKIQXmQtk3uHANpyQ==
X-CSE-MsgGUID: 6ZThOOPDS5qnQQfsCQHV5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32867984"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="32867984"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 11:00:54 -0700
X-CSE-ConnectionGUID: pFv7Gm7cTz6/EF4lS1A9cw==
X-CSE-MsgGUID: gsuUrsL8RjOXxSAPDWlG1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="80359807"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 22 Oct 2024 11:00:53 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3JBa-000TuO-2W;
	Tue, 22 Oct 2024 18:00:50 +0000
Date: Wed, 23 Oct 2024 01:59:55 +0800
From: kernel test robot <lkp@intel.com>
To: Saurabh Sengar <ssengar@linux.microsoft.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] sched/topology: Enable topology_span_sane check only for
 debug builds
Message-ID: <ZxfoG50ltwUFNzJ-@a65df9119445>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1729619853-2597-1-git-send-email-ssengar@linux.microsoft.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] sched/topology: Enable topology_span_sane check only for debug builds
Link: https://lore.kernel.org/stable/1729619853-2597-1-git-send-email-ssengar%40linux.microsoft.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



