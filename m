Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D975C8C1
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Oct 2023 09:20:43 +0000 (UTC)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3928XgBN008714;
	Mon, 2 Oct 2023 03:55:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=FU0vcJFLexZhfzD
	Mk1rC/fUorfoAyYNQT9hd/aGP56s=; b=rAs3Cgj7+3cH9bYs8c+71RSjm8WTITW
	6bL98QcOEYqdJXYKSc+z/OMiLLfIknLDNvPG5yrWaDF2XIK2GWt7yyLDQsoSsdlc
	i2frmxsm1wZ263wQHLuTCVDJmHqeWrjqWIM/iaPU0YX8szTvNaDbpgh3F0q4m2ti
	nnAdD6T/V/aeu2G/0suDBEC88rlWkJO24a6DuNA0TZuRoFH6bAuv/MhZcKFqA48P
	CbRYzEkW/T2eM/qWzd1GNHcK+ygU1dp0EHqtvWy12Udw9bKZoyWUJuL+T2JWU1vd
	NRApV7Fr8KXUxGLodEz3CxL2vEvN+DqwZBNMF3C00n6x1+wJMuVcMpw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3teg3k27jm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Oct 2023 03:55:17 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Mon, 2 Oct
 2023 09:55:15 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Mon, 2 Oct 2023 09:55:15 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D60D711AB;
	Mon,  2 Oct 2023 08:55:15 +0000 (UTC)
Date: Mon, 2 Oct 2023 08:55:15 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: kernel test robot <lkp@intel.com>
CC: Lucas Tanure <tanureal@opensource.cirrus.com>,
        <oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        Lee Jones
	<lee@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: drivers/soundwire/bus_type.c:126:30: error: implicit declaration
 of function 'irq_create_mapping'; did you mean 'irq_dispose_mapping'?
Message-ID: <20231002085515.GN103419@ediswmail.ad.cirrus.com>
References: <202309292102.R2ui2IV9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202309292102.R2ui2IV9-lkp@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: CN7-0Yme3XpWRcX3wd1AD_Apa6t36m7_
X-Proofpoint-ORIG-GUID: CN7-0Yme3XpWRcX3wd1AD_Apa6t36m7_
X-Proofpoint-Spam-Reason: safe

On Fri, Sep 29, 2023 at 09:08:54PM +0800, kernel test robot wrote:
> Hi Lucas,
> 
> FYI, the error/warning still remains.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   9ed22ae6be817d7a3f5c15ca22cbc9d3963b481d
> commit: 12a95123bfe1dd1a6020a35f5e67a560591bb02a soundwire: bus: Allow SoundWire peripherals to register IRQ handlers
> date:   6 weeks ago
> config: s390-randconfig-r031-20221019 (https://download.01.org/0day-ci/archive/20230929/202309292102.R2ui2IV9-lkp@intel.com/config)
> compiler: s390-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230929/202309292102.R2ui2IV9-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202309292102.R2ui2IV9-lkp@intel.com/
> 
> All error/warnings (new ones prefixed by >>):
> 

This is fixed by this commit:

https://lore.kernel.org/lkml/20230920160401.854052-1-ckeepax@opensource.cirrus.com/

Thanks,
Charles
