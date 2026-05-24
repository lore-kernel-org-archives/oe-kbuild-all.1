Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54206223DE7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 May 2026 01:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779586031; cv=none; b=MvT9JF151ngBasvJRSNmFK/yl7nU4uqEuM74ODb/g5LTHYgK13QQRwIAGQCxAa46cavd+29bw6MFDF7B10McoFe+j7vA33Q20JuEphYj4Oai+2vT7iT8dHPdz72WcQyNhi2JmVD1ViL+wseEMm8+qNDLWiqVTNWSs9d+Wwu0Hi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779586031; c=relaxed/simple;
	bh=bWBrStZuXpTD4PVBcwXkbtifi1txjP2AbaVOCVckkwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uDvO/Y49QyldWKPw87Csqh1PJ+CF75w+nOB9YWKKjQAdQLDaR73W83LD5WQ0f10JVVV0IOG4jb/JchULtUkerjBqppJmBw5I0biTaWrizXWQLS5ISseOG07EoyOi5zAfqxH5/BQA0xZWviDnZOojCYKwFo6bjEaRVRgt0XIxu3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N7cewEXg; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N7cewEXg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779586030; x=1811122030;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=bWBrStZuXpTD4PVBcwXkbtifi1txjP2AbaVOCVckkwA=;
  b=N7cewEXgR1zKNC0esDr5+1UhJMlSP8k1hmdhNQglWIpL9yef+9HaMzC8
   wyXITKXH9hLdZ/2CJvqTJCv42t61isjr18dlbQbO+UoQ+6PWF8ZdDaW0S
   cDw15AAAK6h+ipL9cqPZH67P0SK4Q+ZZr6AVVIjwN+PEdILfqGTv0Vaps
   mQ4X9IVgv65Cu8UmvMKx4X9vTWcxG4TfVHXtN38M+iVQyxW5Lh2NEpNFV
   t+YCqLRsarSF1PZQSWwsnCgcWlDkIQThrSoc0gAAx8FITWKO3+h1PXrrI
   mlWp/GJr6NA84czN3LEPP1duhPE8KxrEt0zpD5q2eJHMzuRqNzv2QfMAY
   g==;
X-CSE-ConnectionGUID: hXvbg7B5Tz6g+pdMII+5AA==
X-CSE-MsgGUID: Zs+OI2M6SWKKonihQ/B4tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="79607438"
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="79607438"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 18:27:08 -0700
X-CSE-ConnectionGUID: LyWsdOGsQ6W+1tgHqIKy7w==
X-CSE-MsgGUID: l8OPKolxSmGrLmQi2/44rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="265105511"
Received: from lkp-server01.sh.intel.com (HELO 6ba8523b1a8f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 23 May 2026 18:27:05 -0700
Received: from kbuild by 6ba8523b1a8f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQxcN-000000000XT-2yYC;
	Sun, 24 May 2026 01:27:03 +0000
Date: Sun, 24 May 2026 09:26:06 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>,
	Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH] media: camif-core: Drop GPIO handling
Message-ID: <202605240943.CiZtuwD9-lkp@intel.com>
References: <20260523-s3c-camif-descriptors-v1-1-797052aab553@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260523-s3c-camif-descriptors-v1-1-797052aab553@kernel.org>

Hi Linus,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 254f49634ee16a731174d2ae34bc50bd5f45e731]

url:    https://github.com/intel-lab-lkp/linux/commits/Linus-Walleij/media-camif-core-Drop-GPIO-handling/20260523-063811
base:   254f49634ee16a731174d2ae34bc50bd5f45e731
patch link:    https://lore.kernel.org/r/20260523-s3c-camif-descriptors-v1-1-797052aab553%40kernel.org
patch subject: [PATCH] media: camif-core: Drop GPIO handling
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260524/202605240943.CiZtuwD9-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260524/202605240943.CiZtuwD9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605240943.CiZtuwD9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/samsung/s3c-camif/camif-core.c: In function 's3c_camif_remove':
>> drivers/media/platform/samsung/s3c-camif/camif-core.c:510:37: warning: unused variable 'pdata' [-Wunused-variable]
     510 |         struct s3c_camif_plat_data *pdata = &camif->pdata;
         |                                     ^~~~~


vim +/pdata +510 drivers/media/platform/samsung/s3c-camif/camif-core.c

babde1c243b255 drivers/media/platform/s3c-camif/camif-core.c         Sylwester Nawrocki       2012-08-22  506  
10ded2312724b4 drivers/media/platform/samsung/s3c-camif/camif-core.c Uwe Kleine-König         2023-03-26  507  static void s3c_camif_remove(struct platform_device *pdev)
babde1c243b255 drivers/media/platform/s3c-camif/camif-core.c         Sylwester Nawrocki       2012-08-22  508  {
babde1c243b255 drivers/media/platform/s3c-camif/camif-core.c         Sylwester Nawrocki       2012-08-22  509  	struct camif_dev *camif = platform_get_drvdata(pdev);
babde1c243b255 drivers/media/platform/s3c-camif/camif-core.c         Sylwester Nawrocki       2012-08-22 @510  	struct s3c_camif_plat_data *pdata = &camif->pdata;
babde1c243b255 drivers/media/platform/s3c-camif/camif-core.c         Sylwester Nawrocki       2012-08-22  511  
babde1c243b255 drivers/media/platform/s3c-camif/camif-core.c         Sylwester Nawrocki       2012-08-22  512  	media_device_unregister(&camif->media_dev);
9832e155f1ed30 drivers/media/platform/s3c-camif/camif-core.c         Javier Martinez Canillas 2015-12-11  513  	media_device_cleanup(&camif->media_dev);
babde1c243b255 drivers/media/platform/s3c-camif/camif-core.c         Sylwester Nawrocki       2012-08-22  514  	camif_unregister_media_entities(camif);
babde1c243b255 drivers/media/platform/s3c-camif/camif-core.c         Sylwester Nawrocki       2012-08-22  515  	v4l2_device_unregister(&camif->v4l2_dev);
babde1c243b255 drivers/media/platform/s3c-camif/camif-core.c         Sylwester Nawrocki       2012-08-22  516  
babde1c243b255 drivers/media/platform/s3c-camif/camif-core.c         Sylwester Nawrocki       2012-08-22  517  	pm_runtime_disable(&pdev->dev);
babde1c243b255 drivers/media/platform/s3c-camif/camif-core.c         Sylwester Nawrocki       2012-08-22  518  	camif_clk_put(camif);
d5e9bddb280576 drivers/media/platform/s3c-camif/camif-core.c         Dongliang Mu             2021-10-19  519  	s3c_camif_unregister_subdev(camif);
babde1c243b255 drivers/media/platform/s3c-camif/camif-core.c         Sylwester Nawrocki       2012-08-22  520  }
babde1c243b255 drivers/media/platform/s3c-camif/camif-core.c         Sylwester Nawrocki       2012-08-22  521  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
