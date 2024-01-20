Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABBB111A5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jan 2024 18:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705774734; cv=none; b=NtIyk92xPl2iUm6JuHMhWZwuAwZ+kfyfZO6imK6Yej8Yn7sW08Uwox1DZH7L9fytwDa6ZvJz924PodQfrPempiZGj3NXtq/V5iSG/2rluWq6ufWN/peU0qy49mUGPLATjfrhmjW5sA0G3b27BpZPIGDWsxbOxe0lpMi3SRkORVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705774734; c=relaxed/simple;
	bh=oYKLNQ9Byo05LuqILEdNTwLxkpmunMgp5caR99UpcyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gkNbn4rj2lXr9GLXNnJduh9Swxmo8/dkHxbtlPh5EUcel4TgTzYu2fmlh07FVN+J4+6cTlyxFxKZxzv5UH2nNzMmYnOZ+2lAR8+R43KEe3uagBA+uHe/WQHi+vW9JvkPa7dL73jOmW6pqZff7zOAEWH9/wzdT/C29dIoW5Lj40U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jsFjF1K1; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jsFjF1K1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705774733; x=1737310733;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oYKLNQ9Byo05LuqILEdNTwLxkpmunMgp5caR99UpcyE=;
  b=jsFjF1K1JgLFbRQoLq2CpVFIIaiJEolmbKTwcqNxQQhemVnlDm65MF2h
   L+N+YRtYYwNxyZzcdqWH8+PpbjUzMVEYsQMuXxzZc732U/f2h9W8GUIwg
   m/FZ4DUW/SJRvHznMPENBFtyX8+K+u5nRkn/ZAIcg5C6V69uhIxxInaxS
   pT1eHY7rhtwkNlaTj0lf9bAzZAsjgTa7crtRkUWCsy21bQjhpkL8qSwNu
   pTcBs2Mou7NvxRjo7xySnXqvd1sU3UXhTKpJIM/2xwPuVKSh+/UBjSOzH
   mkPtvAb4WTafrMpmkAbcyOffCLkHxObKHh4k5ApS2V4YmpvNjiBa5bhZU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="19534011"
X-IronPort-AV: E=Sophos;i="6.05,208,1701158400"; 
   d="scan'208";a="19534011"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2024 10:18:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,208,1701158400"; 
   d="scan'208";a="806354"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 Jan 2024 10:18:50 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRFvb-0005M2-31;
	Sat, 20 Jan 2024 18:18:47 +0000
Date: Sun, 21 Jan 2024 02:17:52 +0800
From: kernel test robot <lkp@intel.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v12 14/15] media: imx-asrc: Add memory to memory driver
Message-ID: <202401210216.fF5PuPC8-lkp@intel.com>
References: <1705581128-4604-15-git-send-email-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1705581128-4604-15-git-send-email-shengjiu.wang@nxp.com>

Hi Shengjiu,

kernel test robot noticed the following build errors:

[auto build test ERROR on media-tree/master]
[also build test ERROR on broonie-sound/for-next tiwai-sound/for-next tiwai-sound/for-linus linus/master v6.7 next-20240119]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shengjiu-Wang/ASoC-fsl_asrc-define-functions-for-memory-to-memory-usage/20240118-211929
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/1705581128-4604-15-git-send-email-shengjiu.wang%40nxp.com
patch subject: [PATCH v12 14/15] media: imx-asrc: Add memory to memory driver
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20240121/202401210216.fF5PuPC8-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240121/202401210216.fF5PuPC8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401210216.fF5PuPC8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/nxp/imx-asrc.c:456:10: error: 'const struct v4l2_ctrl_config' has no member named 'fraction_bits'
     456 |         .fraction_bits = 32,
         |          ^~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-asrc.c:456:26: warning: initialized field overwritten [-Woverride-init]
     456 |         .fraction_bits = 32,
         |                          ^~
   drivers/media/platform/nxp/imx-asrc.c:456:26: note: (near initialization for 'asrc_src_rate_off_control.def')
   drivers/media/platform/nxp/imx-asrc.c:468:10: error: 'const struct v4l2_ctrl_config' has no member named 'fraction_bits'
     468 |         .fraction_bits = 32,
         |          ^~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-asrc.c:468:26: warning: initialized field overwritten [-Woverride-init]
     468 |         .fraction_bits = 32,
         |                          ^~
   drivers/media/platform/nxp/imx-asrc.c:468:26: note: (near initialization for 'asrc_dst_rate_off_control.def')


vim +456 drivers/media/platform/nxp/imx-asrc.c

   446	
   447	static const struct v4l2_ctrl_config asrc_src_rate_off_control = {
   448		.ops = &asrc_m2m_ctrl_ops,
   449		.id = V4L2_CID_M2M_AUDIO_SOURCE_RATE_OFFSET,
   450		.name = "Audio Source Sample Rate Offset",
   451		.type = V4L2_CTRL_TYPE_INTEGER64,
   452		.min = v4l2_ctrl_fp_compose(-128, 0, 32),
   453		.max = v4l2_ctrl_fp_compose(127, 0xffffffff, 32),
   454		.def = 0,
   455		.step = 1,
 > 456		.fraction_bits = 32,
   457	};
   458	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
