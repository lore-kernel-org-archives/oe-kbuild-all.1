Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8722003CA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Nov 2024 15:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731425005; cv=none; b=K0mvWOdWbktFYxnR85fPWPLdaKQiLhBy7h2YnHstMQaiaXw21Y5hHwP8tQ9JFqQ36XcQqLX+L1O6QRrsWbcmycAqhp0pnw/It89M06+DHb+GHLa1hwXNPNOkH57Wu9i2XCHS6cxC2+7YXtVLPmP+nhh/Xuasv69jK5bo0NOasXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731425005; c=relaxed/simple;
	bh=z1QRJl4o/FVr3yQxRkug8L3aAPvX99rJcMsZvep3Dpk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fjL+bePcfLaeHlflZ97Os1Ji20uyJP1WYKHCHyrycP8CCfLRvsxKtBF5sxHQtDs2YGXT7vDibbflvU7AHQH3nWr4Fa7uSztpjNNwKRNdjhDFXD83Cupbus65ZP5X+RxlilWPEsBnyAKRJRqcQSPw0JuyfoQ75Jxj3JVugovZRT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=epvNeo/5; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="epvNeo/5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731425003; x=1762961003;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z1QRJl4o/FVr3yQxRkug8L3aAPvX99rJcMsZvep3Dpk=;
  b=epvNeo/5IFJm+xNTkONAXOFD3YZ8bR6BnOqG6KQi0MzLDXsjI7O7S9eI
   B+7f2Hv7hrYqvKyOvbDI2bmXioMKNvfnEGJ1DXJeXm+0x7RhreaniJjxp
   PESWtRHtDXqljEicTVChKuFH++jAkCUQgGD8MH6+w2rldCKTyaVJvCiR1
   hJSfrvRGVXln6RelYwar1eUjSAI4tIEF7Sz04JZ50gkxw76UZiTn6JEya
   ypLy92xkRwlVpCC8heY7nJ0sv+s6kQqsnv+Ai0h+1JlUQ495IpI7YItMN
   P7uQCQPYNhDklMNrf6kiAvTtsNZk3r9sXyqOVARW4Ao097wgg9oxjPfD+
   A==;
X-CSE-ConnectionGUID: Jtuf6pSxTtepa2GJWBHtSA==
X-CSE-MsgGUID: ojlH9S1PQRe6QDrXRAsLgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="18875192"
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; 
   d="scan'208";a="18875192"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 07:23:22 -0800
X-CSE-ConnectionGUID: YzVYwgzfSf2ZTObKeO0ywA==
X-CSE-MsgGUID: kpOF8E+OSWWGf+Ha0hq/Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; 
   d="scan'208";a="87477545"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Nov 2024 07:23:21 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAsje-0001T3-2i;
	Tue, 12 Nov 2024 15:23:18 +0000
Date: Tue, 12 Nov 2024 23:22:31 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2024-11-12-2 70/86]
 sound/soc/soc-pcm.c:746:16: warning: variable 'ret' set but not used
Message-ID: <202411122315.AAsrxtVY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-cleanup-2024-11-12-2
head:   e9ee7637473b0ebd74e4147970a2b809e0b19bc9
commit: 1e7a7e779fe45dfb74c2e275f18f1a1b1238c3c0 [70/86] ASoC: soc-pcm: makes soc_pcm_components_close() void
config: i386-randconfig-141-20241112 (https://download.01.org/0day-ci/archive/20241112/202411122315.AAsrxtVY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241112/202411122315.AAsrxtVY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411122315.AAsrxtVY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/soc-pcm.c: In function 'soc_pcm_components_close':
>> sound/soc/soc-pcm.c:746:16: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     746 |         int i, ret = 0;
         |                ^~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +/ret +746 sound/soc/soc-pcm.c

e7ecfdb794fef1f Kuninori Morimoto 2019-05-13  740  
1e7a7e779fe45df Kuninori Morimoto 2024-11-12  741  static void soc_pcm_components_close(struct snd_pcm_substream *substream,
51aff91ad123e03 Kuninori Morimoto 2020-09-28  742  				    int rollback)
244e293690a6e07 Charles Keepax    2018-06-19  743  {
2679a5b2f7d99e3 Kuninori Morimoto 2023-09-11  744  	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
244e293690a6e07 Charles Keepax    2018-06-19  745  	struct snd_soc_component *component;
33be10b563dc56c Kuninori Morimoto 2021-07-27 @746  	int i, ret = 0;
244e293690a6e07 Charles Keepax    2018-06-19  747  
613fb50059cf19a Kuninori Morimoto 2020-01-10  748  	for_each_rtd_components(rtd, i, component) {
33be10b563dc56c Kuninori Morimoto 2021-07-27  749  		int r = snd_soc_component_close(component, substream, rollback);
e82ebffce3ec075 Kuninori Morimoto 2020-02-10  750  		if (r < 0)
e82ebffce3ec075 Kuninori Morimoto 2020-02-10  751  			ret = r; /* use last ret */
e82ebffce3ec075 Kuninori Morimoto 2020-02-10  752  
51aff91ad123e03 Kuninori Morimoto 2020-09-28  753  		snd_soc_component_module_put_when_close(component, substream, rollback);
244e293690a6e07 Charles Keepax    2018-06-19  754  	}
244e293690a6e07 Charles Keepax    2018-06-19  755  }
244e293690a6e07 Charles Keepax    2018-06-19  756  

:::::: The code at line 746 was first introduced by commit
:::::: 33be10b563dc56c33d28562ff83065a89647e443 ASoC: soc-pcm: cleanup cppcheck warning at soc_pcm_components_close()

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
