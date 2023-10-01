Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2250A8F60
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Oct 2023 05:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696139508; x=1727675508;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=1Il7lXxxltgnw0Gsx46x1lNQDoJ/ZFdyp1U7Bwo8qHM=;
  b=AtVJOKO5i/7Yzx6dYombRg4XQDXslcONMhwWhsqP5EZca3fRXdwLefbB
   yaWbQLhnDcjfc7YcP3WlXNIkcE+iwQ/y29uyKQkfUxvwF5bmFb54wiqc/
   o6ebRShM8mYPRi3YIQ91ZCGWl1eFvoXefr/N9Qf1gb84yk4YNZMK0X5tA
   p3SlkX9SZcULPRrLgQ6WbHThUO59KBhnQN8IHo4i/EqyHpBmQu44gBRmI
   dAzW1qXJp8zlgLbX10CefIjv6WyDd6NulO8yiWN35OZjDg8CtNF2CvSPu
   KXUxThDtJEaha+Za0dbkaWhc8Dpom9r3jTohsAQgAR2qbtSQ67NDRYU1A
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="379780988"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="379780988"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2023 22:51:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="785472787"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="785472787"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 30 Sep 2023 22:51:45 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmpMf-0004oD-09;
	Sun, 01 Oct 2023 05:51:41 +0000
Date: Sun, 1 Oct 2023 13:51:30 +0800
From: kernel test robot <lkp@intel.com>
To: Dinghao Liu <dinghao.liu@zju.edu.cn>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] [v3] ieee802154: ca8210: Fix a potential UAF in
 ca8210_probe
Message-ID: <ZRkI4j2+dXZ9sjQ4@f61ccfac960a>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231001054949.14624-1-dinghao.liu@zju.edu.cn>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html/#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] [v3] ieee802154: ca8210: Fix a potential UAF in ca8210_probe
Link: https://lore.kernel.org/stable/20231001054949.14624-1-dinghao.liu%40zju.edu.cn

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



