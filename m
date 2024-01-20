Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7677E62F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jan 2024 04:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705725090; cv=none; b=SUif6+EECYi7TOMrwprWeSQqdv4jY1sTMAZZvFqAbsH29hA6KCD4dMyFRHN/e3LkIznzKnDCbC6ElVeuvRdw6CLbnJaO0R4hshjLrUGwERjUQiSzx9yYywDlSyzFqsp+hfx2i3XtzMHMPC+sL3d44PuL2sph4W+5MKpIU7XebEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705725090; c=relaxed/simple;
	bh=jMxlSvbiU3C0I1oF5Nc13hU7kmLJYLtwfV1DrcbsVe4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OiDq5EAqdHyRyuMTsSFOHAw1UGDnKzge3UKvr3uCQyTmM3+ogLcE3Hzv7/r65zR/Nu7X4b9LZxd2+aFlE6FNzwA2JMzMX2XR5Wc6E9QWBnINhi8Y1MXaKRbhZzMvx6AJZu9XYfm2cJ9lC5i4rAw/maks9+inpkyBaiV3kNagqt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZWH4Oykf; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZWH4Oykf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705725088; x=1737261088;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jMxlSvbiU3C0I1oF5Nc13hU7kmLJYLtwfV1DrcbsVe4=;
  b=ZWH4Oykfi+5h9I3fvlCI6Dy0yeI/eQ5PhwnyGiKLa8nCTNbXksG5Qt5W
   UjGjw60NCOMcznhzMldg6MJbZFqGrneD2nLb7CFt+Ot7mSdujKT6x+quU
   QQd1rwxyNqwDbjaTKPLlsa2B9Vpla4xoIzyOhf5T5kX8zPzX6itzJikzH
   VYz17d2y95hobE0iT7ToMeBITBnrFjqg/VfnVCTlAeLMKNKqup8RQjAGV
   IwtQL7dn8hy7bRRN0Gv9qo/1bYDENcS3i2MpG+6AYf2unX4AAOOprZndY
   vIlJYUS0uwewxLP3EVjwWnmr/KIF26rWPJaLoPA9xOLSKSZS0yTvOvv0h
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="7604666"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="7604666"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 20:31:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="838373"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 19 Jan 2024 20:31:26 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rR30u-0004kA-0n;
	Sat, 20 Jan 2024 04:31:24 +0000
Date: Sat, 20 Jan 2024 12:30:30 +0800
From: kernel test robot <lkp@intel.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v12 13/15] media: vivid: add fixed point test controls
Message-ID: <202401201250.olzKB6qB-lkp@intel.com>
References: <1705581128-4604-14-git-send-email-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1705581128-4604-14-git-send-email-shengjiu.wang@nxp.com>

Hi Shengjiu,

kernel test robot noticed the following build errors:

[auto build test ERROR on media-tree/master]
[also build test ERROR on broonie-sound/for-next tiwai-sound/for-next tiwai-sound/for-linus linus/master v6.7 next-20240119]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shengjiu-Wang/ASoC-fsl_asrc-define-functions-for-memory-to-memory-usage/20240118-211929
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/1705581128-4604-14-git-send-email-shengjiu.wang%40nxp.com
patch subject: [PATCH v12 13/15] media: vivid: add fixed point test controls
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20240120/202401201250.olzKB6qB-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401201250.olzKB6qB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401201250.olzKB6qB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/test-drivers/vivid/vivid-ctrls.c:195:10: error: 'const struct v4l2_ctrl_config' has no member named 'fraction_bits'
     195 |         .fraction_bits = 16,
         |          ^~~~~~~~~~~~~
   drivers/media/test-drivers/vivid/vivid-ctrls.c:206:10: error: 'const struct v4l2_ctrl_config' has no member named 'fraction_bits'
     206 |         .fraction_bits = 63,
         |          ^~~~~~~~~~~~~


vim +195 drivers/media/test-drivers/vivid/vivid-ctrls.c

   186	
   187	static const struct v4l2_ctrl_config vivid_ctrl_int32_q16 = {
   188		.ops = &vivid_user_gen_ctrl_ops,
   189		.id = VIVID_CID_INT_Q4_16,
   190		.name = "Integer 32 Bits Q4.16",
   191		.type = V4L2_CTRL_TYPE_INTEGER,
   192		.min = v4l2_ctrl_fp_compose(-16, 0, 16),
   193		.max = v4l2_ctrl_fp_compose(15, 0xffff, 16),
   194		.step = 1,
 > 195		.fraction_bits = 16,
   196	};
   197	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
