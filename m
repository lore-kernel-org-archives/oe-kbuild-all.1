Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E8F1DDFF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jan 2024 11:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705491665; cv=none; b=DFAMZqBIgXG+x65JUTOjLwW+HMeZfgV2gnNrvYeKD96n8T2UwwasJcP2hL0tlJBkSm0zU7LY/lHNUTkDW46rRky2SEHc9KYabljT2bfQuwxBVMkyT/8joMcNcf0ENvID0Ks9FEVIaXTam+ceEtcdeDyixdIKGcRy6a6J2aEKx1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705491665; c=relaxed/simple;
	bh=31AAOX5m8CxfjQz7OsMygP4aDW7CtnECXfK5iC3hsnE=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To; b=SUiVnHHhK+LgoPHasPRynqDT0rPLF5TvUVYXq0fOyHNduFGmszzWT64HCZhpFgI17PFtns7F92J+ZIszoPSk412110h+yyayRpB+wz74SD0jXwGJfO1T9RclGejrOIJT2T6VWCpqMf059ppVmEdccPy87wWzWT9sSwjHbkx3eso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z1UVTpsO; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z1UVTpsO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705491663; x=1737027663;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=31AAOX5m8CxfjQz7OsMygP4aDW7CtnECXfK5iC3hsnE=;
  b=Z1UVTpsOAjmf3ZeNomIT4ImN8rbH2KQGoF4E/2nnMDWKPkYKkHBJ8blT
   Mn3jZC6xa2BvMahzt39QuX1EaMuuc3eNWBM6GYkfhi3oc4j3YCB2ldRiq
   hUlTafqN9JnyrOIGrrkkun8v3CuVk78t9A0CKBUPi9n6CcRV8xjm3JQAJ
   EDSOhZdEGZtUcBkW6v3RYAgV3u6pJbPVxhTtbHkcQZuSNnlG7BxtEG07P
   9qtY761LVdfaaRF4YQqm/bQ9j35DVaRGhqEkbhHF47gkCgi/IJdv01rlb
   FOVRtwgsUOpv80IJwO5VXBnY7n9oQ542XrAXjAIy4+9DwywrXPpm914TM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="21620638"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="21620638"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2024 03:41:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="733959660"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="733959660"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 17 Jan 2024 03:41:00 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQ4Hy-0001wU-0O;
	Wed, 17 Jan 2024 11:40:58 +0000
Date: Wed, 17 Jan 2024 19:40:16 +0800
From: kernel test robot <lkp@intel.com>
To: Badhri Jagan Sridharan <badhri@google.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1] Revert "usb: typec: tcpm: fix cc role at port reset"
Message-ID: <Zae8oBmtqL8JMSnH@fc6e15c3a4e0>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240117113806.2584341-1-badhri@google.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v1] Revert "usb: typec: tcpm: fix cc role at port reset"
Link: https://lore.kernel.org/stable/20240117113806.2584341-1-badhri%40google.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



