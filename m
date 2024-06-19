Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47423152792
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jun 2024 16:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718815954; cv=none; b=IBLBz4G4mQyTNqvNJh1qicztun2mtKOyJ7wrt2zrbZpgEc55EUW0Fh7W9ZxBlDcgbWL2dQC+4pLgBmVjL2KpBeNHVA9pM0D3yQRk9d2+FQ5VPy0Cng1SmRtLPIcWkK+VXMpCbd8jLsJUJvayVAhNJfQAsfGzXl1RWY5jagGf7bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718815954; c=relaxed/simple;
	bh=1cI56OuVMnCSGDKEHjh+MPNPmWVJGIpJYWFcNh7JipQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k5QDY8LRvlze+zfaLiJN3yRJVfdLJFsr3knltB2u5NVt4jb3E4Dho09bEUEQoOjMUqDtdmF0U4ORWkbghHDHdY2cwaL9znuLUNWpY7n3kLFadttm1dursIIMmHjj6/oYqshasUZ5Xo+zGV5gh05uAhofre3FOudy5TJ7zYO3lZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E6YD+Yai; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E6YD+Yai"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718815953; x=1750351953;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1cI56OuVMnCSGDKEHjh+MPNPmWVJGIpJYWFcNh7JipQ=;
  b=E6YD+YaiZft8N2/KIjUTwYyMPsL5boI4dRLM3n3CFINpp/1Hpufgyc/a
   pPQ0q8U0uDE6CBL2utzsy+L88NCJxIiJiGVm/WBEqAe6yefFGOxblxQlX
   2kzGSaomVP4s1YvkxzdFoJG0YYzZgtmlagUHkMo9gqF7MR2/BX88KzbO6
   8t7nRM3Bl3iq3eaVo88gVp+6Rx+AuqhrlTBJ+FNeul5cVvYGpIYnCP7+s
   wtXfyKbP43TdiX3NgfWJdhi2NGvS4vR6E9oIFmwj7EIDLpd++faepVvXE
   Ttkihr9+SFJKUAWXq1sKyDR0dVe3x1U4HalTTk87al08kBlStE13BZouc
   w==;
X-CSE-ConnectionGUID: lLRosGicTtiUwBRo3zFOUA==
X-CSE-MsgGUID: mBTCVYLlQZ+Rb8IPkD5VZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15897669"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="15897669"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 09:52:31 -0700
X-CSE-ConnectionGUID: sO7tXA/gTWumN9fqPwPH7A==
X-CSE-MsgGUID: pJC2RhZPQDmZqxL7Gc9oCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="47115469"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 19 Jun 2024 09:52:29 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJyXr-0006m2-1O;
	Wed, 19 Jun 2024 16:52:27 +0000
Date: Thu, 20 Jun 2024 00:52:22 +0800
From: kernel test robot <lkp@intel.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 11/19] media: renesas: vsp1: Add and use function to
 dump a pipeline to the log
Message-ID: <202406200018.1RpJIl3K-lkp@intel.com>
References: <20240619001722.9749-12-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240619001722.9749-12-laurent.pinchart+renesas@ideasonboard.com>

Hi Laurent,

kernel test robot noticed the following build errors:

[auto build test ERROR on 91798162245991e26949ef62851719bb2177a9c2]

url:    https://github.com/intel-lab-lkp/linux/commits/Laurent-Pinchart/media-renesas-vsp1-Drop-vsp1_entity_get_pad_format-wrapper/20240619-081928
base:   91798162245991e26949ef62851719bb2177a9c2
patch link:    https://lore.kernel.org/r/20240619001722.9749-12-laurent.pinchart%2Brenesas%40ideasonboard.com
patch subject: [PATCH v2 11/19] media: renesas: vsp1: Add and use function to dump a pipeline to the log
config: arm-shmobile_defconfig (https://download.01.org/0day-ci/archive/20240620/202406200018.1RpJIl3K-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240620/202406200018.1RpJIl3K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406200018.1RpJIl3K-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/media/platform/renesas/vsp1/vsp1_drm.h:18,
                    from drivers/media/platform/renesas/vsp1/vsp1_drm.c:21:
   drivers/media/platform/renesas/vsp1/vsp1_drm.c: In function 'vsp1_du_setup_lif':
>> drivers/media/platform/renesas/vsp1/vsp1_pipe.h:161:1: error: expected statement before ')' token
     161 | )}
         | ^
   drivers/media/platform/renesas/vsp1/vsp1_drm.c:736:9: note: in expansion of macro 'vsp1_pipeline_dump'
     736 |         vsp1_pipeline_dump(pipe, "LIF setup");
         |         ^~~~~~~~~~~~~~~~~~
>> drivers/media/platform/renesas/vsp1/vsp1_drm.c:736:46: error: expected ')' before ';' token
     736 |         vsp1_pipeline_dump(pipe, "LIF setup");
         |                                              ^
>> drivers/media/platform/renesas/vsp1/vsp1_drm.c:770:18: error: expected ';' before '}' token
     770 |         return 0;
         |                  ^
         |                  ;
     771 | }
         | ~                 
>> drivers/media/platform/renesas/vsp1/vsp1_drm.c:734:17: error: label 'unlock' used but not defined
     734 |                 goto unlock;
         |                 ^~~~
>> drivers/media/platform/renesas/vsp1/vsp1_drm.c:650:23: warning: unused variable 'flags' [-Wunused-variable]
     650 |         unsigned long flags;
         |                       ^~~~~
   drivers/media/platform/renesas/vsp1/vsp1_drm.c: In function 'vsp1_du_atomic_flush':
>> drivers/media/platform/renesas/vsp1/vsp1_pipe.h:161:1: error: expected statement before ')' token
     161 | )}
         | ^
   drivers/media/platform/renesas/vsp1/vsp1_drm.c:912:9: note: in expansion of macro 'vsp1_pipeline_dump'
     912 |         vsp1_pipeline_dump(pipe, "atomic update");
         |         ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/vsp1/vsp1_drm.c:912:50: error: expected ')' before ';' token
     912 |         vsp1_pipeline_dump(pipe, "atomic update");
         |                                                  ^
   drivers/media/platform/renesas/vsp1/vsp1_drm.c:917:40: error: expected ';' before '}' token
     917 |         mutex_unlock(&vsp1->drm->lock);
         |                                        ^
         |                                        ;
     918 | }
         | ~                                       
>> drivers/media/platform/renesas/vsp1/vsp1_drm.c:902:25: error: label 'done' used but not defined
     902 |                         goto done;
         |                         ^~~~
   drivers/media/platform/renesas/vsp1/vsp1_drm.c: In function 'vsp1_du_setup_lif':
>> drivers/media/platform/renesas/vsp1/vsp1_drm.c:771:1: warning: control reaches end of non-void function [-Wreturn-type]
     771 | }
         | ^
--
   In file included from drivers/media/platform/renesas/vsp1/vsp1_video.c:32:
   drivers/media/platform/renesas/vsp1/vsp1_video.c: In function 'vsp1_video_pipeline_init':
>> drivers/media/platform/renesas/vsp1/vsp1_pipe.h:161:1: error: expected statement before ')' token
     161 | )}
         | ^
   drivers/media/platform/renesas/vsp1/vsp1_video.c:533:9: note: in expansion of macro 'vsp1_pipeline_dump'
     533 |         vsp1_pipeline_dump(pipe, "video");
         |         ^~~~~~~~~~~~~~~~~~
>> drivers/media/platform/renesas/vsp1/vsp1_video.c:533:42: error: expected ')' before ';' token
     533 |         vsp1_pipeline_dump(pipe, "video");
         |                                          ^
>> drivers/media/platform/renesas/vsp1/vsp1_video.c:535:18: error: expected ';' before '}' token
     535 |         return 0;
         |                  ^
         |                  ;
     536 | }
         | ~                 
>> drivers/media/platform/renesas/vsp1/vsp1_video.c:536:1: warning: control reaches end of non-void function [-Wreturn-type]
     536 | }
         | ^


vim +161 drivers/media/platform/renesas/vsp1/vsp1_pipe.h

   145	
   146	void __vsp1_pipeline_dump(struct _ddebug *, struct vsp1_pipeline *pipe,
   147				  const char *msg);
   148	
   149	#if defined(CONFIG_DYNAMIC_DEBUG) || \
   150		(defined(CONFIG_DYNAMIC_DEBUG_CORE) && defined(DYNAMIC_DEBUG_MODULE))
   151	#define vsp1_pipeline_dump(pipe, msg)			\
   152		_dynamic_func_call("vsp1_pipeline_dump()", __vsp1_pipeline_dump, pipe, msg)
   153	#elif defined(DEBUG)
   154	#define vsp1_pipeline_dump(pipe, msg)			\
   155		__vsp1_pipeline_dump(NULL, pipe, msg)
   156	#else
   157	#define vsp1_pipeline_dump(pipe, msg)			\
   158	({							\
   159		if (0)						\
   160			__vsp1_pipeline_dump(NULL, pipe, msg);	\
 > 161	)}
   162	#endif
   163	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
