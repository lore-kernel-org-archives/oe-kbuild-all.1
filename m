Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6201112
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Nov 2023 22:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SL5eqd48"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699828596; x=1731364596;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=FDKQJc4AeibGqoYELpJwBZ6gXqXZ4aq3PPO5w+lJ9tk=;
  b=SL5eqd48XYtr1byspntjUZW68eHvhyX8NjJuxAsQxH43+wDM7gFQn7SQ
   D2rHNkpCNauOU0wC7odTiCU6ixTxub+9Rex1gfIo6OoMG6qqaHWZGd9t6
   Qxec679q+r6YEYTiuvN4BV4rPfPITc2ZyM6Xe6xGREo8lYZBwrd4nep29
   +gNin+Rc8pGnG12IEQRPE1toHhNLLBh5sXfkkUFEsWBnthf2qKSghT/0q
   92HIDHqp1AJ2a0+WTioKqULFk+zOHZa1yojwAORju/9MTfYLobBxL6tUU
   kCfdJ0O7oLijAPThfJHEaFSm41k8AmAheljA3AZiInJvIqlriiySWBayL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="11906062"
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="11906062"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 14:36:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="757646558"
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="757646558"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 12 Nov 2023 14:36:34 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2J4B-000BaE-2u;
	Sun, 12 Nov 2023 22:36:31 +0000
Date: Mon, 13 Nov 2023 06:35:19 +0800
From: kernel test robot <lkp@intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] ACPI: video: Use acpi_device_fix_up_power_children()
Message-ID: <ZVFTJwxQd48gi3bv@a9cca7fa5d54>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231112203627.34059-3-hdegoede@redhat.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH 2/2] ACPI: video: Use acpi_device_fix_up_power_children()
Link: https://lore.kernel.org/stable/20231112203627.34059-3-hdegoede%40redhat.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



