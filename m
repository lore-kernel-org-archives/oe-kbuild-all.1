Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B72D224C4
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Oct 2023 20:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GcJCpDWy"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696453084; x=1727989084;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1FoqNYuPcPo+x/L/Tusi2mVwUWrZ96ehOnQMkkEk0kk=;
  b=GcJCpDWyHgZMPItU/MTDcAwObJudU9SLZAuCCWCfqzGBlpXQX2CGb6Hk
   QcOPgnRdw30ch07BWkRfkCONpESkCKbT59diOeyBRE8BdSIoiwZk6NW8K
   /DV9njIdm/n4gVogt8NfJeDzGWo/fY8kx3aQ+57XZLck14JTMwLFpQFn0
   Now2VYPidjW1wxx5XoPExH4XIROF83AClIjy8W3uuvUUh531bA0TzXd8T
   FVJPwn3mEV6m20AlefB8etexFTc29yGu0/VjHnHZmXNe5HHubcSAhjVwi
   +1EYMsr8TYgjNebW6wzXKx9NTHG9MPTJgUTlmzHZ4+JukzYNEnyxXr2pF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="386126801"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="386126801"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 13:58:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="817279558"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="817279558"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 04 Oct 2023 13:58:02 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qo8wR-000Kc1-37;
	Wed, 04 Oct 2023 20:57:59 +0000
Date: Thu, 5 Oct 2023 04:57:26 +0800
From: kernel test robot <lkp@intel.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v5 10/11] media: imx-asrc: Add memory to memory driver
Message-ID: <202310050431.7xv8z9vU-lkp@intel.com>
References: <1695891619-32393-11-git-send-email-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1695891619-32393-11-git-send-email-shengjiu.wang@nxp.com>

Hi Shengjiu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on media-tree/master]
[also build test WARNING on broonie-sound/for-next tiwai-sound/for-next tiwai-sound/for-linus linus/master v6.6-rc4 next-20231004]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shengjiu-Wang/ASoC-fsl_asrc-define-functions-for-memory-to-memory-usage/20230928-173903
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/1695891619-32393-11-git-send-email-shengjiu.wang%40nxp.com
patch subject: [RFC PATCH v5 10/11] media: imx-asrc: Add memory to memory driver
config: i386-randconfig-061-20231005 (https://download.01.org/0day-ci/archive/20231005/202310050431.7xv8z9vU-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231005/202310050431.7xv8z9vU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310050431.7xv8z9vU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/media/platform/nxp/imx-asrc.c:159:53: sparse: sparse: restricted snd_pcm_format_t degrades to integer
   drivers/media/platform/nxp/imx-asrc.c:717:37: sparse: sparse: restricted snd_pcm_format_t degrades to integer

vim +159 drivers/media/platform/nxp/imx-asrc.c

   148	
   149	static int asrc_check_format(struct asrc_pair_m2m *pair_m2m, u8 dir, u32 format)
   150	{
   151		struct asrc_m2m *m2m = pair_m2m->m2m;
   152		struct fsl_asrc_m2m_pdata *pdata = &m2m->pdata;
   153		struct fsl_asrc_pair *pair = pair_m2m->pair;
   154		u64 format_bit = 0;
   155		int i;
   156	
   157		for (i = 0; i < NUM_FORMATS; ++i) {
   158			if (formats[i].fourcc == format) {
 > 159				format_bit = 1 << formats[i].format;
   160				break;
   161			}
   162		}
   163	
   164		if (dir == IN && !(format_bit & pdata->fmt_in))
   165			return find_fourcc(pair->sample_format[V4L_OUT]);
   166		else if (dir == OUT && !(format_bit & pdata->fmt_out))
   167			return find_fourcc(pair->sample_format[V4L_CAP]);
   168		else
   169			return format;
   170	}
   171	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
