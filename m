Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141B62904
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Feb 2023 11:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677065059; x=1708601059;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=NrpDAn4F4TO5JZB0hlyUQr9Nzum65oGQ/vOmrgvMTi8=;
  b=Rg8UWVbtqYf6wOXDSQZFfKt08NYfTHwNksI0oi17w9TajXy6nkB2bG/A
   AnP9ZWrKXzXe3fR5Rb4pkdf8x/t85LN8Zm9QH90xIwfiAe4ZeLXoGv4U1
   fIxdjkol2FztUGk62SKG3Md+ww1vKuJUInCCFovPE5xrVtk1L6yvgevUn
   7M0OufdkExifv3+rH5ju+z/lSp5NtjOTC1XilDoIk8JHaZLvnCEcE1nrF
   bM/UakB/K2a6yBxdDDVmXa/++lj23js7ctd1tA9BXBpNdcGjHv33G1RbM
   1wwbyUt0WnMlC44bnX+AgmhhPoWSM3B/YmwIAHPY7IYQm4ldamFqtdwbO
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="330626545"
X-IronPort-AV: E=Sophos;i="5.97,318,1669104000"; 
   d="scan'208";a="330626545"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2023 03:24:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="760926308"
X-IronPort-AV: E=Sophos;i="5.97,318,1669104000"; 
   d="scan'208";a="760926308"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Feb 2023 03:24:11 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUnEI-0000Ib-1i;
	Wed, 22 Feb 2023 11:24:10 +0000
Date: Wed, 22 Feb 2023 19:23:44 +0800
From: kernel test robot <lkp@intel.com>
To: maennich@google.com
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/5] MAINTAINERS: Add scripts/pahole-flags.sh to BPF
 section
Message-ID: <Y/X7QOnBbFGjm5vV@f839a3c1ca0d>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230222112141.278066-2-maennich@google.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH 1/5] MAINTAINERS: Add scripts/pahole-flags.sh to BPF section
Link: https://lore.kernel.org/stable/20230222112141.278066-2-maennich%40google.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



