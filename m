Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8EF2076AB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Nov 2024 17:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731431985; cv=none; b=X3C21jv0bwxdTxuZR4Hi1q19ACkivGjG/SxyTGLYN1vDKskMGl+MOD18lex793onsDihUdycL/jO91aizmy0diBrerMMIek/yVMleJSA6Jp9MavU7Gl88743fYUfR4nNcXT0jgBTPpw/PYaSuytrqv3tpuTUvtNjbNPpTz8mnyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731431985; c=relaxed/simple;
	bh=Pyhf31zepbQc9xuNmjROnSdJ2KtoOo138q+eT2R4WvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LcEMYKelUDqHRxULI8dNRWdl8T7lMuUovlLdUCK9K163bdUUHhGoFzu1QoZjirmGLEGl6/HpzM8DKzmRnF5LyYAadVQ2dYmDIAOiH/QaLeFQfycJeqIFnj2OhntgoZX3o6nRI04h6ixAC86Yl4IempffcWbwD5ID5kvktqVEo+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NIhj6B/r; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NIhj6B/r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731431984; x=1762967984;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pyhf31zepbQc9xuNmjROnSdJ2KtoOo138q+eT2R4WvQ=;
  b=NIhj6B/rhgTYJRdTIrza1ngXaOgOJLgACzNSo1VU0crHrbvkHdbrsQNU
   Pk1IMOtNwFuCuMB62VKpzgp1GD38GoluzHUWtI/ige2BDGdEl7odLBa4K
   aDoaS4DQqbkgqYoqi+H0QypZPgmpYxQY7g8GklyJVunLpHnGwS4HLW7UE
   TjYIp4cFJ6SKTqmC+XPMY9gB08Tq79+Zx5x9dgi7/Jvzxh0oGTVYVibds
   hi2ExtcMch8ImqQCFMsL54r8HEjVZyXe71wDaVHpLq50qoyN4uMiCh5FZ
   oAt6UIdNObAXjN1TC67sWpIDqkgqeanu9oA/Z1cCzBvLwuLea18qfO62e
   Q==;
X-CSE-ConnectionGUID: AupmxGzmQEawxbyn8NGxdw==
X-CSE-MsgGUID: gTmfOlurSDGAoxUWomfxOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="31377687"
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; 
   d="scan'208";a="31377687"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 09:19:43 -0800
X-CSE-ConnectionGUID: nhXN8bopRXawz1uLHQ2OFA==
X-CSE-MsgGUID: +yRC3+cpSWulG6xOUHICsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; 
   d="scan'208";a="88392039"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Nov 2024 09:19:43 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAuYG-0001Zb-0e;
	Tue, 12 Nov 2024 17:19:40 +0000
Date: Wed, 13 Nov 2024 01:18:48 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2024-11-12-2 72/86]
 sound/soc/soc-pcm.c:2384:28: error: passing argument 1 of 'snd_soc_ret' from
 incompatible pointer type
Message-ID: <202411130156.GD7RBIrV-lkp@intel.com>
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
commit: abea6749066443c1916d5eb930a6e5aae22095f9 [72/86] ASoC: soc-pcm: use snd_soc_ret()
config: i386-randconfig-141-20241112 (https://download.01.org/0day-ci/archive/20241113/202411130156.GD7RBIrV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411130156.GD7RBIrV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411130156.GD7RBIrV-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/soc-pcm.c: In function 'soc_pcm_components_close':
   sound/soc/soc-pcm.c:741:16: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     741 |         int i, ret = 0;
         |                ^~~
   sound/soc/soc-pcm.c: In function 'dpcm_dai_trigger_fe_be':
>> sound/soc/soc-pcm.c:2384:28: error: passing argument 1 of 'snd_soc_ret' from incompatible pointer type [-Werror=incompatible-pointer-types]
    2384 |         return snd_soc_ret(fe, ret, "trigger FE cmd: %d failed\n", cmd);
         |                            ^~
         |                            |
         |                            struct snd_soc_pcm_runtime *
   In file included from sound/soc/soc-pcm.c:24:
   include/sound/soc.h:542:38: note: expected 'const struct device *' but argument is of type 'struct snd_soc_pcm_runtime *'
     542 | int snd_soc_ret(const struct device *dev, int ret, const char *fmt, ...);
         |                 ~~~~~~~~~~~~~~~~~~~~~^~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +/snd_soc_ret +2384 sound/soc/soc-pcm.c

  2354	
  2355	static int dpcm_dai_trigger_fe_be(struct snd_pcm_substream *substream,
  2356					  int cmd, bool fe_first)
  2357	{
  2358		struct snd_soc_pcm_runtime *fe = snd_soc_substream_to_rtd(substream);
  2359		int ret;
  2360	
  2361		/* call trigger on the frontend before the backend. */
  2362		if (fe_first) {
  2363			dev_dbg(fe->dev, "ASoC: pre trigger FE %s cmd %d\n",
  2364				fe->dai_link->name, cmd);
  2365	
  2366			ret = soc_pcm_trigger(substream, cmd);
  2367			if (ret < 0)
  2368				goto end;
  2369	
  2370			ret = dpcm_be_dai_trigger(fe, substream->stream, cmd);
  2371			goto end;
  2372		}
  2373	
  2374		/* call trigger on the frontend after the backend. */
  2375		ret = dpcm_be_dai_trigger(fe, substream->stream, cmd);
  2376		if (ret < 0)
  2377			goto end;
  2378	
  2379		dev_dbg(fe->dev, "ASoC: post trigger FE %s cmd %d\n",
  2380			fe->dai_link->name, cmd);
  2381	
  2382		ret = soc_pcm_trigger(substream, cmd);
  2383	end:
> 2384		return snd_soc_ret(fe, ret, "trigger FE cmd: %d failed\n", cmd);
  2385	}
  2386	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
