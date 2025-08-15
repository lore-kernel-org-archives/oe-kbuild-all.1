Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37190286D7D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Aug 2025 02:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755225795; cv=none; b=MzfHHAYfweyVGSiJhg3aDise0v5Yzar8H9O4TTYsz2CHFUq6aWn0fe4iB+a8CoxtGBOQLdsB+SGqHNCKThL4ZZrKMIIq96hkhjbI71DXYfy66u2SETFs/zQwli95HXT/uOBZCMWl4uzcBuPgUB7eHnqZrldQz1jVA2yRANcXzoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755225795; c=relaxed/simple;
	bh=f+5WkI+FihDR9KRkaGU9HnhUL9AMJEFjMq/Sin5AXq8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=PqI8tKwfAcL23aRBDmQA8xF/uoGxBFYBr/IisGv3v4EEALfnbJYJl1kYE+ZZLKj/6Bo5mO/p7l21/cqCrswFSw9C56YhVIdw3lyU/Mv8Y1JamUOmudGx7oCBUkQAVmY3DMAVr+RrIPonWCiaCOHiV9fGuYIGekpsYQjFW8Qt+mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B00ptY9R; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B00ptY9R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755225794; x=1786761794;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=f+5WkI+FihDR9KRkaGU9HnhUL9AMJEFjMq/Sin5AXq8=;
  b=B00ptY9RFN7+occIa+FUUz52DlOhTcA37FUp76snGVildFaTPPtChDHW
   8XqpDMDmwLhrvEOQ7f2nx2Ob1CIL5eISNb3ZJ4vZHvaiJDvAOcQIHIP40
   IftdjbYbgyBdzvJxLN3oD5XTHXRsXJD+fHXsjs0EHDF+tG59pleWlBa3g
   4l/ncF8RivwaQjbmSfdVcNWVYCBkyySb641TAhkVT63pNQFVSdDr40FZU
   13nngIgKCSBpYglmsprHrBdO/X3X45mVEUkGonjc3dUK1sgxm4GMFWca1
   QgheCUSRv2ZRPGz1AF6pQbIx7ioWvZJTN/u48A0b2VZi2a/ogGOprt/MK
   w==;
X-CSE-ConnectionGUID: 4VkWuRuYQy2RQi8g/tfmTQ==
X-CSE-MsgGUID: mmDJJiFYSzuZpmuQeNWyMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="82987838"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="82987838"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 19:43:13 -0700
X-CSE-ConnectionGUID: GkLv4YFuT8G8/NuXxMRREg==
X-CSE-MsgGUID: RY1h14kMTPSeg3m2CWEbjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="204096761"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 14 Aug 2025 19:43:12 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umkPI-000BTA-0Q;
	Fri, 15 Aug 2025 02:43:06 +0000
Date: Fri, 15 Aug 2025 10:42:54 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/2] usb: typec: maxim_contaminant: disable low power
 mode when reading comparator values
Message-ID: <aJ6ertd5AjU7OuCh@1a863d778a0f>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814-fix-upstream-contaminant-v1-1-801ce8089031@google.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH 1/2] usb: typec: maxim_contaminant: disable low power mode when reading comparator values
Link: https://lore.kernel.org/stable/20250814-fix-upstream-contaminant-v1-1-801ce8089031%40google.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



