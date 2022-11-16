Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05EA15C9A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Nov 2022 23:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668642205; x=1700178205;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=4Kh6cLtmynoO8BaixKVKNVbQ9E+XiqqFGfNCWz531q8=;
  b=mff6idri+jVQC3su2H/UGKrB9tvrFFcWUyXMEcg84VCQpJR+0mMdgU94
   7tJIDZaylF2Xn1IMakh53whgcHgnsE62a6wXz/EATXlIwCazn+T4jVejs
   324/iohrZr3HERpUA2S46+aVIIbKIpwwWCOK1fYtmE6ZHRzD6r09UabPI
   ZmCP5xIjS773nNfYgdI0G4OubpA/f8RreKJXBaNyFWGFzsN+uuNIdaQrl
   DJ+cDqEEGmpga1xLOn++9ovvtS21NK22/DzVKHVaUePb4qVWpXFHaH6TS
   5Npcz1QHK1NYBFgyAvUCJM8Cgv1DRwdzli4zE43uAA5ry5lX7uZZdgFsO
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="314516056"
X-IronPort-AV: E=Sophos;i="5.96,169,1665471600"; 
   d="scan'208";a="314516056"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2022 15:43:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="884611284"
X-IronPort-AV: E=Sophos;i="5.96,169,1665471600"; 
   d="scan'208";a="884611284"
Received: from lkp-server01.sh.intel.com (HELO ebd99836cbe0) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 16 Nov 2022 15:43:24 -0800
Received: from kbuild by ebd99836cbe0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ovS3v-0002qv-2d;
	Wed, 16 Nov 2022 23:43:23 +0000
Date: Thu, 17 Nov 2022 07:42:36 +0800
From: kernel test robot <lkp@intel.com>
To: Vishal Verma <vishal.l.verma@intel.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 1/2] ACPI: HMAT: remove unnecessary variable
 initialization
Message-ID: <Y3V1bPPwd2EAiumA@34289d8193f4>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221116-acpi_hmat_fix-v2-1-3712569be691@intel.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH v2 1/2] ACPI: HMAT: remove unnecessary variable initialization
Link: https://lore.kernel.org/stable/20221116-acpi_hmat_fix-v2-1-3712569be691%40intel.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp



