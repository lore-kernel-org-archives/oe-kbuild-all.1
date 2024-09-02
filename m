Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395F9185957
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Sep 2024 09:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725268973; cv=none; b=hSlTyxTSGCmjSUqHQ9OyJajkd3D5Yr/P2DP4mBPPaes25SOVHHABsDhF5vmlpnALz69xwLXhpmFV53ILk9RVpSsfdrdCk5HVDaX1sHUzPcr4XBu6EVtRuTSXLyGgIaq7mmvxHKK3IkUuWJFRsEKY6RAUEuH9JibeqRvSVzCk4xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725268973; c=relaxed/simple;
	bh=j2BIbeUTeuEYSSFzijV8jX08mxyfc2V0uiGciEqWQ8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VsZPiz5Zsjkw599w88tUvtANgiXakx2ULzTMEbIcloj8yJ3I9umNJCFTolj7c/dqd5RryXduF6coEUOdzm2rGktXKMkyu4rvZ/TCxvrdh/MAamD7o49kl+yulA3PaASpSlZELkLagUd4tRACE068ZHH4kLd2FPETcGiCvyno8uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eCcx9JTP; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eCcx9JTP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725268971; x=1756804971;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j2BIbeUTeuEYSSFzijV8jX08mxyfc2V0uiGciEqWQ8M=;
  b=eCcx9JTPVECwzN5XVV5UVAGqMQJ0ZIevducog5RCoVrmO7B5vQa7PCLP
   HfJp9nlIRCHklC2quxo5aFI+84pUPvo5dKR77vZY7hgV6LtSSMe1c8TuW
   eoLZNf5/bewDi9L2VXhTT6PPNAK/rF5PaB6ZHu8Qd3hH+y86LeDJj3MhA
   axlKOSLWhEEFg8mQCXDAweDLwSaXVNSbgaML9wZNR2tr13164lJVXtdLd
   dEpmrgXGKsNYbOWeaAqvN3SD76+KpDh+dr5OwwyoS3mv5HF2aeTv9RYw8
   8oIHI7bw0PymiaAfye59Lorr1R3/+zm/lktHGPck6yEgaq9BANLwdW+8F
   g==;
X-CSE-ConnectionGUID: jifJxtKfSbuHLvWZXo8HZw==
X-CSE-MsgGUID: lJ5qgHuTQsm8gon3/7Tg7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="35238236"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="35238236"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 02:22:50 -0700
X-CSE-ConnectionGUID: 4n4v0OX/TFaqY/b+iW1mkg==
X-CSE-MsgGUID: XI+MEbLPTaKnIQ8tPAhKpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="87788869"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 02 Sep 2024 02:22:49 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sl3Gp-0005Jm-1O;
	Mon, 02 Sep 2024 09:22:47 +0000
Date: Mon, 2 Sep 2024 17:22:45 +0800
From: kernel test robot <lkp@intel.com>
To: Yuesong Li <liyuesong@vivo.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC] reset: Provide new devm_reset helpers for get and
 deassert reset control
Message-ID: <202409021638.nWWDOU2d-lkp@intel.com>
References: <20240830033351.233263-1-liyuesong@vivo.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830033351.233263-1-liyuesong@vivo.com>

Hi Yuesong,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on pza/reset/next]
[also build test ERROR on pza/imx-drm/next linus/master v6.11-rc6 next-20240830]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yuesong-Li/reset-Provide-new-devm_reset-helpers-for-get-and-deassert-reset-control/20240830-113607
base:   https://git.pengutronix.de/git/pza/linux reset/next
patch link:    https://lore.kernel.org/r/20240830033351.233263-1-liyuesong%40vivo.com
patch subject: [PATCH RFC] reset: Provide new devm_reset helpers for get and deassert reset control
config: i386-buildonly-randconfig-005-20240902 (https://download.01.org/0day-ci/archive/20240902/202409021638.nWWDOU2d-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240902/202409021638.nWWDOU2d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409021638.nWWDOU2d-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c:16:
>> include/linux/reset.h:817:30: error: 'devm_reset_control_get_deassert' defined but not used [-Werror=unused-function]
     817 | static struct reset_control *devm_reset_control_get_deassert(
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   In file included from sound/soc/codecs/sti-sas.c:11:
   include/linux/reset.h: In function 'devm_reset_control_get_deassert':
>> include/linux/reset.h:831:15: error: implicit declaration of function 'devm_add_action_or_reset' [-Werror=implicit-function-declaration]
     831 |         ret = devm_add_action_or_reset(dev, (void *)reset_control_assert, (void *)reset);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/reset.h: At top level:
   include/linux/reset.h:817:30: warning: 'devm_reset_control_get_deassert' defined but not used [-Wunused-function]
     817 | static struct reset_control *devm_reset_control_get_deassert(
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/devm_reset_control_get_deassert +817 include/linux/reset.h

   808	
   809	/**
   810	 * devm_reset_control_get_deassert - resource managed
   811	 * @dev: device to be reset by the controller
   812	 * @index: index of the reset controller
   813	 *
   814	 * A helper function to automatically handle return value of
   815	 * devm_reset_control_get_exclusive() and reset_control_deassert().
   816	 */
 > 817	static struct reset_control *devm_reset_control_get_deassert(
   818				  struct device *dev, const char *id)
   819	{
   820		int ret;
   821		struct reset_control *reset;
   822	
   823		reset = devm_reset_control_get_exclusive(dev, id);
   824		if (IS_ERR(reset))
   825			return reset;
   826	
   827		ret = reset_control_deassert(reset);
   828		if (ret)
   829			return ERR_PTR(ret);
   830	
 > 831		ret = devm_add_action_or_reset(dev, (void *)reset_control_assert, (void *)reset);
   832		if (ret)
   833			return ERR_PTR(ret);
   834	
   835		return reset;
   836	}
   837	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
