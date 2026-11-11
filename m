Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794406507;
	b=MTb1ozoi7kKcbU7wtMGIJwSwvRA3dShNWX6qyqozPlJqmXE8o90enlYtupVQpHzcJVAj
	 osb0fSvCqcbSVExORFrxW+aZgF3ro3agd7cRwkaOdkzBgaeNNt9vopl1Aab8p0SDkYYry
	 pln/bkQi0CEwbCpwjblI49VanLPZSJ0R1J7RlKeUWsaFmRs2RnTN3cnOuUpdAJC3sDB4D
	 TADIee4zd743AsWG2Qz7nRrWEXoRbGGpdwVH79tPyfC2aXLJMXlezj+Rl9m2y7jrMQKoy
	 FrN+eK054PLnhTmpLOVj1JoliM1inp0yzocBv4RkkkkbHna4QSqjEf5kXz/fklo9/eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794406507;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=J3Tue/ZLHAgSzuWbvVH0tsrTuJrMXHztDIZMIkXXHcI=;
	b=txef0aFKJpzOWlhb6cOyL43BixlDtl3JEpNjzr4OSZafHQIhLLCX3qszmH3YOCSnnjrR
	 As0wTubZNlLyUGQ5e/pT3k1p5UVibw0rwsTapfnW23BD2tqHIq40WTW40y7rgDff+FCdT
	 AbnZEkliwdZi12mnbhgL1BBOGSyxOLc74iSo3FUVymbyWmSnInYnq9zHPDp/gg9txlEbF
	 xSK07Se+jcL1Os0TtXkTV8JXPcimgEfWFsCXsGvFzGDG3aTGMPnRES0nIu8erJyo8N7B8
	 fxXSQkEKHaumrsTtRQMJ1Qi2jbyEUSQ6qWRarxro3f8Ka+gGc11xXT2NXdNoAYoTz0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=my2wfBC7;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC24606A332
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Nov 2026 14:15:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADC24606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=my2wfBC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794406506; x=1825942506;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eKKzkAz4Zsnjbeu0gBKUfPz+wZ8ad4WChmT3hoPCUNo=;
  b=my2wfBC79niO93Odpt9DyquoEXEheroOH5weSkUR4Iej6C/IiHt3vUrW
   qv+gcNPSHry7rIRUqAjduUFUef5GjrtU0xiUKGlU0EeHFW6Zw/Uad39LT
   jDs545vWk0OkpQAIGPFdVauZaFSIYLlRCypQpX/q7llEpyJLCUCPaJOiS
   Lbu8GLFtXXpwYFeiT6y35LXGvma/XfmA5dMdAgpwQFhb0Qt8BfDOnbN88
   P2WW2pVx+1OfFpff+BEsMtV25rYHXx+o45bpu2a+xJipmF1mpP+ALVBC6
   wAEKLXwJYkSXfFTezDTleDaBqRwVM07TYR9PhtLTDfj9o+eXhdC8lt/qo
   g==;
X-CSE-ConnectionGUID: 7dg1A6FfSQmdMwqAn8C89Q==
X-CSE-MsgGUID: recKu1P9QByOMg1V/e5DZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3175604"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3175604"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 06:14:58 -0800
X-CSE-ConnectionGUID: 0rS2UZD0TXOhrUP5jCAB3w==
X-CSE-MsgGUID: lOTieGtfRRmELSBLwF7gxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8424150"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Nov 2026 06:14:57 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xR96E-00000000yzb-0hkb;
	Wed, 11 Nov 2026 14:14:54 +0000
Date: Wed, 11 Nov 2026 22:14:13 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Marshall <pm@petermarshall.ca>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org, Peter Marshall <pm@petermarshall.ca>
Subject: Re: [PATCH] platform/surface: platform_profile: handle fan standby
 state
Message-ID: <202611112200.LGfh2iNB-lkp@intel.com>
References: <20261111020916.3557508-2-pm@petermarshall.ca>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111020916.3557508-2-pm@petermarshall.ca>

Hi Peter,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v7.4-rc2 next-20261110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Marshall/platform-surface-platform_profile-handle-fan-standby-state/20261110-210916
base:   linus/master
patch link:    https://lore.kernel.org/r/20261111020916.3557508-2-pm%40petermarshall.ca
patch subject: [PATCH] platform/surface: platform_profile: handle fan standby state
config: i386-randconfig-1013-20261111 (https://download.01.org/0day-ci/archive/20261111/202611112200.LGfh2iNB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261111/202611112200.LGfh2iNB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611112200.LGfh2iNB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/surface/surface_platform_profile.c:103:12: warning: 'ssam_fan_state_set' defined but not used [-Wunused-function]
     103 | static int ssam_fan_state_set(struct ssam_device *sdev, enum ssam_fan_state s)
         |            ^~~~~~~~~~~~~~~~~~


vim +/ssam_fan_state_set +103 drivers/platform/surface/surface_platform_profile.c

   102	
 > 103	static int ssam_fan_state_set(struct ssam_device *sdev, enum ssam_fan_state s)
   104	{
   105		const u8 state = s;
   106	
   107		return ssam_retry(__ssam_fan_state_set, sdev->ctrl, &state);
   108	}
   109	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
