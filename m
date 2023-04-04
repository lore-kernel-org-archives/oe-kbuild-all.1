Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68A17C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Apr 2023 04:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680581161; x=1712117161;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zjjPLUAEP0HLsH4q+176G8PM/eMGiGvoliPNp6qZQAk=;
  b=hgE2DR26QkzafY6NwfU0Wxk+OvNa7VIeePHVdMEtlijcfS0Ju0tjrD6g
   j1SOXQQuw901VtHuEIl+gzU+JVwra3TFYASfr3Cu+Lcg7pJlIw6eR9rrI
   8VvNFa6CKK9/HPHkJq2mu+XH23z94/OJXmD0+Ky4qmPPVwTt9gFAy0s7E
   tByv8a3TOPji4Oi32u5LIcOdZvQR2WWVlcXJM8uCMDcdv9GXUuyLo0/Ju
   TiKOSyrtiQGxGAgZTqr7pLXv34Xf/hrOe16u6Za7l5Oc4KYmMeXGpU9Cc
   B0sy6HXbgkTgK1p9tAbDQPxSld8fEQsM07/uerMsBJWJrkiI/y36Sm0pJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="339570818"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; 
   d="scan'208";a="339570818"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2023 21:06:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="932297693"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; 
   d="scan'208";a="932297693"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 03 Apr 2023 21:06:00 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjXvj-000P9d-2N;
	Tue, 04 Apr 2023 04:05:59 +0000
Date: Tue, 4 Apr 2023 12:05:06 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RESEND v9 5/5] MAINTAINERS: Add entries for Apple PWM
 driver
Message-ID: <202304041117.YfOAPGQc-lkp@intel.com>
References: <20230214-fpwm-v9-5-f3094107b16b@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230214-fpwm-v9-5-f3094107b16b@gmail.com>

Hi Sasha,

kernel test robot noticed the following build warnings:

[auto build test WARNING on fe15c26ee26efa11741a7b632e9f23b01aca4cc6]

url:    https://github.com/intel-lab-lkp/linux/commits/Sasha-Finkelstein-via-B4-Relay/dt-bindings-pwm-Add-Apple-PWM-controller/20230403-222205
base:   fe15c26ee26efa11741a7b632e9f23b01aca4cc6
patch link:    https://lore.kernel.org/r/20230214-fpwm-v9-5-f3094107b16b%40gmail.com
patch subject: [PATCH RESEND v9 5/5] MAINTAINERS: Add entries for Apple PWM driver
reproduce:
        # https://github.com/intel-lab-lkp/linux/commit/68a55e1008fc4e1a9a74a16ef234fcbbb286cdad
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sasha-Finkelstein-via-B4-Relay/dt-bindings-pwm-Add-Apple-PWM-controller/20230403-222205
        git checkout 68a55e1008fc4e1a9a74a16ef234fcbbb286cdad
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304041117.YfOAPGQc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pwm/pwm-apple.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
