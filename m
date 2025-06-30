Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36F3263F42
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jun 2025 12:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751287437; cv=none; b=dVRd3jZ1G6DV+3gNAgIkt9Sv5EWhI1kIuAdAWLXjjU5I1CCI9Df/m0Zpq780kkBdn8XrUJ/9Hm37VQGJpotHVdHrB1gExgjnJj3vNggG5jsHZPrcprMFspso7kbMQ0MHoIMmbqrH+zAaO/D4rHp3Hukiwh25uRqXW+gS8m0v8Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751287437; c=relaxed/simple;
	bh=oIf/PMtn530HE9Pv8KXHwNSnQGe5dgNGRutDIaG2MpA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=DLnoMcDn4O716lJv1lmmU+fe9bmYSHf5EJrDzHijiC+rniTViMeZuE6fh9R7aLV7ZdUf5eiwBifT15ZkhlJgRCptQpO/MrVt23Eelmzc0b2iPOJYXwxMaS4hutGp/p6lWIV3aEKqIHUqLwYN9zjzx6SxiEwtK/PzrXE5qMNkgaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ab+h5XWc; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ab+h5XWc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751287435; x=1782823435;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=oIf/PMtn530HE9Pv8KXHwNSnQGe5dgNGRutDIaG2MpA=;
  b=Ab+h5XWc2Be1iPIQu6C8Yc7HQTWvsGhMQucOTiF8hdQR19rjnsTftZao
   TAL1GDDfykVRTJmkfAVR4FGbytGJUHCbbF70+OLccmjXMPi8JyrQN5ZS+
   dioOcjHGkuOCmnvvgwNg3XsqgaA+KTpXuhR4ZH4PWMKC+m3VBY8aIhhzr
   BE87s/6ZkzUs5PsTSQ618UFtXqL9NoiGbEEoGA54XHOshCQHYLPp/czqp
   5sYItwuwzE8b2f3psCCVGn7cQ2IFsLIYAqG6+lQC1JOp9p/hWKZWQ8Fac
   zrZ8M/8mO0cwlBjhQeOonkgwaYTRUtU/noHkhiZjStg+dE6m2ucslcm8v
   g==;
X-CSE-ConnectionGUID: gZr7oFSMQzm5E/2QO4qP/g==
X-CSE-MsgGUID: 1beLvSpMTguG5SfPDDjxxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="64564247"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="64564247"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 05:41:04 -0700
X-CSE-ConnectionGUID: gJk0BvjXQPGwo/Rffw9WSA==
X-CSE-MsgGUID: 2K7NcRiMRrmhxUe4q2eszQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="177112794"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 30 Jun 2025 05:40:55 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWDoW-000Yy2-2t;
	Mon, 30 Jun 2025 12:40:48 +0000
Date: Mon, 30 Jun 2025 20:39:55 +0800
From: kernel test robot <lkp@intel.com>
To: Aditya Garg <gargaditya08@live.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 4/4] HID: magicmouse: use secs_to_jiffies() for
 battery timeout
Message-ID: <aGKFmxZ-CkXYFl0V@617460b90d88>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630123649.80395-5-gargaditya08@live.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v2 4/4] HID: magicmouse: use secs_to_jiffies() for battery timeout
Link: https://lore.kernel.org/stable/20250630123649.80395-5-gargaditya08%40live.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



