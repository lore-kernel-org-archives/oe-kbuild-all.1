Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29352A41
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 05:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y4lwqo3b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697778592; x=1729314592;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fsYuVo1jOzDbYYHCpCuSRULH/+HrOeGybJYahRCEjsc=;
  b=Y4lwqo3bxGAeRJuunWJHflMX98ZlKziwWBTDMEYL0ecO+gUtLwp3/7xN
   +6wV35/Oz+T74XBWKijLG2/i3EYgOAG7081gRXmkMUb4vVmuznIbH0E0/
   fku28Kry4xAK8wnJpp8siYGrne8FeNZX1/LomtEhH9M7Ndk4SzVPFpSHf
   crpv2qIcuDcRolV2vMVYoz2K+aGrbtKkLdsiL/5p18Rv3u/N7fIp888Hj
   qRcBhKr8AVkW3NhtFcxRktxenaT9ZjoLa1TOY2sEwsOCQj+aEoYOyWuih
   zLHJhNHSpjEuptJNQ1i6qKtBsBiHjR0wt1Ze1zeedylob5vn1RFo/Ggel
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="390312943"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="390312943"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 22:09:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="827610607"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="827610607"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 19 Oct 2023 22:09:49 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qthla-00033N-37;
	Fri, 20 Oct 2023 05:09:46 +0000
Date: Fri, 20 Oct 2023 13:09:26 +0800
From: kernel test robot <lkp@intel.com>
To: Soumya Negi <soumya.negi97@gmail.com>,
	Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	julia.lawall@inria.fr, Andi Shyti <andi.shyti@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 1/5] staging: vme_user: Replace printk() with dev_*()
Message-ID: <202310201236.d4IEfmLQ-lkp@intel.com>
References: <a36a0b839f9c21efe1f2df6f9272ae882fd04fb8.1697763267.git.soumya.negi97@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a36a0b839f9c21efe1f2df6f9272ae882fd04fb8.1697763267.git.soumya.negi97@gmail.com>

Hi Soumya,

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Soumya-Negi/staging-vme_user-Replace-printk-with-dev_/20231020-095619
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/a36a0b839f9c21efe1f2df6f9272ae882fd04fb8.1697763267.git.soumya.negi97%40gmail.com
patch subject: [PATCH v3 1/5] staging: vme_user: Replace printk() with dev_*()
reproduce: (https://download.01.org/0day-ci/archive/20231020/202310201236.d4IEfmLQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310201236.d4IEfmLQ-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using 'vme_slave_get', this function's name, in a string
#118: FILE: drivers/staging/vme_user/vme.c:425:
+		dev_err(bridge->parent, "vme_slave_get not supported\n");

WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using 'vme_master_set', this function's name, in a string
#191: FILE: drivers/staging/vme_user/vme.c:577:
+		dev_warn(bridge->parent, "vme_master_set not supported\n");

WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using 'vme_lm_set', this function's name, in a string
#583: FILE: drivers/staging/vme_user/vme.c:1577:
+		dev_err(bridge->parent, "vme_lm_set not supported\n");

WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using 'vme_lm_get', this function's name, in a string
#600: FILE: drivers/staging/vme_user/vme.c:1613:
+		dev_err(bridge->parent, "vme_lm_get not supported\n");

WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using 'vme_lm_attach', this function's name, in a string
#617: FILE: drivers/staging/vme_user/vme.c:1650:
+		dev_err(bridge->parent, "vme_lm_attach not supported\n");

WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using 'vme_lm_detach', this function's name, in a string
#634: FILE: drivers/staging/vme_user/vme.c:1683:
+		dev_err(bridge->parent, "vme_lm_detach not supported\n");

WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using 'vme_slot_num', this function's name, in a string
#662: FILE: drivers/staging/vme_user/vme.c:1751:
+		dev_warn(bridge->parent, "vme_slot_num not supported\n");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
