Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C2D20FB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Oct 2023 04:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YQvs+3AB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696999921; x=1728535921;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=js7pF/+qKAwfI2zBJAjM2YED0nSvmfq4gb6xk5KIdYQ=;
  b=YQvs+3AB3r4SD82rIod1JzzVrwugHaW0VKQR/K+sHQ15Zl6Piv7jszSP
   8MwePMwNqOYiVxSHfTQL5o1IRIzKsyk9NXlnrWvMia8+YYBmkSXgAUP1D
   DrMdhtDAuygXtLTvNDQfqcISGkmPjTyXLgBtlXvHQBeGNTPlD24iSU4mq
   biBedDOTRIdJHhNGEhFwe1LmyGityCd9LB3OMY1IZaT7e0qgFe+EUJLJN
   0ZfGjb4IwZbLID/6Zb5FyabMhqhotwqk2yn2fUCfJd8JQ5M9ah8zqVOkc
   kt0yo+QQCe/OtZD93IEUhzPc4MChXSibJM2BCwQysFB+sF78Ek3WFNROJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="374921374"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="374921374"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 21:52:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="877525059"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="877525059"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 10 Oct 2023 21:52:00 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqRCP-0001kP-2q;
	Wed, 11 Oct 2023 04:51:57 +0000
Date: Wed, 11 Oct 2023 12:51:53 +0800
From: kernel test robot <lkp@intel.com>
To: Zheng Wang <zyytlz.wz@163.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [RESEND PATCH v2] media: mtk-jpeg: Fix use after free bug due to
 uncanceled work
Message-ID: <ZSYp6Xw+y9i+/0pe@7e1dc97a21a5>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231011031740.982735-1-zyytlz.wz@163.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [RESEND PATCH v2] media: mtk-jpeg: Fix use after free bug due to uncanceled work
Link: https://lore.kernel.org/stable/20231011031740.982735-1-zyytlz.wz%40163.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



