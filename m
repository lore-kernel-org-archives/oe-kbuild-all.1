Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D99918029
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Mar 2024 20:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710793698; cv=none; b=Fs3rJj4SrXN2lq6HHtHIOuj75PgPymuQ5u1g/SAoVXPoTDOm99FmzeyCEIi5L7cuzMYdHRAtbiUHSBmNafU285SIOx5bfspWAkvcgrf1GB2fnVjkMObosAOXVFl4rOgWcSHaQ63VVyE64XJXu6XK2i7LDxcXzPzWnJ3tmitCB5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710793698; c=relaxed/simple;
	bh=/1TZqILMC5z6Ns43/ZtGVPQd5aavQdtFfUTRdhLnOnw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nF0sD8IS5dkPMMhWofOvEEEgJ7uhHK7YDHLDJasZMYcdMqfyPco+8+gJ3RB7Xh/sc99af61wTy6IWQdwcMj5++wBCAHX7So9Foo02m9IZVgBV8JoM9Bu9UV3PU2ifjDD7L+zapbpiE2NkaNQBlQagKO/mipTk7P7p4gsn3KytlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gim3FVkG; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gim3FVkG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710793696; x=1742329696;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/1TZqILMC5z6Ns43/ZtGVPQd5aavQdtFfUTRdhLnOnw=;
  b=Gim3FVkG6hFvJMxGn4cd6cFExnA9iik/WYBYEgMVB5u3q8Ihks1b3lDF
   3iy0z0m8y0TTqQMOnGAi0FBzjHJ7Axd7Yk60n1mZPkszrQUbCNXWwSoHb
   f/uZcsu3OgxVl4RQI8yMBy4vow55ovEjb4xrhAoDcDS75OlF2zrGs0jE8
   OWQbYcpE3rsGnHsoOhx28T3Vng3N7za6iKWzW6HgwYVAi3b4+vTGfEbg5
   9DsqUSxJiPS1l/ckkag7IcS2+HBUyUMOZDH+UAXTE6PLuOkNfiUyZs/97
   qr4Ya+PmNf++ueo5cFjvAr4N8Pt29q7gd/57WY+nRgIJD9Gokro40MNWF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5813050"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="5813050"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 13:28:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="13469419"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Mar 2024 13:28:14 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmJad-000HER-1U;
	Mon, 18 Mar 2024 20:28:11 +0000
Date: Tue, 19 Mar 2024 04:27:54 +0800
From: kernel test robot <lkp@intel.com>
To: Jai Luthra <j-luthra@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 1/6]
 sound/soc/soc-generic-dmaengine-pcm.c:321:5: sparse: sparse: symbol
 'dmaengine_pcm_prepare' was not declared. Should it be static?
Message-ID: <202403190446.8Z4AdPtO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   871d5629a0ee4ae82d0caf8d57d4f711d54e1465
commit: 7ff6902b6e5082643c2d5dd34d34fc5a8e53d7d8 [1/6] HACK: ALSA: dmaengine: Synchronize dma channel in prepare()
config: microblaze-randconfig-r111-20240318 (https://download.01.org/0day-ci/archive/20240319/202403190446.8Z4AdPtO-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240319/202403190446.8Z4AdPtO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403190446.8Z4AdPtO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/soc-generic-dmaengine-pcm.c:321:5: sparse: sparse: symbol 'dmaengine_pcm_prepare' was not declared. Should it be static?

vim +/dmaengine_pcm_prepare +321 sound/soc/soc-generic-dmaengine-pcm.c

   320	
 > 321	int dmaengine_pcm_prepare(struct snd_soc_component *component,
   322				  struct snd_pcm_substream *substream)
   323	{
   324		return snd_dmaengine_pcm_prepare(substream);
   325	}
   326	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
