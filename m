Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F8E12C526
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 May 2024 16:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715358504; cv=none; b=q2Iqy9ehEUZc/+QSGA7AcJ68M2bpM9Id4dCLLtwJcQdeY29ciT8KtUGAO1NerxtJG4RgtHPZOZa/MOoBWPGtDgwUqOVH+vYoD8qt2FBPU7LUptTu8jkIUW2y+lei7ZnChgG/JQBksa3zJ+7yTlAdVYBZmiqxQJvH5l6DSwixsoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715358504; c=relaxed/simple;
	bh=/TEGs37r+5/A3KkqbGPr9dFQFcU8FjytMMmJoLxblg4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=g10e/Fv1v+gOM73LJNEMept8hARjLh9TYYzcutl1RZBdv0MAR61255VZssZ11hjzw8v7dWduhygf8ku3ZbxB4CH8mTVNLhvhu+QYhdbVn3QBxsijy9jSoL0yiXIVRhXvpMQ9HHWJxTx5aG0gEgqKK+Lv6O0yqQNz0Miv/C6PfRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c0V62YL+; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c0V62YL+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715358502; x=1746894502;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=/TEGs37r+5/A3KkqbGPr9dFQFcU8FjytMMmJoLxblg4=;
  b=c0V62YL+RDrA7fAyaj2KT6LUfIlgUdBs/+DaUxXPYIe/J2K0mlFkhGyu
   H0tRygjeR//W3ew0m7dgosTReOxaExWqTZDmOt3CwePcPq894RNEePXTj
   pRvlKorCOD+dBVGhEQoWQ1WVACmNqEy2BoclVJu1U9xcqFgw0yCQNyKQi
   qArq8XewmPDzeLz84KeqotcitolOS/RJre2cAyNUvzgw1TPbLEOtNoB0l
   UC66TBdZqVINf/30NKLFWQI1p4TCLlfEPOYy7+Hfay9s812QtuyNwuH8Z
   Xi0ZKDeF+sUYpDny+cvy/Z/o0EJIryPqR1odUq5jhNdaehjNluUuJuoaj
   A==;
X-CSE-ConnectionGUID: SQTlDJ7GQ0ykTEBTL7qcmQ==
X-CSE-MsgGUID: sr/D9jc7TjO7nkBM552hoQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="28833859"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="28833859"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 09:28:22 -0700
X-CSE-ConnectionGUID: WQxnJyQMQ9ioRsmVLsWPWw==
X-CSE-MsgGUID: 2A9v6NC0QnurDKYhhzzhlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="34317251"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 May 2024 09:28:21 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5T6Y-0006LJ-0J;
	Fri, 10 May 2024 16:28:18 +0000
Date: Sat, 11 May 2024 00:27:31 +0800
From: kernel test robot <lkp@intel.com>
To: John Kacur <jkacur@redhat.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] Fix reporting when a cpu count is 0
Message-ID: <Zj5K8_tlAFldTZp1@974e639ab07c>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240510162605.28050-1-jkacur@redhat.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] Fix reporting when a cpu count is 0
Link: https://lore.kernel.org/stable/20240510162605.28050-1-jkacur%40redhat.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



