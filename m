Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B82876048
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Sep 2024 08:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725265251; cv=none; b=DtxYkjnvT8eTBTbtz68YkYZbNNr0GuBaOQ/AxukaFnS6B7aZMRHbfBMhkURGnW+OT5I+ip9w3KS3MicrQW52lSRAa6kSOgUwqUqp+tMsgl3FWB66K+sxyLuZrTV05Dh3xlPjf2mOozZPWPzcpN6yFKs9Co3vn2ne/mFzVZywmcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725265251; c=relaxed/simple;
	bh=eizpPVMVj7PSTauWagvvtALtSWjt2qGnDov0KRIgfMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fWztAVDvkKYKRXZXWqu5ijPKg83yyGEjhQA3rzaKwClgotJHh3Pjy24z1dbPHLtQvw3DIML4YVrUuI6AHJJZTOxx1pH+tzeBlDKh1hWPOz6rPT3RGeKm3gWqxf/mww1aaFjhiFy6IurtCS5gORvaiwkJFKmPhLdmVZ+N7pUnzBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HPX4Q2s4; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HPX4Q2s4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725265250; x=1756801250;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eizpPVMVj7PSTauWagvvtALtSWjt2qGnDov0KRIgfMU=;
  b=HPX4Q2s4XytT1THtq0deLjN1hglqyE8FaqIP743useUky6NSt8PYM12J
   FGwh4iiFXTbebVSeuPBbfIrPhispg8pohiJZ3jeRpaf70iuUyIVKhcbo0
   ZmZNvSXjeCD4GrPoWUtzbtNygYuYxvOYN2OGFJvyxBsH2O0o+GZGfbg7E
   VVaEC4v2IkfxAUe96E07yMlQxm15UAUzfmbcw1wXho+8qfgVepBCHkXEt
   abikUreZZKg8Ne3380E42F2qk4YF+d7HYv1YruGvvBcc93A9Iddtww3ZZ
   jluzKyqnhW6i/cIR8V9/re5KCH+M0viD0CCvHlL+vGZCJltxo8dbx4Ufg
   g==;
X-CSE-ConnectionGUID: vHVkyw2vTgaY8kiVJ1AbyQ==
X-CSE-MsgGUID: pNzjwnSJT/u0oX2swfneUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="46347037"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="46347037"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 01:20:49 -0700
X-CSE-ConnectionGUID: mR48KQ4tRL+Ozw9Pp1MMew==
X-CSE-MsgGUID: vMkSe4wfSCWI4dLt0JaMvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="95346308"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 02 Sep 2024 01:20:48 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sl2In-0005Hm-34;
	Mon, 02 Sep 2024 08:20:45 +0000
Date: Mon, 2 Sep 2024 16:20:34 +0800
From: kernel test robot <lkp@intel.com>
To: Yuesong Li <liyuesong@vivo.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC] reset: Provide new devm_reset helpers for get and
 deassert reset control
Message-ID: <202409021604.4gaJkwG2-lkp@intel.com>
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
kernel test robot noticed the following build warnings:

[auto build test WARNING on pza/reset/next]
[also build test WARNING on pza/imx-drm/next linus/master v6.11-rc6 next-20240830]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yuesong-Li/reset-Provide-new-devm_reset-helpers-for-get-and-deassert-reset-control/20240830-113607
base:   https://git.pengutronix.de/git/pza/linux reset/next
patch link:    https://lore.kernel.org/r/20240830033351.233263-1-liyuesong%40vivo.com
patch subject: [PATCH RFC] reset: Provide new devm_reset helpers for get and deassert reset control
config: i386-buildonly-randconfig-001-20240902 (https://download.01.org/0day-ci/archive/20240902/202409021604.4gaJkwG2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240902/202409021604.4gaJkwG2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409021604.4gaJkwG2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/ata/libahci_platform.c:25:
>> include/linux/reset.h:817:30: warning: 'devm_reset_control_get_deassert' defined but not used [-Wunused-function]
     817 | static struct reset_control *devm_reset_control_get_deassert(
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


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
   831		ret = devm_add_action_or_reset(dev, (void *)reset_control_assert, (void *)reset);
   832		if (ret)
   833			return ERR_PTR(ret);
   834	
   835		return reset;
   836	}
   837	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
