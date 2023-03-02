Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B705BD524
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Mar 2023 22:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677794978; x=1709330978;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=3BAXfAVqk1f5v8SC4ZDHFMqkj906qjSEk4yxiRB1IeY=;
  b=MUSw4er9y/oXCwq7BhRvQSNNI2keRSIrzB+v28Fv/cqkX++ZOz4sMpNl
   XWhvTsCQAzgpk0hVUANYUC518dZMGA9whm0zTwClcJtOmTWokL8WaA4ye
   16ga8CoxVfL0G1IMcIRBL8Z5SPv6wBgQ12q3XQi0gk+gkwsGdi9xNCBqp
   eYQIbwkRr2vUoS1wN5PBymlDFeIEAHQUWa4BmlM4E451wLXYpS4wOlYCF
   Y+WfFRxDXgLsT0y1hrNLAzxGwizXOXx6x2Rp8kWIOkzhElHQPf4jt/0OG
   0SnmNXYBddPTMQUVvB3PoBooYu5l0BkxZNO6MK9zJ0JmRdx/pgENo8mKR
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="315278331"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; 
   d="scan'208";a="315278331"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 14:09:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="1004330752"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; 
   d="scan'208";a="1004330752"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 02 Mar 2023 14:09:36 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXr7H-0000ve-3C;
	Thu, 02 Mar 2023 22:09:36 +0000
Date: Fri, 3 Mar 2023 06:08:40 +0800
From: kernel test robot <lkp@intel.com>
To: William Breathitt Gray <william.gray@linaro.org>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] gpio: ws16c48: Fix off-by-one error in WS16C48 resource
 region extent
Message-ID: <ZAEeaAajyZJf77pG@42ed42284782>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230228081126.94280-1-william.gray@linaro.org>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH] gpio: ws16c48: Fix off-by-one error in WS16C48 resource region extent
Link: https://lore.kernel.org/stable/20230228081126.94280-1-william.gray%40linaro.org

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



