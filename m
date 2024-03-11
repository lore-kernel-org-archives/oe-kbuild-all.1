Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246E75810E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Mar 2024 22:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710196445; cv=none; b=BXDz7AQfQ8xaNUSpU5hrxxnX6cY6nPKHAQanLy2vo0/TAk4XQeoj/IjEtefSZuUbBkEsA4o7Qk/13M1aSyoC5AY9d1DHf683OuGzSlH3zPi/FykOoeNChp6Ysy0f1Dev4a3wPDFJ+Hw2deAqPlZ2I7tdzx5gbFZSdmZh9trUrP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710196445; c=relaxed/simple;
	bh=wtRonEicjIwh44mB6DV+Ah6WfpAdtDG+jPjaSMw31m0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=X27xeYWtVSYMlue6Sm/6bUM168NOm2nssmaq7HNUnZrRjOZCLXkrQ0eDHzb9gc8u+puTsRKdR67/JQbQeYJSVyxPRi6N61vol2X882jdB5XLkF45ijKhG3K6YnTIq3peu5csT58bTKzm+Y2YoD0rHSjAj710+7fdUFmfAh9yjvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O+pkEtyU; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O+pkEtyU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710196443; x=1741732443;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=wtRonEicjIwh44mB6DV+Ah6WfpAdtDG+jPjaSMw31m0=;
  b=O+pkEtyUlR6Z921H5TcMn7sK2SWKXXvswbwqH/qGHSRR+RFpG//mlqcJ
   aCRwZnvvyXU3uqc8ErtH+RMfORqsOWt4v0hTRmmsox7uaesHlCf6G3JTx
   uvDoHlXyCGSrOKU9eF/7DDds5Tc+TXQXxur7aOg+q4sZvQJRWUAMd5n8/
   6Od2y3HfMO0wZwudvwwQL1Tbo1BQGjzVYiOZGhqBW0WjCxBAOZMW15Vj6
   qQnLoIXy0I+h2AhXKn3tiYU1h3Mk4DnLu9SaepXus/uucyxSxLACFuvbi
   v/44mY3Aedm0p2B7kdAtVgn4fQnuK1fK2Yvhmvc2JZsEoIbkolEScw//a
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="27359308"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="27359308"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 15:34:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="11382437"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Mar 2024 15:33:59 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjoDW-0009VX-39;
	Mon, 11 Mar 2024 22:33:58 +0000
Date: Tue, 12 Mar 2024 06:33:03 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Liang <mliang@purestorage.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] net/mlx5: offset comp irq index in name by one
Message-ID: <Ze-Gn1kYLBq-HCxs@28e5c5ca316a>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240311223018.580975-1-mliang@purestorage.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] net/mlx5: offset comp irq index in name by one
Link: https://lore.kernel.org/stable/20240311223018.580975-1-mliang%40purestorage.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



