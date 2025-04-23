Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4307813B797
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Apr 2025 17:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745429073; cv=none; b=I58sLYNPM8D5I6p9reLCQRWNoL64/0BF/0iE1HRIJZNg9fSFZzPh1FJwoQ2LVSWWqW5WFG4JAYMrx+QP6zdQ3VfGtij14/RyPPwjLKZYE62uvyTzc2ihzc8836JYQZGJ83j58wNGKDd9tap1Ltsw6E6XSuUpMmy/wMgnq+Tw23c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745429073; c=relaxed/simple;
	bh=C/ItQMBGQpaIKTis4fRY7CCBXO1s/q/CifYA91HgoP4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=G4DaZYdUgqTXrsO8PrNu9/JSQpcetjJtyEW7xGC6X+y06fjIMfEj4ZgKZ6W1FdeXgHu7hVTq3tnVVBTx4SYfdg793R2JSqwoBcG79b3FKxaDBjzFz05OBw+wM42m7y8pKcIvxv2E8paAm2MKh/pV2j9kvfuifm5yebgGLWDl5Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nGGEQKFx; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nGGEQKFx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745429072; x=1776965072;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=C/ItQMBGQpaIKTis4fRY7CCBXO1s/q/CifYA91HgoP4=;
  b=nGGEQKFxo6g5llXz4dYdqBBQRWVnVCw3SdfnAlR2Zr2DTlGuNCKF9rNA
   fYchqTAB7WnWF4iQ9LFQ8tVMoiNUoOXyLL7WsWlOzxMxH6mmApiP7IZ3v
   HtbWIGhX/hAmZgRezmr3fBQYKO4ZZxVNqUy6Ien6K2RZV5TE78CFKBOSI
   NOOAtnehFYNOqo9OsZTnOHQPRBS4pz2eAbCaBlTSNhhyq/hHRHctjRci/
   wyYkpZxn7B1rIpOUTrEhxwTnAEpy7jooUBilnnfFyl/EiErOv4yUMThSy
   ivoVm0v3JlAaycppKw79mMHHNfrM0cHflgg+qXXjsBFQOQF03v0Q9CPlN
   w==;
X-CSE-ConnectionGUID: 8fyd2xdVQfmlcOWjPvm91Q==
X-CSE-MsgGUID: yc+kxwp/SgmxaA2PSddUdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="64561823"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="64561823"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 10:24:31 -0700
X-CSE-ConnectionGUID: SrJgpfbESeqgCUtwmDF8NA==
X-CSE-MsgGUID: dBPTBENqQeS5z5winuISNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="169581926"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 23 Apr 2025 10:24:30 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7dpj-0003Ud-2O;
	Wed, 23 Apr 2025 17:24:27 +0000
Date: Thu, 24 Apr 2025 01:24:09 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] rpmsg: qcom_smd: Fix uninitialized return variable in
 __qcom_smd_send()
Message-ID: <aAkiOYKT35Sda1uJ@5d75f5d2dfb3>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAkhvV0nSbrsef1P@stanley.mountain>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] rpmsg: qcom_smd: Fix uninitialized return variable in __qcom_smd_send()
Link: https://lore.kernel.org/stable/aAkhvV0nSbrsef1P%40stanley.mountain

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



