Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493CA8834
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Aug 2025 00:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754182624; cv=none; b=Cnc5UZTKU/UwVVCnTlGsuz+jpZeVLxQBwPhlrXsM/nqsnA0AG+q4kFpuv7IcBncK6xU8CmDmqS7OIaTjHyloS2u5qTZ7wswZyIGzGq5bNrvhc38b2pcFHIQ5w1Zw7/FRYbh+6+KTYzVxwerrug2Was3m7G85KYEw5cZCRR+2pns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754182624; c=relaxed/simple;
	bh=FuQXppfHDIthToj/a6+v9wXeMA7rRCmTzAJxH/TkdTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h7CvaSQ84WZsVOn4oBW5owSM2TNqiZoLTYY/AWTgHVnDlna5Sf6RsAwsMGF8lpGlRQd2ULoicD/+yKMPc0Burrjyf/SsOescVZAzGHnIrtJKdOSh9IKB1GRPcs3+9SmSYiGeGO+h1E4lkyX2C1fzQ29kGSEBa3PHLimJDpNF4vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h1JrHKpT; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h1JrHKpT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754182622; x=1785718622;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FuQXppfHDIthToj/a6+v9wXeMA7rRCmTzAJxH/TkdTg=;
  b=h1JrHKpTsiTB6IqlJQBmoAxLUCmR9kHC68+v5lcFZLSk3JLLnXWFIHlt
   8izGgHDptixG9AUzwQwrkWs+w0gywyMvO1vNzHKMLeU8d0Doe3RAsOP6Y
   x/pHIK0+5r0nupb6uGz51DTRGpHTs5iJ/DPmnoT815+9I9E/KUsIE8ZQs
   KfhPTapFpncoEopYXbXzTFJyQ9LaEw3OfEMVYz+nUt0uIPRZ6M9KNZOr8
   olPu0kXbsn4C40Kjom48daOwCzreamDWHwlL1qMPycvk/X5URp0hAiUDy
   5EX8m+7CwSwNzVain669dHAQDtQ1GNqyqxtF7rZoylF0etjzX9bviBkr/
   g==;
X-CSE-ConnectionGUID: YQC3yNbkQUqKpiEaADHXEQ==
X-CSE-MsgGUID: 48ApwWU1S/q2gkZfbI7XUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11510"; a="59105943"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="59105943"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2025 17:57:01 -0700
X-CSE-ConnectionGUID: uW9DjfQKRumylC0BuXoNgw==
X-CSE-MsgGUID: R+2nd32ITkSnwdb961CZEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="169231686"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 Aug 2025 17:57:01 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiN22-0005gW-0m;
	Sun, 03 Aug 2025 00:56:58 +0000
Date: Sun, 3 Aug 2025 08:56:26 +0800
From: kernel test robot <lkp@intel.com>
To: Vadim Fedorenko <vadfed@meta.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-wired-lan] [RFC PATCH v3] ethtool: add FEC bins
 histogramm report
Message-ID: <202508030836.U75ZjaHR-lkp@intel.com>
References: <20250802063024.2423022-1-vadfed@meta.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250802063024.2423022-1-vadfed@meta.com>

Hi Vadim,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on tnguy-next-queue/dev-queue]
[also build test WARNING on tnguy-net-queue/dev-queue net/main net-next/main linus/master v6.16 next-20250801]
[cannot apply to horms-ipvs/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vadim-Fedorenko/ethtool-add-FEC-bins-histogramm-report/20250802-143217
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
patch link:    https://lore.kernel.org/r/20250802063024.2423022-1-vadfed%40meta.com
patch subject: [Intel-wired-lan] [RFC PATCH v3] ethtool: add FEC bins histogramm report
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20250803/202508030836.U75ZjaHR-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250803/202508030836.U75ZjaHR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508030836.U75ZjaHR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/ethtool/fec.c: In function 'fec_prepare_data':
>> net/ethtool/fec.c:147:1: warning: the frame size of 1552 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     147 | }
         | ^


vim +147 net/ethtool/fec.c

be85dbfeb37c8c Jakub Kicinski  2021-04-15   97  
1e5d1f69d9fb8e Jakub Kicinski  2021-03-29   98  static int fec_prepare_data(const struct ethnl_req_info *req_base,
1e5d1f69d9fb8e Jakub Kicinski  2021-03-29   99  			    struct ethnl_reply_data *reply_base,
f946270d05c260 Jakub Kicinski  2023-08-14  100  			    const struct genl_info *info)
1e5d1f69d9fb8e Jakub Kicinski  2021-03-29  101  {
1e5d1f69d9fb8e Jakub Kicinski  2021-03-29  102  	__ETHTOOL_DECLARE_LINK_MODE_MASK(active_fec_modes) = {};
1e5d1f69d9fb8e Jakub Kicinski  2021-03-29  103  	struct fec_reply_data *data = FEC_REPDATA(reply_base);
1e5d1f69d9fb8e Jakub Kicinski  2021-03-29  104  	struct net_device *dev = reply_base->dev;
1e5d1f69d9fb8e Jakub Kicinski  2021-03-29  105  	struct ethtool_fecparam fec = {};
1e5d1f69d9fb8e Jakub Kicinski  2021-03-29  106  	int ret;
1e5d1f69d9fb8e Jakub Kicinski  2021-03-29  107  
1e5d1f69d9fb8e Jakub Kicinski  2021-03-29  108  	if (!dev->ethtool_ops->get_fecparam)
1e5d1f69d9fb8e Jakub Kicinski  2021-03-29  109  		return -EOPNOTSUPP;
1e5d1f69d9fb8e Jakub Kicinski  2021-03-29  110  	ret = ethnl_ops_begin(dev);
1e5d1f69d9fb8e Jakub Kicinski  2021-03-29  111  	if (ret < 0)
1e5d1f69d9fb8e Jakub Kicinski  2021-03-29  112  		return ret;
1e5d1f69d9fb8e Jakub Kicinski  2021-03-29  113  	ret = dev->ethtool_ops->get_fecparam(dev, &fec);
1e5d1f69d9fb8e Jakub Kicinski  2021-03-29  114  	if (ret)
3d7cc109ecf76a Jakub Kicinski  2021-04-15  115  		goto out_complete;
be85dbfeb37c8c Jakub Kicinski  2021-04-15  116  	if (req_base->flags & ETHTOOL_FLAG_STATS &&
be85dbfeb37c8c Jakub Kicinski  2021-04-15  117  	    dev->ethtool_ops->get_fec_stats) {
be85dbfeb37c8c Jakub Kicinski  2021-04-15  118  		struct ethtool_fec_stats stats;
be85dbfeb37c8c Jakub Kicinski  2021-04-15  119  
be85dbfeb37c8c Jakub Kicinski  2021-04-15  120  		ethtool_stats_init((u64 *)&stats, sizeof(stats) / 8);
923ac23600c242 Vadim Fedorenko 2025-08-01  121  		dev->ethtool_ops->get_fec_stats(dev, &stats, &data->fec_ranges);
be85dbfeb37c8c Jakub Kicinski  2021-04-15  122  
be85dbfeb37c8c Jakub Kicinski  2021-04-15  123  		fec_stats_recalc(&data->corr, &stats.corrected_blocks);
be85dbfeb37c8c Jakub Kicinski  2021-04-15  124  		fec_stats_recalc(&data->uncorr, &stats.uncorrectable_blocks);
be85dbfeb37c8c Jakub Kicinski  2021-04-15  125  		fec_stats_recalc(&data->corr_bits, &stats.corrected_bits);
923ac23600c242 Vadim Fedorenko 2025-08-01  126  		if (data->fec_ranges)
923ac23600c242 Vadim Fedorenko 2025-08-01  127  			memcpy(data->hist, stats.hist, sizeof(stats.hist));
be85dbfeb37c8c Jakub Kicinski  2021-04-15  128  	}
1e5d1f69d9fb8e Jakub Kicinski  2021-03-29  129  
1e5d1f69d9fb8e Jakub Kicinski  2021-03-29  130  	WARN_ON_ONCE(fec.reserved);
1e5d1f69d9fb8e Jakub Kicinski  2021-03-29  131  
1e5d1f69d9fb8e Jakub Kicinski  2021-03-29  132  	ethtool_fec_to_link_modes(fec.fec, data->fec_link_modes,
1e5d1f69d9fb8e Jakub Kicinski  2021-03-29  133  				  &data->fec_auto);
1e5d1f69d9fb8e Jakub Kicinski  2021-03-29  134  
1e5d1f69d9fb8e Jakub Kicinski  2021-03-29  135  	ethtool_fec_to_link_modes(fec.active_fec, active_fec_modes, NULL);
1e5d1f69d9fb8e Jakub Kicinski  2021-03-29  136  	data->active_fec = find_first_bit(active_fec_modes,
1e5d1f69d9fb8e Jakub Kicinski  2021-03-29  137  					  __ETHTOOL_LINK_MODE_MASK_NBITS);
1e5d1f69d9fb8e Jakub Kicinski  2021-03-29  138  	/* Don't report attr if no FEC mode set. Note that
1e5d1f69d9fb8e Jakub Kicinski  2021-03-29  139  	 * ethtool_fecparam_to_link_modes() ignores NONE and AUTO.
1e5d1f69d9fb8e Jakub Kicinski  2021-03-29  140  	 */
1e5d1f69d9fb8e Jakub Kicinski  2021-03-29  141  	if (data->active_fec == __ETHTOOL_LINK_MODE_MASK_NBITS)
1e5d1f69d9fb8e Jakub Kicinski  2021-03-29  142  		data->active_fec = 0;
1e5d1f69d9fb8e Jakub Kicinski  2021-03-29  143  
3d7cc109ecf76a Jakub Kicinski  2021-04-15  144  out_complete:
3d7cc109ecf76a Jakub Kicinski  2021-04-15  145  	ethnl_ops_complete(dev);
3d7cc109ecf76a Jakub Kicinski  2021-04-15  146  	return ret;
1e5d1f69d9fb8e Jakub Kicinski  2021-03-29 @147  }
1e5d1f69d9fb8e Jakub Kicinski  2021-03-29  148  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
